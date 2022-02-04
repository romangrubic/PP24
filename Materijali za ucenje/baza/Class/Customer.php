<?php

// Our Customer class where we query to database.
class Customer extends Db
{
    public function getAllCustomers()
    {
        // $this->connect references connect() method from parent class Db
        $query=$this->connect()->prepare('Select * from customer;');
        $query->execute();
        // We are taking the finished query and puting it into result array with fetchAll method
        $result = $query->fetchAll(PDO::FETCH_ASSOC);
        // Returning the $result array with all customers inside
        return $result;
    }
}
