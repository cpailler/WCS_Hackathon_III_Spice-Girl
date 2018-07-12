<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Developpement
 *
 * @ORM\Table(name="developpement")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\DeveloppementRepository")
 */
class Developpement
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
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\TypeDeveloppement", inversedBy="developpements")
     * @ORM\JoinColumn(nullable=false)
     */
    private $type;

    /**
     * @var int
     *
     * @ORM\Column(name="prix", type="integer")
     */
    private $prix;

    /**
     * @var float
     *
     * @ORM\Column(name="facteur_pollution", type="float")
     */
    private $facteurPollution;

    /**
     * @var float
     *
     * @ORM\Column(name="facteur_inflation", type="float")
     */
    private $facteurInflation;

    /**
     * @var float
     *
     * @ORM\Column(name="facteur_gain", type="float")
     */
    private $facteurGain;

    /**
     * @var bool
     *
     * @ORM\Column(name="effectif", type="boolean")
     */
    private $effectif=0;

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
     * @return Developpement
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
     * @return Developpement
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
     * Set prix
     *
     * @param integer $prix
     *
     * @return Developpement
     */
    public function setPrix($prix)
    {
        $this->prix = $prix;

        return $this;
    }

    /**
     * Get prix
     *
     * @return int
     */
    public function getPrix()
    {
        return $this->prix;
    }

    /**
     * Set facteurPollution
     *
     * @param float $facteurPollution
     *
     * @return Developpement
     */
    public function setFacteurPollution($facteurPollution)
    {
        $this->facteurPollution = $facteurPollution;

        return $this;
    }

    /**
     * Get facteurPollution
     *
     * @return float
     */
    public function getFacteurPollution()
    {
        return $this->facteurPollution;
    }

    /**
     * Set facteurInflation
     *
     * @param float $facteurInflation
     *
     * @return Developpement
     */
    public function setFacteurInflation($facteurInflation)
    {
        $this->facteurInflation = $facteurInflation;

        return $this;
    }

    /**
     * Get facteurInflation
     *
     * @return float
     */
    public function getFacteurInflation()
    {
        return $this->facteurInflation;
    }

    /**
     * Set facteurGain
     *
     * @param float $facteurGain
     *
     * @return Developpement
     */
    public function setFacteurGain($facteurGain)
    {
        $this->facteurGain = $facteurGain;

        return $this;
    }

    /**
     * Get facteurGain
     *
     * @return float
     */
    public function getFacteurGain()
    {
        return $this->facteurGain;
    }

    /**
     * Set type
     *
     * @param \AppBundle\Entity\TypeDeveloppement $type
     *
     * @return Developpement
     */
    public function setType(\AppBundle\Entity\TypeDeveloppement $type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return \AppBundle\Entity\TypeDeveloppement
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set effectif
     *
     * @param boolean $effectif
     *
     * @return Developpement
     */
    public function setEffectif($effectif)
    {
        $this->effectif = $effectif;

        return $this;
    }

    /**
     * Get effectif
     *
     * @return boolean
     */
    public function getEffectif()
    {
        return $this->effectif;
    }
}
