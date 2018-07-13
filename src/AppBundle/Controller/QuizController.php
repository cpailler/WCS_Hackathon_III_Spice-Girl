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



class QuizController extends Controller
{
    /**
     * @Route("/quiz", name="quiz")
     */

    public function indexAction(Request $request){

        return $this->render('default/index.html.twig');
    }


}
