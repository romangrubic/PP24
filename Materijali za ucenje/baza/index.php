<?php
// Writing required files
require_once 'Class/Db.php';
require_once 'Class/Customer.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tablica</title>
</head>

<body>
    <?php
    // Placing the result of our query into $result
    $object = new Customer;
    $result = $object->getAllCustomers();
    ?>
    <!-- Creating table element for our list of customers -->
    <table border="1" cellpadding="2" cellspacing="2" style="width:80%; margin:auto;">
        <thead>
            <tr>
                <th>ID</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Email</th>
                <th>Phone number</th>
                <th>Street</th>
                <th>City</th>
                <th>Postal number</th>
                <th>Date created</th>
            </tr>
        </thead>
        <tbody>
            <!-- Foreach loop to echo out each element to the table -->
            <?php foreach ($result as $row) : ?>
                <tr>
                    <?php foreach ($row as $key => $value) : ?>
                        <td><?php echo $value ?></td>
                    <?php endforeach ?>
                </tr>
            <?php endforeach ?>
        </tbody>
    </table>
</body>

</html>