CREATE TABLE [categorys] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [name] nvarchar(255),
  [status] nvarchar(255),
  [created_by] integer,
  [updated_by] integer,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [users] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [username] nvarchar(255),
  [password] nvarchar(255),
  [role_id] integer,
  [is_active] bit DEFAULT 0,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [roles] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [role_name] nvarchar(255),
  [created_by] integer,
  [updated_by] integer,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [products] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [category_id] integer,
  [code] nvarchar(255),
  [name] nvarchar(255),
  [trade_mark] nvarchar(255),
  [price] decimal,
  [discount_price] float,
  [description] text,
  [status] nvarchar(255),
  [created_by] integer,
  [updated_by] integer,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [customers] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [fullname] nvarchar(255),
  [email] nvarchar(255),
  [password] nvarchar(255),
  [phone] nvarchar(255),
  [address] nvarchar(255),
  [is_active] bit DEFAULT 0,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [carts] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [customer_id] integer,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [cart_items] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [cart_id] integer,
  [product_id] integer,
  [quantity] integer,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [orders] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [customer_id] integer,
  [order_date] timestamp,
  [note] nvarchar(255),
  [status] bit DEFAULT 0,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [order_details] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [order_id] integer,
  [product_id] integer,
  [quantity] integer,
  [created_at] datetime,
  [updated_at] datetime
)
GO

ALTER TABLE [products] ADD FOREIGN KEY ([category_id]) REFERENCES [categorys] ([id])
GO

ALTER TABLE [orders] ADD FOREIGN KEY ([customer_id]) REFERENCES [customers] ([id])
GO

ALTER TABLE [order_details] ADD FOREIGN KEY ([order_id]) REFERENCES [orders] ([id])
GO

ALTER TABLE [order_details] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [cart_items] ADD FOREIGN KEY ([cart_id]) REFERENCES [carts] ([id])
GO

ALTER TABLE [cart_items] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [users] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [categorys] ADD FOREIGN KEY ([created_by]) REFERENCES [users] ([id])
GO

ALTER TABLE [categorys] ADD FOREIGN KEY ([updated_by]) REFERENCES [users] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([created_by]) REFERENCES [users] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([updated_by]) REFERENCES [users] ([id])
GO


--Proc
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_create_customer]
(
	@fullname NVARCHAR(100),
	@email VARCHAR(100),
	@password VARCHAR(255),
	@phone NVARCHAR(15),
	@address NVARCHAR(255),
	@id integer = 0 output
)
AS
BEGIN
	IF NOT EXISTS (SELECT email FROM dbo.customers WHERE email = @email)
		BEGIN
			INSERT INTO [dbo].[customers](fullname,email,password,phone,address,is_active,created_at)
			VALUES  (@fullname,@email,@password,@phone,@address,1,GETDATE())
			SET @id = SCOPE_IDENTITY();
		END
	ELSE 
		BEGIN
			RAISERROR (N'Email này đã tồn tại.', 16, 1);
			return 0
		END
END

GO

DECLARE @new_identity INT;
EXEC dbo.[sp_create_customer] @fullname = 'Nguyễn Văn Đông', @email = 'nvdong04@gmail.com', @password= '123456789',@phone='0987781213', @address='HN' ,@id = @new_identity OUTPUT;
PRINT @new_identity;
