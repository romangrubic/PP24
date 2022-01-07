<!-- 9. Write a PHP script to calculate and display average temperature, five lowest and highest temperatures. Go to the editor
Recorded temperatures : 78, 60, 62, 68, 71, 68, 73, 85, 66, 64, 76, 63, 75, 76, 73, 68, 62, 73, 72, 65, 74, 62, 62, 65, 64, 68, 73, 75, 79, 73
Expected Output :
Average Temperature is : 70.6 
List of seven lowest temperatures : 60, 62, 63, 63, 64, 
List of seven highest temperatures : 76, 78, 79, 81, 85, -->

<?php

$temps=[78, 60, 62, 68, 71, 68, 73, 85, 66, 64, 76, 63, 75, 76, 73, 68, 62, 73, 72, 65, 74, 62, 62, 65, 64, 68, 73, 75, 79, 73];

$sum=0;

foreach($temps as $t){
    $sum+=$t;
}

$average=$sum/count($temps);
echo 'Average temperature is '.$average.'.<br/>';


rsort($temps);
for($i=0;$i<5;$i++){
    echo $temps[$i].' ';
}
echo '<br/>';
for($i=count($temps)-5;$i<count($temps);$i++){
    echo $temps[$i].' ';
}
?>