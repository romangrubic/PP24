<?php
session_start();
if (!isset($_SESSION['user']['username'])) {
    header('location: index.php');
    exit;
}

require_once 'classes/Funkcije.classes.php';

if (isset($_POST['text']) && !empty($_POST['text'])) {
    $poruka = 'Dodaj novu objavu.';
    $color=$_POST['backgroundcolor'];
    POST::insertPost($color);
} else if ($_SESSION['user']['login'] !== 0) {
    $poruka = 'Objava ne moze biti prazna!';
    $boja = 'crvena2';
} else {
    $poruka = 'Dodaj novu objavu';
    $_SESSION['user']['login']++;
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
            <h3 class="large-7 ime"><?php echo $_SESSION['user']['username']; ?></h3>
            <a class="button alert odjava large-3" href="odjava.php">Odjavi se.</a>
        </div>
        <hr>
        <section class="addPost">
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                <!-- <legend>Dodaj novu objavu.</legend> -->
                <label for="text" class="poruka2 <?php echo $boja; ?>"><?php echo $poruka; ?></label>
                <textarea name="text" id="text" cols="20" rows="3"></textarea>
                <label for="color">Odaberite boju pozadine, ako želite.</label>
                <input type="color" name="backgroundcolor" id="color" value="#ffffff" >
                <input class="button warning" type="submit" value="Objavi!">
            </form>
        </section>
        <hr>
        <section class="postSection">
            <?php
            $data = $_SESSION['data'];

            foreach ($data as $post) : ?>
                <div class="objave grid-x" style="background-color:<?php echo $post['background']; ?>">
                    <?php
                    Post::writePost($post);
                    if ($_SESSION['user']['username'] == $post['username']) {
                        echo '
                            <a class="button alert odjava large-3" href="deletePost.php?postId=' . $post['id'] . '">Obrisi objavu.</a>        
                                ';
                    } ?>
                </div>
            <?php endforeach; ?>
        </section>
    </div>


    <!-- Start skripte.php -->
    <?
    include_once 'includes/skripte.php';
    ?>
    <!-- Zavrsetak skripte.php -->
</body>

</html>