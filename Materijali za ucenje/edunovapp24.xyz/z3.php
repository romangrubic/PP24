<?php

// Program prima jedan broj. Ako je primljeni broj prim (prosti) broj
// onda je boja stranice plava, inače je crvena

// Prosti brojevi ili prim-brojevi su svi prirodni brojevi djeljivi 
// bez ostatka samo s brojem 1 i sami sa sobom, a veći od broja 1. 
// Broj 1 po definiciji nije prost broj.

// dodatak: ispisati sve prim brojeve između dva primljena broja

if (!isset($_GET['n'])) {
    echo 'Postavite n u adresnu traku';
    exit;
}

if (!isset($_GET['m'])) {
    echo 'Postavite m u adresnu traku';
    exit;
}


// $boja = 'red';

$n = $_GET['n'];
$m = $_GET['m'];

$manji = 0;
$veci = 0;

if ($n <= $m) {
    $manji = $n;
    $veci = $m;
} else {
    $manji = $m;
    $veci = $n;
}

for ($i = $manji; $i <= $veci; $i++) {
    $prim = 1;
    for ($j = 2; $j < $veci/2; $j++) {
        if ($i % $j === 0) {
            $prim = 0;
            break;
        }
    }
    // echo $prim;
    if ($prim == 1) {
        echo $i.', ';
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body style="background-color: <?php echo $boja; ?>;">

</body>

</html>