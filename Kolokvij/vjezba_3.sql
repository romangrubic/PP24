drop database if exists vjezba_3;
create database vjezba_3;
use vjezba_3;

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);

alter table svekar add foreign key (cura) references cura(sifra);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno bit not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null    
);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

create table punica(
    sifra int not null primary key auto_increment,
    asocijalno bit,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

alter table punica add foreign key (snasa) references snasa(sifra);

-- 1.zadatak
insert into ostavljena(sifra,kuna,lipa,majica,modelnaocala,prijatelj) values
(null,null,null,null,'modelnaocala',null),
(null,null,null,null,'burek',null),
(null,null,null,null,'piroska',null);

insert into snasa(sifra,introvertno,kuna,eura,treciputa,ostavljena) values
(null,null,15.43,9.99,null,1),
(null,null,195.43,19.99,null,2),
(null,null,153.43,39.99,null,3);

insert into prijatelj(sifra,kuna,haljina,lipa,dukserica,indiferentno) values
(null,null,null,null,null,1),
(null,null,null,null,null,0),
(null,null,null,null,null,1);

insert into brat(sifra,jmbag,ogrlica,ekstroventno) values
(null,null,21,1),
(null,null,53,1),
(null,null,98,0);

insert into prijatelj_brat(sifra,prijatelj,brat) values
(null,1,1),
(null,2,2),
(null,3,3);

-- 2.zadatak
update svekar
set suknja='Osijek';

-- 3.zadatak
delete from punica
where kratkamajica='AB';

-- 4.zadatak / lipa je varchar
select majica
from ostavljena
where lipa not in ('9','10','20','30','35');

-- 5.zadatak
select a.ekstroventno,f.vesta,e.kuna
from brat a
inner join prijatelj_brat b on a.sifra=b.brat
inner join prijatelj c on b.prijatelj=c.sifra
inner join ostavljena d on c.sifra=d.prijatelj
inner join snasa e on d.sifra=e.ostavljena
inner join punica f on e.sifra=f.snasa
where d.lipa<>91 and c.haljina like '%ba%'
order by e.kuna desc;

--6.zadatak
select haljina,lipa 
from prijatelj
where sifra not in (select distinct prijatelj from prijatelj_brat);

