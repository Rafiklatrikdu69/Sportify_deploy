<?php

class JsonControllerJeu implements DefaultJeuController{
    
    public  function  index(){
        $userPoint = new utilisateurDAO();
        $data = [1=>$userPoint->getPointUser($_SESSION['nom'])];
        $tab =  json_encode($data, true);
        echo $tab; 
        //file_put_contents('test.json', $data);
    }
    
    public function point(){
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userPoint = new utilisateurDAO(); 
            $data = file_get_contents("php://input");
            var_dump($data);
            $tab =  json_decode($data, true);
            echo "le score: ".$tab['score'];
            $userPoint->updatePointJeu($tab['score'],$_SESSION['nom']);
        }
    }

    public function updateScore(){
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userPoint = new utilisateurDAO(); 
            //GET OLD SCORE; 
            $userPoint = new utilisateurDAO();
            $oldScore = intval($userPoint->getMeilleurScoreUser($_SESSION['nom']));
            //GET NEW SCORE; 
            $data = file_get_contents("php://input");
            var_dump($data);
            $newScore =  json_decode($data, true);
            echo "le score: ".$newScore['score'];

            if($newScore['score'] > $oldScore){
                echo $oldScore; 
                $userPoint->updateScoreJeu($newScore['score'], $_SESSION['nom']); 
            }
        }
    }

    public function classement(){
        $userPoint = new utilisateurDAO(); 
        $data = $userPoint-> getScoreClassementJeu(); 
        $tab = json_encode($data, true);
        echo $tab; 
    }

    public function meilleurScore(){
        $userPoint = new utilisateurDAO();
        $data = [1=>$userPoint->getMeilleurScore()];
        $tab =  json_encode($data, true);
        echo $tab; 
    }

    public function meilleurScoreUser(){
        $userPoint = new utilisateurDAO();
        $data = [1=>$userPoint->getMeilleurScoreUser($_SESSION['nom'])];
        $tab =  json_encode($data, true);
        echo $tab; 
    }
}
