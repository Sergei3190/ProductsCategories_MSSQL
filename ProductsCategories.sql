CREATE TABLE [dbo].[Products] (
    [id]   INT            IDENTITY (1, 1) NOT NULL,
    [name] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([id] ASC), 
);

CREATE TABLE [dbo].[Categories]
(
    [id]    INT            IDENTITY (1, 1) NOT NULL,
    [name] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([id] ASC), 
);

CREATE TABLE [dbo].[ProductsCategories] (
    [product_id] INT NOT NULL,
    [category_id] INT NOT NULL,
    CONSTRAINT [PK_ProductsCategories] PRIMARY KEY CLUSTERED ([product_id] ASC, [category_id] ASC),
    CONSTRAINT [FK_ProductsCategories_product] FOREIGN KEY ([product_id]) REFERENCES [Products] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_ProductsCategories_category] FOREIGN KEY ([category_id]) REFERENCES [Categories] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO [Products] ([name]) VALUES (N'продукт 1');
INSERT INTO [Products] ([name]) VALUES (N'продукт 2');
INSERT INTO [Products] ([name]) VALUES (N'продукт 3');
INSERT INTO [Products] ([name]) VALUES (N'продукт 4');
INSERT INTO [Products] ([name]) VALUES (N'продукт 5');

INSERT INTO [Categories] ([name]) VALUES (N'категория 1');
INSERT INTO [Categories] ([name]) VALUES (N'категория 2');
INSERT INTO [Categories] ([name]) VALUES (N'категория 3');

INSERT INTO [ProductsCategories] ([product_id],[category_id]) VALUES (1,2);
INSERT INTO [ProductsCategories] ([product_id],[category_id]) VALUES (3,1);
INSERT INTO [ProductsCategories] ([product_id],[category_id]) VALUES (4,3);
INSERT INTO [ProductsCategories] ([product_id],[category_id]) VALUES (1,1);
INSERT INTO [ProductsCategories] ([product_id],[category_id]) VALUES (3,3);

SELECT 
	[Products].[name] AS product_name, [Categories].[name] AS category_name
FROM
	[Products]
LEFT JOIN 
	[ProductsCategories] ON [Products].[id] = [ProductsCategories].[product_id]
LEFT JOIN 
	[Categories] ON [ProductsCategories].[category_id] = [Categories].[id]