<!-- 19. Write a PHP program to check which number nearest to the value 100 among two given integers. Return 0 if the two numbers are equal. Go to the editor
Sample Input:
78, 95
95, 95
99, 70
Sample Output:
95
0
99 -->

<?php

function program($a, $b){
    if ($a === $b){
        return 0;
    };
    $aa=100 - $a;
    $bb=100 - $b;

    return ($aa < $bb) ? $a : $b;
}

echo program(90,91).'<br />';
echo program(97,91).'<br />';
echo program(35,65).'<br />';
?>