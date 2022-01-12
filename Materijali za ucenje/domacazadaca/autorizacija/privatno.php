<?php

session_start();
if(!isset($_SESSION['autoriziran'])){
    header('location: index.php');
    exit;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php include_once 'include/zaglavlje.php'; ?>
</head>
<body>
    <div class="callout">
    <a href="odjava.php">Odjavi se.</a>
    </div>
</body>
</html>