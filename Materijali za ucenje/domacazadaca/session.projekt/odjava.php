<?php

session_start();
// Brisanje usera i njegovih podataka
$data=$_SESSION['data'];
foreach($data as $post){
    if($post['username']=$_SESSION['user']['username']){
        unset($post);
    }
}
unset($_SESSION['user']['username']);
session_destroy();
// Reidrekcija na index.php
header('location: index.php');