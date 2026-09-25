CREATE FUNCTION [dbo].[fn_GetCustomerOrderCount]
(
    @CustomerID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @OrderCount INT;

    SELECT
        @OrderCount = COUNT(*)
    FROM dbo.OrderHeader
    WHERE CustomerID = @CustomerID;

    RETURN ISNULL(@OrderCount, 0);
END;
GO