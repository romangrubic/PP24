<!-- 11. Write a PHP program to create a new string taking the first 3 characters of a given string and return the string with the 3 characters
 added at both the front and back. If the given string length is less than 3, use whatever characters are there. Go to the editor
Sample Input:
"Python"
"JS"
"Code"
Sample Output:
PytPythonPyt
JSJSJS
CodCodeCod -->

<?php

function program($string){
    if(strlen($string) < 3){
        return $string.$string.$string;
    }else{
        $a=substr($string, 0, 3);
        return $a.$string.$a;
    };
}


echo program('Roman').'<br/>';
echo program('Osijek').'<br/>';
echo program('Ab').'<br/>';

?>