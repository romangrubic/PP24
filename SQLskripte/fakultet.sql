drop database if exists fakultet;
create database fakultet;
use fakultet;

create table student(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table kolegij(
    sifra   int not null primary key auto_increment,
    naziv     varchar(50) not null
);

create table rok(
    sifra   int not null primary key auto_increment,
    datum datetime,
    kolegij int not null
);

create table prijava(
    student int not null,
    rok int not null
);

alter table rok add foreign key (kolegij) references kolegij(sifra);

alter table prijava add foreign key (student) references student(sifra);
alter table prijava add foreign key (rok) references rok(sifra);

