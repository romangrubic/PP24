<?php

// Our connection to database class using PDO
class Db
{
    private $dsn;
    private $username;
    private $password;

    public function connect()
    {
        $this->dsn = 'mysql:host=127.0.0.1;dbname=shop;charset=utf8';
        $this->username = 'edunova';
        $this->password = 'edunova';

        try {
            $db = new PDO($this->dsn, $this->username, $this->password);
            return $db;
        } catch (PDOException $e) {
            echo 'Connection error: ' . $e->getMessage();
            die();
        }
    }
}
