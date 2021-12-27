<!-- 32. Write a PHP program to check whether a number is an Armstrong number or not. Return true if the number is Armstrong
 otherwise return false.
Note: An Armstrong number of three digits is an integer so that the sum of the cubes of 
its digits is equal to the number itself. For example, 153 is an Armstrong number since 1**3 + 5**3 + 3**3 = 153 -->

<?php

function armstrongnumber($broj){
    $sum=0;

    $array=str_split($broj);

    for($i=0;$i<=count($array);$i++){
        $sum=$sum + $array[$i]**3;
    }

    if($broj===$sum){
        echo 'Broj '.$broj.' je Armstrongov broj. <br/>';
    }else {
        echo 'Broj '.$broj.' nije Armstrongov broj. <br/>';
    }
}

armstrongnumber(153);
armstrongnumber(345);
armstrongnumber(879);
armstrongnumber(678);
armstrongnumber(123);
armstrongnumber(357);
armstrongnumber(407);

?>