<?php declare(strict_types=1);
use PHPUnit\Framework\TestCase;

class UtilisateurTest extends TestCase
{
    public function testCannotBeSame(): void
    {

        $user1 = new Utilisateur(
            1, // ID
            "pseudo123", // Pseudo
            "exemple@example.com", // Email
            "motdepasse123", // Mot de passe
            100, // Point actuel
            500, // Point classement
            "actif", // Status
            750 // Score de jeu
        );
        $user2 = new Utilisateur(
            2, // ID
            "pseudo123", // Pseudo (le même pseudo)
            "exemple2@example.com", // Email
            "motdepasse456", // Mot de passe
            150, // Point actuel
            600, // Point classement
            "actif", // Status
            800 // Score de jeu
        );
        $this->assertNotEquals($user2->getPseudo(), $user1->getPseudo());
    }
    public function testCannotBeMinus(): void
    {

        $user1 = new Utilisateur(
            1, // ID
            "pseudo123", // Pseudo
            "exemple@example.com", // Email
            "motdepasse123", // Mot de passe
            100, // Point actuel
            500, // Point classement
            "actif", // Status
            750 // Score de jeu
        );
        $this->assertGreaterThan(6, strlen($user1->getMotDePasse()));
    }

}
