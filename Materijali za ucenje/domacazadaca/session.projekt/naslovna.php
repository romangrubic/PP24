<?php
session_start();
if (!isset($_SESSION['user']['username'])) {
    header('location: index.php');
    exit;
}

require_once 'classes/Funkcije.classes.php';

if (isset($_POST['text']) && !empty($_POST['text'])) {
    $podaci = [
        'username' => $_SESSION['user']['username'],
        'text' => $_POST['text'],
        'image'=> $_SESSION['user']['image']
    ];
    // stavljamo ih na pocetak liste.
    array_unshift($_SESSION['data'], $podaci);
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
    <div class="naslovna grid-container">
        <div class="grid-x userblok">
            <img src="images/noprofileimage.jpg" class="profile-image large-2" alt="No profile image :/">
            <h3 class="large-7 ime"><?php echo $_SESSION['user']['username'];?></h3>
            <a class="button alert odjava large-3" href="odjava.php">Odjavi se.</a>
        </div>
        <hr>
        <section class="addPost">
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                <!-- <legend>Dodaj novu objavu.</legend> -->
                <label for="text">Dodaj novu objavu</label>
                <textarea name="text" id="text" cols="20" rows="3"></textarea>
                <input class="button warning" type="submit" value="Objavi!">
            </form>
        </section>
        <hr>
        <section class="postSection">
            <?php
            $data = $_SESSION['data'];

            foreach ($data as $post) {
                Post::writePost($post);
            }
            ?>
        </section>
    </div>


    <!-- Start skripte.php -->
    <?
    include_once 'includes/skripte.php';
    ?>
    <!-- Zavrsetak skripte.php -->
</body>

</html>