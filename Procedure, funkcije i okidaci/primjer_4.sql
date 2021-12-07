drop database if exists primjer_4;
create database primjer_4;
use primjer_4;

create table sestra(
    id int(11) not null primary key auto_increment,
    indiferentno tinyint(1),
    eura decimal(15,9) not null,
    ogrlica int(11) not null,
    narukvica int(11)
);

create table ostavljen(
    id int(11) not null primary key auto_increment,
    kratkamajica varchar(39) not null,
    narukvica int(11) not null,
    prstena int(11),
    nausnica int(11) not null,
    sestra int(11)
);

alter table ostavljen add foreign key (sestra) references sestra(id);

create table punac(
    id int(11) not null primary key auto_increment,
    narukvica int(11),
    eura decimal(15,8),
    indiferentno tinyint(1) not null,
    prstena int(11)
);

create table svekrva(
    id int(11) not null primary key auto_increment,
    kuna decimal(14,8) not null,
    dukserica varchar(32) not null,
    maraka decimal(14,7) not null,
    narukvica int(11) not null
);

create table svekar(
    id int(11) not null primary key auto_increment,
    kuna decimal(12,6),
    kratkamajica varchar(45),
    novcica decimal(12,8),
    indiferentno tinyint(1),
    narukvica int(11) not null
);


-----------------------------------------------------------
-- Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 1275 i 5317
-- (7). Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču (7).

drop function if exists zadatak1;
DELIMITER $$
create function zadatak1(broj int(11)) returns int(11)
begin
    if broj < 1275 then return 1275;
    elseif broj between 1275 and 5317 then return broj;
    else return 5317;
    end if;
end;
$$
DELIMITER ;

------------------------------------------------------------------
-- Kreirajte proceduru zadatak2 koja unosi 49888 zapisa u tablicu svekrva (7). Izvesti proceduru jednom
-- tako da u tablici bude točno 49888 zapisa (7).

drop procedure if exists zadatak2;
DELIMITER $$
create procedure zadatak2()
begin
    declare brojac int default 0;
    petlja: loop
        if brojac=49888 then leave petlja;
        end if;

        insert into svekrva(id,kuna,dukserica,maraka,narukvica) values
        (null,13.22,'dukserica',9.99,zadatak1(brojac));

        set brojac=brojac+1;

    end loop petlja;
end;
$$
DELIMITER ;

-----------------------------------------------------------------------
-- Kreirajte okidač zadatak3 nakon insert-a u tablicu svekrva tako da za svaki unos u tablicu svekrva napravi
-- po dva unosa u tablicu svekar (7). Okidač je u funkciji, tablica svekar ima dvostruko više zapisa od tablice
-- svekrva (7).

drop trigger if exists zadatak3;
DELIMITER $$
create trigger zadatak3
after insert
on svekrva
for each row
begin
    insert into svekar(id,kuna,kratkamajica,novcica,indiferentno,narukvica) values
    (null,null,null,null,null,zadatak1(1234));
end;
$$
DELIMITER ;

call zadatak2();

-------------------------------------------------------------------------
-- Kreirajte proceduru zadatak4 koja iz tablice svekrva zbraja svaku 5 vrijednost id-a (1,5,10,...). U tablicu
-- ostavljen se unosi broj zapisa koji odgovaraju izračunatoj sumi (7). Izvesti proceduru jednom tako da u
-- tablici ostavljen bude točan broj zapisa koji odgovaraju sumi odabranih brojeva (8).

drop procedure if exists zadatak4;
DELIMITER $$
create procedure zadatak4()
begin

    declare _id int default 0;
    declare kraj int default 0;
    declare suma int default 1;
    declare brojac int default 0;
    declare svekrva_cursor cursor for select id from svekrva order by id;
    declare continue handler for not found set kraj=1;

    open svekrva_cursor;
    prvapetlja: loop
        fetch svekrva_cursor into _id;

        if kraj=1 then leave prvapetlja;
        end if;

        if _id%5=0 then set suma=suma+_id;
        end if;

    end loop prvapetlja;
    close svekrva_cursor;

    drugapetlja: loop
        if brojac=suma then leave drugapetlja;
        end if;

        insert into ostavljen(id,kratkamajica,narukvica,prstena,nausnica,sestra) values
        (null,'kratka majica', zadatak1(brojac),null,zadatak1(brojac),null);

        set brojac=brojac+1;
    end loop drugapetlja;
end;
$$
DELIMITER ;

call zadatak4;