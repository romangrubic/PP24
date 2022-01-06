<!-- 35. Write a PHP program to compare two given strings and return the number of the positions where they contain the same length 2 substring. Go to the editor
Sample Input:
"abcdefgh", "abijsklm"
"abcde", "osuefrcd"
"pqrstuvwx", "pqkdiewx"
Sample Output:
1
1
2 -->

<?php

function program($string1, $string2){
    $count=0;

    for($i=0;$i<strlen($string1)-1;$i++){
        for($j=0;$j<strlen($string2)-1;$j++){
            if(substr($string1, $i, 2) === substr($string2, $j, 2)){
                $count++;
            }
        }
    }

    return $count;
}
echo program("abcdefgh", "abijsklm").'<br/>';
echo program("abcde", "osuefrcd").'<br/>';
echo program("pqrstuvwx", "pqkdiewx").'<br/>';


?>