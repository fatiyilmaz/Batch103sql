/*                                            *BASIC SQL COMMANDS*
                                  								   
   SELECT      ==> Select data from database                      *Veritabanından veri seçin
   FROM        ==> Specify table we're puling from                *Aldığımız tabloyu belirtin
   WHERE       ==> Filter query to match a condition              *Bir koşulu eşleştirmek için sorguyu filtrele
   AS          ==> Rename column or table with alias              *Sütun veya tabloyu takma adla yeniden adlandırın
   JOIN        ==> Combine rows from 2 or more tables             *2 veya daha fazla tablodaki satırları birleştirin
   AND         ==> Combine query conditions. All must be met      *Sorgu koşullarını birleştirin. Hepsi karşılanmalı
   OR          ==> Combine query conditions. One must be met      *Sorgu koşullarını birleştirin. Biri karşılanmalı
   LIMIT       ==> Limit rows returned. See also FETCH & TOP      *Soruda istenilenin sirasini verir.
   IN          ==> Specify multiple values when using WHERE       *WHERE kullanırken birden çok değer belirtin
   CASE        ==> Return value on a specified condition          *Belirli bir koşulda dönüş değeri
   IS NULL     ==> Return only rows with a NULL value             *Yalnızca NULL değerine sahip satırları döndür
   LIKE        ==> Search for patterns in column                  *Sütunda desen ara
   COMMIT      ==> Write transaction to database                  *Veritabanına işlem yaz
   ROLLBACK    ==> Undo a transaction block                       *Bir işlem bloğunu geri alma
   ALTER TABLE ==> Add/Remove columns from table                  *Tablodan sütun ekleme/kaldırma
   UPDATE      ==> Update table data                              *Tablo verilerini güncelle
   CREATE      ==> Create TABLE,DATABASE,INDEX or VIEW            *TABLO, VERİ TABANI, DİZİN veya GÖRÜNÜM oluşturun
   DELETE      ==> Delete rows from table                         *Tablodan satırları sil
   INSERT      ==> Add single row to table                        *Tabloya tek satır ekle
   DROP        ==> Delete TABLE,DATABASE or INDEX                 *TABLO, DATABASE veya INDEX'i silin
   GROUP BY    ==> Group data into logical sets                   *Verileri mantıksal kümeler halinde gruplandırma
   ORDER BY    ==> Set order of result. Use DESC to reverse order *Kucukten buyuge siralamayi ayarlayın. Sıralamayı tersine çevirmek için DESC'yi kullanın
   HAVING      ==> Same as WHERE but filters groups               *WHERE ile aynı, ancak grupları filtreliyor
   COUNT       ==> Count number of rows                           *Satır sayısını say
   SUM         ==> Return sum of column                           *Sütunun toplamını döndür 
   AVG         ==> Return average of column                       *Sütunun ortalamasını döndür
   MIN         ==> Return min value of column                     *Sütunun minimum değerini döndür
   MAX         ==> Return max value of column                     *Sütunun maksimum değerini döndür
 
                                              *CATEGORIES*

DDL ==> Data Definition Language     ==> Veri Tanımlama Dili
CREATE | DROP | ALTER | TRUNCATE | RENAME | COMMENT


DQL ==> Data Query Language          ==> Veri Sorgulama Dili
SELECT


DML ==> Data Manipulation Language   ==> Veri Işleme Dili
INSERT | UPDATE | DELETE | LOCK | CALL | EXPLAIN PLAN


DCL ==> Data Control Language        ==> Veri Kontrol Dili
GRANT | REVOKE


TCL ==> Transaction Control Language ==> İşlem Kontrol Dili
COMMIT | ROLLBACK | SAVEPOINT | SET TRANSACTION


                                             *LOGICAL*
AND | OR | NOT | ANY | SOME | ALL | BETWEEN | IN | EXISTS | LIKE | IS NULL | UNIQUE
 
 
										  
									    *IMPORTANT KEYWORDS*
WHERE | DISTINCT | LIMIT | ORDER BY | DESC | ASC | AS | FROM | SET | VALUES | CASE | DEFAULT	



                                         *DATABASE OBJECTS*
TABLE | VIEW | SYNONYM | SEQUENCE | INDEX | TRIGGER



                                            *CONSTRAINTS*
NOT NULL | UNIQUE | PRIMARY KEY | FOREIGN KEY | CHECK | DEFAULT 



                                       *AGGREGATION FUNCTIONS*
AVG | COUNT | MAX | MIN | SUM


			   
			                           *AGGREGATION KEYWORDS*
GROUP BY | HAVING 
						
*/




