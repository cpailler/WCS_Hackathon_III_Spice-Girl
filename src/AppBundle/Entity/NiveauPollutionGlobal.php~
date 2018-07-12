<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * NiveauPollutionGlobal
 *
 * @ORM\Table(name="niveau_pollution_global")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\NiveauPollutionGlobalRepository")
 */
class NiveauPollutionGlobal
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
     * @ORM\Column(name="niveau_global", type="float")
     */
    private $niveauGlobal;


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
     * Set niveauGlobal
     *
     * @param float $niveauGlobal
     *
     * @return NiveauPollutionGlobal
     */
    public function setNiveauGlobal($niveauGlobal)
    {
        $this->niveauGlobal = $niveauGlobal;

        return $this;
    }

    /**
     * Get niveauGlobal
     *
     * @return float
     */
    public function getNiveauGlobal()
    {
        return $this->niveauGlobal;
    }
}
