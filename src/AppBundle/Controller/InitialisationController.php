<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Departement;
use AppBundle\Entity\Developpement;
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
     * @Route("/", name="initalise_departement")
     */
    public function initialiseDepartementAction()
    {
        $em = $this->getDoctrine()->getManager();
        $departements = $em->getRepository(Departement::class)->findAll();

        foreach ($departements as $departement) {
            $departement->setUsine(0);
            $departement->setNiveauPollution(rand(0,5));
            $em->persist($departement);
            $em->flush();

        }
        $this->redirectToRoute('page_jeu');


    }

    public function initialiseDeveloppementAction()
    {
        $em = $this->getDoctrine()->getManager();
        $developpements = $em->getRepository(Developpement::class)->findAll();

        foreach ($developpements as $developpement) {
            $developpement->setEffectif(0);
            $em->persist($developpement);
            $em->flush();

        }
        $this->redirectToRoute('page_jeu');
    }


}
