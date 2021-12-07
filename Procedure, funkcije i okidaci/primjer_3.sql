drop database if exists primjer_3;
create database primjer_3;
use primjer_3;

create table prijateljica(
    id int(11) not null primary key auto_increment,
    gustoca decimal(12,7),
    maraka decimal(14,9) not null,
    treciputa datetime,
    narukvica int(11) not null
);

create table neprijatelj(
    id int(11) not null primary key auto_increment,
    gustoca decimal(13,6) not null,
    treciputa datetime,
    novcica decimal(12,8) not null,
    narukvica int(11) not null,
    prijateljica int(11)
);

alter table neprijatelj add foreign key (prijateljica) references prijateljica(id);

create table ostavljen(
    id int(11) not null primary key auto_increment,
    ekstroventno tinyint(1),
    haljina varchar(42),
    nausnica int(11),
    narukvica int(11)
);

create table djevojka(
    id int(11) not null primary key auto_increment,
    lipa decimal(13,5),
    majica varchar(35) not null,
    indiferentno tinyint(1) not null,
    kuna decimal(14,8),
    narukvica int(11) not null
);

create table punica(
    id int(11) not null primary key auto_increment,
    bojaociju varchar(40) not null,
    modelnaocala varchar(42) not null,
    ekstroventno tinyint(1),
    asocijalno tinyint(1),
    prstena int(11)
);

-----------------------------------------------------------
-- 1. Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 1346 i 5367
-- (7). Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču (7).

drop function if exists zadatak1;
DELIMITER $$
create function zadatak1(_broj int(11)) returns INT(11)
begin
    if _broj < 1346 then return 1346;
    elseif _broj between 1346 and 5367 then return _broj;
    else return 5367;
    end if;
end;
$$
DELIMITER ;


-------------------------------------------------------------
-- Kreirajte proceduru zadatak2 koja unosi 33501 zapisa u tablicu ostavljen (7). Izvesti proceduru jednom
-- tako da u tablici bude točno 33501 zapisa (7).

drop procedure if exists zadatak2;
DELIMITER $$
create procedure zadatak2()
begin
    declare _broj INT default 0;
    petlja: loop
        if _broj=33501 then leave petlja;
        end if;

            insert into ostavljen(id,ekstroventno,haljina,nausnica,narukvica) values
            (null,null,null,zadatak1(_broj),zadatak1(_broj));

            set _broj=_broj+1;
    end loop petlja;
end;
$$
DELIMITER ;

----------------------------------------------------------------
-- Kreirajte okidač zadatak3 nakon insert-a u tablicu ostavljen tako da za svaki unos u tablicu ostavljen
-- napravi po dva unosa u tablicu djevojka (7). Okidač je u funkciji, tablica djevojka ima dvostruko više zapisa
-- od tablice ostavljen (7).

drop trigger if exists zadatak3;
DELIMITER $$
create trigger zadatak3
after insert
on ostavljen
for each row
begin
    insert into djevojka(id,lipa,majica,indiferentno,kuna,narukvica) values
    (null,null,'dugamajica',1,null,21),
    (null,null,'kratkamajica',0,null,12);
end;
$$
DELIMITER ;


call zadatak2();
-----------------------------------------------------------------------------
-- Kreirajte proceduru zadatak4 koja iz tablice ostavljen zbraja svaku 8 vrijednost id-a (1,8,16,...). U tablicu
-- neprijatelj se unosi broj zapisa koji odgovaraju izračunatoj sumi (7). Izvesti proceduru jednom tako da u
-- tablici neprijatelj bude točan broj zapisa koji odgovaraju sumi odabranih brojeva (8).

drop procedure if exists zadatak4;
DELIMITER $$
create procedure zadatak4()
begin
    declare _id int default 0;
    declare kraj int default 0;
    declare suma int default 1;
    declare brojac int default 0;
    declare ostavljen_cursor cursor for select id from ostavljen order by id;
    declare continue handler for not found set kraj = 1;

    open ostavljen_cursor;
    prvapetlja: loop
        fetch ostavljen_cursor into _id;

        if kraj=1 then leave prvapetlja;
        end if;

        if _id%8=0 then set suma=suma+_id;
        end if;

    end loop prvapetlja;
    close ostavljen_cursor;


    drugapetlja: loop
        if brojac=suma then leave drugapetlja;
        end if;

        insert into neprijatelj(id,gustoca,treciputa,novcica,narukvica,prijateljica) values
        (null,12.33,now(),null,zadatak1(brojac),null);

        set brojac=brojac+1;

    end loop drugapetlja;
    
end;
$$
DELIMITER ;

call zadatak4();