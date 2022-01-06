<!-- 30. Write a PHP program to create a string like "aababcabcd" from a given string "abcd". Go to the editor
Sample Input:
"abcd"
"abc"
"a"
Sample Output:
aababcabcd
aababc
a -->

<?php

function program($string){
    $result='';

    for($i=0;$i<=strlen($string);$i++){
        $result.=substr($string, 0, $i);
    }

    return $result;
}

echo program('abcd').'<br/>';
echo program('a').'<br/>';
echo program('ab').'<br/>';

?>