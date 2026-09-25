CREATE PROCEDURE [dbo].[usp_GetOrders]
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        o.OrderID,
        o.OrderDate,
        o.OrderStatus,
        SUM(od.Quantity * od.UnitPrice) AS OrderTotal
    FROM dbo.OrderHeader AS o
    INNER JOIN dbo.OrderDetail AS od
        ON o.OrderID = od.OrderID
    WHERE o.CustomerID = @CustomerID
    GROUP BY
        o.OrderID,
        o.OrderDate,
        o.OrderStatus
    ORDER BY
        o.OrderDate DESC;
END;
GO