CREATE SCHEMA geol;

CREATE TABLE geol.Eon(
ID_Eon INTEGER PRIMARY KEY,
Nazwa VARCHAR(30));

CREATE TABLE geol.Era(
ID_Era INTEGER PRIMARY KEY,
ID_Eon INTEGER REFERENCES geol.Eon(ID_Eon),
Nazwa VARCHAR(30));

CREATE TABLE geol.Okres(
ID_Okres INTEGER PRIMARY KEY,
ID_Era INTEGER REFERENCES geol.Era(ID_Era),
Nazwa VARCHAR(30));

CREATE TABLE geol.Epoka(
ID_Epoka INTEGER PRIMARY KEY,
ID_Okres INTEGER REFERENCES geol.Okres(ID_Okres),
Nazwa VARCHAR(30));

CREATE TABLE geol.Pietro(
ID_Pietro INTEGER PRIMARY KEY,
ID_Epoka INTEGER REFERENCES geol.Epoka(ID_Epoka),
Nazwa VARCHAR(30));

-- Wypełnienie tabel

-- Eon (ID_Eon, Nazwa)
INSERT INTO geol.Eon VALUES
(1, 'Fanerozoik');

-- Era (ID_Era, ID_Eon, Nazwa)
INSERT INTO geol.Era VALUES
(1, 1, 'Paleozoik'),
(2, 1, 'Mezozoik'),
(3, 1, 'Kenozoik');

-- Okres (ID_Okres, ID_Era, Nazwa)
INSERT INTO geol.Okres VALUES
(1, 1, 'Dewon'),
(2, 1, 'Karbon'),
(3, 1, 'Perm'),
(4, 2, 'Trias'),
(5, 2, 'Jura'),
(6, 2, 'Kreda'),
(7, 3, 'Paleogen'),
(8, 3, 'Neogen'),
(9, 3, 'Czwartorzed');

-- Epoka (ID_Epoka, ID_Okres, Nazwa)
INSERT INTO geol.Epoka VALUES
(1, 1, 'Dolny'),
(2, 1, 'Srodkowy'),
(3, 1, 'Gorny'),
(4, 2, 'Dolny'),
(5, 2, 'Gorny'),
(6, 3, 'Dolny'),
(7, 3, 'Gorny'),
(8, 4, 'Dolna'),
(9, 4, 'Srodkowa'),
(10, 4, 'Gorna'),
(11, 5, 'Dolna'),
(12, 5, 'Srodkowa'),
(13, 5, 'Gorna'),
(14, 6, 'Dolna'),
(15, 6, 'Gorna'),
(16, 7, 'Paleocen'),
(17, 7, 'Eocen'),
(18, 7, 'Oligocen'),
(19, 8, 'Miocen'),
(20, 8, 'Pliocen'),
(21, 9, 'Plejstocen'),
(22, 9, 'Holocen');

-- Pietro (ID_Pietro, ID_Epoka, Nazwa)
INSERT INTO geol.Pietro VALUES
(1, 1, 'Lachkow'),
(2, 1, 'Prag'),
(3, 1, 'Ems'),
(4, 2, 'Eifel'),
(5, 2, 'Zywet'),
(6, 3, 'Fran'),
(7, 3, 'Famen'),
(8, 4, 'Turnej'),
(9, 4, 'Wizen'),
(10, 4, 'Serpuchow'),
(11, 5, 'Baszkir'),
(12, 5, 'Moskow'),
(13, 5, 'Kasimow'),
(14, 5, 'Gzel'),
(15, 6, 'Assel'),
(16, 6, 'Sakmar'),
(17, 6, 'Artinsk'),
(18, 6, 'Kangur'),
(19, 7, 'Ufa'),
(20, 7, 'Kazan'),
(21, 7, 'Tatar'),
(22, 8, 'Ind'),
(23, 8, 'Olenek'),
(24, 9, 'Anizyk'),
(25, 9, 'Ladyn'),
(26, 10, 'Karnik'),
(27, 10, 'Noryk'),
(28, 10, 'Retyk'),
(29, 11, 'Hettang'),
(30, 11, 'Synemur'),
(31, 11, 'Pliensbach'),
(32, 11, 'Toark'),
(33, 12, 'Aalen'),
(34, 12, 'Bajos'),
(35, 12, 'Baton'),
(36, 12, 'Kelowej'),
(37, 13, 'Oksford'),
(38, 13, 'Kimeryd'),
(39, 13, 'Tyton'),
(40, 14, 'Berias'),
(41, 14, 'Walanzyn'),
(42, 14, 'Hoteryw'),
(43, 14, 'Barrem'),
(44, 14, 'Apt'),
(45, 14, 'Alb'),
(46, 15, 'Cenoman'),
(47, 15, 'Turon'),
(48, 15, 'Koniak'),
(49, 15, 'Santon'),
(50, 15, 'Kampan'),
(51, 15, 'Mastrycht'),
(52, 16, 'Dan'),
(53, 16, 'Zeland'),
(54, 16, 'Tanet'),
(55, 17, 'Iprez'),
(56, 17, 'Lutet'),
(57, 17, 'Barton'),
(58, 17, 'Priabon'),
(59, 18, 'Rupel'),
(60, 18, 'Szat'),
(61, 19, 'Akwitan'),
(62, 19, 'Burdygal'),
(63, 19, 'Lang'),
(64, 19, 'Serrawal'),
(65, 19, 'Torton'),
(66, 19, 'Mesyn'),
(67, 20, 'Zankl'),
(68, 20, 'Piacent'),
(69, 21, 'Gelas'),
(70, 21, 'Kalabr'),
(71, 21, 'Chiban'),
(72, 21, 'Tarant'),
(73, 22, 'Granland'),
(74, 22, 'Nortgryp'),
(75, 22, 'Megalaj');

-- Tabela geologiczna

CREATE TABLE geol.Tabela AS (SELECT * FROM geol.Pietro NATURAL JOIN geol.Epoka NATURAL JOIN 
geol.Okres NATURAL JOIN geol.Era NATURAL JOIN geol.Eon);

--tabele milion i dziesiec
CREATE TABLE Dziesiec(cyfra int, bit int);
CREATE TABLE Milion(liczba int, cyfra int, bit int);

INSERT INTO Dziesiec VALUES (0,1);
INSERT INTO Dziesiec VALUES (1,1);
INSERT INTO Dziesiec VALUES (2,1);
INSERT INTO Dziesiec VALUES (3,1);
INSERT INTO Dziesiec VALUES (4,1);
INSERT INTO Dziesiec VALUES (5,1);
INSERT INTO Dziesiec VALUES (6,1);
INSERT INTO Dziesiec VALUES (7,1);
INSERT INTO Dziesiec VALUES (8,1);
INSERT INTO Dziesiec VALUES (9,1);


INSERT INTO Milion 
SELECT a1.cyfra + 10 * a2.cyfra + 100 * a3.cyfra + 1000 * a4.cyfra
+ 10000 * a5.cyfra + 10000 * a6.cyfra AS liczba, a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;

-- Zapytanie 1

SELECT COUNT(*) FROM Milion INNER JOIN geol.Tabela ON 
(mod(Milion.liczba, 75) = (geol.Tabela.ID_Pietro));

-- Zapytanie 2

SELECT COUNT(*) FROM Milion INNER JOIN  geol.Pietro  ON 
(mod(Milion.liczba, 75) = geol.Pietro.ID_Pietro) NATURAL JOIN geol.Epoka NATURAL JOIN 
geol.Okres NATURAL JOIN geol.Era NATURAL JOIN geol.Eon;

-- Zapytanie 3

SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba, 75) = 
(SELECT ID_Pietro FROM geol.Tabela WHERE mod(Milion.liczba, 75) = (ID_Pietro));

-- Zapytanie 4

SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba, 75) = 
(SELECT geol.Pietro.ID_Pietro FROM geol.Pietro NATURAL JOIN 
 geol.Epoka NATURAL JOIN geol.Okres NATURAL JOIN geol.Era NATURAL JOIN geol.Eon);
 
 -- Indeksowanie
 
CREATE INDEX indexEon ON geol.Eon(ID_Eon);
CREATE INDEX indexEra ON geol.Era(ID_Era, ID_Eon);
CREATE INDEX indexOkres ON geol.Okres(ID_Okres, ID_Era);
CREATE INDEX indexEpoka ON geol.Epoka(ID_Epoka, ID_Okres);
CREATE INDEX indexPietro ON geol.Pietro(ID_Pietro, ID_Epoka);
CREATE INDEX indexLiczba ON Milion(liczba);
CREATE INDEX indexTabela ON geol.Tabela(ID_Pietro, ID_Epoka, ID_Era, ID_Okres, ID_Eon);