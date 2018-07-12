<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * EventAleatoire
 *
 * @ORM\Table(name="event_aleatoire")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\EventAleatoireRepository")
 */
class EventAleatoire
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
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=255)
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=255)
     */
    private $description;

    /**
     * @var float
     *
     * @ORM\Column(name="pollution_apparition", type="float")
     */
    private $pollutionApparition;


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
     * Set nom
     *
     * @param string $nom
     *
     * @return EventAleatoire
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return EventAleatoire
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set pollutionApparition
     *
     * @param float $pollutionApparition
     *
     * @return EventAleatoire
     */
    public function setPollutionApparition($pollutionApparition)
    {
        $this->pollutionApparition = $pollutionApparition;

        return $this;
    }

    /**
     * Get pollutionApparition
     *
     * @return float
     */
    public function getPollutionApparition()
    {
        return $this->pollutionApparition;
    }
}
