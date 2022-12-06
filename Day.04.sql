--									ALIASES
-- Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir.

CREATE TABLE calisanlar3
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar3 VALUES(123456789,'Ali Can','Istanbul');
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem','Ankara');
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut','Izmir');

select * from calisanlar3

-- Eger iki sutunun verilerini birlestirmek istersek concet sembolu || kullaniriz.
select calisan_id as id, calisan_isim || calisan_dogdugu_sehir as calisan_bilgisi from calisanlar3

-- 2.Yol;
select calisan_id as id, concat (calisan_isim,' - ',calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar3

-- sayfa 82 practice odev

-- IS NULL CONDITION 
-- Arama yapilan field'da null degeri almis kayitlari getirir.

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar 

-- Name sutununda null olan degerleri listeleyelim
select name from insanlar where name is null

-- Name sutununda null olmayan degerleri listeleyelim
select name from insanlar where name is not null

-- Insanlar tablosunda null deger almis verileri no name olarak degistiriniz
UPDATE insanlar
SET name = 'No Name'
WHERE name IS NULL

-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
	
	Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
    Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
    Default olarak küçükten büyüğe sıralama yapar
    Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/


CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar1

--Insanlar tablosundaki datalari adres’e gore siralayin
select * from insanlar1 order by adres; -- kucukten buyuge

--Insanlar tablosundaki datalari soyisim’e gore siralayin
select * from insanlar1 order by soyisim; -- kucukten buyuge

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar1 where isim = 'Mine' order by ssn; --ssn sirasina gore siralama

-- NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir

-- Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select * from insanlar1 where soyisim = 'Bulut' order by 4; -- ilk eklemeye gore 

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar1 order by ssn desc; -- buyukten kucuge

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar1 order by isim asc , soyisim desc; -- asc kullanilarak da yazilir, kullanilmadan da yazilir / asc default natural order olarak siralar. 

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,soyisim from insanlar1 order by length (soyisim);

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarıni tersten sıralayınız
select isim,soyisim from insanlar1 order by length (soyisim) desc;

/*
Eger sutun uzunluguna gore siralamak istersek length komutu kullaniriz
Ve yine uzunlugu buyukten kucuge siralamak istersek sonuna DESC komutunu ekleriz.
 */
 
-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
-- 1.Yol;
select isim || ' ' || soyisim as isim_soyisim from insanlar1 order by length (isim || soyisim);

-- 2.Yol;
select isim || ' ' || soyisim as isim_soyisim from insanlar1 order by length (isim)+length(soyisim);

-- 3.Yol; 
select concat (isim,' ',soyisim) as isim_soyisim from insanlar1 order by length (isim)+length(soyisim); 
 
-- GROUP BY KULLANIMI
CREATE TABLE manav
(
isim varchar(50),  Urun_adi varchar(50),  Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
select * from manav 
 
--Isme gore alinan toplam urunleri listeleyiniz
select isim , sum (urun_miktar) as aldigi_toplam_urun from manav
group by isim;

--Isme gore alinan toplam urunleri bulun ve urunleri buyukten kucuge listeleyiniz 
select isim , sum (urun_miktar) as aldigi_toplam_urun from manav
group by isim
order by aldigi_toplam_urun desc;

-- Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi , count (isim) from manav
group by urun_adi; 

select isim , count (urun_adi) aldigi_urun_miktari from manav
group by isim;


