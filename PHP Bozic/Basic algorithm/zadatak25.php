<!-- 25. Write a PHP program to create a new string which is n (non-negative integer) copies of a given string. Go to the editor
Sample Input:
"JS", 2
"JS", 3
"JS", 1
Sample Output:
JSJS
JSJSJS
JS -->

<?php

function program($string, $int){
    $strint='';
    for($i=0;$i<$int;$i++){
        $strint=$strint.$string;
    }
    return $strint;
}
echo program('Pyt', 3).'<br/>';
echo program('Js', 13);
?>