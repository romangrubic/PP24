<!-- 28. Write a PHP program to check if the first appearance of "a" in a given string is immediately followed by another "a". Go to the editor
Sample Input:
"caabb"
"babaaba"
"aaaaa"
Sample Output:
bool(true)
bool(false)
bool(true) -->

<?php

function program($s){
    $first=0;

    for($i=0;$i<strlen($s);$i++){
        if((substr($s, $i, 1)==='a') && $first===0){
            $first=1;
            if(substr($s, $i,2)==='aa'){
                return true;
            }else{
                return false;
            }
        }
    }
    return false;
}
var_dump(program('cmsdaabb'));
var_dump(program('bghjabaaba'));
var_dump(program('ghjfaaaaa'));
?>