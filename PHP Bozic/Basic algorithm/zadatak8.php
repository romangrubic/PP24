<!-- 8. Write a PHP program to create a new string which is 4 copies of the 2 front characters of a given string. If the given string length is less than 2 return the original string. Go to the editor
Sample Input:
"C Sharp"
"JS"
"a"
Sample Output:
C C C C
JSJSJSJS
a -->


<?php

function program($string){
    return strlen($string) > 1 ? substr($string, 0, 2).substr($string, 0, 2).substr($string, 0, 2).substr($string, 0, 2) : $string;
}

echo program('roman').'<br/>';
echo program('a').'<br/>';
echo program('osijek').'<br/>';
echo program('ab').'<br/>';
?>