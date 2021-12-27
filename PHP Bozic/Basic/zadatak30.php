<!-- 30. Write a PHP script to get the time of the last modification of the current page  -->

<?php

echo 'Current page last modified on : '.date('l, dS F, Y, h:ia', getlastmod());

?>