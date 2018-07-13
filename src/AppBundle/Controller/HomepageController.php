<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;


/**
 * Homepage controller.
 *
 * @Route("/")
 */
class HomepageController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function homepage(){
        return $this->render('homepage/homepage.html.twig');
    }
}
