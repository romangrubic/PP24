<!-- 14. Write a PHP program to check two given integers whether either of them is in the range 100..200 inclusive. Go to the editor
Sample Input:
100, 199
250, 300
105, 190
Sample Output:
bool(true)
bool(false)
bool(true) -->


<?php

function program($a, $b){
    if(($a >= 100 && $a<=200) || ($b>=100 && $b <=200)){
        return true;
    }else {
        return false;
    };
}

var_dump(program(150, 320));
var_dump(program(0, 320));
var_dump(program(150, 145));

?>