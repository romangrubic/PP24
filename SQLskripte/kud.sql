drop database if exists kud;
create database kud;
use kud;

create table mjesto(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    drzava varchar(50)
);

create table nastup(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    mjesto int not null
);

create table clan(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50)not null,
    oib char(11)
);

create table nastup_clan(
    nastup int not null,
    clan int not null
);

alter table nastup add foreign key (mjesto) references mjesto(sifra);

alter table nastup_clan add foreign key (nastup) references nastup(sifra);
alter table nastup_clan add foreign key (clan) references clan(sifra);
