<!-- 34. Write a PHP program to check the bits of the two given positions of a number are same or not. 
112 - > 01110000
Test 2nd and 3rd position
Result: True
Test 4th and 5th position
Result: False -->

<?php

function checkbits($broj, $pos1, $pos2){
    $pos1--;
    $pos2--;

    $binbroj=strrev(decbin($broj));

    if($binbroj[$pos1]===$binbroj[$pos2]){
        echo 'true';
    }else {
        echo 'false';
    }
}
checkbits(133,2,3);
?>