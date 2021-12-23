<!-- zadaci sa https://www.w3resource.com/php-exercises/php-basic-exercises.php -->


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $var; ?></title>
</head>
<body>

<?php
// 1. Write a PHP script to get the PHP version and configuration information.

echo phpinfo();

echo  '<hr/>';

/*
 2. Write a PHP script to display the following strings. Go to the editor
Sample String :
'Tomorrow I \'ll learn PHP global variables.'
'This is a bad command : del c:\\*.*'
Expected Output :
Tomorrow I 'll learn PHP global variables.
This is a bad command : del c:\*.* 
*/

echo 'Tomorrow I \'ll learn PHP global variables.';
echo '<br/>';
echo 'This is a bad command : del c:\\*.*';
echo  '<hr/>';

/*
3. $var = 'PHP Tutorial'. Put this variable into the title section, h3 tag and as an anchor text within an HTML document. Go to the editor
Sample Output :

PHP Tutorial
PHP, an acronym for Hypertext Preprocessor, is a widely-used open source general-purpose scripting language. It is a cross-platform, HTML embedded server-side scripting language and is especially suited for web development.
Go to the PHP Tutorial.
*/

$var='PHP Tutorial';

?>


    <h3><?php echo $var; ?></h3>
    <p><a href="https://www.w3resource.com/php/php-home.php">Go to <?php echo $var ?></a></p>


<!-- 4. Create a simple HTML form and accept the user name and display the name through PHP echo statement. -->


    <form method="POST">
    <h3>Please input your name:</h3>
    <input type="text" name="name">
    <button type=submit>Submit name</button>
    </form>

    <?php
    $name=$_POST['name'];

    echo '<h3> Hello '.$name.' </h3>';

    ?>


<!-- 5. Write a PHP script to get the client IP address. -->
<?php

echo $_SERVER['REMOTE_ADDR'];

echo $_SERVER['HTTP_CLIENT_IP'];


echo '<hr/>';
// 6. Write a simple PHP browser detection script. 

echo $_SERVER['HTTP_USER_AGENT'];

echo '<hr/>';

// 7. Write a PHP script to get the current file name.
echo $_SERVER['PHP_SELF'];

echo '<hr/>';

/*
8. Write a PHP script, which will return the following components of the url 'https://www.w3resource.com/php-exercises/php-basic-exercises.php'. Go to the editor

List of components : Scheme, Host, Path
Expected Output :
Scheme : http
Host : www.w3resource.com
Path : /php-exercises/php-basic-exercises.php
*/

$url='https://www.w3resource.com/php-exercises/php-basic-exercises.php';

$url=parse_url($url);

echo 'Scheme : '.$url['scheme'].'<br/>';
echo 'Host : '.$url['host'].'<br/>';
echo 'Path : '.$url['path'].'<br/>';
?>

</body>
</html>