-- 1.Wykorzystuj¹c wyra¿enie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki pracownika oraz jego danych, a nastêpnie zapisze je do tabeli tymczasowej TempEmployeeInfo. Rozwi¹¿ w oparciu o AdventureWorks.

WITH exp_1 (LoginID, JobTitle, BirthDate, Gender, HireDate, MaritalStatus, VacationHours, SickLeaveHours, Rate)
AS
(
	SELECT LoginID, JobTitle, BirthDate, Gender, HireDate, MaritalStatus, VacationHours, SickLeaveHours, Rate FROM AdventureWorks2022.HumanResources.Employee AS em
	INNER JOIN AdventureWorks2022.HumanResources.EmployeePayHistory AS pe
	ON em.BusinessEntityID = pe.BusinessEntityID
)
SELECT * INTO #TempEmployeeInfo FROM exp_1;

SELECT * FROM #TempEmployeeInfo;

-- 2.Uzyskaj informacje na tematprzychodówze sprzeda¿y wed³ug firmy i kontaktu (za pomoc¹ CTEi bazy AdventureWorksL). Wynik powinien wygl¹daæ nastêpuj¹co:

WITH exp_2 (CompanyContact, Revenue)
AS
(
	SELECT concat(CompanyName, ' (', FirstName, LastName, ')') AS CompanyContact, TotalDue AS Revenue 
	FROM AdventureWorksLT2022.SalesLT.Customer AS Cust
	INNER JOIN AdventureWorksLT2022.SalesLT.SalesOrderHeader AS SalHe
	ON Cust.CustomerID = SalHe.CustomerID
)
SELECT * FROM exp_2
ORDER BY CompanyContact;


-- 3.Napisz zapytanie, które zwróci wartoœæ sprzeda¿y dla poszczególnych kategorii produktów.Wykorzystaj CTE i bazê AdventureWorksLT.
WITH exp_3 (Category, SalesValue)
AS
(
SELECT ProCa.Name AS Category, ROUND(UnitPrice, 2) * OrderQty AS SalesValue FROM AdventureWorksLT2022.SalesLT.Product AS Pro
INNER JOIN AdventureWorksLT2022.SalesLT.ProductCategory AS ProCa
ON Pro.ProductCategoryID = ProCa.ProductCategoryID
INNER JOIN AdventureWorksLT2022.SalesLT.SalesOrderDetail AS SalDe
ON Pro.ProductID = SalDe.ProductID
)
SELECT Category, SUM(SalesValue) AS SalesValue FROM exp_3
GROUP BY Category
ORDER BY Category;