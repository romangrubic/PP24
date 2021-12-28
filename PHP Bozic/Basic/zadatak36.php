<!-- 36. Write a PHP program to test if a given string occurs at the end of another given string. -->

<?php

function stringtest($str1, $str2){
    $lenstr2=strlen($str2);
    $lenstr1=strlen($str1);

    if(substr($str1, $lenstr1-$lenstr2, $lenstr2)== $str2){
        return 'True';
    }else {
        return 'False';
    }
}

echo stringtest("Python","on")."\n";
echo stringtest("JavaScript","php")."\n";

?>