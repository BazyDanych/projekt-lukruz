CREATE TABLE `adres` (
  `id_adres` int(11) DEFAULT NULL AUTO_INCREMENT,
  `id_miasto` int(11) DEFAULT NULL,
  `id_ulica` int(11) DEFAULT NULL,
  `oznaczenie_domu` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `mieszkanie` int(11) DEFAULT NULL,
  `id_wojewodztwo` int(11) DEFAULT NULL,
  `id_powiat` int(11) DEFAULT NULL,
  `id_gmina` int(11) DEFAULT NULL,
  `id_kod_pocztowy` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_adres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `akademik` (
  `id_akademik` int(11) DEFAULT NULL AUTO_INCREMENT,
  `id_adres` int(11) DEFAULT NULL,
  `numer_pokoju` int(11) DEFAULT NULL,
  primary KEY(`id_akademik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `autorzy` (
  `id_student` int(11) DEFAULT NULL,
  `id_praca_dyplomowa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `gmina` (
  `id_gmina` int(11) DEFAULT NULL AUTO_INCREMENT,
  `gmina` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_gmina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `grupa` (
  `id_kierunek` int(11) DEFAULT NULL,
  `data_utworzenia` datetime DEFAULT NULL,
  `id_grupa` int(11) DEFAULT NULL AUTO_INCREMENT,
  PRIMARY KEY(`id_grupa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `grupa_lista` (
  `id_grupa` int(11) DEFAULT NULL,
  `id_student` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `kierunek` (
  `id_kierunek` int(11) DEFAULT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `limit_kierunku` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_kierunek`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `kod_pocztowy` (
  `id_kod_pocztowy` int(11) DEFAULT NULL AUTO_INCREMENT,
  `okreg_kodowy` int(11) DEFAULT NULL,
  `sektor_kodowy` int(11) DEFAULT NULL,
  `placowka` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_kod_pocztowy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `lista_akademikowa` (
  `id_akademik` int(11) DEFAULT NULL,
  `id_student` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `lista_platnosci` (
  `id_student` int(11) DEFAULT NULL,
  `id_platnosc` int(11) DEFAULT NULL,
  `data_wplaty` datetime DEFAULT NULL,
  `termin_zaplaty` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `miasto` (
  `id_miasto` int(11) DEFAULT NULL AUTO_INCREMENT,
  `nazwa_miasta` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_miasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `obecnosci` (
  `id_student` int(11) DEFAULT NULL,
  `id_zajecia` int(11) DEFAULT NULL,
  `dzien` datetime DEFAULT NULL,
  `czy_obecny` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `ocena` (
  `id_ocena` int(11) DEFAULT NULL AUTO_INCREMENT,
  `id_typ_oceny` int(11) DEFAULT NULL,
  `wartosc` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_ocena`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `oceny` (
  `id_student` int(11) DEFAULT NULL,
  `id_ocena` int(11) DEFAULT NULL,
  `id_przedmiot` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `osoba` (
  `id_osoba` int(11) DEFAULT NULL AUTO_INCREMENT,
  `id_adres` int(11) DEFAULT NULL,
  `imie` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `drugie_imie` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `nazwisko` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `telefon` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_osoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `platnosc` (
  `id_platnosc` int(11) DEFAULT NULL AUTO_INCREMENT,
  `kwota` int(11) DEFAULT NULL,
  `nazwa` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_platnosc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `pomoc_finansowa` (
  `id_student` int(11) DEFAULT NULL,
  `id_typ_pomocy_finansowej` int(11) DEFAULT NULL,
  `termin` datetime DEFAULT NULL,
  `kwota` int(11) DEFAULT NULL,
  `id_kierunek` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `powiat` (
  `id_powiat` int(11) DEFAULT NULL AUTO_INCREMENT,
  `powiat` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_powiat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `praca_dyplomowa` (
  `id_praca_dyplomowa` int(11) DEFAULT NULL AUTO_INCREMENT,
  `id_typ_pracy_dyplomowej` int(11) DEFAULT NULL,
  `liczba_punktow` int(11) DEFAULT NULL,
  `termin_obrony` datetime DEFAULT NULL,
  `max_termin_obrony` datetime DEFAULT NULL,
  PRIMARY KEY(`id_praca_dyplomowa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `pracownik` (
  `id_pracownik` int(11) DEFAULT NULL AUTO_INCREMENT,
  `id_osoba` int(11) DEFAULT NULL,
  `id_stanowisko` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_pracownik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `przedmiot` (
  `id_przedmiot` int(11) DEFAULT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `id_typ_zajec` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_przedmiot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `sala` (
  `id_sala` int(11) DEFAULT NULL AUTO_INCREMENT,
  `id_adres` int(11) DEFAULT NULL,
  `id_typ_sali` int(11) DEFAULT NULL,
  `numer` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_sala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `stanowisko` (
  `id_stanowisko` int(11) DEFAULT NULL AUTO_INCREMENT,
  `stanowisko` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_stanowisko`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `student` (
  `id_student` int(11) DEFAULT NULL AUTO_INCREMENT,
  `waznosc_legitymacji` datetime DEFAULT NULL,
  `id_osoba` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `typ_oceny` (
  `id_typ_oceny` int(11) DEFAULT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_typ_oceny`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `typ_pomocy_finansowej` (
  `id_typ_pomocy_finansowej` int(11) DEFAULT NULL AUTO_INCREMENT,
  `typ_pomocy` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_typ_pomocy_finansowej`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `typ_pracy_dyplomowej` (
  `id_typ_pracy_dyplomowej` int(11) DEFAULT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_typ_pracy_dyplomowej`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;


CREATE TABLE `typ_sali` (
  `id_typ_sali` int(11) DEFAULT NULL AUTO_INCREMENT,
  `typ` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_typ_sali`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `typ_zajec` (
  `id_typ_zajec` int(11) DEFAULT NULL AUTO_INCREMENT,
  `typ_zajec` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_typ_zajec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `tytuly` (
  `id_osoba` int(11) DEFAULT NULL,
  `id_tytul_naukowy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `tytul_naukowy` (
  `id_tytul_naukowy` int(11) DEFAULT NULL AUTO_INCREMENT,
  `tytul_naukowy` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_tytul_naukowy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `ulica` (
  `id_ulica` int(11) DEFAULT NULL AUTO_INCREMENT,
  `ulica` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_ulica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `wojewodztwo` (
  `id_wojewodztwo` int(11) DEFAULT NULL AUTO_INCREMENT,
  `wojewodztwo` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY(`id_wojewodztwo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;


CREATE TABLE `zajecia` (
  `id_zajecia` int(11) DEFAULT NULL AUTO_INCREMENT,
  `id_przedmiot` int(11) DEFAULT NULL,
  `liczba_godzin` int(11) DEFAULT NULL,
  `semestr` int(11) DEFAULT NULL,
  `rok` int(11) DEFAULT NULL,
  `id_pracownik` int(11) DEFAULT NULL,
  `id_grupa` int(11) DEFAULT NULL,
  `czy_zakonczone` bit(1) DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL,
  PRIMARY KEY(`id_zajecia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `logs` (
    `id` int(11) DEFAULT NULL AUTO_INCREMENT,
    `id_osoba` int(11) DEFAULT NULL,
    `zdarzenie` varchar(20) DEFAULT NULL,
    `data` date DEFAULT NULL,
    PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

ALTER TABLE `adres` ADD FOREIGN KEY(`id_miasto`) REFERENCES `miasto`(`id_miasto`);
ALTER TABLE `adres` ADD FOREIGN KEY(`id_ulica`) REFERENCES `ulica`(`id_ulica`);
ALTER TABLE `adres` ADD FOREIGN KEY(`id_wojewodztwo`) REFERENCES `wojewodztwo`(`id_wojewodztwo`);
ALTER TABLE `adres` ADD FOREIGN KEY(`id_powiat`) REFERENCES `powiat`(`id_powiat`);
ALTER TABLE `adres` ADD FOREIGN KEY(`id_gmina`) REFERENCES `gmina`(`id_gmina`);
ALTER TABLE `adres` ADD FOREIGN KEY(`id_kod_pocztowy`) REFERENCES `kod_pocztowy`(`id_kod_pocztowy`);
ALTER TABLE `akademik` ADD FOREIGN KEY(`id_adres`) REFERENCES `adres`(`id_adres`);
ALTER TABLE `autorzy` ADD FOREIGN KEY(`id_student`) REFERENCES `student`(`id_student`);
ALTER TABLE `autorzy` ADD FOREIGN KEY(`id_praca_dyplomowa`) REFERENCES `praca_dyplomowa`(`id_praca_dyplomowa`);
ALTER TABLE `grupa` ADD FOREIGN KEY(`id_kierunek`) REFERENCES `kierunek`(`id_kierunek`);
ALTER TABLE `grupa_lista` ADD FOREIGN KEY(`id_grupa`) REFERENCES `grupa`(`id_grupa`);
ALTER TABLE `grupa_lista` ADD FOREIGN KEY(`id_student`) REFERENCES `student`(`id_student`);
ALTER TABLE `lista_akademikowa` ADD FOREIGN KEY(`id_akademik`) REFERENCES `akademik`(`id_akademik`);
ALTER TABLE `lista_akademikowa` ADD FOREIGN KEY(`id_student`) REFERENCES `student`(`id_student`);
ALTER TABLE `lista_platnosci` ADD FOREIGN KEY(`id_student`) REFERENCES `student`(`id_student`);
ALTER TABLE `lista_platnosci` ADD FOREIGN KEY(`id_platnosc`) REFERENCES `platnosc`(`id_platnosc`);
ALTER TABLE `obecnosci` ADD FOREIGN KEY(`id_student`) REFERENCES `student`(`id_student`);
ALTER TABLE `obecnosci` ADD FOREIGN KEY(`id_zajecia`) REFERENCES `zajecia`(`id_zajecia`);
ALTER TABLE `ocena` ADD FOREIGN KEY(`id_typ_oceny`) REFERENCES `typ_oceny`(`id_typ_oceny`);
ALTER TABLE `oceny` ADD FOREIGN KEY(`id_student`) REFERENCES `student`(`id_student`);
ALTER TABLE `oceny` ADD FOREIGN KEY(`id_ocena`) REFERENCES `ocena`(`id_ocena`);
ALTER TABLE `oceny` ADD FOREIGN KEY(`id_przedmiot`) REFERENCES `przedmiot`(`id_przedmiot`);
ALTER TABLE `osoba` ADD FOREIGN KEY(`id_adres`) REFERENCES `adres`(`id_adres`);
ALTER TABLE `pomoc_finansowa` ADD FOREIGN KEY(`id_student`) REFERENCES `student`(`id_student`);
ALTER TABLE `pomoc_finansowa` ADD FOREIGN KEY(`id_typ_pomocy_finansowej`) REFERENCES `typ_pomocy_finansowej`(`id_typ_pomocy_finansowej`);
ALTER TABLE `pomoc_finansowa` ADD FOREIGN KEY(`id_kierunek`) REFERENCES `kierunek`(`id_kierunek`);
ALTER TABLE `praca_dyplomowa` ADD FOREIGN KEY(`id_typ_pracy_dyplomowej`) REFERENCES `typ_pracy_dyplomowej`(`id_typ_pracy_dyplomowej`);
ALTER TABLE `pracownik` ADD FOREIGN KEY(`id_osoba`) REFERENCES `osoba`(`id_osoba`);
ALTER TABLE `pracownik` ADD FOREIGN KEY(`id_stanowisko`) REFERENCES `stanowisko`(`id_stanowisko`);
ALTER TABLE `przedmiot` ADD FOREIGN KEY(`id_typ_zajec`) REFERENCES `typ_zajec`(`id_typ_zajec`);
ALTER TABLE `sala` ADD FOREIGN KEY(`id_adres`) REFERENCES `adres`(`id_adres`);
ALTER TABLE `sala` ADD FOREIGN KEY(`id_typ_sali`) REFERENCES `typ_sali`(`id_typ_sali`);
ALTER TABLE `student` ADD FOREIGN KEY(`id_osoba`) REFERENCES `osoba`(`id_osoba`);
ALTER TABLE `tytuly` ADD FOREIGN KEY(`id_osoba`) REFERENCES `osoba`(`id_osoba`);
ALTER TABLE `tytuly` ADD FOREIGN KEY(`id_tytul_naukowy`) REFERENCES `tytul_naukowy`(`id_tytul_naukowy`);
ALTER TABLE `zajecia` ADD FOREIGN KEY(`id_przedmiot`) REFERENCES `przedmiot`(`id_przedmiot`);
ALTER TABLE `zajecia` ADD FOREIGN KEY(`id_pracownik`) REFERENCES `pracownik`(`id_pracownik`);
ALTER TABLE `zajecia` ADD FOREIGN KEY(`id_grupa`) REFERENCES `grupa`(`id_grupa`);
ALTER TABLE `zajecia` ADD FOREIGN KEY(`id_sala`) REFERENCES `sala`(`id_sala`);
ALTER TABLE `logs` ADD FOREIGN KEY(`id_osoba`) REFERENCES `osoba`(`id_osoba`);

















