<!-- 26. Write a PHP program to create a new string which is n (non-negative integer) copies of the the first 3 characters of a given string. 
If the length of the given string is less than 3 then return n copies of the string. Go to the editor
Sample Input:
"Python", 2
"Python", 3
"JS", 3
Sample Output:
PytPyt
PytPytPyt
JSJSJS -->

<?php

function program($s, $n){
    $result='';
    if(strlen($s)<3){
        for($i=0;$i<$n;$i++){
            $result=$result.$s;
        }
    }else{
        for($i=0;$i<$n;$i++){
            $result=$result.substr($s, 0 ,3);
        }
    }
    return $result;
}

echo program('Python', 5).'<br/>';
echo program('Js', 5).'<br/>';
echo program('PHP', 5).'<br/>';

?>