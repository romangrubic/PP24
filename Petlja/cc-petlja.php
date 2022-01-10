<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Head start -->
    <?php require_once 'includes/head.php'; ?>
    <!-- Head finish -->
</head>

<body>
    <div class="container form">
        <div class="row">
            <form method="GET" class="mx-auto">
                <input type="number" name="row">
                <input type="number" name="column">
                <button action="submit">Submit</button>
            </form>
        </div>
    </div>



    <?php

    spirala($_GET['row'], $_GET['column']);

    function spirala($row, $column)
    {
        // Number of cells in the whole table
        $size = ($row * $column);

        // Array start from 0 so we have to decrement by 1 in order to preserve it
        $column--;
        $row--;

        // We are defining our 2-d matrix
        $top = 0;
        $right = $column;
        $bottom = $row;
        $left = 0;

        // Counter to show the user and compare with size 
        $counter = 1;

        // We push the counter in it's position inside multidimensional array
        $list = [];

        while ($counter <= $size) {
            for ($i = $bottom; $i >= $top; $i--) {
                $list[$i][$right] = $counter++;
            };
            $right--;
            if($counter>$size) break;

            for ($i = $right; $i >= $left; $i--) {
                $list[$top][$i] = $counter++;
            };
            $top++;
            if($counter>$size) break;

            for ($i = $top; $i <= $bottom; $i++) {
                $list[$i][$left] = $counter++;
            }
            $left++;
            if($counter>$size) break;

            for ($i = $left; $i <= $right; $i++) {
                $list[$bottom][$i] = $counter++;
            }
            $bottom--;
            if($counter>$size) break;

        };

        if (isset($_GET['row']) && isset($_GET['column'])) {
            echo '<div class="container mx-auto">';
            echo '<table>';
            for ($i = 0; $i <= $row; $i++) {
                echo '<tr>';
                for ($j = 0; $j <= $column; $j++) {
                    echo '<td>' . $list[$i][$j] . '</td>';
                };
                echo '</tr>';
            };
            echo '</table>';
            echo '</div>';
        }
    }
    ?>

</body>

</html>