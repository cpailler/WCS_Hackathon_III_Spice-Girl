<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Atout;
use AppBundle\Entity\Banque;
use AppBundle\Entity\Departement;
use AppBundle\Entity\FacteurInflationGlobal;
use AppBundle\Entity\FacteurPollutionGlobal;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class ExpansionController extends Controller
{
    /**
     * @Route("/expansion", name="expansion")
     */
    public function ExpansionAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $banque = $em->getRepository(Banque::class)->findAll()[0];
        $facteurInflation = $em->getRepository(FacteurInflationGlobal::class)->findAll()[0];
        $departements = $em->getRepository(Departement::class)->findBy(array('usine'=>false));
        if ($banque->getMoney()<ceil(500*$facteurInflation->getFacteur())){
            $this->addFlash('danger', 'Vous ne disposez pas des fonds nécessaires à cet achat!');
        }
        elseif (empty($departements)){
            $this->addFlash('danger', 'Il ne reste plus de département où s\'implanter');
        }
        else{
            $em->persist($banque->setMoney($banque->getMoney()-ceil(500*$facteurInflation->getFacteur())));
            $em->persist($departements[floor(rand(0,count($departements)-1))]->setUsine(1));
            $em->persist($facteurInflation->setFacteur($facteurInflation->getFacteur()*3));
            $em->flush();
        }


        return $this->redirectToRoute('game');
    }
}
