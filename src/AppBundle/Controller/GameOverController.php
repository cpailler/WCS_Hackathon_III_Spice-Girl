<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;


/**
 * Created by PhpStorm.
 * User: jennifer
 * Date: 13/07/2018
 * Time: 01:02
 */

/**
 * GameOver controller.
 *
 * @Route("/game_over")
 */
class GameOverController extends Controller
{
    /**
     * @Route("/", name="game_over")
     */
    public function gameover(){
        return $this->render('game_over/gameover.html.twig');
    }
}