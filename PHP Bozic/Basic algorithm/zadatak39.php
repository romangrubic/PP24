<!-- 39. Write a PHP program to compute the sum of the two given integers. If the sum is in the range 10..20 inclusive return 30. Go to the editor
Sample Input:
12, 17
2, 17
22, 17
20, 0
Sample Output:
29
30
39
30 -->

<?php

function program($int1, $int2){
    return ($int1+$int2)<=20 && ($int1+$int2)>=10 ? 30 : $int1+$int2;
}

echo program(12, 17).'<br/>';
echo program(2, 17).'<br/>';
echo program(22, 17).'<br/>';
?>