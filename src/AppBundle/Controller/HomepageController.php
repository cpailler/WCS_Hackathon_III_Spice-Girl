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
    /*
     * @Route("/test", name="homepage")
     */
    public function homepage(request $request){
        return $this->render('homepage/homepage.html.twig');
    }
}
