<!-- 19. Arithmetic operations on character variables : $d = 'A00'. Using this variable print the following numbers. 
Sample Output :
A01
A02
A03
A04
A05 -->


<?php

$d='A00';

for($i;$i<5;$i++){
    echo ++$d.'<br/>';
}

?>