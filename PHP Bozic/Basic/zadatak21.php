<!-- 21. Write a PHP function to test whether a number is greater than 30, 20 or 10 using ternary operator. -->

<?php

function check($x){
    $result= $x > 30 ? 'Bigger than 30' : ($x > 20 ? 'Bigger than 20' : ($x > 10 ? 'Bigger than 10' : 'Input a number atleast greater than 10'));

    echo $result. '<br/>';
}


check(54);
check(24);
check(14);
check(4);

?>