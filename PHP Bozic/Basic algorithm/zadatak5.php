<!-- 5. Write a PHP program to create a new string where 'if' is added to the front of a given string. If the string already begins with 'if', return the string unchanged. Go to the editor
Sample Input:
"if else"
"else"
Sample Output:
if else
if else -->

<?php

function beginsif($string){
    if (strlen($string) > 2 && substr($string, 0, 2) == 'if'){
        return $string;
    } else {
        return 'if '.$string;
    }
}

echo beginsif('if else').'<br/>';
echo beginsif('else').'<br/>';

?>