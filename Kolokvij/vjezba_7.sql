drop database if exists vjezba_7;
create database vjezba_7;
use vjezba_7;

create table cura(
    sifra int not null primary key auto_increment,
    lipa decimal(12,9) not null,
    introvertno bit,
    modelnaocala varchar(40),
    narukvica int,
    treciputa datetime,
    kuna decimal(14,9)
);
create table punica(
    sifra int not null auto_increment primary key,
    majica varchar(40),
    eura decimal(12,6) not null,
    prstena int,
    cura int not null
);

alter table punica add foreign key (cura) references cura(sifra);

create table zarucnik(
    sifra int not null auto_increment primary key,
    vesta varchar(34),
    asocijalno bit not null,
    modelnaocala varchar(43),
    narukvica int not null,
    novcica decimal(15,5) not null
);

create table mladic(
    sifra int not null auto_increment primary key,
    prstena int,
    lipa decimal(14,5) not null,
    narukvica int not null,
    drugiputa datetime not null
);

create table zarucnik_mladic(
    sifra int not null auto_increment primary key,
    zarucnik int not null,
    mladic int not null
);

alter table zarucnik_mladic add foreign key (zarucnik) references zarucnik(sifra);
alter table zarucnik_mladic add foreign key (mladic) references mladic(sifra);

create table ostavljen(
    sifra int not null auto_increment primary key,
    lipa decimal(14,6),
    introvertno bit not null,
    kratkamajica varchar(38) not null,
    prstena int not null,
    zarucnik int 
);

alter table ostavljen add foreign key (zarucnik) references zarucnik(sifra);

create table prijateljica(
    sifra int not null auto_increment primary key,
    haljina varchar(45),
    gustoca decimal(15,10) not null,
    ogrlica int,
    novcica decimal(12,5),
    ostavljen int
);

alter table prijateljica add foreign key (ostavljen) references ostavljen(sifra);

create table sestra(
    sifra int not null auto_increment primary key,
    bojakose varchar(34) not null,
    hlace varchar(36)  not null,
    lipa decimal(15,6),
    stilfrizura varchar(40) not null,
    maraka decimal(12,8) not null,
    prijateljica int
);

alter table sestra add foreign key (prijateljica) references prijateljica(sifra);


----------------------------------------------------------------------------------------------
-- 1. U tablice prijateljica, ostavljen i zarucnik_mladic unesite po 3
-- retka. (7)

insert into prijateljica(sifra, haljina, gustoca, ogrlica,novcica,ostavljen) values 
(null, null,7.99,null, null,null),
(null, null,71.99,null, null,null),
(null, null,6.99,null, null,null);

insert into ostavljen(sifra, lipa,introvertno,kratkamajica,prstena,zarucnik) values
(null,null,1,'plava majica',1,null),
(null,null,1,'crna majica',1,null),
(null,null,1,'crvena majica',1,null);

insert into zarucnik(sifra, vesta,asocijalno,modelnaocala,narukvica,novcica) values
(null,null,1,null,4,14.99),
(null,null,1,null,54,54.99),
(null,null,1,null,756,23.99);

insert into mladic(sifra,prstena,lipa,narukvica,drugiputa) values
(null,null,12.99,43,now()),
(null,null,2.99,473,now()),
(null,null,1657.99,3,now());

insert into zarucnik_mladic(sifra, zarucnik, mladic) values 
(null,1,1),
(null,2,2),
(null,3,3);

----------------------------------------------------------------------------------------------
-- 2. U tablici punica postavite svim zapisima kolonu eura na vrijednost
-- 15,77. (4)

update punica
set eura=15.77;

---------------------------------------------------------------------------------
-- 3. U tablici sestra obrišite sve zapise čija je vrijednost kolone hlace
-- manje od AB. (4)

delete from sestra
where hlace < 'AB';

--------------------------------------------------------------------------------
-- 4. Izlistajte kratkamajica iz tablice ostavljen uz uvjet da vrijednost
-- kolone introvertno nepoznate. (6)

select kratkamajica
from ostavljen
where introvertno is null;

-----------------------------------------------------------------------------------
-- 5. Prikažite narukvica iz tablice mladic, stilfrizura iz tablice sestra te
-- gustoca iz tablice prijateljica uz uvjet da su vrijednosti kolone
-- introvertno iz tablice ostavljen poznate te da su vrijednosti kolone
-- asocijalno iz tablice zarucnik poznate. Podatke posložite po gustoca iz
-- tablice prijateljica silazno. (10)

select a.narukvica, f.stilfrizura, e.gustoca
from mladic a
inner join zarucnik_mladic b on a.sifra=b.mladic
inner join zarucnik c on b.zarucnik=c.sifra
inner join ostavljen d on c.sifra=d.zarucnik
inner join prijateljica e on e.ostavljen=d.sifra
inner join sestra f on e.sifra=f.prijateljica
where d.introvertno is not null and c.asocijalno is not null
order by e.gustoca desc;

--------------------------------------------------------------------------------------
-- 6. Prikažite kolone asocijalno i modelnaocala iz tablice zarucnik čiji se
-- primarni ključ ne nalaze u tablici zarucnik_mladic. (5)

select asocijalno, modelnaocala
from zarucnik
where sifra not in (select distinct zarucnik from zarucnik_mladic);