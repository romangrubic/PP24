drop database if exists udrugazazastituzivotinja;
create database udrugazazastituzivotinja;
use udrugazazastituzivotinja;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table zivotinja(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    vrsta varchar(50) not null,
    pasmina varchar(50) not null,
    osoba int,
    prostor int not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    oznaka varchar(50) not null,
    velicinaum2 decimal(18,2) not null
);

alter table zivotinja add foreign key (osoba) references osoba(sifra);
alter table zivotinja add foreign key (prostor) references prostor(sifra); 