<?php

// Klasa je korisnicki definiran tip podataka
// Sadrzi podatke, funkcije te pristupna ogranicenja nad funkcijama i podacima
// Funkcije unutar klase nazivamo i postupcima (metodama)
// Klasa je nacrt po kojem ce se stvarati objekti

// Objekt je instanca (primjer) klase
// Odnos klase i objekta je poput odnosa tipa integer i konkretne varijable $x tog tipa

// Iz jedne klase moze nastati neogranicen broj objekata


// Stvaranje klase
class Automobil
{
    public $boja;
    public $godProizvodnje;
    public $trenutnaBrzina;

    function ubrzaj()
    {
        $this->trenutnaBrzina +=5;
        echo 'Brzina auta je : '.$this->trenutnaBrzina.'<br/>';
    }
}

// $boja, $godinaProizvodnje i $trenutnaBrzina su podatkovni,
//  a ubrzaj() funkcijski clanovi klase
// pomocu $this pristupamo podatkovnom clanu unutar klase