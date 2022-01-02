<!-- 13. Write a PHP program to check if one given temperatures is less than 0 and the other is greater than 100. Go to the editor
Sample Input:
120, -1
-1, 120
2, 120
Sample Output:
bool(true)
bool(true)
bool(false) -->


<?php

function program($a, $b){
    return $a < 0 && $b > 100 || $a > 100 && $b < 0;
}

var_dump(program(120, -1));
var_dump(program(-1, 120));
var_dump(program(120, 121));

?>