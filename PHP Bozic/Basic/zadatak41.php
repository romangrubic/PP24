<!-- 41. Write a PHP program to print out the multiplication table upto 6*6. 
Output:

 1   2   3   4   5   6                                                                    
 2   4   6   8  10  12                                                                        
 3   6   9  12  15  18                                                                      
 4   8  12  16  20  24                                                                             
 5  10  15  20  25  30                                                                     
 6  12  18  24  30  36  -->

<?php

for($i=1;$i<7;$i++){
    for($j=1;$j<7;$j++){
        echo str_pad($i*$j, 4, "  ", STR_PAD_LEFT);
    }
    echo '<br/>';
}

?>