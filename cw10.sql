-- 1 zadanie

BEGIN TRANSACTION

UPDATE Production.Product 
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680

COMMIT TRANSACTION

SELECT * FROM Production.Product WHERE ProductID = 680

-- 2 zadanie

SELECT * FROM Production.Product WHERE ProductID = 707

EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

BEGIN TRANSACTION

DELETE FROM Production.Product
WHERE ProductID = 707

ROLLBACK

SELECT * FROM Production.Product WHERE ProductID = 707

-- 3 zadanie

BEGIN TRANSACTION

INSERT INTO Production.Product(
[Name],
[ProductNumber],
[MakeFlag],
[FinishedGoodsFlag],
[Color],
[SafetyStockLevel],
[ReorderPoint],
[StandardCost],
[ListPrice],
[DaysToManufacture],
[ProductLine],
[ProductSubcategoryID],
[ProductModelID],
[SellStartDate],
[ModifiedDate]
)
VALUES(
'Siema',
'JS-214',
'0',
'1',
'Blue',
'1',
'2',
'10.01',
'14.22',
'120',
'S',
'11',
'124',
'2012-05-21 00:00:00.000',
'2016-02-08 10:01:36.827')

COMMIT TRANSACTION

-- 4 zadanie

BEGIN TRANSACTION
 
IF( SELECT SUM(StandardCost) FROM Production.Product) + (SELECT SUM(StandardCost) * 0.1 FROM Production.Product) <= 500000
BEGIN
	UPDATE Production.Product
	SET StandardCost = StandardCost * 1.1
	COMMIT TRANSACTION
	PRINT ('Zatwierdzono transakcje')

END
ELSE
BEGIN
ROLLBACK
PRINT ('Wycofano')
END

-- 5 Zadanie

BEGIN TRANSACTION

IF ( EXISTS (SELECT ProductNumber FROM Production.Product WHERE ProductNumber = 'JS-202'))
BEGIN
	ROLLBACK
	PRINT ('Wycofano')
END
ELSE
BEGIN
INSERT INTO Production.Product(
[Name],
[ProductNumber],
[MakeFlag],
[FinishedGoodsFlag],
[Color],
[SafetyStockLevel],
[ReorderPoint],
[StandardCost],
[ListPrice],
[DaysToManufacture],
[ProductLine],
[ProductSubcategoryID],
[ProductModelID],
[SellStartDate],
[ModifiedDate]
)
VALUES(
'Siema1',
'JS-202',
'0',
'1',
'Blue',
'1',
'2',
'10.01',
'14.22',
'120',
'S',
'11',
'124',
'2012-05-21 00:00:00.000',
'2016-02-08 10:01:36.827')
COMMIT TRANSACTION
PRINT ('Zatwierdzono')
END

-- 6 Zadanie

SELECT * FROM Sales.SalesOrderDetail

BEGIN TRANSACTION

IF (EXISTS (SELECT OrderQty FROM Sales.SalesOrderDetail WHERE OrderQty = 0))
BEGIN
ROLLBACK
PRINT ('Wycofano')
END
ELSE
BEGIN
UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 100
COMMIT TRANSACTION
PRINT ('Zatwierdzono')
END

-- 7 Zadanie

BEGIN TRANSACTION
DELETE FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product)
IF @@ROWCOUNT > 10
BEGIN
ROLLBACK
PRINT ('Wycofano')
END
ELSE
BEGIN
COMMIT TRANSACTION
PRINT ('Zatwierdzono')
END