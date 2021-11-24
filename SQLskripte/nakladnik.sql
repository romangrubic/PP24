drop database if exists nakladnik;
create database nakladnik;
use nakladnik;

create table nakladnik(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    mjesto int not null,
    oib char(11)
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    autor varchar(50),
    kod varchar(50)
);

create table mjesto(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    drzava varchar(50)
);

create table nakladnik_djelo(
    nakladnik int not null,
    djelo int not null
);

alter table nakladnik add foreign key (mjesto) references mjesto(sifra);

alter table nakladnik_djelo add foreign key (nakladnik) references nakladnik(sifra);
alter table nakladnik_djelo add foreign key (djelo) references djelo(sifra);


 

