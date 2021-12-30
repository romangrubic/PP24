<!-- 43. Write a PHP program that multiplies corresponding elements of two given lists. -->

<?php

function multiply($a, $b){

    $result=[];

    for($i=0;$i<count($a);$i++){
        array_push($result, $a[$i]*$b[$i]);
    }
    print_r($result);
}

multiply(['10','12','3'], ['1','3','3']);

?>

