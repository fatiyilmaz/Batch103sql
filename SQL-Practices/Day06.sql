-- 							JOINS
/*
2 Tablodaki datalari Birlestirmek icin kullanilir.
Su ana kadar gordugumuz Union,Intersect ve Minus sorgu sonuclari icin kullanilir
Tablolar icin ise JOIN kullanilir
5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk datada olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur
*/



CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);

INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');
INSERT INTO siparisler VALUES(55, 105, '2020-04-21');

select * from sirketler


-- INNER JOINS

/*
NOT :
1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
*/

-- SORU 1. Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler inner join siparisler -- ortaklari getirecegi icin sirketler,siparisler yazim siralamasi onemli degil.
on sirketler.sirket_id = siparisler.sirket_id -- sartim sirkerler ve siparislerden bunlari getir diyorum.



-- LEFT JOINS

/*
 NOT :
1) Left Join’de ilk tablodaki tum record’lar gosterilir.
2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
 */


-- SORU 1. Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler left join siparisler -- burada 1. tablo veriliyor
on sirketler.sirket_id = siparisler.sirket_id -- siparisler de olmayan null verdi




-- RIGHT JOIN

/*
	NOT :
	1)Right Join’de ikinci tablodaki tum record’lar gosterilir.
	2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
	ancak ortak olmayan datalar icin o kisimlar bos kalir
 */

-- SORU 1. Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler right join siparisler -- left right'in tersini veriyor. burada 2.tablo veriliyor	
on sirketler.sirket_id = siparisler.sirket_id




-- FULL JOINS
/*
	NOT :
	1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
	2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/
-- SORU 1. Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler full join siparisler -- iki tablonunda hem kesisen hem kesismeyenlerini gosterir.
on sirketler.sirket_id = siparisler.sirket_id


-- SELF JOINS

CREATE TABLE personel  (
id int,
isim varchar(20),  
title varchar(60),  yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

select * from personel


-- Soru 1. Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
SELECT p1.isim AS personel_ismi, p2.isim AS yonetici_ismi
FROM personel p1 INNER JOIN personel p2 ON p1.yonetici_id = p2.id;


select p1.title , p2.title  from personel p1 inner join personel p2 on p1.yonetici_id = p2.id


-- LIKE CONDITION 

/*
	LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
	statement ile calisan wildcards’a(özel sembol) izin verir.. Ve bize pattern matching yapma
	imkani verir.
*/

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1007, 'erhan', 82000);

select * from musteriler


-- NOT; % => 0 veya birden fazla karakter belirtir.

/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz
*/

-- SORU1 : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like 'A%' -- A ile baslasin sonu ne olursa olsun diyoruz modulus'le.

select * from musteriler where isim ilike 'a%' --- ILIKE ile kucuk harf yazarak hem buyuk 'a' lari hemde kucuk 'a' lari getirebiliyoruz.

select * from musteriler where isim ~~* 'A%' -- Bu da buyuk kucuk 'a'li isimleri getirir.


-- Soru 1. Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim, gelir from musteriler
where isim  like '%e'


-- Soru 2. Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler
where isim like '%er%'

-- Soru 3. Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler
where isim ilike '%er%'

-- Soru 4. Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_atma' -- 5 harfli son dort harf atma

-- Soru 5. Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_a%'

-- Soru 6.Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '__s%'

-- sayfa 113 odev 

--Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim  '_s';
--Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim  'F___%';
--Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim ~~ '_a_m%'; 
 
 
 
--       REGEXP_LIKE


CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3);
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hAt', 5);

/*
    REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

-- SORU 1. Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ 'h[ai]t' 

select * from kelimeler where kelime ~* 'h[ai]t' -- yildi sekilde buyuk harfleri de alir.



--SORU 2. Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
--yazdiran QUERY yazin
select * from kelimeler where kelime ~* 'h[a-k]t'



-- SORU 3. a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ '^[as]' -- ^ --> baslayan demek. a veya s ile baslayanlar



-- SORU 4. m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ '[mf]$'


--ODEV
--SORU 1 : ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not like 'h%'

--SORU 2 : a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not ilike '%a%'

--SORU 3 : ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not like '_de'

--SORU 4 : 2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime !~ '[_eio]'





-- NOT LIKE KISMI ODEV


-- UPPER - LOWER - INITCAP
/*
UPPER – LOWER - INITCAP
Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
kucuk harf yazdirmak icin kullaniriz
 */

-- Kelimeler tablosundaki kelime sutunundaki verileri once hepsini buyuk harf, sonra kucuk harf ve ilk harfleri buyuk harf
-- olacak sekilde yazdiralim.
select upper (kelime) as kelime from kelimeler
select lower (kelime) as kelime from kelimeler
select initcap (kelime) as kelime from kelimeler -- initcap istedigimiz sutundaki verilerin ilk harfini buyuk yazar


-- Musteriler tablosundan butun isimleri buyuk harf yapiniz
select upper (isim) from musteriler


/*
  Eger birden fazla sutundaki verileri buyuk kucuk harf yapmak istersek 
  select lower (tittle), upper (isim) from personel seklinde yapabiliriz.
*/

select lower (tittle), upper (isim) from personel






