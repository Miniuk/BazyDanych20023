USE firma11
GO

-- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj¹c do niego kierunkowy dla Polski w nawiasie (+48)

-- dodawanie +48
UPDATE ksiegowosc.pracownicy
SET telefon = '(+48) ' + ksiegowosc.pracownicy.telefon
WHERE telefon IS NOT NULL;

--UPDATE ksiegowosc.pracownicy
--SET telefon = '101234567'
--WHERE id_pracownika = 10;

ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon varchar(20);

SELECT *
FROM ksiegowosc.godziny;

-- b) Zmodyfikuj atrybut telefonow tabeli pracownicy tak, aby numer oddzielony by³ myœlnikami wg wzoru: ‘555-222-333’

UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT(SUBSTRING(pracownicy.telefon,1,9),'-', SUBSTRING(pracownicy.telefon,9,3),'-',SUBSTRING(pracownicy.telefon,12,3));
SELECT *
FROM ksiegowosc.pracownicy;

-- c) Wyœwietl dane pracownika, którego nazwisko jest najd³u¿sze, u¿ywaj¹c du¿ych liter

SELECT
	p.id_pracownika,
	UPPER(p.imie) as imie,
	UPPER(p.nazwisko) as nazwisko,
	UPPER(p.adres) as adres,
	p.telefon
FROM ksiegowosc.pracownicy as p
WHERE LEN(p.nazwisko) = (
	SELECT MAX(LEN(p.nazwisko))
	FROM ksiegowosc.pracownicy as p);

-- d) Wyœwietl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5

SELECT
HASHBYTES('md5', p.imie) AS imie,
HASHBYTES('md5', p.nazwisko) AS nazwisko,
HASHBYTES('md5', p.adres) AS adres,
HASHBYTES('md5', p.telefon) AS telefon,
HASHBYTES('md5', CAST(pe.kwota AS varchar(32))) AS pensje
FROM ksiegowosc.pracownicy AS p
INNER JOIN ksiegowosc.wynagrodzenie AS w
ON p.id_pracownika = w.id_pracownika
INNER JOIN ksiegowosc.pensje AS pe
ON w.id_pensji = pe.id_pensji;


-- e) Wyœwietl pracowników, ich pensje oraz premie. Wykorzystaj z³¹czenie lewostronne

SELECT
ksiegowosc.pracownicy.imie AS imie,
ksiegowosc.pracownicy.nazwisko AS nazwisko,
ksiegowosc.pensje.kwota AS pensje,
ksiegowosc.premia.kwota AS premia
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pracownicy
ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
LEFT JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premia
ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii;


-- f) wygeneruj raport (zapytanie), które zwróciw wyniki treœæ wg poni¿szego szablonu:

ALTER TABLE ksiegowosc.godziny
ADD Liczba_nadgodzin INTEGER NULL;

SELECT * FROM ksiegowosc.godziny;

UPDATE  ksiegowosc.godziny
SET Liczba_nadgodzin = liczba_godzin - 160

SELECT 'Pracownik ' + imie + ' ' + nazwisko + ', w dniu' + CONVERT(varchar(10), CONVERT(date, ksiegowosc.wynagrodzenie.dataa), 104)
+ ' otrzyma³ pensjê ca³kowit¹ na kwotê: ' + CONVERT(varchar(20), (ksiegowosc.pensje.kwota + ksiegowosc.premia.kwota + CASE WHEN Liczba_nadgodzin < 0
THEN 0
ELSE Liczba_nadgodzin * 10000
END))
+ ' z³, gdzie wynagrodzenie zasadnicze wynosi³o: ' + CAST(ksiegowosc.pensje.kwota AS varchar(10)) + ' z³, premia: ' +
CAST(ksiegowosc.premia.kwota AS varchar(10)) + ' z³, nadgodziny: ' + CONVERT(varchar(10), (CASE WHEN Liczba_nadgodzin < 0 THEN 0
ELSE Liczba_nadgodzin * 10000
END)) + ' z³.' AS raport

FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premia ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
LEFT JOIN ksiegowosc.godziny ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.godziny.id_pracownika;