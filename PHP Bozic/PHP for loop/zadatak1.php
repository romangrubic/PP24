<!-- 1. Create a script that displays 1-2-3-4-5-6-7-8-9-10 on one line. There will be no hyphen(-) at starting and ending position. -->

<?php

for ($i = 1; $i <= 10; $i++) {
    if ($i === 1) {
        echo $i;
    } else {
        echo '-' . $i;
    }
}

?>