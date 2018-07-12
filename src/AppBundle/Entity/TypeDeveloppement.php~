<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TypeDeveloppement
 *
 * @ORM\Table(name="type_developpement")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\TypeDeveloppementRepository")
 */
class TypeDeveloppement
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
     * @ORM\Column(name="type", type="string", length=255)
     */
    private $type;

    /**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\Developpement", mappedBy="type")
     */
    private $developpements;

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
     * Set type
     *
     * @param string $type
     *
     * @return TypeDeveloppement
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->developpements = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add developpement
     *
     * @param \AppBundle\Entity\Developpement $developpement
     *
     * @return TypeDeveloppement
     */
    public function addDeveloppement(\AppBundle\Entity\Developpement $developpement)
    {
        $this->developpements[] = $developpement;

        return $this;
    }

    /**
     * Remove developpement
     *
     * @param \AppBundle\Entity\Developpement $developpement
     */
    public function removeDeveloppement(\AppBundle\Entity\Developpement $developpement)
    {
        $this->developpements->removeElement($developpement);
    }

    /**
     * Get developpements
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getDeveloppements()
    {
        return $this->developpements;
    }
}
