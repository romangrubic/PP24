<?php
require_once 'classes/Funkcije.classes.php';
session_start();
if (!isset($_SESSION['user']['username'])) {
    header('location: index.php');
    exit;
}

if (isset($_POST['text']) && !empty($_POST['text'])) {
    $podaci = [
        'username' => $_SESSION['user']['username'],
        'text' => $_POST['text']
    ];

    array_unshift($_SESSION['data'], $podaci);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Start zaglavlje.php -->
    <?
    include_once 'includes/zaglavlje.php';
    ?>
    <!-- Zavrsetak zaglavlje.php -->
</head>

<body class="board">
    <div class="section">
        <div class="container">
            <a class="button alert odjava" href="odjava.php">Odjavi se.</a>
        </div>
        <section class="addPost">
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                <!-- <legend>Dodaj novu objavu.</legend> -->
                <label for="text">Dodaj novu objavu</label>
                <textarea name="text" id="text" cols="30" rows="3"></textarea>
                <input class="button " type="submit" value="Objavi!">
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