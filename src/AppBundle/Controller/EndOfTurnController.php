<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Atout;
use AppBundle\Entity\Banque;
use AppBundle\Entity\Departement;
use AppBundle\Entity\EventAleatoire;
use AppBundle\Entity\FacteurGainTotal;
use AppBundle\Entity\FacteurPollutionGlobal;
use AppBundle\Entity\NiveauPollutionGlobal;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class EndOfTurnController extends Controller
{
    /**
     * @Route("/end_of_turn", name="end_of_turn")
     */
    public function EndOfTurnAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $departements = $em->getRepository(Departement::class)->findAll();
        $facteurPollutionGlobal = $em->getRepository(FacteurPollutionGlobal::class)->findAll()[0];
        $facteurGainTotal = $em->getRepository(FacteurGainTotal::class)->findAll()[0];
        $nbBarAOxygene = $em->getRepository(Atout::class)->findOneBy(array('id'=>2));
        $banque = $em->getRepository(Banque::class)->findAll()[0];
        $niveauPollutionGlobal = $em->getRepository(NiveauPollutionGlobal::class)->findAll()[0];
        $pollutionTotale = 0;
        $gainMax = 0;
        $gainDuTour = 0;
        $rapportTruque = $em->getRepository(Atout::class)->findOneBy(array('id'=>1));
        foreach ($departements as $departement){
            if ($departement->getUsine()){
                $departement->setNiveauPollution(min(100, $departement->getNiveauPollution()
                    +$facteurPollutionGlobal->getFacteur()));
                if ($departement->getNiveauPollution()>=50){
                    $impactProduction = 1-max(0,.25*(($departement->getNiveauPollution()-50)*2/100)-$nbBarAOxygene);
                }
                else{
                    $impactProduction = 1;
                }
                $gainMax +=round(300*$facteurGainTotal->getFacteur());
                $gainDuTour += round(300*$facteurGainTotal->getFacteur()*$impactProduction);
            }
            $pollutionTotale += $departement->getNiveauPollution();
            $em->persist($departement);
        }

        dump($gainDuTour);
        if ($rapportTruque->getQuantite() != 1){
            $gainDuTour = floor($gainDuTour*(1-(0.1+0.3*($niveauPollutionGlobal->getNiveauGlobal()/100))));
        }else{
            $rapportTruque->setQuantite(0);
            $em->persist($rapportTruque);
        }

        dump($gainDuTour);
        $banque->setMoney($banque->getMoney()+$gainDuTour);

        $niveauPollutionGlobal->setNiveauGlobal(round($pollutionTotale/10, 2));

        $events = $em->getRepository(EventAleatoire::class)->findBy(array('actif'=>1));
        foreach($events as $event){
            if ($event->getId() == 1) {
                $banque->setMoney($banque->getMoney() - $gainMax);
                $event->setActif(0);
            } elseif ($event->getId() == 2) {
                $banque->setMoney($banque->getMoney() - $gainMax * $facteurPollutionGlobal->getFacteur() / 100);
                $event->setActif(0);
            } elseif ($event->getId() == 3) {
                $banque->setMoney($banque->getMoney() - $gainMax * 2);
                $event->setActif(0);
            }
            $em->persist($event);
        }

        $em->persist($banque);
        $em->flush();
        if ($banque->getMoney()<0){
            return $this->redirectToRoute('game_over', array('reason'=>'money'));
        }
        elseif ($niveauPollutionGlobal->getNiveauGlobal()==100){
            return $this->redirectToRoute('game_over', array('reason'=>'pollution'));
        }
        else{
            $rand = rand(0,100);
            if ($rand<15){
                $event = $em->getRepository(EventAleatoire::class)->findAll()[floor($rand/5)];
                if ($event->getPollutionApparition()<=$niveauPollutionGlobal->getNiveauGlobal()){
                    $event->setActif(1);
                    $em->persist($event);
                    $em->flush();
                }
            }

            return $this->redirectToRoute('game');

        }
    }
}
