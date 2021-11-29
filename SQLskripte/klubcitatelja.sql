drop database if exists klubcitatelja;
create database klubcitatelja;
use klubcitatelja;

create table citatelj(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table vlasnik(
    sifra   int not null primary key auto_increment,
    citatelj int not null
);

create table knjiga(
    sifra   int not null primary key auto_increment,
    naziv     varchar(50) not null,
    vlasnik int not null
);

create table citatelj_knjiga(
    citatelj int not null,
    knjiga int not null
);

alter table knjiga add foreign key (vlasnik) references vlasnik(sifra);
alter table citatelj_knjiga add foreign key (citatelj) references citatelj(sifra);
alter table citatelj_knjiga add foreign key (knjiga) references knjiga(sifra);
alter table vlasnik add foreign key (citatelj) references citatelj(sifra);

-- INSERT
insert into citatelj(sifra,ime,prezime,oib) values
(null,'Roman','Grubić',null),
(null,'Max','Ferdinand',null),
(null,'Mila','Unikat',null),
(null,'Tea','Mikolaj',null);

insert into vlasnik(sifra,citatelj) values 
(null,1),
(null,2),
(null,3);

insert into knjiga(sifra,naziv,vlasnik) values
(null,'Pale sam na svijetu',1),
(null,'Zlatarevo zlato',1),
(null,'Mala sirena',2),
(null,'Mali Princ',3);

insert into citatelj_knjiga(citatelj,knjiga) values 
(1,1),
(2,1),
(3,1),
(4,1),
(2,2),
(3,2),
(3,3),
(4,3),
(4,4);

-- UPDATE 
update citatelj set oib='67307252444' where ime='Roman' and prezime like 'Grubi%';
update vlasnik set citatelj=4 where sifra=3;

-- JOIN
-- izlistaj sve knjige kojima je vlasnica Tea (prezime nepoznato)
select * from citatelj;

select a.sifra as sifra_knjige, a.naziv, c.ime as vlasnik
from knjiga a 
inner join vlasnik b on a.vlasnik=b.sifra
inner join citatelj c on b.citatelj=c.sifra
where c.ime='Tea';


-- Izlistaj sve citatelje koji su procitali knjigu 'Pale sam na svijetu'
select * from knjiga;

select a.ime, a.prezime
from citatelj a
inner join citatelj_knjiga b on a.sifra=b.citatelj
inner join knjiga c on b.knjiga=c.sifra
where c.naziv='Pale sam na svijetu';