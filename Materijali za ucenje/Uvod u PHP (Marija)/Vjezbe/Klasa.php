<?php

// Klasa je korisnicki definiran tip podataka
// Sadrzi podatke, funkcije te pristupna ogranicenja nad funkcijama i podacima
// Funkcije unutar klase nazivamo i postupcima (metodama)
// Klasa je nacrt po kojem ce se stvarati objekti

// Objekt je instanca (primjer) klase
// Odnos klase i objekta je poput odnosa tipa integer i konkretne varijable $x tog tipa

// Iz jedne klase moze nastati neogranicen broj objekata


// Cahurenje (skrivanje podataka ili enkapsulacija)
// Ostvaruje se pomocu modifikatora pristupa private
// Samo kod unutar klase moze pristupiti podatkovnom clanu deklariranom sa private!

// Stvaranje klase
class Automobil
{
    public $boja;
    public $godProizvodnje;
    private $trenutnaBrzina;

    // __get() is utilized for reading data from inaccessible (protected or private) or non-existing properties.
    // Izvor: https://www.php.net/manual/en/language.oop5.overloading.php#object.get
    function __get($name)
    {
        return $this->$name;
    }
    // __set() is run when writing data to inaccessible (protected or private) or non-existing properties.
    // Izvor: https://www.php.net/manual/en/language.oop5.overloading.php#object.get
    function __set($name, $value)
    {
        return $this->$name=$value;
    }
    // Sada mozemo citati i pisati u trenutnuBrzinu jer smo ubacili magic functions get i set
    // Inace dobijamo fatal error.
    
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

