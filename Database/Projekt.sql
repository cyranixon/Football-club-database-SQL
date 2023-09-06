--polecenia SELECT z warunkiem WHERE

--wybiera osoby o nazwisku 'Kaminski'
SELECT * FROM OSOBA
WHERE Nazwisko = 'Kamiński';
--wybiera osoby które są plci meskiej
SELECT * FROM OSOBA
WHERE PLEC = 'M';
--wybiera zawodnikow z dziennika zawodnika ktorzy sa zwrotni
SELECT * FROM  DZIENNIK_ZAWODNIKA
WHERE ZWINNOSC = 'Zwrotny';
--Wybiera zawodnikow ktorzy ważą wiecej niz 70 kg
SELECT * FROM ZAWODNIK
WHERE WAGA > 70;
--Wybiera zawonikow ktorych pesel zaczyna sie od 45
SELECT * FROM ZAWODNIK
WHERE OSOBA_PESEL LIKE '45%';

--polecenia SELECT ze złączeniem tabel

--Łączy tabele fizjoterapeuty i zawowdnikow przypisanych do nich
SELECT *
FROM ZAWODNIK, FIZJOTERAPEUTA
WHERE ZAWODNIK.FIZJOTERAPEUTA_ID = FIZJOTERAPEUTA.ID;
--Łączy tabele TRENER i ZAWODNIK
SELECT *
FROM ZAWODNIK, TRENER;
--Łączy tabele zawodnik i z tabelą dziennik, z przypisnaym dziennikiem do zawodnika
SELECT *
FROM ZAWODNIK JOIN DZIENNIK_ZAWODNIKA ON ZAWODNIK.ID = DZIENNIK_ZAWODNIKA.ZAWODNIK_ID;
--Łącczy tabele tak aby wyswietlac trenerów przypisanych do danego treningu
SELECT *
FROM LISTA_TRENEROW JOIN TRENING ON LISTA_TRENEROW.TRENING_ID = TRENING_ID;
--Łączy tabele tak aby wyswietlac drużynę oraz rozgrywki w jakich bierze udział
SELECT *
FROM LISTA_DRUZYN JOIN ROZGRYWKI ON LISTA_DRUZYN.ROZGRYWKI_ID = ROZGRYWKI.ID;


--polecenia SELECT z klauzulą GROUP BY i HAVING

--wyswielta jaka jest maksymalna waga dla danego wzrostu zawodnika w druzynie
SELECT MAX(WAGA),WZROST
FROM ZAWODNIK
GROUP BY WZROST;
--Wyswietla ile zawodnikow jest danego wzrostu w druzynie
SELECT COUNT(ID),WZROST
FROM ZAWODNIK
GROUP BY WZROST;
-- Wyswietla ile jest zawodnikow danej wagi w drużynie malejąco
SELECT COUNT(ID),WAGA
FROM ZAWODNIK
GROUP BY WAGA
ORDER BY COUNT(ID)DESC;
-- wyswietla ile jest zawonikow nad ktorymi opieke sprawuje fizjoterapeuta o ID = 4
SELECT COUNT(ID),FIZJOTERAPEUTA_ID
FROM ZAWODNIK
GROUP BY FIZJOTERAPEUTA_ID
HAVING FIZJOTERAPEUTA_ID = 4;
--Wyswietyla ile jest zawodnikow zwrotnych
SELECT COUNT (ID), ZWINNOSC
FROM DZIENNIK_ZAWODNIKA
GROUP BY ZWINNOSC
HAVING COUNT(ID) > 0;


















