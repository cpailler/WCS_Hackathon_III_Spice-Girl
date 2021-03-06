<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Infobulle;
use AppBundle\Entity\Atout;
use AppBundle\Entity\Banque;
use AppBundle\Entity\Departement;
use AppBundle\Entity\Developpement;
use AppBundle\Entity\EventAleatoire;
use AppBundle\Entity\FacteurGainTotal;
use AppBundle\Entity\FacteurInflationGlobal;
use AppBundle\Entity\FacteurPollutionGlobal;
use AppBundle\Entity\NiveauPollutionGlobal;
use AppBundle\Entity\Personnage;
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
        $eventAleatoire = $em->getRepository(EventAleatoire::class)->findBy(array('actif'=>1));
        $niveauPollution = $em->getRepository(NiveauPollutionGlobal::class)->findAll()[0];
        $typeDeveloppement = $em->getRepository(TypeDeveloppement::class)->findAll();
        $infobulles = $em->getRepository(Infobulle::class)->FindAll();
        $nbUsines = count($em->getRepository(Departement::class)->findBy(array('usine'=>true)));
        $personnage = $em->getRepository(Personnage::class)->findOneBy(array('actif'=>true));
        foreach ($departements as $departement){
            switch ($departement->getNiveauPollution()){
                case $departement->getNiveauPollution()<10 :
                    $couleur[$departement->getNomCamelCase()] = "#3db48e";
                    break;
                case $departement->getNiveauPollution()<20 :
                    $couleur[$departement->getNomCamelCase()] = "#5dca5f";
                    break;
                case $departement->getNiveauPollution()<30 :
                    $couleur[$departement->getNomCamelCase()] = "#99e600";
                    break;
                case $departement->getNiveauPollution()<40 :
                    $couleur[$departement->getNomCamelCase()] = "#c3f001";
                    break;
                case $departement->getNiveauPollution()<50 :
                    $couleur[$departement->getNomCamelCase()] = "#ff0";
                    break;
                case $departement->getNiveauPollution()<60 :
                    $couleur[$departement->getNomCamelCase()] = "#fed201";
                    break;
                case $departement->getNiveauPollution()<70 :
                    $couleur[$departement->getNomCamelCase()] = "#ffaa01";
                    break;
                case $departement->getNiveauPollution()<80 :
                    $couleur[$departement->getNomCamelCase()] = "#fe5e00";
                    break;
                case $departement->getNiveauPollution()<90 :
                    $couleur[$departement->getNomCamelCase()] = "#fe0000";
                    break;
                default :
                    $couleur[$departement->getNomCamelCase()] = "maroon";
                    break;

            }
        }

        // replace this example code with whatever you need
        return $this->render('game.html.twig', array(
            'banque' => $banque,
            'facteurPollutionGlobal' => $facteurPollutionGlobal,
            'facteurInflation' => $facteurInflation,
            'facteurGain' => $facteurGain,
            'atouts' => $atout,
            'departements' => $departements,
            'developpements' => $developpements,
            'eventAleatoire' => $eventAleatoire,
            'niveauPollution' => $niveauPollution,
            'typeDeveloppements' => $typeDeveloppement,
            'infobulle' => $infobulles[array_rand($infobulles)],
            'typeDeveloppements' => $typeDeveloppement,
            'couleur' => $couleur,
            'nbUsines' => $nbUsines,
            'personnage'=>$personnage
        ));
    }
}