<!-- 31. Write a PHP program to count a substring of length 2 appears in a given string and also as the last 2 characters of the string. Do not count the end substring. Go to the editor
Sample Input:
"abcdsab"
"abcdabab"
"abcabdabab"
"abcabd"
Sample Output:
1
2
3
0 -->


<?php

function program($string){
    $lasttwo=substr($string, strlen($string)-2, 2);
    $counter=0;

    for($i=0;$i<strlen($string)-2;$i++){
        if(substr($string, $i, 2) === $lasttwo){
            $counter++;
        }
    }
    return $counter;
}

echo program('abcdsab').'<br/>';
echo program('abcdabab').'<br/>';
echo program('abcabdabab').'<br/>';
?>