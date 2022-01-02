<!-- 9. Write a PHP program to create a new string with the last char added at the front and back of a given string of length 1 or more. 
Sample Input:
"Red"
"Green"
"1"
Sample Output:
dRedd
nGreenn
111 -->

<?php

function program($string){
    return strlen($string) > 2 ? substr($string, strlen($string)-1).$string.substr($string, strlen($string)-1) : $string;
}

echo program('Osijek').'<br/>';
echo program('Roman').'<br/>';
echo program('A').'<br/>';

?>