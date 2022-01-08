<!-- 3. Create a script to construct the following pattern, using nested for loop. Go to the editor

*  
* *  
* * *  
* * * *  
* * * * *  -->

<?php

for($i=1;$i<=5;$i++){
    for($j=1;$j<=$i;$j++){
        echo '*';
        if($j<$i){
            echo ' ';
        }
    }
    echo '<br/>';
}

?>