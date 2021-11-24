drop database if exists muzej;
create database muzej;
use muzej;

create table izlozba(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    datumpocetka datetime,
    datumkraja datetime,
    kustos int,
    sponzor int
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    godina date,
    autor int
);

create table clan(
    izlozba int,
    djelo int
);

create table autor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    zemlja varchar(255)
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    iban varchar(50),
    oib char(11)
);

create table sponzor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    iznos decimal(18,2)
);

alter table clan add foreign key (izlozba) references izlozba(sifra);
alter table clan add foreign key (djelo) references djelo(sifra);

alter table izlozba add foreign key (kustos) references kustos(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);

alter table djelo add foreign key (autor) references autor(sifra);
