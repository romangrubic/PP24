<?php

class Post 
{
    public static function writePost($post){
        echo '
            <div>
                <p>'.$post['text'].'</p>
                <h4>'.$post['username'].'</h4>
            </div>
            <hr />
        ';
    }
};