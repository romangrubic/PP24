<!-- 24. Write a PHP program to convert the last 3 characters of a given string in upper case. If the length of the string has less than 3 then uppercase all the characters. Go to the editor
Sample Input:
"Python"
"Javascript"
"js"
"PHP"
Sample Output:
PytHON
JavascrIPT
JS
PHP -->

<?php

function program($string){
    if (strlen($string) < 3){
        return strtoupper($string);
    }
    $last3 = strtoupper(substr($string, strlen($string)-3));

    return substr($string, 0, strlen($string)-3).$last3;
}

echo program('Python').'<br/>';
echo program('js').'<br/>';
echo program('JavaScript').'<br/>';
?>