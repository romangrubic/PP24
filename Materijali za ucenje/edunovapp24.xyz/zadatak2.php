<?php

// Napišite program koji za unesena tri broja ispisuje najveći

if(!isset($_GET['broj1'])){
    echo 'Postavite broj1 u adresnu traku';
    exit;
}

if(!isset($_GET['broj2'])){
    echo 'Postavite broj2 u adresnu traku';
    exit;
}

if(!isset($_GET['broj3'])){
    echo 'Postavite broj3 u adresnu traku';
    exit;
}

$broj1=$_GET['broj1'];
$broj2=$_GET['broj2'];
$broj3=$_GET['broj3'];

echo max($broj1, $broj2, $broj3);
