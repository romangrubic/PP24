<!-- 23. Write a PHP script to compare the PHP version.
Note : Use version_compare() function and PHP_VERSION constant. -->


<?php

if(version_compare(PHP_VERSION, '7.0.0') >= 0){
    echo 'At least 7.0.0, my version '. PHP_VERSION;
}else {
    echo 'Version is below 7.0.0, my version '. PHP_VERSION;
}

?>