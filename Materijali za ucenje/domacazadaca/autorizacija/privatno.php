<?php

session_start();
if (!isset($_SESSION['name'])) {
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
    <div class="slika">
        <img src="image/Bojack.jpg" alt="Bojack Horseman image">
    </div>
    <div class="callout" id="odjava">
        <a href="odjava.php">Odjavi se.</a>
    </div>

</body>

</html>