1.Data Query Language (Veri Sorgulama Dili - DQL) -- verileri getirmek icin kullanilir
SELECT: veritabanındaki verileri alır. 

2.Data Manipulation Language (Veri Kullanma Dili - DML) -- tablonun icerisindeki verilerle ilgilenir onlari kullaniriz
INSERT:Veritabanına yeni veri ekler.
DELETE:Veritabanındaki verileri siler
UPDATE:Veritabanındaki verileri günceller.

3.Data Definition Language (Veri Tanimlama Dili - DDL) -- tablolarla ilgilenir
DROP: Bir veritabanını veya veritabanı içindeki tabloyu siler.
ALTER: Bir veritabanı veya veritabanı içindeki tabloyu günceller.
CREATE:Bir veritabanı veya veritabanı içinde tablo oluşturur.	

-- PRIMARY - FOREIGN
CREATE TABLE parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO parent VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO parent VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO parent VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO parent VALUES (104, 'Apple', 'Adam Eve');

select * from parent;

CREATE TABLE child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no) -- parent tablosunu reference gosteriyorum onun primary key olmasi gerekiyor.
	                                                               -- Parent tabloda olmayan primary key ile child tabloya veri girisi yapilamaz.
	                                                               -- child tablodaki veri silinmeden parent tablo silinemez
);

INSERT INTO child VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO child VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO child VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO child VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO child VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO child VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO child VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from child;

--SORU 1: child tablosuna ted_verginosu 101 olan veri girişi yapınız
insert into child values (101,2000,'Araba','Fatih');


-- SORU 2: child tablosuna ted_verginosu 105 olan veri girişi yapınız
-- parent tabloda olmayan primary key ile child tabloya veri girisi yapilamaz.
insert into child values (105,3000,'Motor','Hasim'); -- bu sebeple bu kod calismaz


--SORU 3: child tablosuna ted_vergino null olan veri girişi yapınız
--Parent tabloda olmayan primary key ile child tabloya veri girişi yapılamaz.
--İstisnai olarak "null"eklenebilir
insert into child values (null,4000,'TV','Hasan');


--SORU 4: .parent tablosundaki vergi_no 101 olan veriyi siliniz.
-- child tablodaki veri silinmeden parent tablodaki veri silinemez.
delete from parent where vergi_no = 101;


--SORU 5: child tablosundaki ted_vergino 101 olan verileri siliniz
delete from child where ted_vergino = 101;


--SORU 6: .parent tablosundaki vergi_no 101 olan veriyi siliniz
-- 5. soruda child tabloda ted_vergino 101 olani sildik bu yuzden artik parenttan da 101 olani silebiliriz.
delete from parent where vergi_no = 101;


--SORU 7: parent tablosunu siliniz.
-- child tablo silinmeden parent tablo silinemez.


--SORU 8: child tablosunu siliniz
delete from child; -- tablo icerisindeki verileri silerken kullanilir.
drop table child; -- tablo'yu silmek icin kullanilir.


--SORU 9: parent tablosunu siliniz
-- 7. soruda bu islem yapilamadi ama child tablo silindikten sonra artik parent tablo da silinebilir.
drop table parent;

--        ON DELETE CASCADE
-- childi silmeden parenti silebilecez 

CREATE TABLE parent2
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO parent2 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent2 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent2 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent2 VALUES (104, 'Apple', 'Mick Jackson');

select * from parent2;

CREATE TABLE child2
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent2(vergi_no)
ON DELETE CASCADE -- child verileri silmeden parenttakileri silebiliyoruz,
	              -- fakat parenttaki verileri silerken child'dakilerde siliniyor.
	              -- child tabloyu silmeden parent tabloyu silebiliyoruz,
	              -- sadece parent silmis oluyoruz child kaliyor.
	          
);

INSERT INTO child2 VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child2 VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child2 VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child2 VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child2 VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child2 VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child2 VALUES(104, 1007,'Kamera', 'Eymen Ozden');

select * from child2;

-- SORU1: parent2 tablosundaki tüm verileri siliniz
delete from parent2;

select * from parent2; -- child tablodaki veriyi silmeden parent tablodaki veriyi silebildik.
                       -- ON DELETE CASCADE sayesinde
					   
					   
-- SORU2: parent2 tablosunu siliniz.

drop table parent2 cascade; -- ON DELETE CASCADE sayesinde child tabloyu silmeden,
                            -- parent tabloyu silebilmek icin cascade yazmak zorundayiz.



-- SORU3: child2 tablosunu siliniz;
drop table child2 cascade;


-- UPDATE
CREATE TABLE toptancilar     --> parent
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);

INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

select * from toptancilar;

CREATE TABLE malzemeler     --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES toptancilar(vergi_no)
on delete cascade	
);

INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');

SELECT * FROM malzemeler;

-- SORU1: vergi_no’su 202 olan toptancinin sirket_ismi'ni 'VivoBook' olarak güncelleyeniz.
update toptancilar
set sirket_ismi = 'VivoBook'
where vergi_no = 202;

--  SORU2: toptancilar tablosundaki tüm sirket isimlerini 'NOKIA' olarak güncelleyeniz.
update toptancilar
set sirket_ismi = 'NOKIA';





