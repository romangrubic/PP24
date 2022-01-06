<!-- 29. Write a PHP program to create a new string made of every other character starting with the first from a given string. Go to the editor
Sample Input:
"Python"
"PHP"
"JS"
Sample Output:
Pto
PP
J -->

<?php

function program($string){
    $result='';

    for($i=0;$i<strlen($string);$i++){
        if($i % 2 === 0){
            $result.=substr($string, $i, 1);
        }
    }
    return $result;
}
echo program('Python').'<br/>';
echo program('JS').'<br/>';
echo program('PHP').'<br/>';

?>