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
    sifra int not null primary key auto_increment,
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
    pocetaklijecenja datetime not null,
    krajlijecenja datetime,
    anamnezabolesti text,
    aktivno boolean not null
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

-- INSERT
insert into osoba(sifra,ime,prezime,oib) values
(null,'Roman','Grubić',null),
(null,'Matija','Horvat',null),
(null,'Tomislav','Sabolić',null),
(null,'Kristijan','Hegeduš',null),
(null,'Matej','Papac',null),
(null,'Mladen','Božić',null),
(null,'Josip','Đunda',null),
(null,'Luka','Opančar',null),
(null,'Kristina','Galić',null);

insert into doktor(sifra,osoba,iban) values
(null,3,null),
(null,6,null),
(null,9,null);

insert into medicinskasestra(sifra,osoba,iban) values 
(null,2,null),
(null,5,null),
(null,8,null);

insert into pacijent(sifra,osoba) values 
(null,1),
(null,4),
(null,7);

insert into lijecenje(sifra,doktor,pacijent,pocetaklijecenja,krajlijecenja,anamnezabolesti,aktivno) values
(null,1,3,'2021-11-23',null,'Porezao rožnicu oka na papir gdje se nalazio burek',1),
(null,2,2,'2021-11-21',null,'Pao sa šanka na pod i zadobio traume glave',1),
(null,3,1,'2021-11-23','2021-11-25 17:23','Pacijent se naglo ustao i zavrtilo mu se u glavi. Neka se drugi put sporije ustaje.',0);

insert into lijecenje_medicinskesestre(lijecenje,medicinskasestra) values 
(1,1),
(3,1),
(2,2),
(1,2),
(3,3);

-- UPDATE
update osoba set oib='24532637674' where sifra=1;
update osoba set ime='Toni' where sifra=3;

-- JOIN

-- izlistaj ime,prezime za sve medicinske sestre koje trenutno imaju aktivno lijecenje
select * from lijecenje;

select distinct a.ime, a.prezime
from osoba a 
inner join medicinskasestra b on a.sifra=b.osoba
inner join lijecenje_medicinskesestre c on b.sifra=c.medicinskasestra
inner join lijecenje d on d.sifra=c.lijecenje
where d.aktivno=1;

-- izlistaj imena pacijenata kojima je lijecenje zavrsilo 25. studenog ove godine


select a.ime, a.prezime, a.oib
from osoba a
inner join pacijent b on b.osoba=a.sifra
inner join lijecenje c on c.pacijent=b.sifra
where c.krajlijecenja like '2021-11-25%';

