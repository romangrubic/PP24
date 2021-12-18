<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Head start -->
    <?php require_once 'includes/head.php'; ?>
    <!-- Head finish -->
</head>

<body>
    <!-- Navbar start -->
    <?php require_once 'includes/navbar.php'; ?>
    <!-- Navbar finish -->
    <div class="uk-padding" style="font-size: <?php echo $_GET['font']; ?>px; background-color: <?php echo $_GET['color']; ?>;">
        <div uk-alert>
            <a class="uk-alert-close"></a>
            <h3>Font size</h3>
            <p>Change the font size in the url address where it says font=<?php echo $_GET['font']; ?></p>
        </div>

        <div uk-alert>
            <a class="uk-alert-close"></a>
            <h3>Background color</h3>
            <p>Change the background color in the url address where it says color=<?php echo $_GET['color']; ?></p>
        </div>
    </div>



    <!-- Script start -->
    <?php require_once 'includes/script.php'; ?>
    <!-- Script finish -->
</body>

</html>