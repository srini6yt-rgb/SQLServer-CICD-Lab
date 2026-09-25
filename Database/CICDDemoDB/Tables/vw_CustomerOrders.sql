CREATE VIEW [dbo].[vw_CustomerOrders]
AS
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    SUM(od.Quantity * od.UnitPrice) AS OrderTotal
FROM dbo.Customer AS c
INNER JOIN dbo.OrderHeader AS o
    ON c.CustomerID = o.CustomerID
INNER JOIN dbo.OrderDetail AS od
    ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.OrderStatus;
GO