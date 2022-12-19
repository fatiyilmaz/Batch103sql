-- EXISTS CONDITION
-- Alt sorgu en az bir satir dondururse exists true olur.
-- Alt sorgu hic satir dondurmezse exists false olur.

CREATE TABLE musteriler
(
  id int, 
  isim varchar(50), 
  sehir varchar(50), 
  yas int
);
INSERT INTO musteriler VALUES(100, 'Ahmet Ümit', 'İstanbul', 54);
INSERT INTO musteriler VALUES(101, 'R.Nuri Güntekin', 'Antalya', 18);
INSERT INTO musteriler VALUES(102, 'S.Faik Abasıyanık', 'Bursa', 14);
INSERT INTO musteriler VALUES(103, 'Yaşar Kemal', 'İstanbul', 26);
INSERT INTO musteriler VALUES(104, 'Halide E. Adıvar', 'İzmir', 35);
INSERT INTO musteriler VALUES(105, 'Nazan Bekiroğlu', 'İzmir', 42);
INSERT INTO musteriler VALUES(106, 'Peyami Safa', 'Antalya', 33);
INSERT INTO musteriler VALUES(107, 'Sabahattin Ali', 'İstanbul', 41);
INSERT INTO musteriler VALUES(108, 'Oğuz Atay', 'İstanbul', 28);
INSERT INTO musteriler VALUES(109, 'Orhan Pamuk', 'Ankara', 30);

select * from musteriler

CREATE TABLE siparisler
(
  id int, 
  musteri_id int, 
  urun_adi varchar(20), 
  tutar int
);

INSERT INTO siparisler VALUES(3001,109, 'kitap',100);
INSERT INTO siparisler VALUES(3002,101, 'kitap',230);
INSERT INTO siparisler VALUES(3003,109, 'defter',100);
INSERT INTO siparisler VALUES(3004,102, 'kalem',80);
INSERT INTO siparisler VALUES(3005,101, 'çanta',550);
INSERT INTO siparisler VALUES(3006,109, 'çanta',440);
INSERT INTO siparisler VALUES(3007,103, 'kitap',160);
INSERT INTO siparisler VALUES(3008,103, 'kalem',75);
INSERT INTO siparisler VALUES(3009,105, 'defter',250);
INSERT INTO siparisler VALUES(3010,108, 'kitap',300);
INSERT INTO siparisler VALUES(3011,106, 'kitap',175);
INSERT INTO siparisler VALUES(3012,109, 'kalem',105);
INSERT INTO siparisler VALUES(3013,107, 'defter',145);

select * from siparisler

--1)Siparişlerde defter varsa müşterilerin isim ve şehirlerini listeleyiniz.
select isim, sehir 
from musteriler
where exists (select * from siparisler where urun_adi = 'defter') -- exists true verecek ve bana isim ve sehirleri verecek.


--2)Siparişlerde defter yoksa müşterilerin isim ve şehirlerini listeleyiniz.
select isim, sehir 
from musteriler
where not exists (select * from siparisler where urun_adi = 'defter') --not exists false verecek ve bana isim ve sehirleri vermeyecek.


--3)Siparişlerde tutarı 600 den büyük sipariş varsa müşterilerin yaş ortalamasını bul .
select avg (yas) from musteriler where exists (select * from siparisler where tutar > 600) -- kosul olmadigindan exists false verdi


--4)Siparişi olan müşterileri listeleyiniz.(iliskili)
select * from musteriler m where exists (select * from siparisler s where s.musteri_id = m.id ) -- exists biraz daha hizli calisir.

-- in kullanimli cozum;
select * from musteriler m where id in (select * from siparisler s where s.musteri_id = m.id ) -- id ve exists ikisi de alt sorgu ikiside ayni isi yapar./subqueries

--5)Siparişi olmayan müşterileri listeleyiniz.(ilişkili)
select * from musteriler m where not exists (select * from siparisler s where s.musteri_id = m.id ) 

--6)Müşterilerden yaşı 18 den küçük varsa siparişini sil.(ilişkili)
delete from siparisler s
where exists (select * from musteriler m where yas<18 and m.id =s.musteri_id) 

--7)İstanbulda yaşayan müşteri varsa müşteri_id , sipariş verdiği ürün adı ve tutarı listeleyiniz.
select musteri_id , urun_adi , tutar from siparisler s where exists (select * from musteriler m where sehir = 'İstanbul' and m.id = s.musteri_id)


--8)İstanbulda yaşayan müşteri varsa sipariş tutarından 50 br indirim yapınız ve tüm siparişleri listeleyiniz.
update siparisler s set tutar = tutar-50
where exists (select * from musteriler m where sehir = 'İstanbul' and m.id = s.musteri_id)


--9)Çanta siparişi veren müşteri varsa isminin yanına * işareti koyunuz ve tüm müşterileri listeleyiniz.
update musteriler m set isim = '*' || isim
where exists (select * siparisler s where s.musteri_id = m.id and urun_adi = 'çanta' )






