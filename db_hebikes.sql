-- Active: 1697615275268@@localhost@1433@db_hebikes
DROP TABLE categorys
DROP TABLE products
DROP TABLE roles
DROP TABLE users
DROP TABLE customers

DROP TABLE cart_items
DROP TABLE carts
DROP TABLE order_details
DROP TABLE orders



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
  [order_date] datetime,
  [note] nvarchar(255),
  [order_total_price] decimal,
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

--init data
INSERT INTO roles(role_name)
values (N'admin'),
(N'staff')

INSERT INTO categorys(name,status)
values (N'Xe đạp điện',1),
(N'Phụ kiện',1)

INSERT INTO users(username,email,password,role_id,is_active,created_at,updated_at) 
values('admin', N'admin@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1,1,GETDATE(),GETDATE())

GO
--Proc
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON
GO


--init data categorys


-- PROCEDURE sp_create_product
ALTER PROCEDURE dbo.sp_create_product
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


-- PROCEDURE sp_update_product
ALTER PROCEDURE dbo.sp_update_product
(
	@product_id int,
	@category_id integer,
	@code NVARCHAR(255),
	@name NVARCHAR(255),
	@brand NVARCHAR(255),
	@price float,
	@discount_price float,
	@image_url NVARCHAR(255),
	@description ntext,
	@status bit,
	@updated_by integer
)
AS
BEGIN
	IF EXISTS (SELECT id FROM products WHERE id = @product_id) 
		BEGIN
			UPDATE products
			SET category_id = @category_id, 
			code = @code, 
			name = @name, 
			brand = @brand, 
			price = @price, 
			discount_price = @discount_price,
			image_url = @image_url,
			description = @description,
			status = @status,
			updated_by = @updated_by,
			updated_at = GETDATE()
			WHERE id = @product_id
		END
	ELSE RAISERROR ('Sản phẩm không tồn vài với id: %s',16,1,@product_id)
END;
GO


-- proc update user
ALTER PROC [dbo].[sp_update_user]
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

ALTER PROC [dbo].[sp_create_customer]
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
			SELECT @cart_id = carts.id 
			FROM dbo.carts join customers ON carts.customer_id = customers.id
			WHERE customer_id = @customer_id
			
			IF(@cart_id != 0)
				BEGIN
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
			ELSE RAISERROR (N'Lỗi add to cart', 16, 1);
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
	ELSE PRINT N'Khách hàng này không tồn tại trên hệ thống'
END

GO

CREATE PROC [dbo].[sp_create_order](
@customer_id INT,
@order_date DATETIME,
@order_note NVARCHAR(255),
@order_total_price FLOAT,
@status bit
)
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.customers WHERE id = @customer_id)
		BEGIN
			INSERT INTO dbo.orders
			        (	customer_id ,
						order_date ,
						note ,
						order_total_price ,
						status,
						created_at,
						updated_at
			        )
			VALUES  (	@customer_id , -- customer_id - int
						@order_date , -- order_date - datetime
						@order_note , -- order_note - ntext
						@order_total_price , -- order_total_price - float
						@status,  -- order_status - int
						GETDATE(),
						GETDATE()
			        )
			SELECT CAST(scope_identity() AS int);
		END
	ELSE 
		BEGIN
			RAISERROR (N'Khách hàng này không tồn tại trên hệ thống', 16, 1);
			return 0
		END
END

GO
-- [sp_create_order_detail]
CREATE PROC [dbo].[sp_create_order_detail](
@order_id INT,
@product_id INT,
@quantity INT 
)
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.orders WHERE id = @order_id)
		BEGIN
			INSERT INTO dbo.order_details
			        ( order_id, product_id, quantity )
			VALUES  ( @order_id, -- order_id - int
			          @product_id, -- product_id - int
			          @quantity  -- quantity - int
			          )
			DELETE FROM dbo.cart_items WHERE product_id = @product_id
		END
END


-- Số đơn hàng theo ngày
SELECT
    DATEPART(YEAR, order_date) AS order_year,
    DATEPART(MONTH, order_date) AS order_month,
    DATEPART(DAY, order_date) AS order_day,
    COUNT(id) AS order_count
FROM
    orders
GROUP BY
    DATEPART(YEAR, order_date),
    DATEPART(MONTH, order_date),
    DATEPART(DAY, order_date)
ORDER BY
    order_year, order_month, order_day;

-- Số đơn hàng theo tháng
SELECT
    DATEPART(YEAR, order_date) AS order_year,
    DATEPART(MONTH, order_date) AS order_month,
    COUNT(id) AS order_count
FROM
    orders
GROUP BY
    DATEPART(YEAR, order_date),
    DATEPART(MONTH, order_date)
ORDER BY
    order_year, order_month;

-- Số đơn hàng theo năm
SELECT
    DATEPART(YEAR, order_date) AS order_year,
    COUNT(id) AS order_count
FROM
    orders
GROUP BY
    DATEPART(YEAR, order_date)
ORDER BY
    order_year;
