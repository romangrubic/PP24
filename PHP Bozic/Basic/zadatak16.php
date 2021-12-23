<!-- 16. Write a PHP script to count number of lines in a file.
Note : Store a text file name into a variable and count the number of lines of text it has.  -->

<?php

$file = basename($_SERVER['PHP_SELF']);

$numberoflines=count(file($file));

echo 'File has '. $numberoflines. ' number of lines';


?>