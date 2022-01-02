<!-- 12. Write a PHP program to check if a given string starts with 'C#' or not. Go to the editor
Sample Input:
"C# Sharp"
"C#"
"C++"
Sample Output:
bool(true)
bool(true)
bool(false) -->


<?php

function program($string){
    $start=substr($string, 0, 2);

    return $start==='C#' ? true : false;
}

var_dump(program('C#'));
var_dump(program('C++'));
var_dump(program('Python'));
var_dump(program('C# Sharp'));
?>