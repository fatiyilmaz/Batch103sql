--DATABASE(VeriTabani) Olusturma
Create dataBase Fatih;

--DDL - DATA DEFINITION LANG.
--CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler
(
ogrenci_no char(7),
isim varchar (20),
soyisim varchar (20),
not_ort real,-- Ondalikli sayilar icin kullanilir(Double gibi)
kayit_tarih date
);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS -- Benzer tablodaki basliklarla ve data tipleriyle yeni bir tablo olusturmak icin normal tablo olustururken ki parantezler yerine AS kullanip Select komutuyla almak istedigimiz verileri aliriz
SELECT isim,soyisim,not_ort FROM ogrenciler;

-- DML - DATA MANIPULATION LANG.
-- INSERT (Database'e veri ekeleme)

INSERT INTO ogrenciler VALUES ('1234567','Fatih','YILMAZ',85.5,now());
INSERT INTO ogrenciler VALUES ('1234567','Fatih','YILMAZ',85.5,'2020-12-11');

-- BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK
INSERT INTO ogrenciler(isim,soyisim) VALUES('Necati','Alemdar');

-- DQL - DATA QUERY LANG.
-- SELECT 
select * -- Herseyi sec, bazilarini sec
FROM -- den dan (ogrenciler'den)
select * FROM ogrenciler;