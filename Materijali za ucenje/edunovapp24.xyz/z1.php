<?php

// Program prima dva broja i ispisuje sve brojeve jedno ispod drugog
// između dva primljena broja od manjeg prema većem

if(isset($_GET['broj1'])){
    $b1=$_GET['broj1'];
}else{
    echo 'Obavezno postavljanje GET parametra broj1 koji je numeričkog tipa';
    exit;
}

if(isset($_GET['broj2'])){
    $b2=$_GET['broj2'];
}else{
    echo 'Obavezno postavljanje GET parametra broj2 koji je numeričkog tipa';
    exit;
}

$broj1=$_GET['broj1'];
$broj2=$_GET['broj2'];

$manji=0;
$veci=0;

if($broj1 <= $broj2){
    $manji=$broj1;
    $veci=$broj2;
}else{
    $manji=$broj2;
    $veci=$broj1;
}

for($i=$manji;$i<$veci;$i++){
    echo $i.', ';
}
echo $veci;

