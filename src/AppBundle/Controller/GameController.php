<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Atout;
use AppBundle\Entity\Banque;
use AppBundle\Entity\Departement;
use AppBundle\Entity\Developpement;
use AppBundle\Entity\EventAleatoire;
use AppBundle\Entity\FacteurGainTotal;
use AppBundle\Entity\FacteurInflationGlobal;
use AppBundle\Entity\FacteurPollutionGlobal;
use AppBundle\Entity\NiveauPollutionGlobal;
use AppBundle\Entity\TypeDeveloppement;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class GameController extends Controller
{
    /**
     * @Route("/game", name="game")
     */
    public function indexAction(Request $request)
    {
        $em=$this->getDoctrine()->getManager();
        $banque = $em->getRepository(Banque::class)->findAll()[0];
        $facteurPollutionGlobal = $em->getRepository(FacteurPollutionGlobal::class)->findAll()[0];
        $facteurInflation = $em->getRepository(FacteurInflationGlobal::class)->findAll()[0];
        $facteurGain = $em->getRepository(FacteurGainTotal::class)->findAll()[0];
        $atout = $em->getRepository(Atout::class)->findAll();
        $departements = $em->getRepository(Departement::class)->findAll();
        $developpements = $em->getRepository(Developpement::class)->findAll();
        $eventAleatoire = $em->getRepository(EventAleatoire::class)->findAll();
        $niveauPollution = $em->getRepository(NiveauPollutionGlobal::class)->findAll()[0];
        $typeDeveloppement = $em->getRepository(TypeDeveloppement::class)->findAll();


        // replace this example code with whatever you need
        return $this->render('game.html.twig', array(
            'banque' => $banque,
            'facteurPollutionGlobal' => $facteurPollutionGlobal,
            'facteurInflation' => $facteurInflation,
            'facteurGain' => $facteurGain,
            'atout' => $atout,
            'departements' => $departements,
            'developpements' => $developpements,
            'eventAleatoire' => $eventAleatoire,
            'niveauPollution' => $niveauPollution,
            'typeDeveloppements' => $typeDeveloppement
        ));
    }
}