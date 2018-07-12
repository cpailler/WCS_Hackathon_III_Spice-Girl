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

class AchatController extends Controller
{
    /**
     * @Route("/achat_developpement/{id}", name="achat_developpement")
     */
    public function AchatDeveloppement(Request $request, Developpement $developpement)
    {
        $em = $this->getDoctrine()->getManager();
        $banque = $em->getRepository(Banque::class)->findAll()[0];
        $facteurPollutionGlobale = $em->getRepository(FacteurPollutionGlobal::class)->findAll()[0];
        $facteurInflation = $em->getRepository(FacteurInflationGlobal::class)->findAll()[0];
        $facteurGain = $em->getRepository(FacteurGainTotal::class)->findAll()[0];

        if($banque->getMoney()<ceil($developpement->getPrix() * $facteurInflation->getFacteur())){
            $this->addFlash('danger', "Vous n'avez pas assez d'argent pour investir dans cette amélioration.");
        }else{
            $banque->setMoney(($banque->getMoney() - ceil($developpement->getPrix() * $facteurInflation->getFacteur()
                )));
            $facteurPollutionGlobale->setFacteur($facteurPollutionGlobale->getFacteur() + $developpement->getFacteurPollution());
            $facteurGain->setFacteur($facteurGain->getFacteur() *  $developpement->getFacteurGain());
            $facteurInflation->setFacteur($facteurInflation->getFacteur() * $developpement->getFacteurInflation());
            $developpement->setEffectif(1);
            $em->persist($developpement);
            $em->persist($banque);
            $em->persist($facteurPollutionGlobale);
            $em->persist($facteurGain);
            $em->persist($facteurInflation);
            $em->flush();


        }
        return $this->redirectToRoute('game');
    }
}