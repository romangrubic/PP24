<!-- 14. Write a PHP script to display source code of a webpage (e.g. "http://www.example.com/").  -->

<?php

if(isset($_GET['webpage'])){
    $webpage=$_GET['webpage']. '/';
}else{
    echo 'Add a parameter webpage and url in it. Example "http://www.facebook.com/"';
}


// Takes the source code of the website in a form of array
$source_code=file($webpage);

foreach ($source_code as $key => $value) {
    echo 'Line No.'. $key. ' : '. nl2br(htmlspecialchars($value) . "\n");
}


?>