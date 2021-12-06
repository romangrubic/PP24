drop database if exists primjer_2;
create database primjer_2;
use primjer_2;

create table prijatelj(
    id int(11) not null primary key auto_increment,
    gustoca decimal(16,5),
    suknja varchar(41) not null,
    asocijalno tinyint(1) not null,
    majica varchar(48),
    prstena int(11) not null
);

create table muskarac(
    id int(11) not null primary key auto_increment,
    eura decimal(15,7) not null,
    haljina varchar(41) not null,
    hlace varchar(34) not null,
    bojakose varchar(42) not null,
    narukvica int(11),
    prijatelj int(11) not null
);

alter table muskarac add foreign key (prijatelj) references prijatelj(id);

create table becar(
    id int(11) not null primary key auto_increment,
    maraka decimal(12,10),
    treciputa datetime not null,
    ekstroventno tinyint(1) not null,
    nausnica int(11)
);

create table ostavljen(
    id int(11) not null primary key auto_increment,
    ekstroventno tinyint(1) not null,
    bojaociju varchar(38) not null,
    nausnica int(11) not null,
    gustoca decimal(16,7),
    narukvica int(11)
);

create table zarucnik(
    id int(11) not null primary key auto_increment,
    kratkamajica varchar(44),
    lipa decimal(15,8),
    ekstroventno tinyint(1) not null,
    ogrlica int(11) not null,
    narukvica int(11)
);

-- -----------------
-- 1. Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 1076 i 4697
-- (7). Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču (7).

drop function if exists zadatak1;
DELIMITER $$
create function zadatak1(broj int(11)) returns int(11)
begin
    if broj < 1076 then return 1076;
    elseif broj between 1076 and 4697 then return broj;
    else return 4697;
    end if;
end;
$$
DELIMITER ;

-- -------------------------------
-- Kreirajte proceduru zadatak2 koja unosi 24064 zapisa u tablicu becar (7). Izvesti proceduru jednom tako
-- da u tablici bude točno 24064 zapisa (7).

drop procedure if exists zadatak2;
DELIMITER $$
create procedure zadatak2()
begin
    declare _broj int default 1;

    petlja: loop
        if _broj =24064 then leave petlja;
        end if;

        insert into becar(id,maraka,treciputa,ekstroventno,nausnica) values
        (null, null, now(), 1, zadatak1(_broj));

        set _broj=_broj+1;

    end loop petlja;
end;
$$
DELIMITER ;

-- ---------------------------------
-- Kreirajte okidač zadatak3 nakon insert-a u tablicu becar tako da za svaki unos u tablicu becar napravi po
-- dva unosa u tablicu ostavljen (7). Okidač je u funkciji, tablica ostavljen ima dvostruko više zapisa od tablice
-- becar (7).

drop trigger if exists zadatak3;
DELIMITER $$
create trigger zadatak3
after insert
on becar
for each row
begin
    insert into ostavljen(id,ekstroventno,bojaociju,nausnica,gustoca,narukvica) values
    (null,1,'smede oci',zadatak1(1234),null,null),
    (null,0,'plave oci',zadatak1(4321),null,null);
end;
$$
DELIMITER ;

call zadatak2();

-- -------------------------------------------
-- Kreirajte proceduru zadatak4 koja iz tablice becar zbraja svaku 8 vrijednost id-a (1,8,16,...). U tablicu
-- muskarac se unosi broj zapisa koji odgovaraju izračunatoj sumi (7). Izvesti proceduru jednom tako da u
-- tablici muskarac bude točan broj zapisa koji odgovaraju sumi odabranih brojeva (8).

insert into prijatelj(id,gustoca,suknja,asocijalno,majica,prstena) values
(null,null,'suknja',1,null,zadatak1(999));

drop procedure if exists zadatak4;
DELIMITER $$
create procedure zadatak4()
begin
    declare _id int default 0;
    declare _suma int default 1;
    declare _kraj int default 0;
    declare _brojac int default 0;
    declare becar_cursor cursor for select id from becar order by id;
    declare continue handler for not found set _kraj=1;

    open becar_cursor;
    petlja1: loop
        fetch becar_cursor into _id;
        if _kraj=1 then leave petlja1;
        end if;

        if mod(_id, 8)=0 then set _suma=_suma+_id;
        end if;
    end loop petlja1;
    close becar_cursor;

    open transaction;
    petlja2: loop
        if _brojac=_suma then leave petlja2;
        end if;

        insert into muskarac(id,eura,haljina,hlace,bojakose,narukvica,prijatelj) values
        (null,15.99,'haljina','hlace','bojakose',null,1);

        set _brojac=_brojac+1;
    end loop petlja2;
    close transaction;
end;
$$
DELIMITER ;

call zadatak4();