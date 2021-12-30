<!-- 45. Write a PHP program to compute the sum of the digits of a number.  -->

<?php

function compute($number){
    $sum=0;

    for($i=0;$i<strlen($number);$i++){
        $sum= $sum + $number[$i];
    }

    return $sum;
}

echo compute('234');

?>