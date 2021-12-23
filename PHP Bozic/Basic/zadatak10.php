<!-- 10. Write a PHP script, to check whether the page is called from 'https' or 'http' -->


<?php
if(isset($_SERVER['HTTPS'])){
    echo 'Page is called from https';
}else{
    echo 'Page is called from http';
};

?>