<!-- 38. Write a PHP program to valid an email address.  -->

<?php

function validateemail($email)
{

    $email = trim($email);

    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo $email . ' is valid email!';
    } else {
        echo $email . 'is not valid email!';
    }
}

echo validateemail('mikimaus'). '<br />';
echo validateemail(' roman@gmail.com'). '<br />';
echo validateemail('hehe@yahoo.com'). '<br />';

?>