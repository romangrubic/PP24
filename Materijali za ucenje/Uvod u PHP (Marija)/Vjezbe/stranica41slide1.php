<!-- Napišite funkciju koja prima nepoznati broj ocjena
vina. Funkcija treba izračunati i ispisati prosječnu
ocjenu vina. -->


<?php

function average(){
    $sum=0;

    for($i=0;$i<func_num_args();$i++){
        $sum+=func_get_arg($i);
    }

    echo $sum/func_num_args().'<hr/>';
}

average(5,6,7,89,3,2,5,6,7,8);

average(4,2,4,6);