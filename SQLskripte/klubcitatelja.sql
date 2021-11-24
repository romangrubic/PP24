drop database if exists klubcitatelja;
create database klubcitatelja;
use klubcitatelja;

create table citatelj(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table knjiga(
    sifra   int not null primary key auto_increment,
    naziv     varchar(50) not null,
    vlasnik int not null,
    kod varchar(50) not null
);

create table citatelj_knjiga(
    citatelj int not null,
    knjiga int not null
);

create table vlasnik(
    sifra   int not null primary key auto_increment,
    citatelj int not null
);

alter table knjiga add foreign key (vlasnik) references vlasnik(sifra);

alter table citatelj_knjiga add foreign key (citatelj) references citatelj(sifra);
alter table citatelj_knjiga add foreign key (knjiga) references knjiga(sifra);

alter table vlasnik add foreign key (citatelj) references citatelj(sifra);