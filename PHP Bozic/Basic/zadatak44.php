<!-- 44. Write a PHP program to print out the sum of pairs of numbers of a given sorted array of positive integers which is equal to a given number. -->

<?php

function x($numbers, $equal){
    $num_pair='';

    for($i=0;$i<count($numbers);$i++){
        for($j=$i+1;$j<count($numbers); $j++){
            if($numbers[$i]+$numbers[$j]== (int)$equal){
                $num_pair .= $numbers[$i]. ', '. $numbers[$j]. '; ';
            }
        }
    }
    return $num_pair;
}


$numbers=array(0,1,2,3,4,5,6,7,8,9);
echo x($numbers, 11);
?>