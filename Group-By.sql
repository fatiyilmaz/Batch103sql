/*
   Group By cumlecigi bir select ifadesinde satirlari, sutunlarin degerlerine gore ozet olarak gruplamak icin kullanilir.
   Group By cumlecigi her grup basina bir satir dondurur.
   Group By genelde; avg , count , max , min ve sum gibi aggregate fonsiyonlar ile birlikte kullanilir. 
*/

create table sahislar
(id int primary key,
ad varchar(20),
soyad varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);

insert into sahislar values(100, 'Eymen',  'Bal', '25', 'E', 'Istanbul', 'Turkiye', '20000');
insert into sahislar values(101, 'Derya', 'Soylu', '35', 'K', 'Istanbul', 'Turkiye', '25000');
insert into sahislar values(102, 'Enes', 'Boz', '55', 'E', 'Istanbul', 'Turkiye', '22000');
insert into sahislar values(103, 'Nil', 'Naz', '45', 'K', 'Trabzon', 'Turkiye', '20000');
insert into sahislar values(104, 'Ali', 'Can', '28', 'E', 'Ankara', 'Turkiye', '15000');
insert into sahislar values(105, 'Yusuf', 'Cengiz', '46', 'E', 'Bolu', 'Turkiye', '30000');
insert into sahislar values(106, 'Ahmet', 'Aslan', '38', 'E', 'Adana', 'Turkiye', '28000');
insert into sahislar values(107, 'Mehmet', 'Aslan', '29', 'E', 'Gaziantep', 'Turkiye', '21000');
insert into sahislar values(108, 'Sena', 'Yavuz', '49', 'K', 'New York', 'USA', '40000');
insert into sahislar values(109, 'Zehra', 'Amber', '52', 'K', 'New York', 'USA', '45000');
insert into sahislar values(110, 'Fatma', 'Nur', '33', 'K', 'Berlin', 'Almanya', '35000');
insert into sahislar values(111, 'Mustafa', 'Bay', '44', 'E', 'Paris', 'Fransa', '34000');
insert into sahislar values(112, 'Murat', 'Kerem', '28', 'E', 'Istanbul', 'Turkiye', '29000');
insert into sahislar values(113, 'Sinan', 'Ay', '45', 'E', 'Izmir', 'Turkiye', '19000');
insert into sahislar values(114, 'Figen', 'Bal', '55', 'K', 'Istanbul', 'Turkiye', '25000');
insert into sahislar values(115, 'Serkan', 'Bayram', '36', 'E', 'Londra', 'Ingiltere', '50000');
insert into sahislar values(116, 'Hakan', 'Bacak', '29', 'E', 'Londra', 'Ingiltere', '55000');
insert into sahislar values(117, 'Zafer', 'Yanak', '47', 'E', 'Berlin', 'Almanya', '42000');
insert into sahislar values(118, 'Birol', 'Kara', '37', 'E', 'Paris', 'Fransa', '41000');
insert into sahislar values(119, 'Ayten', 'Tan', '32', 'K', 'Roma', 'Italya', '39000');

select * from sahislar

-- SORU01: sahisların calıştığı ulke'leri listeleyiniz
select ulke from sahislar group by ulke 

-- SORU02: ulke'lere göre ortalama maaşları listeleyiniz
select ulke, round (avg(maas)) as ort_maas from sahislar group by ulke -- round'u kusuratlari verme, yuvarlama yap dedigim icin kullandim.

-- SORU03: ulke'lere göre kaç çalışan olduğunu sorgulayınız.
select ulke, count (id) as calisan_sayisi from sahislar group by ulke  -- as'ler bizim koydugumuz gecici isimlerdir.

-- SORU04: Maas ortalamasını cinsiyet'e göre sorgulayınız
select round (avg(maas)) as maas_ort, cinsiyet from sahislar group by cinsiyet

-- SORU05: ulke'lere göre ve sehir'lere göre gruplayarak sorgulama yapınız
select ulke, sehir from sahislar group by ulke,sehir  

-- SORU06: ulke'lere göre ve sehir'ler göre çalışan sayısını sorgulayın.
select ulke,sehir, count (id) as calisan_sayisi from sahislar group by ulke,sehir 







