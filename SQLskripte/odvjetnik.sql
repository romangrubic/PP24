drop database if exists odvjetnik;
create database odvjetnik;
use odvjetnik;

create table odvjetnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table klijent(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table suradnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table obrana(
    sifra int not null primary key auto_increment,
    odvjetnik int,
    klijent int not null
);

create table obrana_suradnik(
    obrana int not null,
    suradnik int not null
);

alter table obrana add foreign key (odvjetnik) references odvjetnik(sifra);
alter table obrana add foreign key (klijent) references klijent(sifra);

alter table obrana_suradnik add foreign key (obrana) references obrana(sifra);
alter table obrana_suradnik add foreign key (suradnik) references suradnik(sifra);



