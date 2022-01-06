<!-- 32. Write a PHP program to check a specified number is present in a given array of integers. Go to the editor
Sample Input:
{1,2,9,3}, 3
{1,2,2,3}, 2
{1,2,2,3}, 9
Sample Output:
bool(true)
bool(true)
bool(false) -->

<?php

function program($array, $number){
    $arraylength=(int)count($array);

    for($i=0;$i<$arraylength;$i++){
        if($array[$i]===$number){
            return true;
        }
    }
    return false;
}
var_dump(program([1,2,9,3], 3));
var_dump(program([1,2,2,3], 2));
var_dump(program([1,2,2,3], 9));

?>