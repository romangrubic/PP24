drop database if exists frizerskisalon;
create database frizerskisalon;
use frizerskisalon;

create table djelatnica(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    iban varchar(50),
    oib char(11),
    email varchar(50)
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2) not null,
    opis text
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

create table posjet(
    sifra int not null primary key auto_increment,
    djelatnica int,
    usluga int,
    korisnik int,
    datum datetime
);

-- ALTER
alter table posjet add foreign key (djelatnica) references djelatnica(sifra);
alter table posjet add foreign key (usluga) references usluga(sifra);
alter table posjet add foreign key (korisnik) references korisnik(sifra);

-- INSERT
insert into djelatnica(sifra, ime, prezime, iban, oib, email) values
(null,'Dunja','Bogdanović','HR3340905', null, null),
(null,'Branka','Grubić',null,null,null),
(null,'X','X',null,null,null);

insert into usluga(naziv,cijena,opis) values
('Šišanje muško',20.00,'Lorem ipsum dolom'),
('Pramenovi',70.00,'Lorem ipsum pramenovi'),
('Bojanje kose',50.00,null);

insert into korisnik(ime,prezime,oib) values
('Matej','Papac',null),
('Mladen','Božić',null),
('Josip','Ervačić',null);

insert into posjet(djelatnica,usluga,korisnik,datum) values
(1,1,2,'2021-11-15 17:32'),
(2,2,3,'2021-10-30'),
(2,3,1,'2021-10-24');

