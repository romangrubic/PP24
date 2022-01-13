<?php

// Napišite program koji uneseni broj uvećava za 10 i ispisuje rezultat

if(!isset($_GET['n'])){
    echo 'Postavite n u adresnu traku';
    exit;
}

$n=$_GET['n'];

echo $n+10;