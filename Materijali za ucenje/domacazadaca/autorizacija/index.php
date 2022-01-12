<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Zaglavlje start -->
    <?php include_once 'include/zaglavlje.php'; ?>
    <!-- Zaglavlje kraj -->
</head>

<body>
    <div class="callout" id="index">
        <form action="autoriziraj.php" method="post">
            <fieldset>
                <legend>Ako znas moje ime, prijavi se!</legend>
                <label for="name">Moje ime</label>
                <input type="text" name="name" id="name">
                <h5>
                    <?php if(isset($_SESSION['name'])) {
                        echo 'Moje ime nije ' . $_SESSION['name'] . '. Pokušaj ponovno.';
                    } ?>
                </h5>
                <input type="submit" class="submit" value="Enter">
            </fieldset>
        </form>
    </div>

    <!-- Javascript i ostale skripte start -->
    <?php include_once 'include/skripte.php'; ?>
    <!-- Skripte kraj -->
</body>

</html>