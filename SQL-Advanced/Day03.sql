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


--Task 1 : Film tablosundaki film sayısı 10 dan az ise "Film sayısı az" yazdırın, 10 dan çok ise "Film sayısı yeterli" yazdıralım

do $$
declare 
 sayi integer :=0;
 
begin
 select count(*) from film --4
 into sayi; --sayi=4 yukaridaki sayiyi buraya atadim

 if(sayi<10) then 
 raise notice 'Film sayisi az';
 else
 raise notice 'Film sayisi yeterli';
 end if;

end $$;

-- Task 2: user_age isminde integer data türünde bir değişken tanımlayıp default olarak bir değer verelim,
-- If yapısı ile girilen değer 18 den büyük ise Access Granted, küçük ise Access Denied yazdıralım

DO $$
DECLARE
	user_age integer :=25;

BEGIN

	IF user_age>18 THEN
		RAISE NOTICE 'Access Granted';
	END IF;
	
	IF user_age<18 THEN
		RAISE NOTICE 'Acess Denied';
	END IF;
	
END $$;

-- 2.YOL :

do $$
declare
	user_age integer := 20;
begin
	if(user_age>18) then
		raise notice 'Access Granted';
	else
		raise notice 'Access Denied';
	end if;
end $$


-- Task 3: a ve b isimli integer türünde 2 değişken tanımlayıp default değerlerini verelim, eğer a nın değeri b den büyükse "a , b den büyüktür" yazalım,
-- tam tersi durum için "b, a dan büyüktür" yazalım, iki değer birbirine eşit ise " a,  b'ye eşittir" yazalım:

do $$
declare 
 a integer :=0;
 b integer :=0;
begin
 if(a>b) then
   raise notice 'a , b den büyüktür';
 elseif(b>a) then
   raise notice 'b, a dan büyüktür';
 else 
   raise notice 'a, b ye eşittir';
 end if;
end $$;

-- 2: YOL

DO $$
DECLARE
	a integer := 10;
	b integer := 20;

BEGIN

	IF a>b THEN
		RAISE NOTICE 'a, b den büyüktür';
	END IF;
	
	IF a<b THEN
		RAISE NOTICE 'b, a dan büyüktür';
	END IF;
	
	IF a=b THEN
		RAISE NOTICE 'a, b ye eşittir';
	END IF;

END $$;

-- Task 4 : kullaniciYasi isimli bir değişken oluşturup default değerini verin,
-- girilen yaş 18 den büyükse "Oy kullanabilirsiniz", 18 den küçük ise "Oy kullanamazsınız" yazısını yazalım.

do $$
declare 
 kullanici_yas integer := 10;
begin 
 if (kullanici_yas>18) then
 raise notice 'Oy kullanabilirsiniz';
 elseif (kullanici_yas<18) then
 raise notice 'Oy kullanamazsınız';
 end if;
end $$;



--  ************** LOOP *************************************

-- syntax 

LOOP
	statement;
END LOOP;

-- loop u sonlandırmak için loopun içine if yapısını kullanabilirz :

LOOP
	statements;
	IF condition THEN
		exit; -- loop dan çıkmamı sağlıyor
	END IF;
END LOOP;

-- nested loop 

<<outher>>
LOOP
	statements;
	<<inner>>
	LOOP
		.....
		exit <<inner>>
		END LOOP;
END LOOP;

-- Task : Fibonacci serisinde, belli bir sıradaki sayıyı ekrana getirelim
-- Fibonacci Serisi : 1,1,2,3,5,8,13,...

do $$
declare 
 n integer :=2; --kacinci sira 
 counter integer :=0; --sayac
 i integer :=0; --eleman 
 j integer :=1; --eleman
 fib integer :=0; --n. siradaki fibonacci elemani

BEGIN 
	if(n<1) then
		fib:=0;
	end if;
	loop
		exit when counter =n;
		counter := counter +1;
		select j, (i+j) into i,j;	
	end loop;
	fib:=i;
	raise notice '%', fib;
	
END $$;



-- ************ WHILE LOOP *************************

syntax :

WHILE condition LOOP
	statements;
END LOOP;

-- Task : 1 dan 4 e kadar counter değerlerini ekrana basalım

DO $$
DECLARE
	n integer :=4;
	counter integer :=0;

BEGIN
	WHILE counter<n LOOP
		counter:=counter+1;
		raise notice '%', counter;
	END LOOP;

END $$;

-- Cevap 2:

DO $$

DECLARE
	counter integer :=0;

BEGIN 
	WHILE counter<4 LOOP
		counter := counter+1;
		raise notice '%', counter;
	END LOOP;	

END $$ ;




