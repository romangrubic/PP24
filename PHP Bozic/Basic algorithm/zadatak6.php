<!-- 6. Write a PHP program to remove the character in a given position of a given string. The given position will be in the range 0..string length -1 inclusive.
Sample Input:
"Python", 1
"Python", o
"Python", 4
Sample Output:
Pthon
ython
Pythn -->

<?php

function removecharacter($string, $int){
    return substr($string, 0, $int).substr($string, $int+1);
}

echo removecharacter("Python", 5);
?>