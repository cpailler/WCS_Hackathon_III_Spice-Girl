<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Atout;
use AppBundle\Entity\Banque;
use AppBundle\Entity\Departement;
use AppBundle\Entity\Developpement;
use AppBundle\Entity\FacteurGainTotal;
use AppBundle\Entity\FacteurInflationGlobal;
use AppBundle\Entity\FacteurPollutionGlobal;
use AppBundle\Entity\NiveauPollutionGlobal;
use AppBundle\Entity\Personnage;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;


/**
 * Initialisation controller.
 *
 * @Route("/initial")
 */
class InitialisationController extends Controller
{
    /**
     * @Route("/{id}", name="initial")
     */
    public function initialisationAction(Request $request, Personnage $personnage)
    {
        $em = $this->getDoctrine()->getManager();
        $departements = $em->getRepository(Departement::class)->findAll();
        $developpements = $em->getRepository(Developpement::class)->findAll();
        $facteurInflationGlobals = $em->getRepository(FacteurInflationGlobal::class)->findAll();
        $facteurPollutionGlobals = $em->getRepository(FacteurPollutionGlobal::class)->findAll();
        $niveauPollutionGlobals = $em->getRepository(NiveauPollutionGlobal::class)->findAll();
        $facteurGainTotal = $em->getRepository(FacteurGainTotal::class)->findAll()[0];
        $atouts = $em->getRepository(Atout::class)->findAll();
        $banques = $em->getRepository(Banque::class)->findAll();
        $personnages = $em->getRepository(Personnage::class)->findBy(array('actif'=>1));

        foreach ($personnages as $perso){
            $perso->setActif(0);
            $em->persist($perso);
        }
        $personnage->setActif(1);
        $em->persist($personnage);

        foreach ($departements as $departement) {
            $departement->setUsine(0);
            $niveauxPollution[] = $departement->setNiveauPollution(rand(1,5))->getNiveauPollution();
            $em->persist($departement);
        }
        $em->persist($departements[floor(rand(0,9))]->setUsine(1));

        foreach ($developpements as $developpement) {
            $developpement->setEffectif(0);
            $em->persist($developpement);
        }

        foreach ($facteurInflationGlobals as $facteurInflationGlobal) {
            $facteurInflationGlobal->setFacteur(1);
            $em->persist($facteurInflationGlobal);
        }

        foreach ($facteurPollutionGlobals as $facteurPollutionGlobal) {
            $facteurPollutionGlobal->setFacteur(1);
            $em->persist($facteurPollutionGlobal);
        }

        foreach ($niveauPollutionGlobals as $niveauPollutionGlobal) {
            //calcul en fonction du niveau initial des regions

            $sommeNiveauPollutionGlobal = array_sum($niveauxPollution)/10;
            $niveauPollutionGlobal->setNiveauGlobal($sommeNiveauPollutionGlobal);
            $em->persist($niveauPollutionGlobal);
        }
        foreach ($atouts as $atout) {
            $atout->setQuantite(0);
            $em->persist($atout);
        }

        foreach ($banques as $banque) {
            $banque->setMoney(500);
            $em->persist($banque);
        }
        $facteurGainTotal->setFacteur(1);
        $em->flush();
        return $this->redirectToRoute('game');

    }


}
