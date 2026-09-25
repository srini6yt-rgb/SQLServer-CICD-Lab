CREATE TABLE [dbo].[Customer]
(
    [CustomerID] INT IDENTITY(1,1) NOT NULL,
    [FirstName] NVARCHAR(100) NOT NULL,
    [LastName] NVARCHAR(100) NOT NULL,
    [Email] NVARCHAR(255) NULL,
    [Phone] NVARCHAR(30) NULL,
    [CreatedDate] DATETIME2(0) NOT NULL
        CONSTRAINT [DF_Customer_CreatedDate]
        DEFAULT (SYSUTCDATETIME()),

    CONSTRAINT [PK_Customer]
        PRIMARY KEY CLUSTERED ([CustomerID])
);
GO