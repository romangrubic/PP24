<?php

if(!isset($_POST['username']) || empty($_POST['username'])){
    header('location: index.php?error=login');
    exit;
}

if(!isset($_POST['password']) || empty($_POST['password'])){
    header('location: index.php?error=login');
    exit;
}

session_start();
$_SESSION['user']['username']=$_POST['username'];
header('location: naslovna.php');
