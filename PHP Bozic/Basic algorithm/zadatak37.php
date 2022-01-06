<!-- 37. Write a PHP program to count the number of two 5's are next to each other in an array of integers. Also count the situation where the second 5 is actually a 6. Go to the editor
Sample Input:
{ 5, 5, 2 }
{ 5, 5, 2, 5, 5 }
{ 5, 6, 2, 9}
Sample Output:
1
2
1 -->


<?php

function program($array){
    $count=0;

    $sizeofarray=count($array);

    for($i=0;$i<$sizeofarray-1;$i++){
        if($array[$i]===5){
            if($array[$i+1]===5 || $array[$i+1]===6){
                $count++;
            }
        }
    }
    return $count;
}

echo program([5, 5, 2]).'<br/>';
echo program([5, 5, 2, 5, 5]).'<br/>';
echo program([5, 6, 2, 9]).'<br/>';

?>