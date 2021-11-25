-- knjiznica DB
# BAZAKnjižnica
#izvucite sve nazive knjiga koje su izdali
#ne aktivni izdavači

# izvucite sve autore koji u svojim naslovima 
# knjiga menaju slovo B

# izvucite sve aktivne izdavače koji su izdali knjige u Zagrebu

select * from izdavac;
select * from katalog;
select * from autor;
select * from mjesto;

select a.naslov 
from katalog a inner join izdavac b on a.izdavac=b.sifra
where b.aktivan = 0;

select distinct a.*
from autor a inner join katalog b on a.sifra=b.autor
where b.naslov not like('%b%');

select a.*
from izdavac a inner join katalog b on a.sifra=b.izdavac 
inner join mjesto c on b.mjesto=c.sifra 
where c.naziv ='Zagreb'and a.aktivan=1;




-- sakila DB

# izvucite sve nazive zemalja čiji gradovi nemaju definiranu 
# adresu 

select * from address;
select * from address where address is null ;

select a.*
from country a inner join city b on a.country_id =b.country_id 
inner join address c on b.city_id =c.city_id 
where c.address is null;