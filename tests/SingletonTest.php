<?php declare(strict_types=1);
use PHPUnit\Framework\TestCase;

class config {

    static $host = 'mysql_db';
    static $db = 'Sportify';
    static $db_user = 'root';
    static $db_password = 'root';
    static $url = 'http://localhost';

    static $PATH_MODELS = "App\Models\\";
    static $PATH_VIEWS = "../app/views/";
    static $PATH_PUBLIC = "../public/";

}

final class SingletonTest extends TestCase
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
