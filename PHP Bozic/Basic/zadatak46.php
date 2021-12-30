<!-- 46. Write a PHP program to find heights of the top three building in descending order from eight given buildings. -->

<?php

function sortingheights($array){
    $sortedarray=$array;

    rsort($sortedarray);
    echo $sortedarray[1]. '<br/>';
    echo $sortedarray[2]. '<br/>';
    echo $sortedarray[3]. '<br/>';
}


sortingheights([12,3,4,56,76,87,42])
?>



