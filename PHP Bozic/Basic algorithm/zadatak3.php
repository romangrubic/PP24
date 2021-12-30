<!-- 3. Write a PHP program to check two given integers, and return true if one of them is 30 or if their sum is 30. Go to the editor
Sample Input:
30, 0
25, 5
20, 30
20, 25
Sample Output:
bool(true)
bool(true)
bool(true)
bool(false) -->

<?php

function check($a, $b){
   return ($a==30)|| ($b==30) || ($a+$b==30);
}

var_dump(check(30, 0));
var_dump(check(20, 25));

?>


