CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler3

-- Ismi Mustafa Bak ve Nesibe Yilmaz olan kayitlari silelim

DELETE FROM ogrenciler3 WHERE isim = 'Mustafa Bak' or isim = 'Nesibe Yilmaz';

-- Veli ismi Hasan olan datayi silelim

DELETE FROM ogrenciler3 WHERE soyisim = 'Hasan';

-- TRUNCATE --
-- Bir tablodaki tum verileri geri alamayacagimiz sekilde siler. Sartli silme yapmaz yani WHERE kullanmayiz.

TRUNCATE TABLE ogrenciler3

--ON DELETE CASCADE 

DROP TABLE if exists adresler -- Eger tablo varsa tabloyu siler.

CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE not1
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar4;

select * from talebe
select * from not1

-- Notlar tablosundan talebe_id'si 123 olan datayı silelim

DELETE FROM notlar4 WHERE talebe_id = '123';

-- Talebeler tablosundan id'si 126 olan datayi silelim

DELETE FROM talebeler WHERE id = '126';

DELETE FROM talebe WHERE id = '126';

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/

-- IN CODITION 

DROP TABLE if exists musteriler

CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler

-- And kullanimi
SELECT * FROM musteriler WHERE urun_isim = 'Orange' and urun_id = 10

-- Musteriler tablosundan urun ismi orange, apple veya apricot olan tum verileri listeleyiniz
-- 1.Yol;
SELECT * FROM musteriler WHERE urun_isim = 'Orange' OR urun_isim = 'Apple' OR urun_isim = 'Apricot';

-- IN CONDITION 
-- 2.Yol;
SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apple','Apricot');

-- IN CONDITION - NOT IN
-- NOT IN --> Yazdigimiz verilerin disindakileri getirir.
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot');

-- BETWEEN CONDITION
-- Musteriler tablosundan id'si 20 ile 40 arasinda olan verileri listeleyiniz
/*BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir */

SELECT * FROM musteriler WHERE urun_id >=20 and urun_id<=40; -- ayni sonucu verirler.

SELECT * FROM musteriler WHERE urun_id BETWEEN 20 and 40; -- ayni sonucu verirler.

SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 and 40; -- 20 ve 40 disindakiler verdi.


--SUBQUERIES(ALT SORGU) Iki tablodan gecici olarak tek bir tabloda sorgulama--> sorgu icinde sorgu


CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

SELECT * FROM calisanlar2
SELECT * FROM markalar

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

SELECT isim, maas, isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

SELECT isim,maas,sehir FROM calisanlar2 
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);

ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
SELECT urun_isim,musteri_isim FROM  nisan
WHERE not exists (SELECT urun_isim FROM mart WHERE  mart.urun_isim=nisan.urun_isim);


-- AGGREGATE METHOD
-- Calisanlar toplasundan maksimum maası listeleyelim
SELECT max(maas) AS maksimum_maas FROM calisanlar2;
/*
    Eğer bir sutuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra
vermek istediğimiz ismi yazarız
*/

-- Calisanlar tablosundan en dusuk maasi listeleyelim
SELECT min(maas) AS en_dusuk_maas FROM calisanlar2;

-- Calisanlar tablosundaki maas'larin toplamini listeleyiniz
SELECT sum(maas) AS toplam_maas FROM calisanlar2;

-- Calisanlar tablosundaki maas'larin ortalamasini listeleyiniz
SELECT avg(maas) FROm calisanlar2;
SELECT round (avg(maas),2) FROM calisanlar2

-- Calisanlar tablosundaki maas'larin sayisini listeleyiniz
SELECT count (maas) AS maas_sayisi FROM calisanlar2
select (*) as maas_sayisi from calisanlar2
               
/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/

SELECT * FROM calisanlar2
SELECT * FROM markalar

-- AGGREGATE METHODLARDA SUBQUERY

-->Not; Bir fielddan sutundan sonra gecici bir sey yazdirmak istiyorsam,
-- as diyorum ve yazdirmak istedigim kelimeyi yaziyorum.

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz

SELECT marka_id,marka_isim,
(SELECT count (sehir) AS sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri)
FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

SELECT marka_isim,calisan_sayisi,
(SELECT sum (maas) FROM calisanlar2 WHERE isyeri=marka_isim) as toplam_maas
FROM markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve 
-- minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,
--ayin tabloda olsaydi max,mind yapilabilirdi farkli tablolar oldugu icin bu sekilde;
(SELECT max (maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min (maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
FROM markalar

SELECT 

-- VIEW KULLANIMI

-- Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen sorgulama yerine view'e atadigimiz ismi SELECT komutuyla cagiririz.

CREATE VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT max (maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min (maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
FROM markalar

SELECT * FROM maxminmaas;


CREATE VIEW summas--sum maas olacakti yanlis yazmisim
AS
SELECT marka_isim,calisan_sayisi,
(SELECT sum (maas) FROM calisanlar2 WHERE isyeri=marka_isim) as toplam_maas
FROM markalar

SELECT * FROM summas;--sum maas

-- 							EXISTS CONDITION
/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar
*/

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT urun_id,musteri_isim FROM mart
WHERE exists (SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id) 


--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

SELECT urun_isim, musteri_isim FROM nisan
WHERE exists (SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim)

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. ODEV

SELECT  urun_isim,musteri_isim FROM nisan
WHERE NOT EXISTS (SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim);

SELECT * FROM mart;
SELECT * FROM nisan;


-- DML --> UPDATE

CREATE TABLE tedarikciler1 -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler1 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler1 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler1 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler1 VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler1 -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler1(vergi_no)
on delete cascade
);   

INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler1
select * from urunler1

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
UPDATE tedarikciler1 
SET firma_ismi = 'Vestel' WHERE vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler1
SET firma_ismi = 'Casper',irtibat_ismi='Ali Veli' WHERE vergi_no=101
 
-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler1
SET urun_isim='Telefon' WHERE urun_isim='Phone';

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın. 
UPDATE urunler1
SET urun_id = urun_id + 1 WHERE urun_id > 1004;

-- urunler tablosundaki tum urunlerin urun_id degerini ted_vergino sutun degeleri ile toplayarak guncelleyiniz.
UPDATE urunler1 
SET urun_id = urun_id + ted_vergino

DELETE FROM tedarikciler1
DELETE FROM urunler1

-- urunler tablosundan Ali Bak'in aldigi urunun ismini,tedarikci tablosundan irtibat_ismi 'Adam Eve' olan firmanin ismi (firma_ismi) ile degistiriniz.
UPDATE urunler1
SET urun_isim = (SELECT firma_ismi FROM tedarikciler1 WHERE irtibat_ismi = 'Adam Eve')
WHERE musteri_isim = 'Ali Bak'

-- urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple'in irtibat_isim'i ile degistiriniz
UPDATE urunler1
SET musteri_isim =(SELECT irtibat_ismi FROM tedarikciler1 WHERE firma_ismi = 'Apple')
WHERE urun_isim = 'Laptop'


