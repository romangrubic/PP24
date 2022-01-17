<?php

// napišite funkciju brojPojavljivanja koja prima dva parametra:
// 1. parametar niz
// 2. prametar broj
// funkcija vraća koliko ima pojavljivanja primljenog broja u primljenom nizu

// testirati
// 1. slučaj
// [2,4,2,5,6,7,3]
// 2
//vraća 2

//2. slučaj
// [2,4,2,5,6,7,3]
// 6
// vraća 1

function brojPojavljivanja1($niz, $broj)
{
    $brojPojavljivanja = 0;
    foreach($niz as $v) {
        if ($v === $broj) {
            $brojPojavljivanja++;
        }
    }
    return $brojPojavljivanja;
}

echo brojPojavljivanja1([2, 4, 2, 6, 7, 3], 2);

echo '<hr/>';

function brojPojavljivanja2($niz, $broj)
{

    return count(array_keys($niz, $broj));
}

echo brojPojavljivanja2([2, 4, 2, 5, 6, 7, 3], 2);
