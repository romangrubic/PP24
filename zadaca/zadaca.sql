################################################
#DOMAĆA ZADAĆA: UČITATI SVE BAZE
# odaberite autore koji su rođeni na Vaš datum rođenja
# uključujući i godinu

# odaberite autore koji se zovu kao Vi

# odaberite sve izdavače koji su 
# društva s ograničenom odgovornošću


##### baza world
# odaberite sve zemlje iz Europe

# unesite mjesto Donji Miholjac

# Promjenite Donji Miholjac u Špičkovinu

# Obrišite mjesto Špičkovina


-- database knjiznica

select * from autor;

select * from autor where datumrodenja like '1991-06-24%';

select * from autor where ime='Roman';

select * from izdavac;

select * from izdavac where naziv like '%d.o.o.';

-- database world

select * from country;

select * from country where Continent='Europe';

select * from city;

select * from country where name='Croatia';

insert into city(ID,Name,CountryCode,District,Population) values 
(null,'Donji Miholjac','HRV','Osijek',9491);

select * from city where Name ='Donji Miholjac';

update city set Name = 'Špičkovina',
	District = 'Zabok',
	Population = 764
	where ID=4080;
	
select * from city where ID=4080;

delete from city where ID=4080;