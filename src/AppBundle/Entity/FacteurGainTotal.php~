<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FacteurGainTotal
 *
 * @ORM\Table(name="facteur_gain_total")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\FacteurGainTotalRepository")
 */
class FacteurGainTotal
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var float
     *
     * @ORM\Column(name="facteur", type="float")
     */
    private $facteur;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set facteur
     *
     * @param float $facteur
     *
     * @return FacteurGainTotal
     */
    public function setFacteur($facteur)
    {
        $this->facteur = $facteur;

        return $this;
    }

    /**
     * Get facteur
     *
     * @return float
     */
    public function getFacteur()
    {
        return $this->facteur;
    }
}

