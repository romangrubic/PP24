<!-- 7. Write a PHP script that inserts a new item in an array in any position. Go to the editor
Expected Output :
Original array : 
1 2 3 4 5 
After inserting '$' the array is :
1 2 3 $ 4 5 -->


<?php

$x=[1,2,3,4,5];

array_splice($x, 3, 0, '$');

foreach($x as $num){
    echo $num.' ';
}

?>