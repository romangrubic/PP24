<?php

class Login
{
    // Stvara SESSION detalje pri logiranju
    public static function setLogin($username)
    {
        $_SESSION['user']['username'] = $username;
        $_SESSION['data'] = [
            [
                'username' => 'IvanHorvat',
                'text' => 'Baš me bole leđa. Jel ima tko brufen?'
            ],
            [
                'username' => 'Miki',
                'text' => 'Dobar dan, jel me netko tražio?'
            ],
            [
                'username' => 'Tekashi69',
                'text' => 'Igra li itko Tekken?'
            ]
        ];
    }
}

class Post
{
    // Ispisuje sve objave u SESSION DATA
    public static function writePost($post)
    {
        echo '
            <div>
                <p>' . $post['text'] . '</p>
                <h4>' . $post['username'] . '</h4>
            </div>
            <hr />
        ';
    }
};
