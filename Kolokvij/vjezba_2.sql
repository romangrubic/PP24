drop database if exists vjezba_2;
create database vjezba_2;
use vjezba_2;

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime null,
    ekstroventno bit not null,
    prviputa datetime,
    svekar int not null
);

alter table prijatelj add foreign key (svekar) references svekar(sifra);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);

alter table cura add foreign key (decko) references decko(sifra);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

alter table neprijatelj add foreign key (cura) references cura(sifra);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

-- 1.zadatak

insert into decko(sifra,indiferentno,vesta,asocijalno) values
(null,1,'vesta',0),
(null,0,'majica',0),
(null,1,'hlace',1);

insert into zarucnica(sifra,narukvica,bojakose,novcica,lipa,indiferentno) values
(null,null,'kasjhfasj',null,9.99,0),
(null,null,'lajati',null,19.99,0),
(null,null,'burek',null,29.99,0);

insert into decko_zarucnica(sifra,decko,zarucnica) values 
(null,1,1),
(null,2,2),
(null,3,3);

insert into neprijatelj(sifra,majica,haljina,lipa,modelnaocala,kuna,jmbag,cura) values
(null,null,'haljina',null,'modelnaocala',15.66,null,null),
(null,null,'halaajina',null,'modeaocala',10.66,null,null),
(null,null,'haljaaina',null,'modelnfdsala',12.66,null,null);

insert into cura(sifra,haljina,drugiputa,suknja,narukvica,introvertno,majica,decko) values
(null,'haljina','2021-10-10',null,null,null,'majica',null),
(null,'halfdgfjina','2021-09-09',null,null,null,'masdjica',null),
(null,'haldsjkljina','2021-11-11',null,null,null,'majsfdica',null);

-- 2.zadatak
update prijatelj 
set treciputa='2020-04-30';

-- 3.zadatak
delete from brat
where ogrlica <> 14;

-- 4.zadatak
select suknja 
from cura
where drugiputa is null;

-- 5.zadatak
select a.novcica, f.neprijatelj, e.haljina
from zarucnica a 
inner join decko_zarucnica b on a.sifra=b.zarucnica
inner join decko c on b.decko=c.sifra
inner join cura d on c.sifra=d.decko
inner join neprijatelj e on d.sifra=e.cura
inner join brat f on e.sifra=f.neprijatelj
where d.drugiputa is not null and c.vesta like '%ba%'
group by e.haljina desc;

-- 6.zadatak
select vesta, asocijalno 
from decko
where sifra not in (select distinct decko from decko_zarucnica);
