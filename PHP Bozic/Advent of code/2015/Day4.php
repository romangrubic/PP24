<?php

$input='ckczppom';

$found=false;

$md=0;

$i=0;

while(!$found){
    $md5=md5($input.$i);

    $sub= substr($md5,0,6);

    if($sub==='000000'){
        $found=true;
        $md=$md5;
    } else {
        $i++;
    }
}
echo $md.' md';

echo $i;


?>