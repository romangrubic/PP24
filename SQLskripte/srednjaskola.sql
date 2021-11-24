drop database if exists srednjaskola;
create database srednjaskola;
use srednjaskola;

create table razred(
    sifra   int not null primary key auto_increment,
    naziv     varchar(50) not null
);

create table profesor(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table ucenik(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table razred_ucenik(
    razred int not null,
    ucenik int not null
);

create table razred_profesor(
    razred int not null,
    profesor int not null
);

alter table razred_ucenik add foreign key (razred) references razred(sifra);
alter table razred_ucenik add foreign key (ucenik) references ucenik(sifra);

alter table razred_profesor add foreign key (razred) references razred(sifra);
alter table razred_profesor add foreign key (profesor) references profesor(sifra);