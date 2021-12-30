<!-- 42. Write a PHP program to find the first non-repeated character in a given string. Go to the editor
Input: Green
Output: G
Input: abcdea
Output: b -->

<?php

function character($string){
    for($i=0;$i<= strlen($string);$i++){
        if(substr_count($string, $string[$i])==1){
            return substr($string, $i, 1);
        }
    }
}

echo character('Eldorado').'<br />';
echo character('abcdea').'<br />';

?>