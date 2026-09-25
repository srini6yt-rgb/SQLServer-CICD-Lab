CREATE TABLE [dbo].[OrderDetail]
(
    [OrderDetailID] INT IDENTITY(1,1) NOT NULL,
    [OrderID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    [Quantity] INT NOT NULL,
    [UnitPrice] DECIMAL(18,2) NOT NULL,

    CONSTRAINT [PK_OrderDetail]
        PRIMARY KEY CLUSTERED ([OrderDetailID]),

    CONSTRAINT [FK_OrderDetail_OrderHeader]
        FOREIGN KEY ([OrderID])
        REFERENCES [dbo].[OrderHeader] ([OrderID]),

    CONSTRAINT [FK_OrderDetail_Product]
        FOREIGN KEY ([ProductID])
        REFERENCES [dbo].[Product] ([ProductID]),

    CONSTRAINT [CK_OrderDetail_Quantity]
        CHECK ([Quantity] > 0),

    CONSTRAINT [CK_OrderDetail_UnitPrice]
        CHECK ([UnitPrice] >= 0)
);
GO