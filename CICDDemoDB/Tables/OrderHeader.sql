CREATE TABLE [dbo].[OrderHeader]
(
    [OrderID] INT IDENTITY(1,1) NOT NULL,
    [CustomerID] INT NOT NULL,
    [OrderDate] DATETIME2(0) NOT NULL
        CONSTRAINT [DF_OrderHeader_OrderDate]
        DEFAULT (SYSUTCDATETIME()),

    [OrderStatus] VARCHAR(30) NOT NULL
        CONSTRAINT [DF_OrderHeader_OrderStatus]
        DEFAULT ('NEW'),

    CONSTRAINT [PK_OrderHeader]
        PRIMARY KEY CLUSTERED ([OrderID]),

    CONSTRAINT [FK_OrderHeader_Customer]
        FOREIGN KEY ([CustomerID])
        REFERENCES [dbo].[Customer] ([CustomerID])
);
GO