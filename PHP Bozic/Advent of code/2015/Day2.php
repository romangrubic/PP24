<?php

$file = file('Day2.txt');

$totalsurfacearea=0;

foreach ($file as $item) {
    $present=explode('x', trim($item));

    $l=$present[0];
    $w=$present[1];
    $h=$present[2];

    $a=2*$l*$w;
    $b=2*$w*$h;
    $c=2*$h*$l;

    $smallest=min($a, $b, $c)/2;


    $size=$a+$b+$c+$smallest;

    $totalsurfacearea+=$size;
}


echo $total;