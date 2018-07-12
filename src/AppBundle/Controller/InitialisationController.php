<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Atout;
use AppBundle\Entity\Banque;
use AppBundle\Entity\Departement;
use AppBundle\Entity\Developpement;
use AppBundle\Entity\FacteurInflationGlobal;
use AppBundle\Entity\FacteurPollutionGlobal;
use AppBundle\Entity\NiveauPollutionGlobal;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;


/*
 * Initialisation controller.
 *
 * @Route("/initial")
 */
class InitialisationController extends Controller
{
    /**
     * @Route("/", name="initial")
     */
    public function initialisationAction()
    {
        $em = $this->getDoctrine()->getManager();
        $departements = $em->getRepository(Departement::class)->findAll();
        $developpements = $em->getRepository(Developpement::class)->findAll();
        $facteurInflationGlobals = $em->getRepository(FacteurInflationGlobal::class)->findAll();
        $facteurPollutionGlobals = $em->getRepository(FacteurPollutionGlobal::class)->findAll();
        $niveauPollutionGlobals = $em->getRepository(NiveauPollutionGlobal::class)->findAll();
        $atouts = $em->getRepository(Atout::class)->findAll();
        $banques = $em->getRepository(Banque::class)->findAll();

        foreach ($departements as $departement) {
            $departement->setUsine(0);
            $niveauxPollution[] = $departement->setNiveauPollution(rand(0,5))->getNiveauPollution();
            $em->persist($departement);
            $em->persist($departement[floor(rand(0,10))]->setUsine(1));
        }

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

        $em->flush();
        $this->redirectToRoute('page_jeu');

    }


}
