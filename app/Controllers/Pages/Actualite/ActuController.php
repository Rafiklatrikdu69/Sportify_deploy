<?php
class ActuController implements DefaultActualiteStrategy{
    public function index() {
        (new VerifSession());
        $userId = (new utilisateurDAO())->getUtilisateurByName($_SESSION['nom']);  
        $tabUsers = (new utilisateurDAO())->getAllUsers(); 
        
        // Vérifier si la variable de session 'currpost' est définie
        if (isset($_SESSION['currpost']) && !empty($_SESSION['currpost']) && $_SESSION['currpost'] != 0) {
            // Si 'currpost' est défini, récupérer les données en fonction de sa valeur
            $currPostValue = $_SESSION['currpost'];
            View::View('actu', [
                "tabUsers" => $tabUsers,
                "tabPdp" => (new ActuDAO())->getPdpPosts(),
                'tabPosts' => (new ActuDAO())->getPostsByCurrPost($currPostValue),
                'tabClassement' => (new utilisateurDAO())->getTop10(),
                "tabLikesById"=>(new LikesDAO())->getByUserId($userId),
                // "tabItems"=>(new ItemsDAO())->getAll(),
                // "tabItemsOwned"=>(new ItemsDAO())->getOwnedItems($_SESSION['nom']),
                "tabBadge"=>(new ItemsDAO())->getItemsByType($_SESSION['nom'], "Badge"),
                "userPdp"=>(new utilisateurDAO())->getPdp($_SESSION['nom']),
                "tabIcone"=>(new ItemsDAO())->getItemsByType($_SESSION['nom'], "Icone"),
                "userBadge"=>(new utilisateurDAO())->getBadge($_SESSION['nom']),
                "tabEcusson"=>(new ItemsDAO())->getItemsByType($_SESSION['nom'], "Ecusson"),
                "userEcusson"=>(new utilisateurDAO())->getEcusson($_SESSION['nom']),
                "pointsUser"=>(new utilisateurDAO())->getPointUser($_SESSION['nom']),
                // "userId"=>(new utilisateurDAO())->getUserId($_SESSION['nom']),
                "userRank"=>(new utilisateurDAO())->getClassement($_SESSION['nom']),
                "pronoWin"=>(new utilisateurDAO())->getPronoWin($_SESSION['nom']),
            ]);
            
            // foreach ($tabUsers as $user) {
                //     $userId = $user->getUtilisateurByName($_SESSION['nom']);
                //     ${"pdp" . $userId} = (new ActuDAO())->getPdpById($userId);
                // }
            } else {
                // Si 'currpost' n'est pas défini, récupérer toutes les publications normalement
                View::View('actu', [
                    "tabUsers" => $tabUsers,
                    "tabPdp" => (new ActuDAO())->getPdpPosts(),
                    'tabPosts' => (new ActuDAO())->getAll(),
                    'tabClassement' => (new utilisateurDAO())->getTop10(),
                    "tabLikesById"=>(new LikesDAO())->getByUserId($userId),
                    // "tabItems"=>(new ItemsDAO())->getAll(),
                    // "tabItemsOwned"=>(new ItemsDAO())->getOwnedItems($_SESSION['nom']),
                    "tabBadge"=>(new ItemsDAO())->getItemsByType($_SESSION['nom'], "Badge"),
                    "userPdp"=>(new utilisateurDAO())->getPdp($_SESSION['nom']),
                    "tabIcone"=>(new ItemsDAO())->getItemsByType($_SESSION['nom'], "Icone"),
                    "userBadge"=>(new utilisateurDAO())->getBadge($_SESSION['nom']),
                    "tabEcusson"=>(new ItemsDAO())->getItemsByType($_SESSION['nom'], "Ecusson"),
                    "userEcusson"=>(new utilisateurDAO())->getEcusson($_SESSION['nom']),
                    "pointsUser"=>(new utilisateurDAO())->getPointUser($_SESSION['nom']),
                 //"userId"=>(new utilisateurDAO())->getUserId($_SESSION['nom']),
                    "userRank"=>(new utilisateurDAO())->getClassement($_SESSION['nom']),
                    "pronoWin"=>(new utilisateurDAO())->getPronoWin($_SESSION['nom']),
                ]);
                $_SESSION['currpost'] = 0;
                // foreach ($tabUsers as $user) {
                    //     $userId = $user->getUtilisateurByName($_SESSION['nom']);
                    //     ${"pdp" . $userId} = (new ActuDAO())->getPdpById($userId);
                    // }
}   
            }
            
public function sendLikes() {
    $tabLikesById = (new LikesDAO())->getByUserId($_SESSION['nom']);
    $encodeDataArray = [];

    foreach ($tabLikesById as $like) {
        if (!empty($like)) {
            $likeData = [
                'postId' => $like->getPostId(),
                'userId' => $like->getUserId(),
            ];
            $encodeDataArray[$like->getPostId()] = $likeData; // Key by post ID for easy client-side lookup
        }
    }

    // Ensure you only send a single JSON-encoded string back to the client
    echo json_encode($encodeDataArray);
}
          

            // ajouter tab likes pour like bleu
            public function profil() {

                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    View::View('profil', ["point"=>(new utilisateurDAO())->getPointUser($_POST['pseudo']),
                                    "posts"=>(new ActuDAO())->getPostByNameUser($_POST['pseudo']),
                                    "userRank"=>(new utilisateurDAO())->getClassement($_POST['pseudo']),
                                    "pp"=>(new utilisateurDAO())->getPdp($_POST['pseudo'])
                    ]);
                }
                // View::View('profil', [
                    
                // ]);
           
               
            }

            public function ajoutCom() {
        
            }
            public function like() {
              
            }
            public function ajoutActu() {
             
            }
            }

          
            
            
        
