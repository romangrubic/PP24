<!-- 1. Write a PHP program to compute the sum of the two given integer values. If the two values are the same, then returns triple their sum. Go to the editor
Sample Input
1, 2
3, 2
2, 2
Sample Output:
3
5
12 -->


<?php 

function addition($a, $b){
    if($a===$b){
        return ($a+$b)*3;
    }
    return $a+$b;
}

echo addition(1,2).'<br/>';
echo addition(2,2).'<br/>';
echo addition(3,2).'<br/>';
echo addition(6,2).'<br/>';

?>