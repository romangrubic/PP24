<!-- 22. Write a PHP script to get the full URL.  -->

<?php

if(isset($_SERVER['HTTPS'])){
    echo $url="https://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];;
}else{
    echo $url="http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];;
};

?>