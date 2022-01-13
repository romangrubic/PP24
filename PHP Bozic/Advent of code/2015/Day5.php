<?php


$file = file('Day5.txt');

$nice = 0;

foreach ($file as $string) {

    // IF string has one those, it will jump to next iteration (continue)
    if (strpos($string,'ab') === false || strpos($string,'cd') === false  || strpos($string,'pq') === false  || strpos($string,'xy') === false ) {
        continue;
    }

    $doublechar = false;
    
    for ($i = 0; $i < strlen($string); $i++) {
        $firstchar = substr($string, $i, 1);
        $secondchar = substr($string, $i + 1, 1);

        if ($firstchar === $secondchar) {
            $doublechar = true;
        }
    }

    $vowels = substr_count($string, 'a') + substr_count($string, 'e') + substr_count($string, 'i') + substr_count($string, 'o') + substr_count($string, 'u');

    if ($valid && $vowels >= 3) {
        $nice++;
    }
}

echo count($file);
echo '<hr/>';
echo 'Nice ' . $nice;
