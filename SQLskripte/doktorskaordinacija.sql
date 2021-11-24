drop database if exists doktorskaordinacija;
create database doktorskaordinacija character set utf8;
use doktorskaordinacija;

create table osoba(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table doktor(
    sifra   int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table medicinskasestra(
    sifra   int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table pacijent(
    sifra   int not null primary key auto_increment,
    osoba int not null
);

create table lijecenje(
    sifra int not null primary key auto_increment,
    doktor int not null,
    pacijent int not null,
    pocetaklijecenja datetime,
    krajlijecenja datetime,
    anamnezabolesti text
);

create table lijecenje_medicinskesestre(
    lijecenje int not null,
    medicinskasestra int not null
);

alter table doktor add foreign key (osoba) references osoba(sifra);
alter table medicinskasestra add foreign key (osoba) references osoba(sifra);
alter table pacijent add foreign key (osoba) references osoba(sifra);

alter table lijecenje add foreign key (doktor) references doktor(sifra);
alter table lijecenje add foreign key (pacijent) references pacijent(sifra);

alter table lijecenje_medicinskesestre add foreign key (lijecenje) references lijecenje(sifra);
alter table lijecenje_medicinskesestre add foreign key (medicinskasestra) references medicinskasestra(sifra);
