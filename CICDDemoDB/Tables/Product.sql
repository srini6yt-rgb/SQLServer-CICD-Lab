CREATE TABLE [dbo].[Product]
(
    [ProductID] INT IDENTITY(1,1) NOT NULL,
    [ProductName] NVARCHAR(200) NOT NULL,
    [Price] DECIMAL(18,2) NOT NULL,
    [IsActive] BIT NOT NULL
        CONSTRAINT [DF_Product_IsActive]
        DEFAULT (1),

    CONSTRAINT [PK_Product]
        PRIMARY KEY CLUSTERED ([ProductID]),

    CONSTRAINT [CK_Product_Price]
        CHECK ([Price] >= 0)
);
GO