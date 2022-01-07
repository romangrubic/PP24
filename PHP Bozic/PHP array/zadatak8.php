<!-- 8. Write a PHP script to sort the following associative array : Go to the editor
array("Sophia"=>"31","Jacob"=>"41","William"=>"39","Ramesh"=>"40") in
a) ascending order sort by value
b) ascending order sort by Key
c) descending order sorting by Value
d) descending order sorting by Key -->

<?php

$array=array("Sophia"=>"31","Jacob"=>"41","William"=>"39","Ramesh"=>"40");

asort($array);
echo 'Ascending order by value <br/>';
foreach($array as $k => $v){
    echo 'Age of '.$k.' is : '.$v.'<br/>';
};

ksort($array);
echo 'Ascending order sort by key <br/>';
foreach($array as $k => $v){
    echo 'Age of '.$k.' is : '.$v.'<br/>';
}

arsort($array);
echo 'Descending order sort by value <br/>';
foreach($array as $k => $v){
    echo 'Age of '.$k.' is : '.$v.'<br/>';
}

krsort($array);
echo 'Descending order sort by key <br/>';
foreach($array as $k => $v){
    echo 'Age of '.$k.' is : '.$v.'<br/>';
}
?>