<?php

use PHPUnit\Framework\TestCase;

require "../config/Config.php";

class SingletonTest extends TestCase
{
    public function testGetInstance()
    {
        $instance1 = Singleton::getInstance();
        $instance2 = Singleton::getInstance();

        $this->assertInstanceOf(Singleton::class, $instance1);
        $this->assertInstanceOf(Singleton::class, $instance2);
        $this->assertSame($instance1, $instance2);
    }

    public function testGetBdd()
    {
        $instance = Singleton::getInstance();
        $bdd = $instance->getBdd();

        $this->assertInstanceOf(PDO::class, $bdd);

    }
}
