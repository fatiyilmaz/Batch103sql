/* 

UNION: iki veya daha fazla sorgu ifadesinin sonuç kümelerini 
birleştirerek tek bir sonuç kümesi  oluşturur.

UNION: sadece benzersiz verileri alır.

UNION ALL: benzerli verileri de alır.


Syntax:
-------

select sutun_adi from table_adi
union
select sutun_adi from table_adi

*/

CREATE TABLE personel
(
	id int  PRIMARY KEY,
	isim VARCHAR(50),
	sehir VARCHAR(50),
	maas int,
	sirket VARCHAR(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'Istanbul', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');

select * from personel 

/* -----------------------------------------------------------------------------
  SORU1: maas'i 4000’den cok olan personel isim'lerini ve  
  maas'i 5000’den cok olan sehir'leri gosteren tekrarsız sorguyu yaziniz
------------------------------------------------------------------------------*/

select isim, maas from personel where maas>4000
union
select sehir, maas from personel where maas>5000



/* -----------------------------------------------------------------------------
  SORU2: isim'i 'Mehmet Ozturk' olan kisilerin aldigi maas'lari  ve  
  sehir'i 'Istabul' olan personelin maas'larini tekrarsız
  büyükten küçüge dogru siralayarak bir tabloda gosteren sorguyu yaziniz.    
------------------------------------------------------------------------------*/  


select maas, isim from personel where isim='Mehmet Ozturk'
union
select maas, sehir from personel where sehir='Istanbul'
order by maas desc;


/* -----------------------------------------------------------------------------
  SORU3: sirket'i 'Honda', 'Ford' ve 'Tofas' olan personelin isim'ini tekrarsız listeleyin
------------------------------------------------------------------------------*/  

select sirket, isim from personel where sirket='Honda'
union
select sirket, isim from personel where sirket='Ford'
union
select sirket, isim from personel where sirket='Tofas'








