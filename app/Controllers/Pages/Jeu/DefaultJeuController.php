<?php
interface DefaultJeuController{
    public function index();
    public function point();
    public function updateScore();
    public function classement();
    public function meilleurScore();
    public function meilleurScoreUser();
    public function affichageSucces();
    public function updateSucces();
    public function updateJeuUserSucces();
    public function getInfoSuccesRestant();
}