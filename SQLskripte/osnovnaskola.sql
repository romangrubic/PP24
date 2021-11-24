drop database if exists osnovnaskola;
create database osnovnaskola;
use osnovnaskola;

create table djecjaradionica(
    sifra   int not null primary key auto_increment,
    naziv     varchar(50) not null,
    voditeljica int not null
);

create table voditeljica(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table dijete(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table djecjaradionica_dijete(
    djecjaradionica int not null,
    dijete int not null
);

alter table djecjaradionica add foreign key (voditeljica) references voditeljica(sifra);

alter table djecjaradionica_dijete add foreign key (djecjaradionica) references djecjaradionica(sifra);
alter table djecjaradionica_dijete add foreign key (dijete) references dijete(sifra);
