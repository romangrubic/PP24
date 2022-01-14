<?php declare(strict_types=1);

// Napišite funkciju koja će ispisati svaki drugi broj u
// intervalu između dva cijela broja koja funkcija
// dobije u obliku parametara. Ako funkcija ne dobije
// drugi parametar, onda treba koristiti
// podrazumijevanju vrijednost 1000.

if(!isset($_GET['n'])){
    echo 'Set number as n in the url';
    exit;
}

if(!isset($_GET['m'])){
    echo 'You can set another number as m in the url if you want, otherwise it will default to 1 000. <hr/>';
}

$n=(int)$_GET['n'];

if(isset($_GET['m'])){
    $m=(int)$_GET['m'];
    everyothernumber($n, $m);
}else{
    everyothernumber($n);
}


function everyothernumber(int $n, int $m = 1000) {
    for($i=$n;$i<=$m;$i++){
        if($i%2==0){
            echo $i.', ';
        }
    }
}

?>