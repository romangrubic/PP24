drop database if exists vjezba_4;
create database vjezba_4;
use vjezba_4;

create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(43),
    introvertno bit,
    kuna decimal(14,10)
);

create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11) not null,
    novcica decimal(18,7) not null,
    maraka decimal(12,6) not null,
    ostavljen int not null
);

alter table punac add foreign key (ostavljen) references ostavljen(sifra);

create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null
);

create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prstena int not null
);

create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null
);

alter table zena_mladic add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key (mladic) references mladic(sifra);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    treciputa datetime,
    haljina varchar(44) not null,
    zena int not null
);

alter table snasa add foreign key (zena) references zena(sifra);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);

alter table becar add foreign key (snasa) references snasa(sifra);

create table prijatelj(
    sifra int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);

alter table prijatelj add foreign key (becar) references becar(sifra);


-- 1.zadatak
insert into zena(sifra,suknja,lipa,prstena) values
(null,'suknjakratka',null,2),
(null,'suknja mini',null,4),
(null,'duga suknja',null,5);

insert into mladic(sifra,kuna,lipa,nausnica,stilfrizura,vesta) values
(null,null,null,null,null,'crvena vesta'),
(null,null,null,null,null,'bijla vesta'),
(null,null,null,null,null,'plava vesta');

insert into zena_mladic(sifra,zena,mladic) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into snasa(sifra,introvertno,treciputa,haljina,zena) values
(null,null,null,'crvena haljina',1),
(null,null,null,'zelena haljina',2),
(null,null,null,'modra haljina',3);

insert into becar(sifra,novcica,kratkamajica,bojaociju,snasa) values
(null,null,'da','da',1),
(null,null,'ne','ne',2),
(null,null,'mozda','mozda',3);

-- 2.zadatak
update punac
set majica='Osijek';

-- 3.zadatak
delete from prijatelj
where prstena > 17;

-- 4.zadatak
select haljina 
from snasa
where treciputa is null;

-- 5.zadatak
select a.nausnica,f.jmbag,e.kratkamajica
from mladic a
inner join zena_mladic b on b.mladic=a.sifra
inner join zena c on c.sifra=b.zena
inner join snasa d on c.sifra=d.zena
inner join becar e on e.snasa=d.sifra
inner join prijatelj f on e.sifra=f.becar
where d.treciputa is not null and c.lipa <> 29
order by e.kratkamajica desc;

-- 6.zadatak
select lipa, prstena
from zena
where sifra not in (select distinct zena from zena_mladic);
