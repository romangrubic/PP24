drop database if exists taksisluzba;
create database taksisluzba;
use taksisluzba;

create table vozilo(
    sifra int not null primary key auto_increment,
    proizvodac varchar(50),
    godinaproizvodnje date,
    boja varchar(50)
);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11),
    iban varchar(50),
    vozilo int
);

create table putnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

create table voznja(
    sifra int not null primary key auto_increment,
    vozac int,
    datumpocetka datetime,
    trajanjeukm decimal(18,2),
    datumzavrsetka datetime
);

create table voznja_putnik(
    voznja int not null,
    putnik int not null
);

alter table vozac add foreign key (vozilo) references vozilo(sifra);

alter table voznja add foreign key (vozac) references vozac(sifra);

alter table voznja_putnik add foreign key (voznja) references voznja(sifra);
alter table voznja_putnik add foreign key (putnik) references putnik(sifra);
