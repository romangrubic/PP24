<!-- 6. Write a PHP script which decodes the following JSON string. Go to the editor
Sample JSON code :
{"Title": "The Cuckoos Calling",
"Author": "Robert Galbraith",
"Detail": {
"Publisher": "Little Brown"
}}
Expected Output :
Title : The Cuckoos Calling
Author : Robert Galbraith
Publisher : Little Brown
 -->


<?php

$a='{"Title": "The Cuckoos Calling",
    "Author": "Robert Galbraith",
    "Detail": {
    "Publisher": "Little Brown"
    }}';

$j1=json_decode($a, true);

function decode($value, $key){
    echo $key.' : '.$value.'<br/>';
}

array_walk_recursive($j1, 'decode');
?>