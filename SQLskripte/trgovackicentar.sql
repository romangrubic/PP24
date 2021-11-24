drop database if exists trgovackicentar;
create database trgovackicentar;
use trgovackicentar;

create table djelatnik(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table sef(
    sifra   int not null primary key auto_increment,
    djelatnik int not null,
    iban varchar(50)
);

create table trgovina(
    sifra   int not null primary key auto_increment,
    sef int not null,
    oib     char(11)
);

create table trgovina_djelatnik(
    trgovina int not null,
    djelatnik int not null
);

alter table sef add foreign key (djelatnik) references djelatnik(sifra);

alter table trgovina add foreign key (sef) references sef(sifra);

alter table trgovina_djelatnik add foreign key (trgovina) references trgovina(sifra);
alter table trgovina_djelatnik add foreign key (djelatnik) references djelatnik(sifra);