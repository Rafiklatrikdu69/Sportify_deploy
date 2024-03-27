<?php
class StrategyJeu{
    private $strategy;
    public function __construct(DefaultJeuController $strategy)
    {
        $this->strategy = $strategy;
    }

    public function index()
    {
        return $this->strategy->index();
    }
    public function point()
    {
        return $this->strategy->point();
    }
    public function updateScore()
    {
        return $this->strategy->updateScore();
    }
    public function classement()
    {
        return $this->strategy->classement();
    }
    public function meilleurScore()
    {
        return $this->strategy->meilleurScore();
    }
    public function meilleurScoreUser()
    {
        return $this->strategy->meilleurScoreUser();
    }
    public function affichageSucces()
    {
        return $this->strategy->affichageSucces();
    }
    public function updateSucces()
    {
        return $this->strategy->updateSucces();
    }
    public function updateJeuUserSucces()
    {
        return $this->strategy->updateJeuUserSucces();
    }
    public function getInfoSuccesRestant()
    {
        return $this->strategy->getInfoSuccesRestant();
    }

}