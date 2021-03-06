drop database if exists djecjivrtic;
create database djecjivrtic character set utf8;
use djecjivrtic;

create table odgajateljica(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11),
    strucnasprema int
);

create table strucnasprema(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table odgojnaskupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    odgajateljica int
);

create table clan(
    odgojnaskupina int,
    dijete int
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

alter table odgajateljica add foreign key (strucnasprema) references strucnasprema(sifra);
alter table odgojnaskupina add foreign key (odgajateljica) references odgajateljica(sifra);
alter table clan add foreign key (odgojnaskupina) references odgojnaskupina(sifra);
alter table clan add foreign key (dijete) references dijete(sifra);

-- INSERT
insert into strucnasprema(sifra, naziv) values
(null,'Srednja stručna sprema'),
(null,'Viša stručna spreman');

insert into odgajateljica(sifra,ime,prezime,oib,strucnasprema) values
(null,'Dunja','Bogdanović',null,2),
(null,'Mirna','Horvat',null,1);

insert into odgojnaskupina(sifra,naziv,odgajateljica) values
(null,'Odojčići',1),
(null,'Ljenivci',2);

insert into dijete(sifra,ime,prezime,oib) values
(null,'Roman','Grubić',null),
(null,'Matija','Horvat',null);

insert into clan(odgojnaskupina,dijete) values
(1,1),
(2,2);

-- UPDATE 
update strucnasprema set naziv='SSS - Srednja stručna sprema' where sifra=1;
update strucnasprema set naziv='VSS - Viša stručna sprema' where sifra=2;

-- JOIN
-- pronadi dijete 'Matija' i onda pokazi ime i prezime tete odgajateljice te njenu strucnu spremu
select * from dijete where ime='Matija';

select b.ime, b.prezime, a.naziv
from strucnasprema a
inner join odgajateljica b on a.sifra=b.strucnasprema
inner join odgojnaskupina c on c.odgajateljica=b.sifra
inner join clan d on d.odgojnaskupina=c.sifra
inner join dijete e on e.sifra=d.dijete
where e.ime='Matija';