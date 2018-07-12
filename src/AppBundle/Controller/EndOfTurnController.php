<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Atout;
use AppBundle\Entity\Banque;
use AppBundle\Entity\Departement;
use AppBundle\Entity\FacteurPollutionGlobal;
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
        $nbBarAOxygene = $em->getRepository(Atout::class)->findOneBy(array('id'=>2))->getQuantite();
        $banque = $em->getRepository(Banque::class)->findAll()[0];
        $pollutionTotale = 0;
        $gainDuTour = 0;
        foreach ($departements as $departement){
            if ($departement->getUsine()==1){
                $departement->setNiveauPollution(min(100, $departement->getNiveauPollution()
                    +$facteurPollutionGlobal->getFacteur()));
                if ($departement->getNiveauPollution()>=50){
                    $impactProduction = 1-max(0,0.25*(($departement->getNiveauPollution()-50)*2/100)-$nbBarAOxygene*0.01);
                }
                else{
                    $impactProduction = 1;
                }
                $gainDuTour += round(300*$facteurGainTotal*$impactProduction);
            }
            $pollutionTotale += $departement->getNiveauPollution();
            $em->persist($departement);
        }
        $gainDuTour*=(1-(0.1+0.3*$facteurPollutionGlobal->getFacteur()));

        $banque->setMoney($gainDuTour);
        $em->persist($banque);
        $em->flush();
        return $this->redirectToRoute('page_jeu');
    }
}
