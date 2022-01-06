<!-- 34. Write a PHP program to check whether the sequence of numbers 1, 2, 3 appears in a given array of integers somewhere. Go to the editor
Sample Input:
{1,1,2,3,1}
{1,1,2,4,1}
{1,1,2,1,2,3}
Sample Output:
bool(true)
bool(false)
bool(true) -->


<?php

function program($array){
    for($i=0;$i<count($array)-2;$i++){
        if($array[$i]===1 && $array[$i+1]===2 && $array[$i+2]===3){
            return true;
        }
    }
    return false;
}

var_dump(program([1,1,2,3,1]));
var_dump(program([1,1,2,4,1]));
var_dump(program([1,1,2,1,2,3]));
?>