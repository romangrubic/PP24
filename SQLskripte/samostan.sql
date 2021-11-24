drop database if exists samostan;
create database samostan;
use samostan;

create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    datumredenja datetime,
    nadredenisvecenik int
);

create table posao(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opis text
);

create table radnja(
    sifra int not null primary key auto_increment,
    posao int not null,
    svecenik int not null,
    datum datetime
);

alter table svecenik add foreign key (nadredenisvecenik) references svecenik(sifra);

alter table radnja add foreign key (posao) references posao(sifra);
alter table radnja add foreign key (svecenik) references svecenik(sifra);