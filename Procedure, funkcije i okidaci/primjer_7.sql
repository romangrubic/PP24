drop database if exists primjer_7;
create database primjer_7;
use primjer_7;

create table zena(
    id int(11) not null primary key auto_increment,
    carape varchar(35) not null,
    gustoca decimal(12,5),
    ekstroventno tinyint(1) not null,
    prstena int(11)
);

create table ostavljena(
    id int(11) not null primary key auto_increment,
    haljina varchar(50) not null,
    asocijalno tinyint(1) not null,
    treciputa datetime,
    hlace varchar(44),
    narukvica int(11) not null,
    zena int(11)
);

alter table ostavljena add foreign key (zena) references zena(id);

create table djevojka(
    id int(11) not null primary key auto_increment,
    asocijalno tinyint(1) not null,
    prviputa datetime not null,
    bojakose varchar(38) not null,
    ogrlica int(11)
);

create table mladic(
    id int(11) not null primary key auto_increment,
    introvertno tinyint(1),
    majica varchar(34) not null,
    indiferentno tinyint(1) not null,
    nausnica int(11)
);

create table snasa(
    id int(11) not null primary key auto_increment,
    eura decimal(17,9),
    dukserica varchar(31),
    introvertno tinyint(1) not null,
    nausnica int(11)
);

------------------------------------------------------------------------------------------------
-- Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 948 i 5234
-- (7). Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču (7).

drop function if exists zadatak1;
DELIMITER $$
create function zadatak1(broj int(11)) returns int(11)
begin
    if broj < 948 then return 948;
    elseif broj between 948 and 5234 then return broj;
    else return 5234;
    end if;
end;
$$
DELIMITER ;

-------------------------------------------------------------------------------------------------------
-- Kreirajte proceduru zadatak2 koja unosi 54972 zapisa u tablicu snasa (7). Izvesti proceduru jednom tako
-- da u tablici bude točno 54972 zapisa (7).

drop procedure if exists zadatak2;
DELIMITER $$
create procedure zadatak2()
begin
    declare brojac int default 0;

    petlja: loop
        if brojac=54972 then leave petlja;
        end if;

        insert into snasa(id,eura,dukserica,introvertno,nausnica) values
        (null,null,null,1,zadatak1(brojac));

        set brojac=brojac+1;

        end loop petlja;
end;
$$
DELIMITER ;

------------------------------------------------------------------------------------------------------------
-- Kreirajte okidač zadatak3 nakon insert-a u tablicu snasa tako da za svaki unos u tablicu snasa napravi po
-- dva unosa u tablicu mladic (7). Okidač je u funkciji, tablica mladic ima dvostruko više zapisa od tablice
-- snasa (7).

drop trigger if exists zadatak3;
DELIMITER $$
create trigger zadatak3
after insert
on snasa
for each row
begin
    insert into mladic(id,introvertno,majica,indiferentno,nausnica) values
    (null,null,'majicaplava',1,zadatak1(34)),
    (null,null,'majicacrna',0,zadatak1(9786));
end;
$$
DELIMITER ;

call zadatak2();

------------------------------------------------------------------------------------------------------------------
-- Kreirajte proceduru zadatak4 koja iz tablice snasa zbraja svaku 9 vrijednost id-a (1,9,18,...). U tablicu
-- ostavljena se unosi broj zapisa koji odgovaraju izračunatoj sumi (7). Izvesti proceduru jednom tako da u
-- tablici ostavljena bude točan broj zapisa koji odgovaraju sumi odabranih brojeva (8).

drop procedure if exists zadatak4;
DELIMITER $$
create procedure zadatak4()
begin
    declare suma int default 1;
    declare kraj int default 0;
    declare _id int;
    declare brojac int default 0;
    declare snasa_cursor cursor for select id from snasa order by id;
    declare continue handler for not found set kraj=1;

    open snasa_cursor;
    prvapetlja: loop

        fetch snasa_cursor into _id;

        if kraj=1 then leave prvapetlja;
        end if;

        if _id%9=0 then set suma=suma+_id;
        end if;

    end loop prvapetlja;

    select suma;

    drugapetlja:loop
        if brojac=suma then leave drugapetlja;
        end if;

        insert into ostavljena(id,haljina,asocijalno,treciputa,hlace,narukvica,zena) values
        (null,'haljina',1,null,null,zadatak1(brojac),null);

        set brojac=brojac+1;

    end loop drugapetlja;

end;
$$
DELIMITER ;


call zadatak4();