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

    // Metode mogu primati parametre
    function ubrzaj($koliko)
    {
        $this->trenutnaBrzina +=$koliko;
        echo 'Brzina auta je : '.$this->trenutnaBrzina.'<br/>';
    }
    function imaGodina()
    {
        $dob=date('Y') - $this->godProizvodnje;
        return $dob;
    }
}

// $boja, $godinaProizvodnje i $trenutnaBrzina su podatkovni,
//  a ubrzaj() funkcijski clanovi klase
// pomocu $this pristupamo podatkovnom clanu unutar klase


// Stvaranje objekta
$auto1=new Automobil();
$auto1->trenutnaBrzina=40;
$auto1->ubrzaj(25);
$auto1->godProizvodnje=2016;

echo 'Auto je star '.$auto1->imaGodina().' godina. <br/>';

var_dump($auto1);
// object(Automobil)#1 (3) { ["boja"]=> NULL ["godProizvodnje"]=> NULL ["trenutnaBrzina"]=> int(45) }
// Prvi objekt tog tipa (Prvi automobil) sa tri podatka. Lista s podacima, tipovima i vrijednostima

