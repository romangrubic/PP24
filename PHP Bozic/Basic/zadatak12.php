<!-- 12. Write a simple PHP program to check that emails are valid. -->

<?php

    $email=$_GET['email'];

    if (filter_var($email, FILTER_VALIDATE_EMAIL)){
        echo 'Your email is valid.';
    }else{
        echo 'Your email is not valid';
    }

?>