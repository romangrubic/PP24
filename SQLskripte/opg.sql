drop database if exists opg;
create database opg;
use opg;

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

create table proizvod(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    djelatnik int not null
);

create table sirovina(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table proizvod_sirovina(
    proizvod int not null,
    sirovina int not null
);

alter table proizvod add foreign key (djelatnik) references djelatnik(sifra);

alter table proizvod_sirovina add foreign key (proizvod) references proizvod(sifra);
alter table proizvod_sirovina add foreign key (sirovina) references sirovina(sifra);



