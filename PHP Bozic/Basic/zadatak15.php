<!-- 15. Write a PHP script to get last modified information of a file. 
Sample filename : php-basic-exercises.php
Sample Output : Last modified Monday, 26th June, 2017, 12:43pm -->

<?php

$file = basename($_SERVER['PHP_SELF']);

$unixtime=filemtime($file);

echo 'File last modified on : '.date('l, dS F, Y, h:ia', $unixtime);

?>