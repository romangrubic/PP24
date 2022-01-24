<?php
if (!isset($_POST['username']) || empty($_POST['username'])) {
    header('location: index.php?error=login');
    exit;
}

if (!isset($_POST['password']) || $_POST['password'] !== 'lozinka') {
    header('location: index.php?error=login');
    exit;
}

require_once 'classes/Funkcije.classes.php';

// Zvanje klase za kreiranje SESSIONa i redirekcija na naslovna.php
session_start();
Login::setLogin($_POST['username']);
header('location: naslovna.php');
