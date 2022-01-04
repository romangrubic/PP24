<!-- 23. Write a PHP program to check if two given non-negative integers have the same last digit. Go to the editor
Sample Input:
123, 456
12, 512
7, 87
12, 45
Sample Output:
bool(false)
bool(true)
bool(true)
bool(false) -->

<?php

function program($a, $b){
    $aa= substr($a, -1);
    $bb= substr($b, -1);

    return $aa === $bb;
}

var_dump(program(234,34));
var_dump(program(234,33));
?>