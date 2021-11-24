drop database if exists jdoo;
create database jdoo;
use jdoo;

create table djelatnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50) not null,
    iban varchar(50),
    datumpocetka datetime
);

create table kupac(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50)
);

create table usluga(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2),
    opis text
);

create table transakcija(
    id int not null primary key auto_increment,
    djelatnik int not null,
    kupac int not null,
    usluga int not null,
    vrijemeprodaje datetime
);

alter table transakcija add foreign key (djelatnik) references djelatnik(id);
alter table transakcija add foreign key (kupac) references kupac(id);
alter table transakcija add foreign key (usluga) references usluga(id);