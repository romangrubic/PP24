<!-- 15. Write a PHP program to check whether three given integer values are in the range 20..50 inclusive. Return true 
if 1 or more of them are in the said range otherwise false. 
Sample Input:
11, 20, 12
30, 30, 17
25, 35, 50
15, 12, 8
Sample Output:
bool(true)
bool(true)
bool(true)
bool(false) -->


<?php

function program($a, $b, $c){
    return ($a>=20 && $a<=50) ||($b>=20 && $b<=50) ||($c>=20 && $c<=50) ;
}
var_dump(program(11, 20, 12));
var_dump(program(30, 30, 17));
var_dump(program(25, 35, 50));
var_dump(program(15, 12, 8));
?>