<!-- Napišite funkciju koja će prilikom prvog poziva
vratiti 50, prilikom drugog poziva 49, prilikom
trećeg 48, itd, a za sve pozive nakon pedesetog
vratiti 0. -->

<?php

$x = 50;

function globaldecrement()
{
    global $x;

    if ($x >= 0) {
        echo $x-- . '<br/>';
    } else {
        echo '0<br/>';
    }
}

for ($i = 55; $i >= 0; $i--) {
    globaldecrement();
}

?>