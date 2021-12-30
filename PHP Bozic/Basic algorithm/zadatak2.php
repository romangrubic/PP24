<!-- 2. Write a PHP program to get the absolute difference between n and 51. If n is greater than 51 return triple the absolute difference. Go to the editor
Sample Input:
53
30
51
Sample Output:
6
21
0 -->

<?php

function absolute($number){
    if($number > 51){
        return ($number-51)*3;
    }
    return 51-$number;
}

echo absolute(53).'<br/>';
echo absolute(30).'<br/>';
echo absolute(51).'<br/>';

?>