<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Departement
 *
 * @ORM\Table(name="departement")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\DepartementRepository")
 */
class Departement
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
     * @ORM\Column(name="nom_camel_case", type="string", length=255)
     */
    private $nomCamelCase;

    /**
     * @var int
     *
     * @ORM\Column(name="code_insee", type="integer", unique=true)
     */
    private $codeInsee;

    /**
     * @var float
     *
     * @ORM\Column(name="niveau_pollution", type="float")
     */
    private $niveauPollution;

    /**
     * @var bool
     *
     * @ORM\Column(name="usine", type="boolean")
     */
    private $usine = 0;


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
     * @return Departement
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
     * Set codeInsee
     *
     * @param integer $codeInsee
     *
     * @return Departement
     */
    public function setCodeInsee($codeInsee)
    {
        $this->codeInsee = $codeInsee;

        return $this;
    }

    /**
     * Get codeInsee
     *
     * @return int
     */
    public function getCodeInsee()
    {
        return $this->codeInsee;
    }

    /**
     * Set niveauPollution
     *
     * @param float $niveauPollution
     *
     * @return Departement
     */
    public function setNiveauPollution($niveauPollution)
    {
        $this->niveauPollution = $niveauPollution;

        return $this;
    }

    /**
     * Get niveauPollution
     *
     * @return float
     */
    public function getNiveauPollution()
    {
        return $this->niveauPollution;
    }

    /**
     * Set usine
     *
     * @param boolean $usine
     *
     * @return Departement
     */
    public function setUsine($usine)
    {
        $this->usine = $usine;

        return $this;
    }

    /**
     * Get usine
     *
     * @return bool
     */
    public function getUsine()
    {
        return $this->usine;
    }

    /**
     * Set nomCamelCase
     *
     * @param string $nomCamelCase
     *
     * @return Departement
     */
    public function setNomCamelCase($nomCamelCase)
    {
        $this->nomCamelCase = $nomCamelCase;

        return $this;
    }

    /**
     * Get nomCamelCase
     *
     * @return string
     */
    public function getNomCamelCase()
    {
        return $this->nomCamelCase;
    }
}
