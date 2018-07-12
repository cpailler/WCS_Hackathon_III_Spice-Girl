<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Atout;
use AppBundle\Entity\Banque;
use AppBundle\Entity\Departement;
use AppBundle\Entity\Developpement;
use AppBundle\Entity\FacteurGainTotal;
use AppBundle\Entity\FacteurInflationGlobal;
use AppBundle\Entity\FacteurPollutionGlobal;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class AtoutController extends Controller
{
    /**
     * @Route("/achat_atout/{id}", name="achat_atout")
     */
    public function AchatAtout(Request $request, Atout $atout)
    {
        $em = $this->getDoctrine()->getManager();
        $banque = $em->getRepository(Banque::class)->findAll()[0];
        $facteurInflation = $em->getRepository(FacteurInflationGlobal::class)->findAll()[0];

        if($banque->getMoney()<ceil($atout->getPrix() * $facteurInflation->getFacteur())){
            return $this->addFlash('error', "Vous n'avez pas assez d'argent pour investir dans cette amélioration.");
        }else{
            $banque->setMoney(($banque->getMoney() - ceil($atout->getPrix() * $facteurInflation->getFacteur()
                )));
            $facteurInflation->setFacteur($facteurInflation->getFacteur() * $atout->getFacteurInflation());
            $atout->setQuantite($atout->getQuantite()+1);

            $em->persist($atout);
            $em->persist($banque);
            $em->persist($facteurInflation);
            $em->flush();


        }
        return $this->redirectToRoute('game');
    }
}