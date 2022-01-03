<!-- 20. Write a PHP program to check whether two given integers are in the range 40..50 inclusive, or they are both in the range 50..60 inclusive. Go to the editor
Sample Input:
78, 95
25, 35
40, 50
55, 60
Sample Output:
bool(false)
bool(false)
bool(true)
bool(true) -->

<?php

function program($a, $b){
    return ($a >= 40 && $a <= 50 && $b >= 40 && $b <= 50) || ($a >= 50 && $a <= 60 && $b >= 50 && $b <= 60);
}

var_dump(program(45,60));
var_dump(program(45,47));
var_dump(program(58,60));
?>