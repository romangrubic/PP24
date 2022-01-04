<!-- 22. Write a PHP program to check if a given string contains between 2 and 4 'z' character. Go to the editor
Sample Input:
"frizz"
"zane"
"Zazz"
"false"
Sample Output:
bool(true)
bool(false)
bool(true)
bool(false) -->

<?php

function program($string)
{
    $broj = 0;
    for ($i = 0; $i < strlen($string); $i++) {
        if (substr($string, $i, 1) === 'z') {
            $broj++;
        }
    }
    return $broj > 1 && $broj < 4;
}

var_dump(program('Zazz'));
var_dump(program('falz'));
?>