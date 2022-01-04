<!-- 27. Write a PHP program to count the string "aa" in a given string and assume "aaa" contains two "aa". Go to the editor
Sample Input:
"bbaaccaag"
"jjkiaaasew"
"JSaaakoiaa"
Sample Output:
2
2
3 -->


<?php

function program($string){
    $count=0;

    for($i=0;$i<strlen($string);$i++){
        if(substr($string, $i, 2)=='aa'){
            $count++;
        }
    }
    return $count;
}

echo program('bbaaacaag');

?>