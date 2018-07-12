<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Infobulle;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class InfoBullesController{

    public function infobulleIndexAction(){

        $em = $this->getDoctrine()->getManager();
        $infoBulle = $em->getRepository(Infobulle::class)->FindAll();

        return $this->render('game.html.twig', array(
            'infoBulle' => $infoBulle
        ));
    }

}