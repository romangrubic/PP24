drop database if exists vjezba_5;
create database vjezba_5;
use vjezba_5;

create table zarucnik(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno bit not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno bit,
    zarucnik int 
);

alter table mladic add foreign key (zarucnik) references zarucnik(sifra);

create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno bit,
    vesta varchar(47) not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
);

create table svekar_cura(
    sifra int not null primary key auto_increment,
    svekar int not null,
    cura int not null
);

alter table svekar_cura add foreign key (svekar) references svekar(sifra);
alter table svekar_cura add foreign key (cura) references cura(sifra);


create table punac(
    sifra int not null primary key auto_increment,
    dukserica varchar(33),
    prviputa datetime not null,
    majica varchar(36),
    svekar int not null
);

alter table punac add foreign key (svekar) references svekar(sifra);

create table punica(
    sifra int not null primary key auto_increment,
    hlace varchar(43) not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49) not null,
    modelnaocala varchar(31) not null,
    treciputa datetime not null,
    punac int not null
);

alter table punica add foreign key (punac) references punac(sifra);

create table ostavljena(
    sifra int not null primary key auto_increment,
    majica varchar(33),
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null
);

alter table ostavljena add foreign key (punica) references punica(sifra);

-----------------------------------------------------------------------------
-- U tablice punica, punac i svekar_cura unesite po 3 retka. (7)

insert into cura(sifra,carape,maraka,asocijalno,vesta) values
(null,'carape',14.15,null,'vesta'),
(null,'carapeplave',14.15,null,'vestakratka'),
(null,'carapecrne',14.15,null,'vestadug');

insert into svekar(sifra,bojakose,majica,carape,haljina,narukvica,eura) values
(null,null,null,'carape',null,null,12.34),
(null,null,null,'carape',null,null,12.34),
(null,null,null,'carape',null,null,12.34);

insert into svekar_cura(sifra,svekar,cura) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into punac(sifra,dukserica,prviputa,majica,svekar) values
(null,null,now(),null,1),
(null,null,now(),null,2),
(null,null,now(),null,3);

insert into punica(sifra,hlace,nausnica,ogrlica,vesta,modelnaocala,treciputa,punac) values
(null,'hlace',2,null,'vesta','modelnaocala',now(),1),
(null,'hlace',2,null,'vesta','modelnaocala',now(),2),
(null,'hlace',2,null,'vesta','modelnaocala',now(),3);

-----------------------------------------------------------------------------------------------
-- U tablici mladic postavite svim zapisima kolonu haljina na
-- vrijednost Osijek. (4)

update mladic 
set haljina='Osijek';

------------------------------------------------------------------------------------
-- U tablici ostavljena obrišite sve zapise čija je vrijednost kolone
-- ogrlica jednako 17. (4)

delete from ostavljena 
where ogrlica=17;

---------------------------------------------------------------------------------
-- Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone
-- prviputa nepoznate. (6)

select majica
from punac
where prviputa is null;

-----------------------------------------------------------------------------------
-- Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te
-- nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz
-- tablice punac poznate te da su vrijednosti kolone majica iz tablice
-- svekar sadrže niz znakova ba. Podatke posložite po nausnica iz tablice
-- punica silazno. (10)

select a.asocijalno, f.stilfrizura, e.nausnica
from cura a
inner join svekar_cura b on a.sifra=b.cura
inner join svekar c on b.svekar=c.sifra
inner join punac d on c.sifra=d.svekar
inner join punica e on d.sifra=e.punac
inner join ostavljena f on e.sifra=f.punica
where d.prviputa is not null and c.majica like '%ba%'
order by e.nausnica desc;

-------------------------------------------------------------------------------------
-- Prikažite kolone majica i carape iz tablice svekar čiji se primarni
-- ključ ne nalaze u tablici svekar_cura. (5)

select majica, carape
from svekar
where sifra not in (select distinct sifra from svekar_cura order by sifra);
