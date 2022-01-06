<!-- 40. Write a PHP program that accept two integers and return true if either one is 5 or their sum or difference is 5. Go to the editor
Sample Input:
5, 4
4, 3
1, 4
Sample Output:
bool(true)
bool(false)
bool(true) -->

<?php

function program($int1, $int2){
    return $int1===5 || $int2===5 || ($int1+$int2)===5 || ($int1-$int2)===5;
}

var_dump(program(5, 4));
var_dump(program(4, 3));
var_dump(program(1, 4));
?>