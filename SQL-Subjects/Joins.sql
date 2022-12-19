/*JOINS
2 Tablodaki datalari Birlestirmek icin kullanilir.
Su ana kadar gordugumuz Union,Intersect ve Except sorgu sonuclari icin kullanilir
Tablolar icin ise JOIN kullanilir


join islemleri, farklı Tablolari birlestirmek icin kullanilir. Diger bir ifade ile farkli tablolardaki
secilen sutunlar ile yeni bir tablo olusturmak icin kullanilabilir.
    


5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk tabloda olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur.
*/



-- Inner Join - Intersect


create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);

create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

select * from qa_dersler;

select * from developer_dersler;

--SORU: join kullanarak ortak dersleri sorgulayınız
select A.ders_id, A.ders_ismi, A.ders_saati
from developer_dersler A
inner join qa_dersler B
on A.ders_id = B.ders_id

-- intersect 
select ders_id, ders_ismi,ders_saati from qa_dersler
intersect
select ders_id, ders_ismi,ders_saati from developer_dersler






--Left Join - Right Join

create table filmler
(film_id int,
film_ismi varchar(30),
kategori varchar(30)
);

insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');

create table aktorler
(id int,
aktor_ismi varchar(30),
film_id int
);

insert into aktorler values (101, 'Ata Demirer', 1);
insert into aktorler values (102, 'Necati Sasmaz', 2);
insert into aktorler values (103, 'Gupse Ozay', 3);
insert into aktorler values (104, 'Engin Gunaydin', 4);
insert into aktorler values (105, 'Cem Yilmaz', 5);
insert into aktorler values (107, 'Tarik Akan', 8);
insert into aktorler values (108, 'Turkan Soray', 9);

select * from filmler;
select * from aktorler;


-- SORU1: Tüm film_ismi'leri, kategori'lerini ve filmlerde oynayan aktor_ismi'leri listeleyiniz.
select film_ismi,kategori,aktor_ismi from filmler A 
left join aktorler B
on A.film_id = B.film_id

select film_ismi,kategori,aktor_ismi from aktorler B 
right join filmler A
on A.film_id = B.film_id


-- SORU2: Tüm actor_ismi'leri ve bu aktorlerin oynadıgı film_ismi'lerini listeleyiniz.
select aktor_ismi,film_ismi from filmler B
left join aktorler A
on B.film_id = A.film_id

select aktor_ismi, film_ismi from filmler A
right join aktorler B
on B.film_id=A.film_id

-- SORU3: Tüm film_ismi'lerini ve tüm aktor_ismi'lerini listeleyiniz
--Aktoru olmasa bile film, filmi olmasa bile aktor listelenmelidir.
select film_ismi,aktor_ismi from filmler A
full join aktorler B
on A.film_id = B.film_id






-- Self Join 

CREATE TABLE personel
(
id int,
isim varchar(20),
title varchar(60),
yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

-- Soru 1:Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
-- Self Join 
select personeller.isim as personel_isim, yoneticiler.isim as yonetici_isim
from personel as personeller 
inner join personel as yoneticiler 
on personeller.yonetici_id = yoneticiler.id



