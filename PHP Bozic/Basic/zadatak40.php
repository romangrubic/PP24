<!-- 40. Write a PHP program to calculate the mod of two given integers without using any inbuilt modulus operator. -->

<?php

function nomodulus($broj1, $broj2){
    $ostatak=(int)($broj1/$broj2);

    echo $broj1-$broj2*$ostatak;
}

nomodulus(59,4);
?>