<!-- 7. Write a PHP program to exchange the first and last characters in a given string and return the new string.
Sample Input:
"abcd"
"a"
"xy"
Sample output:
dbca
a
yx -->


<?php

function exchange($string)
{
    if (strlen($string) > 1) {
        return substr($string, strlen($string) - 1) . substr($string, 1, strlen($string) - 2) . substr($string, 0, 1);
    }else{
        return $string;
    }
}

echo exchange('Roman').'<br/>';
echo exchange('b').'<br/>';
echo exchange('Miki').'<br/>';
?>