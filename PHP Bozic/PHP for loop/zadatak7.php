<!-- 7. Write a program which will count the "r" characters in the text "w3resource".  -->

<?php

$s='w3resrrrource';

$count=0;

for($i=0;$i<strlen($s);$i++){
    if(substr($s, $i, 1)=== 'r'){
        $count++;
    }
}

echo $count;

?>