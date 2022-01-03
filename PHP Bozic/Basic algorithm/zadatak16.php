<!-- 17. Write a PHP program to check if a string 'yt' appears at index 1 in a given string. 
If it appears return a string without 'yt' otherwise return the original string. 
Sample Input:
"Python"
"ytade"
"jsues"
Sample Output:
Phon
ytade
jsues -->

<?php

function program($string){
    if(substr($string, 1 , 2)==='yt'){
        return substr($string, 0, 1).substr($string, 3);
    }else{
        return $string;
    }
}

echo program('Python').'<br/>';
echo program('ytade').'<br/>';
echo program('jsues').'<br/>';
?>