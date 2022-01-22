<?php

if (!isset($_POST['username']) || empty($_POST['username'])) {
    header('location: index.php?error=login');
    exit;
}

if (!isset($_POST['password']) || empty($_POST['password'])) {
    header('location: index.php?error=login');
    exit;
}

// Kreiranje SESSION objekta i podataka
session_start();
$_SESSION['user']['username'] = $_POST['username'];
$_SESSION['data'] = [
    [
        'username' => 'IvanHorvat',
        'text' => 'Baš me bole leđa. Jel ima tko brufen?'
    ],
    [
        'username' => 'Miki',
        'text' => 'Dobar dan, jel me netko tražio?'
    ],
    [
        'username' => 'Tekashi69',
        'text' => 'Igra li itko Tekken?'
    ]
];
// Redirekcija na naslovnu stranicu
header('location: naslovna.php');
