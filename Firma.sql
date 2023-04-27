-- cw. 4
-- Piotr Miniuk 400467


-- 1
CREATE DATABASE firma;

-- 2
CREATE SCHEMA rozliczenia;

-- 3
CREATE TABLE rozliczenia.pracownicy (

	id_pracownika CHAR(8) PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(100) NOT NULL,
	telefon CHAR(12) NULL,

);


-- godziny(id_godziny, data, liczba_godzin , id_pracownika)

CREATE TABLE rozliczenia.godziny (

	id_godziny CHAR(6) PRIMARY KEY,
	data DATE NOT NULL,
	liczba_godzin SMALLINT NOT NULL,
	id_pracownika CHAR(8) NOT NULL,

);


-- pensje(id_pensji, stanowisko, kwota, id_premii)

CREATE TABLE rozliczenia.pensje (

	id_pensji CHAR(8) PRIMARY KEY,
	stanowisko VARCHAR(50) NOT NULL,
	kwota SMALLMONEY NOT NULL,
	id_premii CHAR(8) NULL,

);


-- premie(id_premii, rodzaj, kwota)

CREATE TABLE rozliczenia.premie(

	id_premii CHAR(8) PRIMARY KEY,
	rodzaj VARCHAR(30) NULL,
	kwota SMALLMONEY NOT NULL,

);

-- d)
ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);


-- Dodanie klucza obcego dla pensje

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

-- 4
INSERT INTO rozliczenia.pracownicy(

	[id_pracownika],
	[imie],
	[nazwisko],
	[adres],
	[telefon]

)
VALUES
(
	'A1',
	'Roberto',
	'Firmino',
	'Anfield Road, 4/4, 30-102 Liverpool',
	NULL
),
(
	'A2',
	'Andrea',
	'Pirlo',
	'San Siro, 22/1, 30-104 Mediolan',
	NULL
),
(
	'A3',
	'Pedro',
	'Miniuko',
	'Krzêcin Street, 124/4, 30-100 Krzêcin',
	NULL
),
(
	'A4',
	'Ronaldinho',
	'Gaucho',
	'Prison Street, 10/4, 30-109 Medelin',
	NULL
),
(
	'A5',
	'Cristiano',
	'Ronaldo',
	'King Fatah Road, 1/4, 30-105 Rijad',
	NULL
),
(
	'A6',
	'Roberto',
	'Lewandowsky',
	'Camp Nou, 12/4, 30-94 Barcelona',
	NULL
),
(
	'A7',
	'Ngolo',
	'Kante',
	'Stamford Bridge, 4/1, 30-110 Londyn',
	NULL
),
(
	'A8',
	'Roberto',
	'Carlos',
	'Santiago Bernabeu, 4/4, 30-108 Madryt',
	NULL
),
(
	'A9',
	'Lionel',
	'Messi',
	'Parc Des Princes, 4/4, 30-111 Pary¿',
	NULL
),
(
	'A10',
	'Erling',
	'Haaland',
	'Etihad Stadium, 41/4, 30-103 Manchester',
	NULL
)

INSERT INTO rozliczenia.godziny(

	[data],
	[id_godziny],
	[id_pracownika],
	[liczba_godzin]

)
VALUES
(
	'2023-04-20',
	1,
	'A1',
	120
),
(
	'2023-04-20',
	2,
	'A2',
	80
),
(
	'2023-04-20',
	3,
	'A3',
	100
),
(
	'2023-04-20',
	4,
	'A4',
	85
),
(
	'2023-04-20',
	5,
	'A5',
	160
),
(
	'2023-04-20',
	6,
	'A6',
	10
),
(
	'2023-04-20',
	7,
	'A7',
	200
),
(
	'2023-04-20',
	8,
	'A8',
	90
),
(
	'2023-04-20',
	9,
	'A9',
	130
),
(
	'2023-04-20',
	10,
	'A10',
	222
)
INSERT INTO rozliczenia.premie(
	[id_premii],
	[kwota],
	[rodzaj]
)
VALUES
(
	'PR1',
	0,
	NULL
),
(
	'PR2',
	2000,
	NULL
),
(
	'PR3',
	10000,
	NULL
),
(
	'PR4',
	15000,
	NULL
),
(
	'PR5',
	9999,
	NULL
),
(
	'PR6',
	100,
	NULL
),
(
	'PR7',
	20000,
	NULL
),
(
	'PR8',
	3000,
	NULL
),
(
	'PR9',
	500,
	NULL
),
(
	'PR10',
	25000,
	NULL
)
INSERT INTO rozliczenia.pensje (
	[id_pensji],
	[id_premii],
	[kwota],
	[stanowisko]
)
VALUES
(
	'P1',
	'PR1',
	8000,
	'Striker'
),
(
	'P2',
	'PR2',
	12000,
	'Midfielder'
),
(
	'P3',
	'PR3',
	40000,
	'Captain'
),
(
	'P4',
	'PR4',
	500,
	'Prisoner'
),
(
	'P5',
	'PR5',
	10000,
	'Striker'
),
(
	'P6',
	'PR6',
	5000,
	'Striker'
),
(
	'P7',
	'PR7',
	7500,
	'Midfielder'
),
(
	'P8',
	'PR8',
	6000,
	'Defender'
),
(
	'P9',
	'PR9',
	8000,
	'Striker'
),
(
	'P10',
	'PR10',
	5000,
	'Striker'
)
-- 5
SELECT nazwisko, adres FROM rozliczenia.pracownicy;
-- 6
SELECT DATEPART ( dw , data ),
	DATEPART ( mm , data )
FROM rozliczenia.godziny;
-- 7
EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje
ADD kwota_netto AS (pensje.kwota_brutto * 0.81);
SELECT
