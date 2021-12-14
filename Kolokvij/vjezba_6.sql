drop database if exists vjezba_6;
create database vjezba_6;
use vjezba_6;

create table punac(
    sifra int not null primary key auto_increment,
    ekstroventno bit not null,
    suknja varchar(30) not null,
    majica varchar(44) not null,
    prviputa datetime not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(48) not null,
    suknja varchar(42) not null,
    ogrlica int not null,
    treciputa datetime not null,
    dukserica varchar(32) not null,
    narukvica int not null,
    punac int
);

alter table svekrva add foreign key (punac) references punac(sifra);

create table ostavljena(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    kratkamajica varchar(39) not null,
    drugiputa datetime,
    maraka decimal(14,10)
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    haljina varchar(35),
    prstena int not null,
    introvertno bit,
    stilfrizura varchar(36) not null
);

create table prijatelj_ostavljena(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    ostavljena int not null
);

alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena(sifra);

create table brat(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    treciputa datetime not null,
    narukvica int not null,
    hlace varchar(31),
    prijatelj int
);

alter table brat add foreign key (prijatelj) references prijatelj(sifra);

create table zena(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8) not null,
    narukvica int not null,
    dukserica varchar(40) not null,
    haljina varchar(30),
    hlace varchar(32),
    brat int not null
);

alter table zena add foreign key (brat) references brat(sifra);

create table decko(
    sifra int not null primary key auto_increment,
    prviputa datetime,
    modelnaocala varchar(41),
    nausnica int,
    zena int not null
);

alter table decko add foreign key (zena) references zena(sifra);

------------------------------------------------------------------------------------
-- U tablice zena, brat i prijatelj_ostavljena unesite po 3 retka. (7)

insert into ostavljena(sifra,prviputa,kratkamajica,drugiputa,maraka) values
(null,now(),'kratkamajica',null,null),
(null,now(),'kratkamajica',null,null),
(null,now(),'kratkamajica',null,null);

insert into prijatelj(sifra,haljina,prstena,introvertno,stilfrizura) values
(null,null,2,null,'stilfrizura'),
(null,null,2,null,'stilfrizura'),
(null,null,2,null,'stilfrizura');

insert into prijatelj_ostavljena(sifra,prijatelj,ostavljena) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into brat(sifra,nausnica,treciputa,narukvica,hlace,prijatelj) values
(null,1,now(),1,null,null),
(null,2,now(),2,null,null),
(null,3,now(),3,null,null);

insert into zena(sifra,novcica,narukvica,dukserica,haljina,hlace,brat) values
(null,13.23,4,'dukserica',null,null,1),
(null,5.23,2,'dukserica',null,null,2),
(null,9.33,1,'dukserica',null,null,3);

---------------------------------------------------------------------------------------
-- U tablici svekrva postavite svim zapisima kolonu suknja na
-- vrijednost Osijek. (4)

update svekrva
set suknja='Osijek';

---------------------------------------------------------------------------------------
-- U tablici decko obrišite sve zapise čija je vrijednost kolone
-- modelnaocala manje od AB. (4)

delete from decko 
where modelnaocala < 'AB';

---------------------------------------------------------------------------------------
-- Izlistajte narukvica iz tablice brat uz uvjet da vrijednost kolone
-- treciputa nepoznate. (6)

select narukvica
from brat
where treciputa is null;

------------------------------------------------------------------------------------------
-- Prikažite drugiputa iz tablice ostavljena, zena iz tablice decko te
-- narukvica iz tablice zena uz uvjet da su vrijednosti kolone treciputa iz
-- tablice brat poznate te da su vrijednosti kolone prstena iz tablice
-- prijatelj jednake broju 219. Podatke posložite po narukvica iz tablice
-- zena silazno. (10)

select a.drugiputa, f.zena, e.narukvica
from ostavljena a 
inner join prijatelj_ostavljena b on a.sifra=b.ostavljena
inner join prijatelj c on b.prijatelj=c.sifra
inner join brat d on d.prijatelj=c.sifra
inner join zena e on e.brat=d.sifra
inner join decko f on f.zena=e.sifra
where d.treciputa is not null and c.prstena=219
order by e.narukvica desc; 

--------------------------------------------------------------------------------------------
-- Prikažite kolone prstena i introvertno iz tablice prijatelj čiji se
-- primarni ključ ne nalaze u tablici prijatelj_ostavljena. (5)

select prstena, introvertno
from prijatelj
where sifra not in (select distinct prijatelj from prijatelj_ostavljena);