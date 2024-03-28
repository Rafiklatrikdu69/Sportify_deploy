<?php declare(strict_types=1);
use PHPUnit\Framework\TestCase;

class ItemsTest extends TestCase
{
    public function testItemAttributes(): void
    {
        $item = new Items(
            1, // ID
            "Item Name", // Nom
            "Type", // Type
            "Description", // Description
            10.99, // Prix
            "Color" // Couleur
        );

        // Vérifie que les attributs sont correctement initialisés
        $this->assertEquals(1, $item->getId());
        $this->assertEquals("Item Name", $item->getName());
        $this->assertEquals("Type", $item->getType());
        $this->assertEquals("Description", $item->getDescription());
        $this->assertEquals(10.99, $item->getPrice());
        $this->assertEquals("Color", $item->getColor());
    }

    public function testItemPriceIsNumeric(): void
    {
        $item = new Items(
            1, // ID
            "Item Name", // Nom
            "Type", // Type
            "Description", // Description
            10.99, // Prix
            "Color" // Couleur
        );

        // Vérifie que le prix de l'article est un nombre
        $this->assertIsNumeric($item->getPrice());
    }

    public function testItemIdIsPositive(): void
    {
        $item = new Items(
            -1, // ID négatif
            "Item Name", // Nom
            "Type", // Type
            "Description", // Description
            10.99, // Prix
            "Color" // Couleur
        );

        // Vérifie que l'ID de l'article est positif
        $this->assertGreaterThan(0, $item->getId());
    }

    // Ajoutez d'autres tests ici selon vos besoins...
}
