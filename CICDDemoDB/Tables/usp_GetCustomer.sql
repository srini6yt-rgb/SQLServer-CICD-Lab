CREATE PROCEDURE [dbo].[usp_GetCustomer]
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CustomerID,
        FirstName,
        LastName,
        Email,
        Phone,
        CreatedDate
    FROM dbo.Customer
    WHERE CustomerID = @CustomerID;
END;
GO