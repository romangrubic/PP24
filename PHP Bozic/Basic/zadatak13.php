<!-- 13. Write a e PHP script to display string, values within a table. Go to the editor
Note : Use HTML table elements into echo.
Expected Output :
php table -->

<?php

$a=1000;
$b=1200;
$c=1400;

echo '<table style="border: 1px solid black">';
echo '<tr><td>Salary of Mr.A is</td><td>'. $a.'</td>';
echo '<tr><td>Salary of Mr.B is</td><td>'. $b.'</td>';
echo '<tr><td>Salary of Mr.C is</td><td>'. $c.'</td>';
echo '</table>';

?>