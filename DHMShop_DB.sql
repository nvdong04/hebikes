USE [db_DHMShop]
GO
/****** Object:  Table [dbo].[tb_cart]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
 CONSTRAINT [PK_tb_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_cart_item]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tb_cart_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_category]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tb_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_customers]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[sex] [nvarchar](3) NULL,
	[address] [nvarchar](255) NULL,
	[phone_number] [nchar](15) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tb_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_order_detail]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tb_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_orders]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_date] [datetime] NULL,
	[order_note] [ntext] NULL,
	[order_total_price] [float] NOT NULL,
	[order_status] [int] NULL,
 CONSTRAINT [PK_tb_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_products]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [ntext] NULL,
	[detail] [ntext] NULL,
	[img] [varchar](255) NULL,
	[price] [float] NOT NULL,
	[discount_price] [float] NULL,
	[status] [int] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_tb_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_products_detail]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_products_detail](
	[int] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [int] NOT NULL,
	[color] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tb_products_detail] PRIMARY KEY CLUSTERED 
(
	[int] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_role]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tb_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_users]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[role_id] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tb_users_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_category] ON 

INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (1, N'Giày Nike', 0)
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (2, N'Giày Adidas', 0)
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (3, N'Giày Vans', 0)
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (4, N'Giày thể thao', 0)
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (5, N'Giày thới trang', 0)
SET IDENTITY_INSERT [dbo].[tb_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_customers] ON 

INSERT [dbo].[tb_customers] ([id], [email], [password], [full_name], [sex], [address], [phone_number], [status]) VALUES (1, N'nv.dong04@gmail.com', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', N'Nguyễn Đông', N'nam', N'HM-HN', N'0987782326     ', 0)
SET IDENTITY_INSERT [dbo].[tb_customers] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_products] ON 

INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [status], [category_id]) VALUES (1, N'Giày Thể Thao XSPORT Ni.ke Air Force 1 Full Trắng SF', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Được làm từ chất liệu da đặc trưng với chất lượng hoàn hảo
Nike Air Force 1 được thiết kế hướng tới sự đơn giản nhưng vô cùng tinh tế. Đây là sự lựa chọn hoàn hảo cho các tín đồ yêu thể thao khi có thể dễ dàng phối hợp trang phục hằng ngày để khẳng định phong cách thời trang.
Phối màu đơn giản nhưng vô cùng tinh tế.', N'../public/image/product/MG_5049.jpg', 600000, 199999, 1, 1)
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [status], [category_id]) VALUES (2, N'Giày Thể Thao XSPORT Adi.das 350 V2 Static Full Phản Quang REP', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Với đế boost, đôi giày cực kì êm luôn.
Chất liệu prime knit trên upper, đôi giày sẽ mềm hơn qua thời gian.
Không chỉ cải tiến mạnh mẽ về thiết kế, Adidas Yeezy 350 V2 còn đảm bảo tính thoải mái cho người dùng. Thiết kế lưỡi gà và gót sau giày cao hơn một bậc, rộng, hỗ trợ cho quá trình mang/ tháo giày dễ dàng và nhanh chóng hơn. Kết hợp với phần đệm lót ôm sát cổ chân, giúp giày ôm trọn bàn chân người dùng, thuận tiện cho việc chạy nhảy, di chuyển.', N'../public/image/product/MG_7101.jpg', 1000000, 549000, 1, 2)
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [status], [category_id]) VALUES (3, N'Giày Thể Thao Van.s Old Skool Vải XD Mũi Nỉ SF', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Giày Vans kiểu dáng phù hợp với nhiều loại trang phục, kết hợp tuyệt vời nhất với đồ jean, quần vải và legging
Chất liệu vải cao cấp, bền đẹp và rất giặt sạch. 
Đế giày cao su đúc nguyên khối êm chân thoải mái', N'../public/image/product/MG_5049.jpg', 400000, 199999, 1, 3)
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [status], [category_id]) VALUES (4, N'Adidas EQT Bask Adv REP', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Êm chân, chắc chắn, đàn hồi tốt và không quá cứng gây phồng rộp, chai chân khi mang lâu ngày
Bên trong giày được lót êm, không bị cảm giác hầm nóng với thời tiết mùa hè.
Chỉ cần áo phông và quần jean đơn giản, là bạn có thể tự tin xuống phố rồi.', N'../public/image/product/MG_6037.jpg', 850000, 550000, 1, 4)
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [status], [category_id]) VALUES (5, N'Giày XSPORT Balen.ciaga Triple S', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Chủ nghĩa về sự tự do, thoải mái và cá tính đã được phát huy tột độ
Balenciaga Triple S – dòng giày đa sắc màu, phá bỏ mọi giới hạn, đủ đẹp, đủ chất để khiến giới mộ điệu lại một lần nữa phải điên đảo.', N'../public/image/product/xoa-phong-161-1.jpg', 500000, 400000, 1, 5)
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [status], [category_id]) VALUES (11, N'Giày XSPORT Balen.ciaga Triple A', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Chủ nghĩa về sự tự do, thoải mái và cá tính đã được phát huy tột độ
Balenciaga Triple S – dòng giày đa sắc màu, phá bỏ mọi giới hạn, đủ đẹp, đủ chất để khiến giới mộ điệu lại một lần nữa phải điên đảo.', N'../public/image/product/xoa-phong-206.jpg', 455000, 400000, 1, 1)
SET IDENTITY_INSERT [dbo].[tb_products] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_products_detail] ON 

INSERT [dbo].[tb_products_detail] ([int], [product_id], [size], [color], [quantity]) VALUES (1, 1, 41, N'trắng', 10)
INSERT [dbo].[tb_products_detail] ([int], [product_id], [size], [color], [quantity]) VALUES (3, 1, 42, N'đỏ', 50)
INSERT [dbo].[tb_products_detail] ([int], [product_id], [size], [color], [quantity]) VALUES (4, 1, 43, N'đen', 100)
INSERT [dbo].[tb_products_detail] ([int], [product_id], [size], [color], [quantity]) VALUES (6, 1, 43, N'vàng', 20)
SET IDENTITY_INSERT [dbo].[tb_products_detail] OFF
GO
ALTER TABLE [dbo].[tb_category] ADD  CONSTRAINT [DF_tb_category_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tb_customers] ADD  CONSTRAINT [DF_tb_customers_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tb_order_detail] ADD  CONSTRAINT [DF_tb_order_detail_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[tb_orders] ADD  CONSTRAINT [DF_tb_orders_order_status]  DEFAULT ((0)) FOR [order_status]
GO
ALTER TABLE [dbo].[tb_products] ADD  CONSTRAINT [DF_tb_products_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tb_users] ADD  CONSTRAINT [DF_tb_users_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tb_cart_item]  WITH CHECK ADD  CONSTRAINT [FK_tb_cart_item_tb_cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[tb_cart] ([id])
GO
ALTER TABLE [dbo].[tb_cart_item] CHECK CONSTRAINT [FK_tb_cart_item_tb_cart]
GO
ALTER TABLE [dbo].[tb_cart_item]  WITH CHECK ADD  CONSTRAINT [FK_tb_cart_item_tb_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_products] ([id])
GO
ALTER TABLE [dbo].[tb_cart_item] CHECK CONSTRAINT [FK_tb_cart_item_tb_products]
GO
ALTER TABLE [dbo].[tb_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_detail_tb_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[tb_orders] ([id])
GO
ALTER TABLE [dbo].[tb_order_detail] CHECK CONSTRAINT [FK_tb_order_detail_tb_orders]
GO
ALTER TABLE [dbo].[tb_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_detail_tb_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_products] ([id])
GO
ALTER TABLE [dbo].[tb_order_detail] CHECK CONSTRAINT [FK_tb_order_detail_tb_products]
GO
ALTER TABLE [dbo].[tb_orders]  WITH CHECK ADD  CONSTRAINT [FK_tb_orders_tb_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[tb_customers] ([id])
GO
ALTER TABLE [dbo].[tb_orders] CHECK CONSTRAINT [FK_tb_orders_tb_customers]
GO
ALTER TABLE [dbo].[tb_products]  WITH CHECK ADD  CONSTRAINT [FK_tb_products_tb_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[tb_category] ([id])
GO
ALTER TABLE [dbo].[tb_products] CHECK CONSTRAINT [FK_tb_products_tb_category]
GO
ALTER TABLE [dbo].[tb_products_detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_products_detail_tb_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_products] ([id])
GO
ALTER TABLE [dbo].[tb_products_detail] CHECK CONSTRAINT [FK_tb_products_detail_tb_products]
GO
ALTER TABLE [dbo].[tb_users]  WITH CHECK ADD  CONSTRAINT [FK_tb_users_tb_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[tb_role] ([id])
GO
ALTER TABLE [dbo].[tb_users] CHECK CONSTRAINT [FK_tb_users_tb_role]
GO
/****** Object:  StoredProcedure [dbo].[sp_addCustomer]    Script Date: 10/14/2020 7:07:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_addCustomer]
(@email VARCHAR(100),
@password VARCHAR(255),
@full_name NVARCHAR(100),
@sex NVARCHAR(3),
@phone_number NCHAR(15),
@address NVARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (SELECT email FROM dbo.tb_customers WHERE email = @email)
		BEGIN
			INSERT INTO dbo.tb_customers(email ,password ,full_name ,sex ,address ,phone_number ,status)
			VALUES  (@email, -- email - varchar(100)
					@password , -- password - varchar(255)
					@full_name , -- full_name - nvarchar(255)
					@sex , -- sex - nvarchar(3)
					@address , -- address - nvarchar(255)
					@phone_number , -- phone_number - nchar(15)
					0  -- status - int
					)
		END
END
GO
