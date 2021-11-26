drop database if exists djecjaigraonica;
create database djecjaigraonica character set utf8;
use djecjaigraonica;

create table teta(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    iban varchar(50)
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) 
);

create table skupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    teta int not null
);

create table skupina_dijete(
    skupina int not null,
    dijete int not null
);

alter table skupina add foreign key (teta) references teta(sifra);
alter table skupina_dijete add foreign key (skupina) references skupina(sifra);
alter table skupina_dijete add foreign key (dijete) references dijete(sifra);

-- INSERT
insert into teta(sifra, ime, prezime, oib, iban) values
(null,'Dunja','Grubić',null,null),
(null,'Mirna','Cecelja',null,null);

insert into dijete(sifra,ime,prezime,oib) values
(null,'Roman','Grubić',null),
(null,'Matija','Horvat',null);

insert into skupina(sifra,naziv,teta) values
(null,'Odojčići',1),
(null,'Bubamare',2);

insert into skupina_dijete(skupina,dijete) values
(1,1),
(2,2);

-- UPDATE

update teta set prezime='Bogdanović' where sifra=1;
update teta set prezime='Horvat' where sifra=2;

-- JOIN
-- izlistaj ime, prezime i ime skupine za djecu kojoj je teta Dunja.

select a.ime, a.prezime, c.naziv as naziv_skupine
from dijete a 
inner join skupina_dijete b on a.sifra=b.dijete
inner join skupina c on b.skupina=c.sifra
inner join teta d on c.teta=d.sifra
where d.ime='Dunja';