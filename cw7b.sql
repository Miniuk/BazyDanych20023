-- 1
CREATE OR ALTER FUNCTION dbo.fib(@czlon int)
RETURNS @score TABLE(fintab int)
AS
BEGIN
	DECLARE @czlon1 INT;
	DECLARE @czlon2 INT;
	DECLARE @temp INT;
	DECLARE @iter INT;
	SET @temp = 0;
	SET @czlon1 = 0;
	SET @czlon2 = 1;
	SET @iter = 2;
	
	WHILE(@iter <=@czlon + 1)
	BEGIN
		SET @temp = @czlon1 + @czlon2;
		SET @czlon1=@czlon2;
		SET @czlon2=@temp;
		SET @iter=@iter+1;
		INSERT INTO @score VALUES (@czlon2)
		END
	RETURN
END;

CREATE OR ALTER PROCEDURE dbo.finb(@x INT)
AS
BEGIN
SELECT*FROM dbo.fib(@x)
END; 

EXEC dbo.finb 10;

-- 2
CREATE OR ALTER TRIGGER triggup
ON Person.Person
AFTER INSERT
AS
BEGIN
UPDATE Person.Person 
SET Person.LastName = UPPER(Person.LastName) 
WHERE LastName IN (SELECT LastName FROM INSERTED)
END;

INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid());

INSERT INTO Person.Person (BusinessEntityID,PersonType,FirstName,MiddleName,LastName) 
VALUES (20752171,'APFA','Karol','Marcel','Krawczyk');


SELECT * FROM Person.BusinessEntity
SELECT * FROM Person.Person WHERE Person.LastName = 'Krawczyk'

-- 3
CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
DECLARE @NewTaxRate INT, @TaxRate INT
SELECT @NewTaxRate = TaxRate FROM INSERTED
SELECT @TaxRate = TaxRate FROM DELETED
IF @NewTaxRate > 1.3* @TaxRate
PRINT ('ERROR')
END


SELECT * FROM Sales.SalesTaxRate;
