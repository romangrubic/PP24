<!-- 31. Write a PHP program to swap two variables. -->

<?php

$a=4;
$b=7;

echo 'Broj a je '.$a.'. Broj b je '.$b;

$temp=$a;
$a=$b;
$b=$temp;

echo 'Broj a je '.$a.'. Broj b je '.$b;

?>