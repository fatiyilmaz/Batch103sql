-- ******************* Constant ******************** 
-- Bir defa setlendigi zaman bir daha degistirilemeyen.

do $$
declare 
 vat constant numeric := 0.1;
 net_price numeric := 20.5;
begin 
 raise notice 'Satis fiyati : %' , net_price*(1+vat);
-- vat := 0.05;  --constant bir ifadeyi ilk setleme isleminden sonra deger degistirmeye calisirsak hata aliriz.
 
end $$;

-- constant bir ifadeye Run Time da deger verebilir miyim ?
do $$
declare 
 start_at constant time := now();
 
begin 
 raise notice 'blogun calisma zamani : %', start_at;
 
end $$;



-- ////////////// Control Structures ///////////////
-- ************** If Statement *********************

-- syntax :
/*
       if condition  then
	           statement;
	   end if;	   
*/

CREATE TABLE film
(
id int ,
title VARCHAR(50),
type VARCHAR(50),
length int
);
INSERT INTO film VALUES (1, 'Kuzuların Sessizliği', 'Korku',130);
INSERT INTO film VALUES (2, 'Esaretin Bedeli', 'Macera', 125);
INSERT INTO film VALUES (3, 'Kısa Film', 'Macera',40);
INSERT INTO film VALUES (4, 'Shrek', 'Animasyon',85);

CREATE TABLE actor
(
id int ,
isim VARCHAR(50),
soyisim VARCHAR(50)
);
INSERT INTO actor VALUES (1, 'Christian', 'Bale');
INSERT INTO actor VALUES (2, 'Kevin', 'Spacey');
INSERT INTO actor VALUES (3, 'Edward', 'Norton');


-- Task : 1 id li filmi bulalım eğer yoksa ekrana uyarı yazısı verelim

do $$
declare
	istenen_film film%rowtype;
	istenen_filmId film.id%type := 10;

begin
	select * from film
	into istenen_film
	where id = istenen_filmId;
	
	if not found then
		raise notice 'Girdiğiniz id li film bulunamadı : %', istenen_filmId;
	end if;
	
end $$;


-- ***************** IF-THEN-ELSE **********************

/*
	IF condition THEN
			statement;
	ELSE
			alternative statement;
	END IF
*/

-- Task : 1 idli film varsa title bilgisini yazınız yoksa uyarı yazısını ekrana basınız


do $$
declare

	selected_film film%rowtype;
	input_film_id film.id%type :=10;

begin
	select * from film
	into selected_film
	where id = input_film_id;
	
	if not found then
		raise notice 'Girmiş olduğunuz id li film bulunamadı : %', input_film_id;
	else
		raise notice 'Filmin ismi : %', selected_film.title;
	end if;

end $$;











