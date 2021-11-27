drop database if exists jdoo;
create database jdoo;
use jdoo;

create table djelatnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50) not null,
    iban varchar(50),
    datumpocetka datetime
);

create table kupac(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50)
);

create table usluga(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2),
    opis text
);

create table transakcija(
    id int not null primary key auto_increment,
    djelatnik int not null,
    kupac int not null,
    usluga int not null,
    vrijemeprodaje datetime
);

alter table transakcija add foreign key (djelatnik) references djelatnik(id);
alter table transakcija add foreign key (kupac) references kupac(id);
alter table transakcija add foreign key (usluga) references usluga(id);

-- INSERT
insert into djelatnik(id,ime,prezime,oib,email,iban,datumpocetka) values 
(null,'Roman','Grubić',null,'grubrom@gmail.com',null,'2021-11-23 09:00'),
(null,'Miki','Milan',null,'mikimilan@gmail.com',null,'2021-11-23 09:00'),
(null,'Ivanka','Horvat',null,'drmmrm@gmail.com',null,'2021-11-24 09:00');

insert into kupac(id,ime,prezime,oib,email) values 
(null,'Matej','Klik',null,null),
(null,'Bojan','Digo',null,null),
(null,'Darija','Valiant',null,null),
(null,'Kia','Tomičić',null,null);

insert into usluga(id,naziv,cijena,opis) values
(null,'Zamjena guma',99.99,null),
(null,'Pumpanje guma',2.99,null),
(null,'Balansiranje gume',19.99,null);

insert into transakcija(id,djelatnik,kupac,usluga,vrijemeprodaje) values
(null,1,3,1,'2021-11-24 13:42:49'),
(null,1,3,2,'2021-11-24 13:42:49'),
(null,3,2,3,'2021-11-24 13:49:27'),
(null,2,1,1,'2021-11-24 13:51:06');

-- UPDATE
update usluga set cijena=1.99 where naziv='Pumpanje guma';
update usluga set cijena=14.99 where naziv like '%Balansiranje%';

-- JOIN
-- izlistaj svo ime i prezime kupaca i djelatnika te vrijeme prodaje 
-- za sve racune izdane 24. studenog ove godine izmedu 13:40 i 13:50

select a.ime, a.prezime, c.ime, c.prezime, b.vrijemeprodaje
from kupac a
inner join transakcija b on b.kupac=a.id
inner join djelatnik c on b.djelatnik=c.id
where b.vrijemeprodaje >= '2021-11-24 13:40' and b.vrijemeprodaje <='2021-11-24 13:50'; 