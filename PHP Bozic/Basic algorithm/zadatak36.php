<!-- 36. Write a PHP program to create a new string of the characters at indexes 0,1,4,5,8,9 ... from a given string. Go to the editor
Sample Input:
"Python"
"JavaScript"
"HTML"
Sample Output:
Pyon
JaScpt
HT -->

<?php

function program($string){
    $result='';

    $array=[0,1,4,5,8,9];

    for($i=0;$i<strlen($string);$i++){
        if(in_array($i, $array)){
            $result.=$string[$i];
        }
    }
    return $result;
}

echo program("Python").'<br/>';
echo program("JavaScript").'<br/>';
echo program("HTML").'<br/>';

?>