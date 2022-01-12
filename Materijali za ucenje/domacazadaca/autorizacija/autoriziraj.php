<?php

if(!isset($_POST['name'])){
    header('location: index.php');
    exit;
}

if($_POST['name']!='Roman'){
    header('location: index.php');
    exit;
}

session_start();
$_SESSION['autoriziran']='Roman';
header('location: privatno.php');