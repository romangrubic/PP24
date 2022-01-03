<!-- 21. Write a PHP program to find the larger value from two positive integer values that is in the range 20..30 inclusive, or return 0 if neither 
is in that range. 
Sample Input:
78, 95
20, 30
21, 25
28, 28
Sample Output:
0
30
25
28 -->

<?php

function program($a, $b)
{
    if ($a >= 20 && $a <= 30 && $b>= 20 && $b <= 30) {
        if ($a >= $b) {
            return $a;
        } else {
            return $b;
        }
    } else if ($a >= 20 && $a <= 30) {
        return $a;
    } else if ($b >= 20 && $b <= 30) {
        return $b;
    } else {
        return 0;
    }
}

echo program(23,24).'<br/>';
echo program(23,54).'<br/>';
echo program(66,24).'<br/>';
echo program(12,12).'<br/>';

?>