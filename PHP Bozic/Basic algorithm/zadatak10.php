<!-- 10. Write a PHP program to check if a given positive number is a multiple of 3 or a multiple of 7. 
Sample Input
3
14
12
37
Sample Output:
bool(true)
bool(true)
bool(true)
bool(false) -->

<?php

function program($int){
    return $int % 3 == 0 ? true : ($int % 7 == 0 ? true : false);
}

var_dump(program(6));
var_dump(program(25));
var_dump(program(64));
var_dump(program(87));

?>