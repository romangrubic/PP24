<?php

if(!isset($_POST['name'])){
    header('location: index.php');
    exit;
}

if($_POST['name']!='Roman' ){
    session_start();
    if(empty($_POST['name'])){
        $_POST['name']='nepoznato';
    }else{
        $_SESSION['name']=$_POST['name'];
    }
    header('location: index.php');
    exit;
}

session_start();
$_SESSION['name']='Roman';
header('location: privatno.php');