-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-06-15 13:03:58.932

-- tables
-- Table: Analityk
CREATE TABLE Analityk (
    ID integer  NOT NULL,
    Osoba_Pesel char(11)  NOT NULL,
    CONSTRAINT Analityk_pk PRIMARY KEY (ID)
) ;

-- Table: Druzyna
CREATE TABLE Druzyna (
    ID integer  NOT NULL,
    Nazwa varchar2(20)  NOT NULL,
    Wlasciciel_pesel char(11)  NOT NULL,
    CONSTRAINT Druzyna_pk PRIMARY KEY (ID)
) ;

-- Table: Dziennik_zawodnika
CREATE TABLE Dziennik_zawodnika (
    ID integer  NOT NULL,
    Zawodnik_ID integer  NOT NULL,
    Szybkosc varchar2(30)  NOT NULL,
    Kontrola_pilki varchar2(30)  NOT NULL,
    Zwinnosc varchar2(30)  NOT NULL,
    CONSTRAINT Dziennik_zawodnika_pk PRIMARY KEY (ID)
) ;

-- Table: Fizjoterapeuta
CREATE TABLE Fizjoterapeuta (
    ID integer  NOT NULL,
    Osoba_Pesel char(11)  NOT NULL,
    CONSTRAINT Fizjoterapeuta_pk PRIMARY KEY (ID)
) ;

-- Table: LIsta_analitykow
CREATE TABLE LIsta_analitykow (
    Analityk_ID integer  NOT NULL,
    Trening_ID integer  NOT NULL,
    CONSTRAINT LIsta_analitykow_pk PRIMARY KEY (Analityk_ID,Trening_ID)
) ;

-- Table: Lista_druzyn
CREATE TABLE Lista_druzyn (
    Druzyna_ID integer  NOT NULL,
    Rozgrywki_ID integer  NOT NULL,
    CONSTRAINT Lista_druzyn_pk PRIMARY KEY (Druzyna_ID,Rozgrywki_ID)
) ;

-- Table: Lista_trenerow
CREATE TABLE Lista_trenerow (
    Trener_ID integer  NOT NULL,
    Trening_ID integer  NOT NULL,
    CONSTRAINT Lista_trenerow_pk PRIMARY KEY (Trener_ID,Trening_ID)
) ;

-- Table: Lista_wpisow
CREATE TABLE Lista_wpisow (
    Dziennik_zawodnika_ID integer  NOT NULL,
    Wpis_ID integer  NOT NULL,
    CONSTRAINT Lista_wpisow_pk PRIMARY KEY (Dziennik_zawodnika_ID)
) ;

-- Table: Lista_zawodnikow
CREATE TABLE Lista_zawodnikow (
    Zawodnik_ID integer  NOT NULL,
    Trening_ID integer  NOT NULL,
    CONSTRAINT Lista_zawodnikow_pk PRIMARY KEY (Zawodnik_ID,Trening_ID)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    Pesel char(11)  NOT NULL,
    Imie varchar2(20)  NOT NULL,
    Nazwisko varchar2(20)  NOT NULL,
    Data_urodzenia date  NOT NULL,
    Plec char(1)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (Pesel)
) ;

-- Table: Rozgrywki
CREATE TABLE Rozgrywki (
    ID integer  NOT NULL,
    Nazwa_rozgrywek varchar2(30)  NOT NULL,
    CONSTRAINT Rozgrywki_pk PRIMARY KEY (ID)
) ;

-- Table: Trener
CREATE TABLE Trener (
    ID integer  NOT NULL,
    Osoba_Pesel char(11)  NOT NULL,
    CONSTRAINT Trener_pk PRIMARY KEY (ID)
) ;

-- Table: Trening
CREATE TABLE Trening (
    ID integer  NOT NULL,
    Data_rozpoczecia date  NOT NULL,
    Data_zakonczenia date  NOT NULL,
    Druzyna_ID integer  NOT NULL,
    CONSTRAINT Trening_pk PRIMARY KEY (ID)
) ;

-- Table: Wpis
CREATE TABLE Wpis (
    ID integer  NOT NULL,
    Data_wpisu date  NOT NULL,
    CONSTRAINT Wpis_pk PRIMARY KEY (ID)
) ;

-- Table: Zawodnik
CREATE TABLE Zawodnik (
    ID integer  NOT NULL,
    Osoba_Pesel char(11)  NOT NULL,
    Waga number(5,2)  NOT NULL,
    Wzrost number(5,2)  NOT NULL,
    Fizjoterapeuta_ID integer  NOT NULL,
    CONSTRAINT Zawodnik_pk PRIMARY KEY (ID)
) ;

-- foreign keys
-- Reference: Analityk_Osoba (table: Analityk)
ALTER TABLE Analityk ADD CONSTRAINT Analityk_Osoba
    FOREIGN KEY (Osoba_Pesel)
    REFERENCES Osoba (Pesel);

-- Reference: Druzyna_Osoba (table: Druzyna)
ALTER TABLE Druzyna ADD CONSTRAINT Druzyna_Osoba
    FOREIGN KEY (Wlasciciel_pesel)
    REFERENCES Osoba (Pesel);

-- Reference: Dziennik_zawodnika_Zawodnik (table: Dziennik_zawodnika)
ALTER TABLE Dziennik_zawodnika ADD CONSTRAINT Dziennik_zawodnika_Zawodnik
    FOREIGN KEY (Zawodnik_ID)
    REFERENCES Zawodnik (ID);

-- Reference: Fizjoterapeuta_Osoba (table: Fizjoterapeuta)
ALTER TABLE Fizjoterapeuta ADD CONSTRAINT Fizjoterapeuta_Osoba
    FOREIGN KEY (Osoba_Pesel)
    REFERENCES Osoba (Pesel);

-- Reference: LIsta_analitykow_Analityk (table: LIsta_analitykow)
ALTER TABLE LIsta_analitykow ADD CONSTRAINT LIsta_analitykow_Analityk
    FOREIGN KEY (Analityk_ID)
    REFERENCES Analityk (ID);

-- Reference: LIsta_analitykow_Trening (table: LIsta_analitykow)
ALTER TABLE LIsta_analitykow ADD CONSTRAINT LIsta_analitykow_Trening
    FOREIGN KEY (Trening_ID)
    REFERENCES Trening (ID);

-- Reference: Lista_druzyn_Druzyna (table: Lista_druzyn)
ALTER TABLE Lista_druzyn ADD CONSTRAINT Lista_druzyn_Druzyna
    FOREIGN KEY (Druzyna_ID)
    REFERENCES Druzyna (ID);

-- Reference: Lista_druzyn_Rozgrywki (table: Lista_druzyn)
ALTER TABLE Lista_druzyn ADD CONSTRAINT Lista_druzyn_Rozgrywki
    FOREIGN KEY (Rozgrywki_ID)
    REFERENCES Rozgrywki (ID);

-- Reference: Lista_trenerow_Trener (table: Lista_trenerow)
ALTER TABLE Lista_trenerow ADD CONSTRAINT Lista_trenerow_Trener
    FOREIGN KEY (Trener_ID)
    REFERENCES Trener (ID);

-- Reference: Lista_trenerow_Trening (table: Lista_trenerow)
ALTER TABLE Lista_trenerow ADD CONSTRAINT Lista_trenerow_Trening
    FOREIGN KEY (Trening_ID)
    REFERENCES Trening (ID);

-- Reference: Lista_wpisow_Dziennik (table: Lista_wpisow)
ALTER TABLE Lista_wpisow ADD CONSTRAINT Lista_wpisow_Dziennik
    FOREIGN KEY (Dziennik_zawodnika_ID)
    REFERENCES Dziennik_zawodnika (ID);

-- Reference: Lista_wpisow_Wpis (table: Lista_wpisow)
ALTER TABLE Lista_wpisow ADD CONSTRAINT Lista_wpisow_Wpis
    FOREIGN KEY (Wpis_ID)
    REFERENCES Wpis (ID);

-- Reference: Lista_zawodnikow_Trening (table: Lista_zawodnikow)
ALTER TABLE Lista_zawodnikow ADD CONSTRAINT Lista_zawodnikow_Trening
    FOREIGN KEY (Trening_ID)
    REFERENCES Trening (ID);

-- Reference: Lista_zawodnikow_Zawodnik (table: Lista_zawodnikow)
ALTER TABLE Lista_zawodnikow ADD CONSTRAINT Lista_zawodnikow_Zawodnik
    FOREIGN KEY (Zawodnik_ID)
    REFERENCES Zawodnik (ID);

-- Reference: Trener_Osoba (table: Trener)
ALTER TABLE Trener ADD CONSTRAINT Trener_Osoba
    FOREIGN KEY (Osoba_Pesel)
    REFERENCES Osoba (Pesel);

-- Reference: Trening_Druzyna (table: Trening)
ALTER TABLE Trening ADD CONSTRAINT Trening_Druzyna
    FOREIGN KEY (Druzyna_ID)
    REFERENCES Druzyna (ID);

-- Reference: Zawodnik_Fizjoterapeuta (table: Zawodnik)
ALTER TABLE Zawodnik ADD CONSTRAINT Zawodnik_Fizjoterapeuta
    FOREIGN KEY (Fizjoterapeuta_ID)
    REFERENCES Fizjoterapeuta (ID);

-- Reference: Zawodnik_Osoba (table: Zawodnik)
ALTER TABLE Zawodnik ADD CONSTRAINT Zawodnik_Osoba
    FOREIGN KEY (Osoba_Pesel)
    REFERENCES Osoba (Pesel);

-- Inserting data into table: Osoba
INSERT
ALL
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('12345678901', 'Jan', 'Kowalski', '1990-01-01', 'M')
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('23456789012', 'Anna', 'Nowak', '1995-02-15', 'K')
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('34567890123', 'Michał', 'Wiśniewski', '1987-05-10', 'M') -- trenerzy
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('45678901234', 'Katarzyna', 'Lewandowska', '1992-11-20', 'K')
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('56789012345', 'Piotr', 'Jankowski', '1985-07-03', 'M')
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('67890123456', 'Magdalena', 'Wójcik', '1998-09-18', 'K') -- zawodnicy
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('78901234567', 'Marcin', 'Kamiński', '1993-04-25', 'M')
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('89012345678', 'Aleksandra', 'Kowalczyk', '1991-12-08', 'K')-- fizjoterapeuta
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('90123456789', 'Tomasz', 'Szymański', '1988-06-30', 'M')
    INTO Osoba (Pesel, Imie, Nazwisko, Data_urodzenia, Plec) VALUES ('01234567890', 'Karolina', 'Dąbrowska', '1997-03-12', 'K') -- Analitycy
SELECT 1
FROM DUAL;


-- Inserting data into table: Druzyna
INSERT INTO Druzyna (ID, Nazwa, Wlasciciel_pesel) VALUES (1, 'Drużyna A', '12345678901');

-- Inserting data into table: Trener
INSERT
ALL
    INTO Trener (ID, Osoba_Pesel) VALUES (1, '23456789012')
    INTO Trener (ID, Osoba_Pesel) VALUES (2, '34567890123')
SELECT 1
FROM DUAL;



-- Inserting data into table: Fizjoterapeuta
INSERT
ALL
    INTO Fizjoterapeuta (ID, Osoba_Pesel) VALUES (4, '78901234567')
    INTO Fizjoterapeuta (ID, Osoba_Pesel) VALUES (5, '89012345678')
SELECT 1
FROM DUAL;

-- Inserting data into table: Zawodnik
INSERT
ALL
    INTO Zawodnik (ID, Osoba_Pesel, Waga, Wzrost, Fizjoterapeuta_ID) VALUES (1, '45678901234', 75.5, 180.0, 4)
    INTO Zawodnik (ID, Osoba_Pesel, Waga, Wzrost, Fizjoterapeuta_ID) VALUES (2, '56789012345', 68.0, 175.0, 5)
    INTO Zawodnik (ID, Osoba_Pesel, Waga, Wzrost, Fizjoterapeuta_ID) VALUES (3, '67890123456', 69.0, 178.0, 4)
SELECT 1
FROM DUAL;


-- Inserting data into table: Analityk
INSERT
ALL
    INTO Analityk (ID, Osoba_Pesel) VALUES (6, '90123456789')
    INTO Analityk (ID, Osoba_Pesel) VALUES (7, '01234567890')
SELECT 1
FROM DUAL;


-- Inserting data into table: Trening
INSERT INTO Trening (ID, Data_rozpoczecia, Data_zakonczenia, Druzyna_ID) VALUES (8, '2023-06-15', '2023-06-16', 1);

-- Inserting data into table: Dziennik_zawodnika
INSERT
ALL
    INTO Dziennik_zawodnika (ID, Zawodnik_ID, Szybkosc, Kontrola_pilki, Zwinnosc) VALUES (10, 1, 'Szybki', 'Dobra', 'Zwrotny')
    INTO Dziennik_zawodnika (ID, Zawodnik_ID, Szybkosc, Kontrola_pilki, Zwinnosc) VALUES (11, 2, 'Średni', 'Dobra', 'Zwrotny')
    INTO Dziennik_zawodnika (ID, Zawodnik_ID, Szybkosc, Kontrola_pilki, Zwinnosc) VALUES (12, 3, 'wolny', 'Dobra', 'Zwrotny')
SELECT 1
FROM DUAL;

-- Inserting data into table: Wpis
INSERT
ALL
    INTO Wpis (ID, Data_wpisu) VALUES (13, '2023-06-15')
    INTO Wpis (ID, Data_wpisu) VALUES (14, '2023-06-14')
SELECT 1
FROM DUAL;

-- Inserting data into table: LIsta_analitykow
INSERT
ALL
    INTO LIsta_analitykow (Analityk_ID, Trening_ID) VALUES (6, 8)
    INTO LIsta_analitykow (Analityk_ID, Trening_ID) VALUES (7, 8)
SELECT 1
FROM DUAL;

-- Inserting data into table: Rozgrywki
INSERT INTO Rozgrywki (ID, Nazwa_rozgrywek) VALUES (14, 'Liga A');

-- Inserting data into table: Lista_druzyn
INSERT INTO Lista_druzyn (Druzyna_ID, Rozgrywki_ID) VALUES (1, 14);


-- Inserting data into table: Lista_trenerow
INSERT
ALL
    INTO Lista_trenerow (Trener_ID, Trening_ID) VALUES (1, 8)
    INTO Lista_trenerow (Trener_ID, Trening_ID) VALUES (2, 8)
SELECT 1
FROM DUAL;
-- Inserting data into table: Lista_wpisow
INSERT
ALL
    INTO Lista_wpisow (Dziennik_zawodnika_ID, Wpis_ID) VALUES (10, 13)
    INTO Lista_wpisow (Dziennik_zawodnika_ID, Wpis_ID) VALUES (11, 14)
SELECT 1
FROM DUAL;


-- Inserting data into table: Lista_zawodnikow
INSERT
ALL
    INTO Lista_zawodnikow (Zawodnik_ID, Trening_ID) VALUES (1, 8)
    INTO Lista_zawodnikow (Zawodnik_ID, Trening_ID) VALUES (2, 8)
    INTO Lista_zawodnikow (Zawodnik_ID, Trening_ID) VALUES (3, 8)
SELECT 1
FROM DUAL;





-- End of file.

