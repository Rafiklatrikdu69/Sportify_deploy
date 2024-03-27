<?php

class JsonControllerJeu implements DefaultJeuController{
    
    public  function  index()
    {
        $userPoint = new UtilisateurDAO();
        $data = [1 => $userPoint->getPointUser($_SESSION['nom'])];
        $tab =  json_encode($data, true);
        echo $tab;
        //file_put_contents('test.json', $data);
    }

    public function point()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userPoint = new UtilisateurDAO();
            $data = file_get_contents("php://input");
            var_dump($data);
            $tab =  json_decode($data, true);
            echo "le score: " . $tab['score'];
            $userPoint->updatePointJeu($tab['score'], $_SESSION['nom']);
        }
    }

    public function updateScore()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userPoint = new UtilisateurDAO();
            //GET OLD SCORE; 
            $userPoint = new UtilisateurDAO();
            $oldScore = intval($userPoint->getMeilleurScoreUser($_SESSION['nom']));
            //GET NEW SCORE; 
            $data = file_get_contents("php://input");
            var_dump($data);
            $newScore =  json_decode($data, true);
            echo "le score: " . $newScore['score'];

            if ($newScore['score'] > $oldScore) {
                echo $oldScore;
                $userPoint->updateScoreJeu($newScore['score'], $_SESSION['nom']);
            }
        }
    }

    public function classement()
    {
        $userPoint = new UtilisateurDAO();
        $data = $userPoint->getScoreClassementJeu();
        $tab = json_encode($data, true);
        echo $tab;
    }

    public function meilleurScore()
    {
        $userPoint = new UtilisateurDAO();
        $data = [1 => $userPoint->getMeilleurScore()];
        $tab =  json_encode($data, true);
        echo $tab;
    }

    public function meilleurScoreUser()
    {
        $userPoint = new UtilisateurDAO();
        $data = [1 => $userPoint->getMeilleurScoreUser($_SESSION['nom'])];
        $tab =  json_encode($data, true);
        echo $tab;
    }

    public function affichageSucces()
    {
        $userPoint = new UtilisateurDAO();
        $id = $userPoint->getUserId($_SESSION['nom']);
        $data = $userPoint->getAffichageSucces($id);
        $tab = json_encode($data, true);
        echo $tab;
    }

    public function updateSucces()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userPoint = new UtilisateurDAO();
            $id = $userPoint->getUserId($_SESSION['nom']);
            $data = file_get_contents("php://input");
            var_dump($data);
            $succes =  json_decode($data, true);
            echo "le score: " . $succes['score'];
            $userPoint->updateSucces($id, $succes['score']);
        }
    }

    public function updateJeuUserSucces()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userPoint = new UtilisateurDAO();
            $id = $userPoint->getUserId($_SESSION['nom']);
            // Récupération des données envoyées en POST et décodage du JSON
            $data = json_decode(file_get_contents("php://input"), true);

            // Extrait et affiche les données pour vérification
            echo "Les données reçues: ";
            var_dump($data);

            // Appel de la fonction updateJeuUser avec les données reçues
            $userPoint->updateJeuUser(
                $id,
                $data['lose'],
                $data['kill'],
                $data['bekill'],
                $data['score'],
                $data['jet'],
                $data['piece'],
                $data['foot'],
                $data['basket'],
                $data['tennis'],
                $data['baseball'],
                $data['rugby'],
                $data['bowling']
            );
        } else {
            echo "Méthode non autorisée";
        }
    }

    public function getInfoSuccesRestant()
    {
        $userPoint = new UtilisateurDAO();
        $id = $userPoint->getUserId($_SESSION['nom']);
        $data = $userPoint->getInfoSuccesRestant($id);
        $tab = json_encode($data, true);
        echo $tab;
    }

}
