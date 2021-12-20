<?php

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
        for ($i = $right; $i >= $left; $i--) {
            $list[$bottom][$i] = $counter++;
        }
        $bottom--;

        for ($i = $bottom; $i >= $top; $i--) {
            $list[$i][$left] = $counter++;
        }
        $left++;

        for ($i = $left; $i <= $right; $i++) {
            $list[$top][$i] = $counter++;
        };
        $top++;

        for ($i = $top; $i <= $bottom; $i++) {
            $list[$i][$right] = $counter++;
        };
        $right--;
    };
}
