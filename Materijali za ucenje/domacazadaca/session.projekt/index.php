<?php
if(isset($_GET['error'])){
    $poruka='Morate unijeti korisničko ime i ispravnu lozinku!';
    $boja='crvena';
}else{
    $poruka='Unesite Vaše detalje za prijavu.';
}
?>

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
    <section class="section">
            <h1>Dobrodošli na HRbook!</h1>
            <form action="autoriziraj.php" method="post">
                <fieldset class="loginDetalji">
                <legend class="poruka <?php echo $boja; ?>"><?php echo $poruka; ?></legend>                
                    <label for="username">Korisničko ime</label>
                    <input type="text" name="username" id="username" class="detalji">
                    <label for="password">Lozinka</label>
                    <input type="password" name="password" id="password" class="detalji">
                    <input type="submit" class="button warning" value="Prijava!">
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