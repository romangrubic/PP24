<!-- 14. Write a PHP script to display source code of a webpage (e.g. "http://www.example.com/").  -->

<?php

if(isset($_GET['webpage'])){
    $webpage=$_GET['webpage']. '/';
}else{
    echo 'Add a parameter webpage and url in it. Example "http://www.facebook.com/"';
}

$source_code=file($webpage);

foreach ($source_code as $line_number => $text) {
    echo 'Line No.'. $line_number. ' : '. nl2br(htmlspecialchars($text) . "\n");
}


?>