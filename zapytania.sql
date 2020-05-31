/* Studenci, których imie zaczyna się na K */ 
SELECT Concat (O.imie, "", O.nazwisko) AS 'Imie i nazwisko', 
       id_student 
FROM   student AS S 
       JOIN osoba AS O 
         ON S.id_osoba = O.id_osoba 
WHERE  O.imie LIKE 'k%'; 

/* Wykaz średniej ocen koncowych danego studenta */ 
SELECT S.id_student                    AS "Nr", 
       Concat(B.imie, "", B.nazwisko) AS "Imię i nazwisko", 
       Avg(O.wartosc)                  AS "Średnia" 
FROM   ocena AS O 
       INNER JOIN typ_oceny AS T 
               ON O.id_typ_oceny = T.id_typ_oceny 
       INNER JOIN oceny AS OY 
               ON O.id_ocena = OY.id_ocena 
       INNER JOIN student AS S 
               ON S.id_student = OY.id_student 
       INNER JOIN osoba AS B 
               ON B.id_osoba = S.id_osoba 
WHERE  O.id_typ_oceny = 3 
       AND S.id_student = 1; 

/* Wykaz historii płatności danego studenta */ 
SELECT * 
FROM   lista_platnosci 
WHERE  id_student = 46 
ORDER  BY data_wplaty DESC; 

/* Wykaz informacji o danym studencie */ 
SELECT id_student                                             AS 
       "Numer legitymacji", 
       Date(waznosc_legitymacji)                              AS 
       "Ważność legitymacji", 
       O.imie, 
       O.drugie_imie, 
       O.nazwisko, 
       O.email, 
       O.telefon, 
       Concat(U.ulica, "", oznaczenie_domu, "/", mieszkanie, "", 
       P.okreg_kodowy, 
       P.sektor_kodowy, "-", P.placowka, "", M.nazwa_miasta) AS "Adres" 
FROM   student AS S 
       JOIN osoba AS O 
         ON S.id_osoba = O.id_osoba 
       JOIN adres AS A 
         ON O.id_adres = A.id_adres 
       JOIN miasto AS M 
         ON A.id_miasto = M.id_miasto 
       JOIN ulica AS U 
         ON A.id_ulica = U.id_ulica 
       JOIN kod_pocztowy AS P 
         ON A.id_kod_pocztowy = P.id_kod_pocztowy 
ORDER  BY S.id_student; 

/* Grupy danego kierunku oraz ich liczebność */ 
SELECT G.id_grupa        AS "Numer grupy", 
       K.nazwa, 
       Count(id_student) AS "Liczba osób" 
FROM   grupa_lista AS GL 
       JOIN grupa AS G 
         ON G.id_grupa = GL.id_grupa 
       JOIN kierunek AS K 
         ON K.id_kierunek = G.id_kierunek 
GROUP  BY G.id_grupa DESC; 

/* Historia przedmiotów danego pracownika (zakończone)*/ 
SELECT Concat(O.imie, "", O.nazwisko) AS "Prowadzący", 
       R.id_pracownik, 
       P.nazwa                         AS "Przedmiot", 
       Z.rok, 
       Z.semestr 
FROM   zajecia AS Z 
       JOIN przedmiot AS P 
         ON Z.id_przedmiot = P.id_przedmiot 
       JOIN pracownik AS R 
         ON Z.id_pracownik = R.id_pracownik 
       JOIN osoba AS O 
         ON O.id_osoba = R.id_osoba 
WHERE  R.id_pracownik = 2 
       AND Z.czy_zakonczone = 1 
ORDER  BY Z.rok DESC; 

/* Nieskorelowane, najwyższa i najniższa ocena jaką może uzyskać student */

SELECT id_student, 
       (SELECT Max(wartosc) 
        FROM   ocena) AS "Najwyższa ocena", 
       (SELECT Min(wartosc) 
        FROM   ocena) AS "Najniższa ocena" 
FROM   student 
WHERE  id_student BETWEEN 1 AND 10;

/* Skorelowane, liczba ocen uzyskanych przez danego studenta */

SELECT id_student, 
       (SELECT Count(id_ocena) 
        FROM   oceny 
        WHERE  id_student = S.id_student) 
FROM   student S;

/* Widok wyswietlania danych osob z grupy 10*/

CREATE VIEW dane 
AS 
  SELECT S.id_student, 
         imie, 
         nazwisko, 
         email 
  FROM   osoba AS O 
         JOIN student AS S 
           ON S.id_osoba = O.id_osoba 
         JOIN grupa_lista AS L 
           ON S.id_student = L.id_student 
         JOIN grupa AS G 
           ON G.id_grupa = L.id_grupa 
  WHERE  G.id_grupa = 10; 

/* Wyświetalnie widoku */

SELECT * 
FROM   dane; 

/* Usuwanie widoku */

DROP VIEW dane;

/* Procedury */

/* Dodawanie Studentow */
CREATE definer=`root`@`localhost` PROCEDURE `dodajstudenta`
(IN `ido` int, IN `legitymacja` date) NOT deterministic CONTAINS sql sql security definer
INSERT INTO student
            ( 
                        student.waznosc_legitymacji, 
                        student.id_osoba 
            ) 
            VALUES 
            ( 
                        legitymacja, 
                        ido 
            );

/* Użycie procedury */
CALL `DodajStudenta`(28, 2020-04-05);

/* Procedura wyswietlania studentow */

CREATE definer=`root`@`localhost` PROCEDURE `getstudenci`()
NOT deterministic CONTAINS sql sql security definer
SELECT *
FROM   student;

/* Użycie */

CALL `getstudenci`();

/* Procedura zwracająca średnią danego studenta */

CREATE PROCEDURE `getsrednia`(IN `ids` INT) 
NOT DETERMINISTIC 
CONTAINS SQL 
SQL security definer 
  SELECT S.id_student                   AS "Nr", 
         Concat(B.imie, "", B.nazwisko) AS "Imię i nazwisko", 
         Avg(O.wartosc)                 AS "Średnia" 
  FROM   ocena AS O 
         INNER JOIN typ_oceny AS T 
                 ON O.id_typ_oceny = T.id_typ_oceny 
         INNER JOIN oceny AS OY 
                 ON O.id_ocena = OY.id_ocena 
         INNER JOIN student AS S 
                 ON S.id_student = OY.id_student 
         INNER JOIN osoba AS B 
                 ON B.id_osoba = S.id_osoba 
  WHERE  O.id_typ_oceny = 3 
         AND S.id_student = ids; 

/* Użycie */

CALL `GetSrednia`(1);

/* ZAPYTANIA NEGATYWNE */
/* ZAPYTANIA NEGATYWNE */
/* ZAPYTANIA NEGATYWNE */

/* Lista osób, która nie posiada drugiego imienia */

SELECT * 
FROM   student AS S 
       JOIN osoba AS O 
         ON S.id_osoba = O.id_osoba 
EXCEPT 
SELECT * 
FROM   student AS S 
       JOIN osoba AS O 
         ON S.id_osoba = O.id_osoba 
WHERE  O.drugie_imie IS NOT NULL;

/* Liczba osób, która nie jest w grupie 10 */

SELECT Count(S.id_student) 
FROM   student AS S 
WHERE  S.id_student NOT IN (SELECT G.id_student 
                            FROM   grupa_lista G 
                            WHERE  G.id_grupa = 10);

/* Osoby, które mają nieważną legitymację */

(SELECT * 
 FROM   student) 
EXCEPT 
(SELECT * 
 FROM   student 
 WHERE  waznosc_legitymacji > '2020-05-31');

/* Osoby, które nie są pracownikami */

SELECT O.id_osoba, 
       imie, 
       nazwisko 
FROM   osoba AS O 
       RIGHT JOIN student AS S 
               ON O.id_osoba = S.id_osoba 
ORDER  BY O.id_osoba;

/* Usuwanie z tabeli miast, które nie są użyte w żadnym adresie */

DELETE FROM miasto 
WHERE  id_miasto NOT IN (SELECT id_miasto 
                         FROM   adres);





