<!-- 29. Write a PHP script to get the names of the functions of a module.
Note : Find XML, JSON functions etc. -->

<?php

echo get_extension_funcs('XML'). '<br/>';
print_r(get_extension_funcs('XML'));

echo get_extension_funcs('JSON'). '<br/>';
print_r(get_extension_funcs('JSON'));

?>