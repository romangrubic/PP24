<!-- 18. Write a PHP program to check the largest number among three given integers. Go to the editor
Sample Input:
1,2,3
1,3,2
1,1,1
1,2,2
Sample Output:
3
3
1
2 -->

<?php

function program($a, $b, $c)
{
    $max = max($a, max($b, $c));
    return $max;
}

echo program(1,2,3).'<br/>';
echo program(3,3,3).'<br/>';
echo program(7,6,7).'<br/>';
?>