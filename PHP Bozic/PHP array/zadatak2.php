<!-- 2. $color = array('white', 'green', 'red'') Go to the editor
Write a PHP script which will display the colors in the following way :
Output :
white, green, red,

green
red
white -->

<?php

$color = array('white', 'green', 'red');

foreach ($color as $c) {
    echo $c . ', ';
}
sort($color);
echo '<ul>';
foreach ($color as $c) {
    echo '<li>' . $c . '</li>';
}
echo '</ul>';


?>