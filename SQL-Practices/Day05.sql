-- GROUP BY
CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk','Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk','Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk','Ankara', 7000,'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

delete from personel 

select * from personel

-- Soru 1. Isme gore toplam maaslari bulun
select isim , sum(maas) from personel
group by isim;

-- Soru 2. Personel tablosundaki isimleri gruplayiniz
select isim from personel
group by isim;



--        HAVING CLAUSE 
-- Having komutu yalnizca Group By komutu ile kullanilir,
-- Eger gruplamadan sonra bir sart varsa having komutu kullanilir.
-- Where kullanimi ile ayni mantikta calisir.


-- Soru 1. Her sirketin MIN maaslarini eger 4000’den buyukse goster
select sirket, min (maas) as en_dusuk_maas from personel
group by sirket
having min (maas)>4000;


-- Soru 2. Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz
select isim, sum(maas) as toplam_maas
from personel
group by isim
having sum (maas)>10000;

-- Soru 3. Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir,count (isim) as toplam_personel_sayisi from personel 
group by sehir
having count (isim)>1;


-- 4) Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir, max (maas) from personel
group by sehir
having max(maas)<5000;


--						UNION OPERATOR
-- Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i
-- ayni olmalidir.
-- order by ve desc kucukten buyuge, buyukten kucuge cevrimler kullanilabilir.


-- Soru 1. Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
SELECT isim AS isim_ve_sehirler, maas FROM personel WHERE maas>4000
union
SELECT sehir, maas FROM personel WHERE maas>5000


-- Soru 2. Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz
select isim as sehir_ve_personel,maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul';

-- order by li yapim sekli;
select isim as sehir_ve_personel,maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul'
order by maas;


-- 								UNION OPERATOR
-- 						2 Tablodan Data Birlestirme



DROP TABLE if exists personel

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);

INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel
select * from personel_bilgi

-- Soru 1. id’si 123456789 olan personelin , Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
select sehir as sehir_ve_tel ,(maas) as maas_ve_cocuksayisi from personel where id = 123456789
union
select tel, cocuk_sayisi from personel_bilgi where id = 123456789;

-- NOT : Union islemi yaparken 1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
-- 2)Alt alta gelecek sutunlarin data type’lari ayni olmali



--         Union All Operator
/*
Union tekrarli verileri teke düşürür ve bize o şekilde sonuç verir
Union All ise tekrarli verilerle birlikte tün sorguları getirir
*/

-- Soru 1. Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
select isim, (maas) from personel where (maas)<5000

-- union'li / tekrarsizlari yazdirir.
select isim, (maas) from personel where (maas)<5000
union 
select isim, (maas) from personel where (maas)<5000

-- union all'li / tekrar , tekrar yazdirir. 1. sorgu , 2. sorgu
select isim, (maas) from personel where (maas)<5000
union all
select isim, (maas) from personel where (maas)<5000



--     Intersect(Kesisim) Operator
--SQL INTERSECT operatörü, 2 veya daha fazla SELECT ifadesinin sonuçlarını döndürmek için kullanılır.
--Ancak, yalnızca tüm sorgular veya veri kümeleri tarafından seçilen satırları döndürür. Bir sorguda bir kayıt varsa ve diğerinde yoksa,
--INTERSECT sonuçlarından çıkarılacaktır.

-- Soru 1. Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin
SELECT id FROM personel WHERE sehir IN ('Istanbul','Ankara')
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3)


--  Soru 2. Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin

select isim from personel where sirket = 'Honda'
intersect
select isim from personel where sirket = 'Ford'
intersect
select isim from personel where sirket = 'Tofas'


--     Except Operator
/*
   Iki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanilir. 
*/

-- Soru 1. 5000’den az maas alip Honda’da calismayanlari yazdirin

-- 5000 den az alip honda da calismayanlar
select isim, sirket from personel where maas<5000
except
select isim,sirket from personel where sirket = 'Honda'








