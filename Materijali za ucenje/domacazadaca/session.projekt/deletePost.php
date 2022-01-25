<?php
session_start();
if (!isset($_SESSION['user']['username'])) {
    header('location: index.php');
    exit;
}

if (!isset($_GET['postId'])) {
    header('location: naslovna.php');
    exit;
}

$postId = $_GET['postId'];
$username = $_SESSION['user']['username'];
$data = $_SESSION['data'];

$counter = count($data);

for($i=0;$i<$counter;$i++){
    if($data[$i]['id']==$postId){
        unset($_SESSION['data'][$i]);
        break;
    }
};

// foreach ($data as $post) {
//     // echo 'vrtimo se' . $data[$i]['id'] . '+' . $postId . ' <hr/>';
//     if ($post['id'] == $postId) {
//         // echo $i . 'pronaden' . print_r($data[$i]) . '<hr/>';
//         unset($post);
//         break;
//     }
// };

$_SESSION['user']['login'] = 0;
header('location: naslovna.php');
