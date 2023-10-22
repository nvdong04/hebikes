-- Active: 1697615275268@@localhost@1433@db_hebikes

create database [db_hebikes]
GO
USE [db_hebikes]
GO


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
  [email] nvarchar(255),
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
  [brand] nvarchar(255),
  [price] decimal,
  [discount_price] float,
  [image_url] nvarchar(255),
  [description] ntext,
  [status] bit DEFAULT 0,
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

SET QUOTED_IDENTIFIER ON
GO


--init data categorys


-- PROCEDURE sp_create_product
CREATE PROCEDURE dbo.sp_create_product
(
  @category_id integer,
  @code NVARCHAR(255),
  @name NVARCHAR(255),
  @brand NVARCHAR(255),
  @price float,
  @discount_price float,
  @image_url NVARCHAR(255),
  @description ntext,
  @status bit,
  @created_by integer,
  @id integer = 0 output
)
AS
BEGIN
  INSERT INTO dbo.products(category_id,code,name,brand,price,discount_price,image_url,description,status,created_by,updated_by,created_at)
  VALUES (@category_id,@code,@name,@brand,@price,@discount_price,@image_url,@description,@status,@created_by,@created_by,GETDATE())
  SET @id = SCOPE_IDENTITY();
END;
GO

-- proc update user
CREATE PROC [dbo].[sp_update_user]
(
	@user_id int,
	@username NVARCHAR(100),
	@email VARCHAR(255),
	@password VARCHAR(255),
	@role_id integer,
	@is_active bit
)
AS 
BEGIN 
	IF EXISTS (SELECT id FROM [dbo].[users] WHERE id = @user_id) 
		BEGIN
			IF EXISTS(SELECT role_name FROM [dbo].[roles] WHERE id = @role_id)
			    BEGIN
					UPDATE [dbo].[users]
					SET username = @username, email = @email, password = @password, role_id = @role_id, is_active = @is_active, updated_at = GETDATE()
					WHERE id = @user_id 
			    END
            ELSE
                BEGIN
                    RAISERROR (N'Role này không tồn tại.', 16, 1);
                END
		END
	ELSE 
		BEGIN
			RAISERROR (N'User này không tồn tại.', 16, 1);
		END
END;

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
END;

GO

--TRIGGER tg_auto_create_cart
CREATE TRIGGER tg_auto_create_cart
ON dbo.customers
AFTER INSERT,UPDATE
AS
BEGIN
	IF EXISTS(SELECT * FROM Inserted)
		BEGIN
			DECLARE @customer_id INT
			SELECT @customer_id = Inserted.id FROM Inserted
			INSERT INTO dbo.carts( customer_id )
			VALUES  (@customer_id)
		END
END

GO

-- PROD CREATE CART
ALTER PROC [dbo].[sp_create_or_update_to_cart](
@customer_id INT,
@product_id INT,
@quantity INT
)
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.customers WHERE id = @customer_id)
		BEGIN
			DECLARE @cart_id INT
			SELECT @cart_id = carts.id FROM dbo.carts,dbo.customers, dbo.cart_items
			WHERE customer_id = @customer_id AND customer_id = customers.id 
			
			IF EXISTS (SELECT * FROM dbo.cart_items WHERE product_id = @product_id and cart_id = @cart_id)
				BEGIN
					UPDATE dbo.cart_items
					SET quantity = quantity + @quantity
					WHERE product_id = @product_id and cart_id = @cart_id
				END
			ELSE
				BEGIN
					INSERT INTO dbo.cart_items( cart_id, product_id, quantity )
					VALUES  (@cart_id , @product_id , @quantity)
				END
		END
END
GO

--
GO
ALTER PROC [dbo].[sp_get_cart_by_customer_id](
@customer_id INT
)
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.customers WHERE id = @customer_id)
		BEGIN
			SELECT 
				item.id AS cart_item_id,
				product.name AS product_name, 
				item.product_id,
				product.price AS product_price,
				item.quantity, 
				product.price * item.quantity AS into_money
			FROM dbo.carts AS cart
			JOIN dbo.cart_items AS item ON item.cart_id = cart.id
			JOIN dbo.customers AS customer ON cart.customer_id = customer.id
			JOIN dbo.products AS product ON item.product_id = product.id 
			WHERE cart.customer_id = @customer_id
		END
	ELSE PRINT N'Khách hàng này không tồn tại trong CSDL'
END

