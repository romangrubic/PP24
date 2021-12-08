drop database if exists primjer_5;
create database primjer_5;
use primjer_5;

create table punac(
    id int(11) not null primary key auto_increment,
    majica varchar(31) not null,
    kuna decimal(12,5) not null,
    ogrlica int(11) not null,
    narukvica int(11)
);

create table zarucnik(
    id int(11) not null primary key auto_increment,
    stilfrizura varchar(32),
    kuna decimal(13,9),
    eura decimal(14,5),
    indiferentno tinyint(1),
    prstena int(11),
    punac int(11)
);

alter table zarucnik add foreign key (punac) references punac(id);

create table snasa(
    id int(11) not null primary key auto_increment,
    stilfrizura varchar(38),
    majica varchar(35),
    modelnaocala varchar(43) not null,
    nausnica int(11)
);

create table neprijateljica(
    id int(11) not null primary key auto_increment,
    kratkamajica varchar(36) not null,
    bojakose varchar(41) not null,
    treciputa datetime not null,
    narukvica int(11),
    ogrlica int(11)
);

create table zena(
    id int(11) not null primary key auto_increment,
    modelnaocala varchar(40),
    dukserica varchar(46) not null,
    suknja varchar(40) not null,
    bojakose varchar(31) not null,
    narukvica int(11)
);

----------------------------------------------------------------------------
-- Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 1027 i 5327
-- (7). Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču (7).

drop function if exists zadatak1;
DELIMITER $$
create function zadatak1(broj int(11)) returns int(11)
begin
    if broj < 1027 then return 1027;
    elseif broj between 1027 and 5327 then return broj;
    else return 5327;
    end if;
end;
$$
DELIMITER ;

----------------------------------------------------------------------------------
-- Kreirajte proceduru zadatak2 koja unosi 62839 zapisa u tablicu neprijateljica (7). Izvesti proceduru
-- jednom tako da u tablici bude točno 62839 zapisa (7).

drop procedure if exists zadatak2;
DELIMITER $$
create procedure zadatak2()
begin
    declare broj int default 0;

    petlja: loop
    if broj=62839 then leave petlja;
    end if;

    insert into neprijateljica(id,kratkamajica,bojakose,treciputa,narukvica,ogrlica) values
    (null,'kratkamajica','bojakose',now(),zadatak1(broj),zadatak1(broj));

    set broj=broj+1;
    end loop petlja;
end;
$$
DELIMITER ;

-------------------------------------------------------------------------------------
-- Kreirajte okidač zadatak3 nakon insert-a u tablicu neprijateljica tako da za svaki unos u tablicu
-- neprijateljica napravi po dva unosa u tablicu zena (7). Okidač je u funkciji, tablica zena ima dvostruko više
-- zapisa od tablice neprijateljica (7).

drop trigger if exists zadatak3;
DELIMITER $$
create trigger zadatak3
after insert
on neprijateljica
for each row
begin
    insert into zena(id,modelnaocala,dukserica,suknja,bojakose,narukvica) values
    (null,null,'dukserica zelena','duga suknja','plava', null),
    (null,null,'dukserica crna','kratka suknja','zelena', null);
end;
$$
DELIMITER ;

call zadatak2();

----------------------------------------------------------------------------------------
-- Kreirajte proceduru zadatak4 koja iz tablice neprijateljica zbraja svaku 5 vrijednost id-a (1,5,10,...). U
-- tablicu zarucnik se unosi broj zapisa koji odgovaraju izračunatoj sumi (7). Izvesti proceduru jednom tako da
-- u tablici zarucnik bude točan broj zapisa koji odgovaraju sumi odabranih brojeva (8).

drop procedure if exists zadatak4;
DELIMITER $$
create procedure zadatak4()
begin
    declare suma int default 1;
    declare _id int default 0;
    declare kraj int default 0;
    declare brojac int default 0;
    declare neprijateljica_cursor cursor for select id from neprijateljica order by id;
    declare continue handler for not found set kraj=1;

    open neprijateljica_cursor;
    prvapetlja: loop

    fetch neprijateljica_cursor into _id;

    if kraj=1 then leave prvapetlja;
    end if;

    if _id%5=0 then set suma=suma+_id;
    end if;

    end loop prvapetlja;
    close neprijateljica_cursor;

    drugapetlja: loop
    if brojac=suma then leave drugapetlja;
    end if;

    insert into zarucnik(id,stilfrizura,kuna,eura,indiferentno,prstena,punac) values
    (null, null,34.55,null,1,zadatak1(brojac),null);

    set brojac=brojac+1;
    end loop drugapetlja;

end;
$$
DELIMITER ;

call zadatak4();