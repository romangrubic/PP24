drop database if exists primjer_1;
create database primjer_1;
use primjer_1;

create table neprijateljica(
    id int(11) not null primary key auto_increment,
    indiferentno tinyint(1) not null,
    modelnaocala varchar(39) not null,
    maraka decimal(12,10) not null,
    kratkamajica varchar(32) not null,
    ogrlica int(11)
);

create table muskarac(
    id int(11) not null primary key auto_increment,
    maraka decimal(17,7) not null,
    hlace varchar(45) not null,
    prstena int(11) not null,
    nausnica int(11),
    neprijateljica int(11) not null
);

alter table muskarac add foreign key (neprijateljica) references neprijateljica(id);

create table sestra(
    id int(11) not null primary key auto_increment,
    introvertno tinyint(1) not null,
    carape varchar(41),
    suknja varchar(40),
    narukvica int(11) not null
);

create table punac(
    id int(11) not null primary key auto_increment,
    modelnaocala varchar(39),
    treciputa datetime,
    drugiputa datetime,
    novcica decimal(14,6) not null,
    narukvica int(11)
);

create table zarucnica(
    id int not null primary key auto_increment,
    stilfrizura varchar(40),
    prstena int(11) not null,
    gustoca decimal(14,5),
    modelnaocala varchar(35) not null,
    nausnica int(11) not null    
);

-- zadatak 1
drop function if exists zadatak1;
delimiter $$
CREATE FUNCTION zadatak1(x int(11)) RETURNS int(11)
begin 
    if x < 980 then return 980;
    elseif x between 980 and 5098 then return x;
    else return 5098;
    end if;
end;
$$
delimiter ;

-- zadatak 2
drop procedure if exists zadatak2;
delimiter $$
create procedure zadatak2()
begin
    declare _kraj int default 0;

    petlja: LOOP
    if _kraj=56872 then leave petlja;
    end if;

    insert into zarucnica(id,stilfrizura,prstena,gustoca,modelnaocala,nausnica) values
    (null,null,zadatak1(_kraj),null,'modelnaocala',zadatak1(_kraj));

    set _kraj=_kraj+1;

    end loop petlja;
end;
$$
delimiter ;


-- zadatak 3
drop trigger if exists zadatak3;
delimiter $$
create trigger zadatak3
after insert
on zarucnica
for each row
begin
    insert into punac(id,modelnaocala,treciputa,drugiputa,novcica,narukvica) values
    (null,null,now(),now(),14.99,null),
    (null,null,now(),now(),9.99,null);
end;
$$
delimiter ;


call zadatak2();

-- zadatak4
insert into neprijateljica(id,indiferentno,modelnaocala,maraka,kratkamajica,ogrlica) values
(null,1,'modelnaocala',9.99,'kratkamajica',null);

drop procedure if exists zadatak4;
delimiter $$
create procedure zadatak4()
begin	
    declare _id int;
    declare _kraj int default 0;
    declare _suma int default 0;
    declare _brojilo int default 0;
    declare zarucnica_kursor CURSOR for select id from zarucnica order by id;
    declare continue handler for not found set _kraj=1;

    open zarucnica_kursor;
    petlja: loop

    fetch zarucnica_kursor into _id;

    if _kraj=1 then leave petlja;
    end if;

    if (mod(_id, 7))=0 then set _suma=_suma+_id;
    end if;

    end loop petlja;
    close zarucnica_kursor;


    sumapetlja: loop
    if _brojilo=_suma then leave sumapetlja;
    end if;

    insert into muskarac(id,maraka,hlace,prstena,nausnica,neprijateljica) values
    (null,1.99,'hlace',11,null,1);

    set _brojilo=_brojilo+1;

    end loop sumapetlja;
end;
$$
delimiter ;

call zadatak4();