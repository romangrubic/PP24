<!-- 35. Write a PHP program to remove duplicates from a sorted list.
Input: (1,1,2,2,3,4,5,5)
Output: (1,2,3,4,5) -->

<?php

function removeduplicates($niz){

    $lista = array_values(array_unique($niz));
    return $lista;
}

$niz=array(1,2,2,1,3,4,5,6,3,2,5,6,3,4);

print_r(removeduplicates($niz));

?>