<!-- 5. Write a program to calculate and print the factorial of a number using a for loop. The factorial of a number is the product of all integers up to 
and including that number, so the factorial of 4 is 4*3*2*1= 24. -->


<?php

function program($broj){
    $sum=1;

    for($i=$broj;$i>1;$i--){
        $sum*=$i;
    }

    echo $sum;
}

program(4);
?>