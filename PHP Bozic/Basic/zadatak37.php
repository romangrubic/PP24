<!-- 37. Write a PHP program to compute the sum of the prime numbers less than 100. 
Note: There are 25 prime numbers are there in less than 100.
2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97 and sum of all these numbers is 1060. -->

<?php

function primenumber(){
    $sum=0;

    $primarray=[];
    $isprimenumber=false;

    for($i=2;$i<100;$i++){
        $isprimenumber=true;
        for($j=2;$j <= $i/2; $j++){
            if($i%$j===0){
                $isprimenumber=false;
                break;                
            }        
        }
        if($isprimenumber){
            array_push($primarray, $i);
            $sum= $sum+$i;
        }
    }

    print_r($primarray);
    echo '<br />'.$sum;
}

primenumber();

?>