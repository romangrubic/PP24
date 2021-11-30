drop database if exists vjezba_1;
create database vjezba_1;
use vjezba_1;

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

alter table cura add foreign key (punac) references punac(sifra);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);


create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

alter table zena add foreign key (sestra) references sestra(sifra);


create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

alter table muskarac add foreign key (zena) references zena(sifra);


create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno bit,
    ekstroventno bit not null,
    dukserica varchar(48) not null,
    muskarac int not null
);

alter table mladic add foreign key (muskarac) references muskarac(sifra);

-- 1.zadatak
insert into sestra(sifra,introvertno,haljina,maraka,hlace,narukvica) values
(null,null,'Smeda haljina',null,'Plave hlace',5),
(null,null,'Plava haljina',null,'Bijele hlace',5),
(null,null,'Crvena haljina',null,'Smede hlace',5);

insert into zena(sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra) values
(null,null,'banana','Bijeanajica','12345678901','Plave oci',null,1),
(null,null,null,'Crvena majica','12344678901','Smede oci',null,2),
(null,null,null,'Crna majica','12388878901','Zelene oci',null,3);

insert into muskarac(sifra, bojaociju,hlace,modelnaocala,maraka,zena) values
(null,'plaver oci',null,null,35.77,1),
(null,'smede oci',null,null,36.77,2),
(null,'zelene oci',null,null,21.77,3);

insert into svekar(sifra,bojaociju,prstena,dukserica,lipa,eura,majica) values
(null,'plave',null,'plava duksa',null,null,null);

insert into sestra_svekar(sifra,sestra,svekar) values 
(null,1,1),
(null,2,1),
(null,3,1);

-- 2.zadatak
update cura 
set gustoca=15.77;

-- 3.zadatak
delete from mladic 
where kuna>15.78;

-- 4.zadatak
select kratkamajica 
from zena 
where hlace like '%ana%';

-- 5.zadatak
select dukserica 
from svekar;

select asocijalno 
from mladic;

select a.hlace
from muskarac a
inner join zena b on b.sifra=a.zena
inner join sestra c on b.sestra=c.sifra
where b.hlace like 'a%' and c.haljina like '%ba%'
group by a.hlace desc;

-- 6.zadatak
select haljina, maraka
from sestra 
where sifra not in (select sestra from sestra_svekar);

