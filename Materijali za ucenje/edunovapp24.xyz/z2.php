<?php


// Program prima jedan broj i ispisuje sve parne brojeve
// od primljenog broja do broja 2 jedno pograj drugog odvojeno zarezom.
// Zadnji zarez se ne ispisuje

if(!isset($_GET['broj1'])){
    echo 'Postavite broj1 u adresnu traku.';
    exit;
}

$broj1=$_GET['broj1'];

for($i=$broj1;$i>2;$i--){
    if($i % 2 === 0){
        echo $i,', ';
    }
}
echo 2;
