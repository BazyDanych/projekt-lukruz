DROP TABLE IF EXISTS 
adres,
akademik,
autorzy,
gmina,
grupa,
grupa_lista,
kierunek,
kod_pocztowy,
lista_akademikowa,
lista_platnosci,
miasto,
obecnosci,
ocena,
oceny,
osoba,
platnosc,
pomoc_finansowa,
powiat,
praca_dyplomowa,
pracownik,
przedmiot,
sala,
stanowisko,
student,
typ_oceny,
typ_pomocy_finansowej,
typ_pracy_dyplomowej,
typ_sali,
typ_zajec,
tytuly,
tytul_naukowy,
ulica,
wojewodztwo,
zajecia,
logs;

DROP PROCEDURE IF EXISTS GetSrednia;
DROP PROCEDURE IF EXISTS dodajstudenta;
DROP PROCEDURE IF EXISTS getstudenci;