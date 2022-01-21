<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Start zaglavlje.php -->
    <?php
    include_once 'includes/zaglavlje.php';
    ?>
    <!-- Zavrsetak zaglavlje.php -->
</head>

<body>
    <section>
        <h1>Dobrodošli na HRbook!</h1>
        <form action="autoriziraj.php" method="post">
            <fieldset>
                <legend>Unesite Vaše detalje za prijavu</legend>
                <label for="username">Korisničko ime</label>
                <input type="text" name="username" id="username">
                <label for="password">Lozinka</label>
                <input type="password" name="password" id="password">
                <input type="submit" value="Prijava!">
            </fieldset>
        </form>
    </section>

    <!-- Start skripte.php -->
    <?php
    include_once 'includes/skripte.php';
    ?>
    <!-- Zavrsetak skripte.php -->
</body>

</html>