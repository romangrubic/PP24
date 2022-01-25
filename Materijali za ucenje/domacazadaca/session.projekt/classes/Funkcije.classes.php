<?php

class Login
{
    // Stvara SESSION detalje pri logiranju
    public static function setLogin($username)
    {
        $_SESSION['user']['username'] = $username;
        $_SESSION['user']['image']= 'images/noprofileimage.jpg';
        $_SESSION['user']['login']=0;
        $_SESSION['dataId']=1;
        $_SESSION['data'] = [
            [
                'username' => 'IvanHorvat',
                'text' => 'Baš me bole leđa. Jel ima tko brufen?',
                'image'=>'images/ivan.jpg'
            ],
            [
                'username' => 'Miki',
                'text' => 'Dobar dan, jel me netko tražio?',
                'image'=>'images/miki.jpeg'
            ],
            [
                'username' => 'Tekashi69',
                'text' => 'Igra li itko Tekken?',
                'image'=>'images/miki.jpeg'
            ]
        ];
    }
}

class Post
{
    // Uzima POST objekt i stvara novi post
    public static function insertPost($backgroundcolor, $textcolor){
        $podaci = [
        'username' => $_SESSION['user']['username'],
        'id'=> $_SESSION['dataId'],
        'text' => $_POST['text'],
        'background'=>$backgroundcolor,
        'textcolor'=>$textcolor,
        'image'=> $_SESSION['user']['image']
    ];

    array_unshift($_SESSION['data'], $podaci);
    $_SESSION['dataId']++;
    }

    // Ispisuje sve objave iz SESSION DATA
    public static function writePost($post)
    {
        echo '
                <p class="large-12" style="color:'.$post['textcolor'].'">' . $post['text'] . '</p>
                <div class="grid-x center">
                    <img src="'.$post['image'].'" class="user-image" alt="No profile image :/">
                    <h4>' . $post['username'] . '</h4>
                </div>
        ';
    }
};
