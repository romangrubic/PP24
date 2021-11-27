drop database if exists fakultet;
create database fakultet;
use fakultet;

create table student(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    oib     char(11)
);

create table kolegij(
    sifra   int not null primary key auto_increment,
    naziv     varchar(50) not null
);

create table rok(
    sifra   int not null primary key auto_increment,
    datum datetime,
    kolegij int not null
);

create table prijava(
    student int not null,
    rok int not null
);

alter table rok add foreign key (kolegij) references kolegij(sifra);

alter table prijava add foreign key (student) references student(sifra);
alter table prijava add foreign key (rok) references rok(sifra);


-- INSERT
insert into student(sifra,ime,prezime,oib) values 
(null,'Roman','Grubić',null),
(null,'Dunja','Mikić',null),
(null,'Luka','Tajak',null),
(null,'Ina','Smiljan',null);

insert into kolegij(sifra,naziv) values 
(null,'Menadžment'),
(null,'Poslovna informatika'),
(null,'Mikroekonomija');

insert into rok(sifra,datum,kolegij) values
(null,'2021-12-03 12:30',1),
(null,'2021-12-04 11:30',2),
(null,'2021-12-05 10:30',3);

insert into prijava(student,rok) values
(1,2),
(1,3),
(2,1),
(3,2),
(3,1),
(4,1),
(4,3);

-- UPDATE
update student set oib='56833467683' where sifra=1;
update kolegij set naziv='Management ljudskih resursa' where sifra=1;


-- JOIN
-- izlistaj sve studente koji su prijavili ispit za 4.prosinca

select a.ime, a.prezime
from student a
inner join prijava b on a.sifra=b.student
inner join rok c on b.rok=c.sifra
where c.datum like '2021-12-04%';

