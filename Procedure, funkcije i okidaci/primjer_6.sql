drop database if exists primjer_6;
create database primjer_6;
use primjer_6;

create table zarucnica(
    id int(11) not null primary key auto_increment,
    introvertno tinyint(1) not null,
    novcica decimal(16,7),
    stilfrizura varchar(43) not null,
    prstena int(11) not null
);

create table punac(
    id int(11) not null primary key auto_increment,
    novcica decimal(14,6),
    introvertno tinyint(1) not null,
    indiferentno tinyint(1) not null,
    narukvica int(11) not null,
    zarucnica int(11)
);

alter table punac add foreign key (zarucnica) references zarucnica(id);

create table decko(
    id int(11) not null primary key auto_increment,
    narukvica int(11),
    introvertno tinyint(1) not null,
    maraka decimal(16,10) not null,
    nausnica int(11),
    prstena int(11)
);

create table prijateljica(
    id int(11) not null primary key auto_increment,
    bojakose varchar(35),
    kratkamajica varchar(35) not null,
    drugiputa datetime not null,
    indiferentno tinyint(1),
    narukvica int(11) not null
);

create table sestra(
    id int(11) not null primary key auto_increment,
    dukserica varchar(44) not null,
    lipa decimal(15,7),
    nausnica int(11),
    asocijalno tinyint(1),
    narukvica int(11)
);

-----------------------------------------------------------------------------
-- Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 1346 i 4592
-- (7). Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču (7).

drop function if exists zadatak1;
DELIMITER $$
create function zadatak1(broj int(11)) returns int(11)
begin
    if broj < 1346 then return 1346;
    elseif broj between 1346 and 4592 then return broj;
    else return 4592;
    end if;
end;
$$
DELIMITER ;

----------------------------------------------------------------------------
-- Kreirajte proceduru zadatak2 koja unosi 72132 zapisa u tablicu sestra (7). Izvesti proceduru jednom tako
-- da u tablici bude točno 72132 zapisa (7).

drop procedure if exists zadatak2;
DELIMITER $$
create procedure zadatak2()
begin
    declare brojac int default 0;

    petlja: loop
    if brojac=72132 then leave petlja;
    end if;

    insert into sestra(id,dukserica,lipa,nausnica,asocijalno,narukvica) values
    (null,'dukserica',null,zadatak1(brojac),null,zadatak1(brojac));

    set brojac=brojac+1;

    end loop petlja;
end;
$$
DELIMITER ;

-------------------------------------------------------------------------------
-- Kreirajte okidač zadatak3 nakon insert-a u tablicu sestra tako da za svaki unos u tablicu sestra napravi po
-- dva unosa u tablicu decko (7). Okidač je u funkciji, tablica decko ima dvostruko više zapisa od tablice sestra
-- (7).

drop trigger if exists zadatak3;
DELIMITER $$
create trigger zadatak3
after insert
on sestra
for each row
begin
    insert into decko(id,narukvica,introvertno,maraka,nausnica,prstena) values
    (null,null,1,9.99,null,null),
    (null,null,0,43.56,null,null);
end;
$$
DELIMITER ;

call zadatak2();
----------------------------------------------------------------------------------------
-- Kreirajte proceduru zadatak4 koja iz tablice sestra zbraja svaku 8 vrijednost id-a (1,8,16,...). U tablicu
-- punac se unosi broj zapisa koji odgovaraju izračunatoj sumi (7). Izvesti proceduru jednom tako da u tablici
-- punac bude točan broj zapisa koji odgovaraju sumi odabranih brojeva (8).

drop procedure if exists zadatak4;
DELIMITER $$
create procedure zadatak4()
begin
    declare suma int default 1;
    declare _id int default 0;
    declare kraj int default 0;
    declare brojac int default 0;
    declare sestra_cursor cursor for select id from sestra order by id;
    declare continue handler for not found set kraj=1;

    open sestra_cursor;
    prvapetlja: loop
        fetch sestra_cursor into _id;

        if kraj=1 then leave prvapetlja;
        end if;

        if _id%8=0 then set suma=suma+_id;
        end if;
    end loop prvapetlja;
    close sestra_cursor;

    select suma;

    drugapetlja: loop
        if brojac=suma then leave drugapetlja;
        end if;

        insert into punac(id,novcica,introvertno,indiferentno,narukvica,zarucnica) values
        (null,null,1,0,zadatak1(brojac),null);

        set brojac=brojac+1;
    end loop drugapetlja;

end;
$$
DELIMITER ;

call zadatak4();