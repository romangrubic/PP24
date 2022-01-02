<!-- 4. Write a PHP program to check a given integer and return true if it is within 10 of 100 or 200. Go to the editor
Sample Input:
103
90
89
Sample Output:
bool(true)
bool(true)
bool(false) -->

<?php

function check($broj){
    if(abs($broj-100)<=10 || abs($broj-200) <= 10){
        return true;
    }else{
        return false;
    };
}

var_dump(check(99));
var_dump(check(199));
var_dump(check(9));
var_dump(check(929));
?>