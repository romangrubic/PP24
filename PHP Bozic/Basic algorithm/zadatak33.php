<!-- 33. Write a PHP program to check if one of the first 4 elements in an array of integers is equal to a given element. Go to the editor
Sample Input:
{1,2,9,3}, 3
{1,2,3,4,5,6}, 2
{1,2,2,3}, 9
Sample Output:
bool(true)
bool(true)
bool(false) -->

<?php

function program($array, $number){
    for($i=0;$i<4;$i++){
        if($array[$i]===$number){
            return true;
        }
    }
    return false;
}
var_dump(program([1,2,9,3], 3));
var_dump(program([1,2,3,4,5,6], 2));
var_dump(program([1,2,2,3], 9));
?>