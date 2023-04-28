-- cw. 5
-- Piotr Miniuk 400467


-- 1
CREATE DATABASE firma11;

-- 2
create schema ksiegowosc;

-- 3
-- pracownicy
create table ksiegowosc.pracownicy(id_pracownika int primary key, imie nvarchar(30) NOT NULL, nazwisko nvarchar(80) NOT NULL, adres nvarchar(100) NOT NULL, telefon varchar(15) NOT NULL);
-- godziny
create table ksiegowosc.godziny(id_godziny int primary key, dataa date NOT NULL, liczba_godzin int NOT NULL, id_pracownika int NOT NULL);
-- pensje
create table ksiegowosc.pensje(id_pensji int primary key, stanowisko nvarchar(50) not null, kwota money not null);
-- premia
create table ksiegowosc.premia(id_premii int primary key, rodzaj nvarchar(60), kwota money);
-- wynagrodzenie
create table ksiegowosc.wynagrodzenie(id_wynagrodzenia int primary key, dataa date not null, id_pracownika int not null, id_godziny int not null, id_pensji int not null, id_premii int not null);

-- 4
--klucze
alter table ksiegowosc.godziny 
add foreign key(id_pracownika) references ksiegowosc.pracownicy(id_pracownika);

alter table ksiegowosc.wynagrodzenie
add foreign key(id_pracownika) references ksiegowosc.pracownicy(id_pracownika);

alter table ksiegowosc.wynagrodzenie
add foreign key(id_godziny) references ksiegowosc.godziny(id_godziny);

alter table ksiegowosc.wynagrodzenie
add foreign key(id_pensji) references ksiegowosc.pensje(id_pensji);

alter table ksiegowosc.wynagrodzenie
add foreign key(id_premii) references ksiegowosc.premia(id_premii);

EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Info o pracownikach',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='pracownicy'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.pracownicy')
  AND minor_id = 0
  AND class = 1;

 EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Ilosc przepracowanych godzin w ciagu miesiaca',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='godziny'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.godziny')
  AND minor_id = 0
  AND class = 1;

 EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Pensja pracownikow',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='pensje'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.pensje')
  AND minor_id = 0
  AND class = 1;

EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Wysokosc i rodzaj premii',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='premia'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.premia')
  AND minor_id = 0
  AND class = 1;

EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Wynagrodzenie pracownikow',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='wynagrodzenie'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.wynagrodzenie')
  AND minor_id = 0
  AND class = 1;

  -- 5
INSERT INTO ksiegowosc.pracownicy values(1, 'Rui', 'Patricio', 'Stadio Olimpico 1/11, 30-100 Rzym', '123456789');
INSERT INTO ksiegowosc.pracownicy values(2, 'Roberto', 'Carlos', 'Santiago Bernabeu 2/11, 30-101 Madryt', '234567891');
INSERT INTO ksiegowosc.pracownicy values(3, 'Ngolo', 'Kante', 'Stamford Bridge 3/11, 30-102 Londyn', '345678912');
INSERT INTO ksiegowosc.pracownicy values(4, 'Luka', 'Modric', 'Santiago Bernabeu 4/11, 30-101 Madryt', '456789123');
INSERT INTO ksiegowosc.pracownicy values(5, 'Ronaldinho', 'Gaucho', 'Prison Street 5/11, 30-103 Medelin', '567891234');
INSERT INTO ksiegowosc.pracownicy values(6, 'Lionel', 'Messi', 'Parc Des Princes 6/11, 30-104 Pary¿', '678912345');
INSERT INTO ksiegowosc.pracownicy values(7, 'Cristiano', 'Ronaldo', 'King Fatah Stadium 7/11, 30-105 Rijad', '789123456');
INSERT INTO ksiegowosc.pracownicy values(8, 'Pedro', 'Miniuko', 'Krzecin 8/11, 30-106 Krzecin', '891234567');
INSERT INTO ksiegowosc.pracownicy values(9, 'Robert', 'Lewandowsky', 'Camp Nou 9/11, 30-107 Barcelona', '912345678');
INSERT INTO ksiegowosc.pracownicy values(10, 'Erling', 'Haaland',  'Etihad Stadium 10/11, 30-108 Manchester', '101234567');

INSERT INTO ksiegowosc.godziny values(11,'2023-04-27',100,1);
INSERT INTO ksiegowosc.godziny values(12,'2023-04-27',110,2);
INSERT INTO ksiegowosc.godziny values(13,'2023-04-27',120,3);
INSERT INTO ksiegowosc.godziny values(14,'2023-04-27',130,4);
INSERT INTO ksiegowosc.godziny values(15,'2023-04-27',140,5);
INSERT INTO ksiegowosc.godziny values(16,'2023-04-27',150,6);
INSERT INTO ksiegowosc.godziny values(17,'2023-04-27',160,7);
INSERT INTO ksiegowosc.godziny values(18,'2023-04-27',170,8);
INSERT INTO ksiegowosc.godziny values(19,'2023-04-27',180,9);
INSERT INTO ksiegowosc.godziny values(20,'2023-04-27',190,10);

INSERT INTO ksiegowosc.pensje values(21, 'Goalkeeper', 80000);
INSERT INTO ksiegowosc.pensje values(22, 'Defender', 80000);
INSERT INTO ksiegowosc.pensje values(23, 'Midfielder', 90000);
INSERT INTO ksiegowosc.pensje values(24, 'Midfielder', 90000);
INSERT INTO ksiegowosc.pensje values(25, 'Striker', 110000);
INSERT INTO ksiegowosc.pensje values(26, 'Striker', 200000);
INSERT INTO ksiegowosc.pensje values(27, 'Striker', 500000);
INSERT INTO ksiegowosc.pensje values(28, 'Striker', 100000);
INSERT INTO ksiegowosc.pensje values(29, 'Striker', 10000);
INSERT INTO ksiegowosc.pensje values(30, 'Striker', 250000);

INSERT INTO ksiegowosc.premia values(31,'', 10000);
INSERT INTO ksiegowosc.premia values(32,'', 20000);
INSERT INTO ksiegowosc.premia values(33,'', 0);
INSERT INTO ksiegowosc.premia values(34,'', 50000);
INSERT INTO ksiegowosc.premia values(35,'', 15000);
INSERT INTO ksiegowosc.premia values(36,'', 100000);
INSERT INTO ksiegowosc.premia values(37,'', 250000);
INSERT INTO ksiegowosc.premia values(38,'', 100000);
INSERT INTO ksiegowosc.premia values(39,'', 500);
INSERT INTO ksiegowosc.premia values(40,'', 500000);

insert into ksiegowosc.wynagrodzenie values(51,'2023-04-28',1,11,21,31);
insert into ksiegowosc.wynagrodzenie values(52,'2023-04-28',2,12,22,32);
insert into ksiegowosc.wynagrodzenie values(53,'2023-04-28',3,13,23,33);
insert into ksiegowosc.wynagrodzenie values(54,'2023-04-28',4,14,24,34);
insert into ksiegowosc.wynagrodzenie values(55,'2023-04-28',5,15,25,35);
insert into ksiegowosc.wynagrodzenie values(56,'2023-04-28',6,16,26,36);
insert into ksiegowosc.wynagrodzenie values(57,'2023-04-28',7,17,27,37);
insert into ksiegowosc.wynagrodzenie values(58,'2023-04-28',8,18,28,38);
insert into ksiegowosc.wynagrodzenie values(59,'2023-04-28',9,19,29,39);
insert into ksiegowosc.wynagrodzenie values(60,'2023-04-28',10,20,30,40);

-- 6
--a)
select id_pracownika, nazwisko from ksiegowosc.pracownicy;

-- b)
Select ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.pensje.kwota
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji =ksiegowosc.pensje.id_pensji
where ksiegowosc.pensje.kwota>1000
order by ksiegowosc.wynagrodzenie.id_pracownika;

-- c)
select ksiegowosc.wynagrodzenie.id_pracownika,ksiegowosc.pensje.kwota, ksiegowosc.premia.rodzaj
from ksiegowosc.premia inner join (ksiegowosc.pensje inner join ksiegowosc.wynagrodzenie on ksiegowosc.pensje.id_pensji=ksiegowosc.wynagrodzenie.id_pensji) on ksiegowosc.premia.id_premii=ksiegowosc.wynagrodzenie.id_premii
where ksiegowosc.pensje.kwota >2000 and ksiegowosc.premia.rodzaj like '';

-- d)
select ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
from ksiegowosc.pracownicy
where ksiegowosc.pracownicy.imie like 'j%'

-- e)
select ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
from ksiegowosc.pracownicy
where ksiegowosc.pracownicy.nazwisko like '%a' and ksiegowosc.pracownicy.nazwisko like '%n%'

-- f)
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko,( ksiegowosc.godziny.liczba_godzin)-160 as nadgodziny
from ksiegowosc.pracownicy inner join(ksiegowosc.wynagrodzenie inner join ksiegowosc.godziny on ksiegowosc.wynagrodzenie.id_godziny=ksiegowosc.godziny.id_godziny) on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
where ( ksiegowosc.godziny.liczba_godzin)-160>0

-- g)
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota
from (ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji) inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
where ksiegowosc.pensje.kwota between 1500 and 3000;

-- h)
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
from ksiegowosc.pracownicy inner join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika inner join ksiegowosc.godziny on ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny inner join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
where (ksiegowosc.godziny.liczba_godzin)-160>0 and ksiegowosc.premia.kwota = 0;

-- i)
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota
from (ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika)
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
order by ksiegowosc.pensje.kwota;

-- j)
select ksiegowosc.pracownicy.imie,ksiegowosc.pracownicy.nazwisko,ksiegowosc.pensje.kwota, ksiegowosc.premia.kwota
from ((ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika)
	inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji) 
	inner join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii
order by ksiegowosc.pensje.kwota desc, ksiegowosc.premia.kwota desc;

-- k)
select ksiegowosc.pensje.stanowisko, count(ksiegowosc.pensje.stanowisko) as zliczenie
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
group by ksiegowosc.pensje.stanowisko;

-- l)
select ksiegowosc.pensje.stanowisko,AVG(ksiegowosc.pensje.kwota) as srednia, Min(ksiegowosc.pensje.kwota) as minimalna,
MAX(ksiegowosc.pensje.kwota) as maksymalna
from ksiegowosc.pensje
where ksiegowosc.pensje.stanowisko like 'Striker'
group by ksiegowosc.pensje.stanowisko;

-- m)
select Sum(ksiegowosc.pensje.kwota + ksiegowosc.premia.kwota) as wynagrodzenia
from (ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji)
	inner join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii;

-- n)
select ksiegowosc.pensje.stanowisko, Sum(ksiegowosc.pensje.kwota) as wynagrodzenie_stanowiska
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
group by ksiegowosc.pensje.stanowisko;

-- o)
select ksiegowosc.pensje.stanowisko, count(ksiegowosc.premia.kwota) as liczba_premii
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
	inner join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii
group by ksiegowosc.pensje.stanowisko;

-- p)
delete ksiegowosc.pracownicy
	from ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
	inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
	where ksiegowosc.pensje.kwota<1200;