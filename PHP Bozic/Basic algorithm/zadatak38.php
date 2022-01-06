<!-- 38. Write a PHP program to check if a triple is presents in an array of integers or not. If a value appears three times in a row in an array 
it is called a triple. Go to the editor
Sample Input:
{ 1, 1, 2, 2, 1 }
{ 1, 1, 2, 1, 2, 3 }
{ 1, 1, 1, 2, 2, 2, 1 }
Sample Output:
bool(false)
bool(false)
bool(true) -->


<?php

function program($array){
    $sizeofarray=count($array);

    for($i=0;$i<$sizeofarray-2;$i++){
        if($array[$i] === $array[$i+1] &&  $array[$i]=== $array[$i+2]){
            return true;
        }
    }
    return false;
}

var_dump(program([1, 1, 2, 2, 1]));
var_dump(program([1, 1, 2, 1, 2, 3]));
var_dump(program([1, 1, 1, 2, 2, 2, 1]));
?>