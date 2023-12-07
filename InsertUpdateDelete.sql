USE northwind;
INSERT INTO Suppliers (CompanyName)
VALUES ('GenericCompany');

SET @newSupplierID = LAST_INSERT_ID();

INSERT INTO products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice)
VALUES ('Globes', 102, 105, 1, 40.00);
SELECT 
    Products.ProductID,
    Products.ProductName,
	Products.UnitPrice,
    Suppliers.CompanyName AS SupplierName,
    Suppliers.Country AS SupplierCountry
    FROM
    products
    JOIN
      Suppliers ON Products.SupplierID = Suppliers.SupplierID;
      
UPDATE Products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductName = 'Globes';

SELECT 
    Products.ProductID,
    Products.ProductName,
    Products.UnitPrice
FROM 
    Products
JOIN 
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE 
    Suppliers.CompanyName = 'GenericCompany';
    
    DELETE FROM products
WHERE ProductName = 'Globes';

DELETE FROM Suppliers
WHERE CompanyName = 'GenericCompany';

SELECT 
    ProductID,
    ProductName,
    QuantityPerUnit,
    UnitPrice
FROM 
    Products;
    
    SELECT 
    SupplierID,
    CompanyName,
    ContactName,
    Country
FROM 
    Suppliers;