<!-- 39. Write a PHP program to get the size of a file.  -->

<?php

function sizeoffile($path){
    return 'Size of the file is: '.filesize($path);
}

?>