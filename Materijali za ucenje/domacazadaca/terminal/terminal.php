<?php

$podaci = [];

// Pomocna funkcija
function echoeol($parametar)
{
    echo $parametar . PHP_EOL;
};

function izbornik()
{
    echoeol('1. Pregled unesenih kupaca.');
    echoeol('2. Unos novog kupca.');
    echoeol('3. Izlaz iz aplikacije.');
    $terminal = readline('Unesi broj odabira: ');
    switch ($terminal) {
        case 1:
            pregledUnesenih();
            break;
        case 2:
            noviUnos();
            break;
        case 3:
            echoeol('Doviđenja!');
            break;
    }
};

function pregledUnesenih()
{
    if (count($GLOBALS['podaci']) === 0) {
        echoeol('Nema unesenih kupaca.');
    } else {
        echo 'Ime | Prezime | Email | Broj telefona | Ulica i broj | Grad | Postanski broj | Datum unosa' . PHP_EOL;
        foreach ($GLOBALS['podaci'] as $customer) {
            echo $customer->firstname . ' | ' . $customer->lastname . ' | ' . $customer->email . ' | ' . $customer->phonenumber . ' | ' . $customer->street . ' | ' . $customer->city .
                ' | ' . $customer->postalnumber . ' | ' . $customer->datecreated . PHP_EOL;
        }
    }
    izbornik();
};

function noviUnos()
{
    $customer = new stdClass();
    $input = readline('Unesi ime: ');
    $customer->firstname = $input;
    $input = readline('Unesi prezime: ');
    $customer->lastname = $input;
    $input = readline('Unesi email: ');
    $customer->email = $input;
    $input = readline('Unesi broj telefona: ');
    $customer->phonenumber = $input;
    $input = readline('Unesi ulicu i broj: ');
    $customer->street = $input;
    $input = readline('Unesi grad: ');
    $customer->city = $input;
    $input = readline('Unesi postanski broj: ');
    $customer->postalnumber = $input;
    $customer->datecreated = date('d/m/Y');
    $GLOBALS['podaci'][] = $customer;
    echoeol('Kupac unesen u bazu.');
    izbornik();
};

echoeol('Dobrodošli u bazu kupaca.');
izbornik();
