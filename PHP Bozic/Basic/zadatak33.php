<!-- 33. Write a PHP program to convert word to digit. Go to the editor
Input: zero;three;five;six;eight;one
Output: 035681 -->

<?php

function wordstonumbers($words){

    $array=explode(';', $words);
    $result = '';

    for($i=0;$i<=count($array);$i++){
        switch($array[$i]){
            case 'zero':
                $result .= '0';
                break;
            case 'one':
                $result .= '1';
                break;
            case 'two':
                $result .= '2';
                break;
            case 'three':
                $result .= '3';
                break;
            case 'four':
                $result .= '4';
                break;
            case 'five':
                $result .= '5';
                break;
            case 'six':
                $result .= '6';
                break;
            case 'seven':
                $result .= '7';
                break;
            case 'eight':
                $result .= '8';
                break;
            case 'nine':
                $result .= '9';
                break;                
        }
    }

    print_r($result);
    return $result;
}

wordstonumbers('zero;one;two;three;four;five;six;seven;')

?>