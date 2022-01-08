<!-- 9. Write a PHP script using nested for loop that creates a chess board as shown below. Go to the editor
Use table width="270px" and take 30px as cell height and width.

chess board
 -->


<?php

echo '<table width="270px" cellspacing="0px" cellpadding="0px" border="1px">';
for ($i = 1; $i <= 8; $i++) {
    echo '<tr>';
    for ($j = 1; $j <= 8; $j++) {
        $count = $i + $j;
        if ($count % 2 == 0) {
            echo "<td height=30px width=30px bgcolor=#000000></td>";
        } else {
            echo "<td height=30px width=30px bgcolor=#FFFFFF></td>";
        }
    }
    echo '</tr>';
}
echo '</table>';

?>