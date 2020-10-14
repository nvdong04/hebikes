aaa
USE [db_DHMShop]
GO
/****** Object:  Table [dbo].[tb_cart]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cusomer_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_cart_item]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tb_cart_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_category]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [int] NULL CONSTRAINT [DF_tb_category_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tb_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_customers]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[sex] [nvarchar](3) NULL,
	[address] [nvarchar](255) NULL,
	[phone_number] [nchar](15) NULL,
	[status] [int] NULL CONSTRAINT [DF_tb_customers_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tb_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_order_detail]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL CONSTRAINT [DF_tb_order_detail_quantity]  DEFAULT ((0)),
 CONSTRAINT [PK_tb_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_orders]    Script Date: 10/14/2020 11:54:46 PM ******/
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
	[order_status] [int] NULL CONSTRAINT [DF_tb_orders_order_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tb_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_products]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [ntext] NULL,
	[detail] [ntext] NULL,
	[img] [varchar](255) NULL,
	[price] [float] NOT NULL,
	[discount_price] [float] NULL,
	[size] [int] NULL,
	[color] [nvarchar](50) NULL,
	[quantity] [int] NOT NULL,
	[status] [int] NULL CONSTRAINT [DF_tb_products_status]  DEFAULT ((0)),
	[category_id] [int] NULL,
 CONSTRAINT [PK_tb_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_role]    Script Date: 10/14/2020 11:54:46 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_users]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[role_id] [int] NULL,
	[status] [int] NULL CONSTRAINT [DF_tb_users_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tb_users_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_cart] ON 

GO
INSERT [dbo].[tb_cart] ([id], [cusomer_id]) VALUES (1, 1)
GO
INSERT [dbo].[tb_cart] ([id], [cusomer_id]) VALUES (5, 3)
GO
INSERT [dbo].[tb_cart] ([id], [cusomer_id]) VALUES (6, 4)
GO
SET IDENTITY_INSERT [dbo].[tb_cart] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_cart_item] ON 

GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (4, 5, 3, 4)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (5, 5, 1, 5)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (6, 5, 4, 4)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (7, 1, 2, 4)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (8, 1, 6, 5)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (9, 1, 7, 1)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (10, 1, 10, 1)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (11, 1, 9, 1)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (12, 5, 5, 2)
GO
INSERT [dbo].[tb_cart_item] ([id], [cart_id], [product_id], [quantity]) VALUES (13, 5, 8, 1)
GO
SET IDENTITY_INSERT [dbo].[tb_cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_category] ON 

GO
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (1, N'Giày Nike', 0)
GO
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (2, N'Giày Adidas', 0)
GO
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (3, N'Giày Vans', 0)
GO
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (4, N'Giày thể thao', 0)
GO
INSERT [dbo].[tb_category] ([id], [name], [status]) VALUES (5, N'Giày thới trang', 0)
GO
SET IDENTITY_INSERT [dbo].[tb_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_customers] ON 

GO
INSERT [dbo].[tb_customers] ([id], [email], [password], [full_name], [sex], [address], [phone_number], [status]) VALUES (1, N'nv.dong04@gmail.com', N'1aadfddcf9713b4bf8eb1597f34127e7fe7c50695c849d3a7fdc053f75dffea7', N'Nguyễn Đông', N'nam', N'HM-HN', N'0987782326     ', 0)
GO
INSERT [dbo].[tb_customers] ([id], [email], [password], [full_name], [sex], [address], [phone_number], [status]) VALUES (3, N'vandong1x99@gmail.com', N'1aadfddcf9713b4bf8eb1597f34127e7fe7c50695c849d3a7fdc053f75dffea7', N'Nguyễn Đông', N'Nam', N'Hoàng Mai - Hà Nội', N'0987782326     ', 0)
GO
INSERT [dbo].[tb_customers] ([id], [email], [password], [full_name], [sex], [address], [phone_number], [status]) VALUES (4, N'ha1234@gmail.com', N'1aadfddcf9713b4bf8eb1597f34127e7fe7c50695c849d3a7fdc053f75dffea7', N'Nguyễn Văn Hà', N'Nam', N'Hiệp Hòa - Bắc Giang', N'0366457896     ', 0)
GO
SET IDENTITY_INSERT [dbo].[tb_customers] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_order_detail] ON 

GO
INSERT [dbo].[tb_order_detail] ([id], [order_id], [product_id], [quantity]) VALUES (2, 3, 1, 2)
GO
INSERT [dbo].[tb_order_detail] ([id], [order_id], [product_id], [quantity]) VALUES (3, 3, 2, 1)
GO
INSERT [dbo].[tb_order_detail] ([id], [order_id], [product_id], [quantity]) VALUES (4, 3, 3, 2)
GO
SET IDENTITY_INSERT [dbo].[tb_order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_orders] ON 

GO
INSERT [dbo].[tb_orders] ([id], [customer_id], [order_date], [order_note], [order_total_price], [order_status]) VALUES (3, 1, CAST(N'2020-10-13 14:55:50.927' AS DateTime), N'ácfdsmvhjfsdmvs', 3000000, 0)
GO
SET IDENTITY_INSERT [dbo].[tb_orders] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_products] ON 

GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (1, N'Giày Thể Thao XSPORT Ni.ke Air Force 1 Full Trắng SF', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Được làm từ chất liệu da đặc trưng với chất lượng hoàn hảo
Nike Air Force 1 được thiết kế hướng tới sự đơn giản nhưng vô cùng tinh tế. Đây là sự lựa chọn hoàn hảo cho các tín đồ yêu thể thao khi có thể dễ dàng phối hợp trang phục hằng ngày để khẳng định phong cách thời trang.
Phối màu đơn giản nhưng vô cùng tinh tế.', N'../public/image/product/MG_5049.jpg', 600000, 199999, 41, N'Trắng', 10, 1, 1)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (2, N'Giày Thể Thao XSPORT Adi.das 350 V2 Static Full Phản Quang REP', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Với đế boost, đôi giày cực kì êm luôn.
Chất liệu prime knit trên upper, đôi giày sẽ mềm hơn qua thời gian.
Không chỉ cải tiến mạnh mẽ về thiết kế, Adidas Yeezy 350 V2 còn đảm bảo tính thoải mái cho người dùng. Thiết kế lưỡi gà và gót sau giày cao hơn một bậc, rộng, hỗ trợ cho quá trình mang/ tháo giày dễ dàng và nhanh chóng hơn. Kết hợp với phần đệm lót ôm sát cổ chân, giúp giày ôm trọn bàn chân người dùng, thuận tiện cho việc chạy nhảy, di chuyển.', N'../public/image/product/MG_7101.jpg', 1000000, 549000, 41, N'Xanh đen', 22, 1, 2)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (3, N'Giày Thể Thao Van.s Old Skool Vải XD Mũi Nỉ SF', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Giày Vans kiểu dáng phù hợp với nhiều loại trang phục, kết hợp tuyệt vời nhất với đồ jean, quần vải và legging
Chất liệu vải cao cấp, bền đẹp và rất giặt sạch. 
Đế giày cao su đúc nguyên khối êm chân thoải mái', N'../public/image/product/xoa-phong-161-1.jpg', 400000, 199999, 42, N'Xanh đen', 11, 1, 3)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (4, N'Giày Thể Thao XSPORT Adi.das EQT Bask Adv REP', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Êm chân, chắc chắn, đàn hồi tốt và không quá cứng gây phồng rộp, chai chân khi mang lâu ngày
Bên trong giày được lót êm, không bị cảm giác hầm nóng với thời tiết mùa hè.
Chỉ cần áo phông và quần jean đơn giản, là bạn có thể tự tin xuống phố rồi.', N'../public/image/product/MG_6037.jpg', 850000, 550000, 43, N'Tím đen', 12, 1, 4)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (5, N'Giày XSPORT Balen.ciaga Triple S', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Chủ nghĩa về sự tự do, thoải mái và cá tính đã được phát huy tột độ
Balenciaga Triple S – dòng giày đa sắc màu, phá bỏ mọi giới hạn, đủ đẹp, đủ chất để khiến giới mộ điệu lại một lần nữa phải điên đảo.', N'../public/image/product/xoa-phong-206.jpg', 500000, 400000, 41, N'Đen vàng', 13, 1, 5)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (6, N'Giày Thể Thao XSPORT Balen.ciaga Triple S REP', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Chủ nghĩa về sự tự do, thoải mái và cá tính đã được phát huy tột độ
Balenciaga Triple S – dòng giày đa sắc màu, phá bỏ mọi giới hạn, đủ đẹp, đủ chất để khiến giới mộ điệu lại một lần nữa phải điên đảo.', N'../public/image/product/MG_6338.jpg', 1250000, 799000, 41, N'Trắng đen', 23, 1, 5)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (7, N'Giày Thể Thao XSPORT A102', N'Đôi giày vừa mang phong cách lướt ván, vừa mang phong cách đường phố', N'Đôi giày vừa mang phong cách lướt ván, vừa mang phong cách đường phố
Có thể mix đẹp dễ dàng với hầu hết tất cả các bộ quần áo, nhiều phong cách khác nhau.
 Mỗi sản phẩm đều mang các đặc trưng, chi tiết nguyên bản với 3 đường sọc logo của Adidas và phần ngón chân bằng cao su', N'../public/image/product/z2077558193230_ea81a8aa664fb9d99dafc63171cea1c5.jpg', 450000, 360000, 41, N'Đen', 33, 1, 1)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (8, N'Giày Thể Thao XSPORT Van.s Old Skool Caro', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Giày Vans kiểu dáng phù hợp với nhiều loại trang phục, kết hợp tuyệt vời nhất với đồ jean, quần vải và legging
Chất liệu vải cao cấp, bền đẹp và rất giặt sạch. 
Đế giày cao su đúc nguyên khối êm chân thoải mái', N'../public/image/product/MG_2135.jpg', 450000, 199999, 42, N'Trắng đen', 15, 1, 3)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (9, N'Giày Thể Thao XSPORT Fi.la B7301', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Thiết kế năng động, trẻ trung không kém phần hiện đại cực kì thích hợp đi dạo phố và cả làm việc.
Chất liệu da cao cấp, mang đến sự thoải mái và êm chân.
Thể hiện cá tính riêng biệt.', N'../public/image/product/MG_6338.jpg', 500000, 400000, 43, N'Trắng', 10, 1, 5)
GO
INSERT [dbo].[tb_products] ([id], [name], [description], [detail], [img], [price], [discount_price], [size], [color], [quantity], [status], [category_id]) VALUES (10, N'Giày Thể Thao XSPORT Con.verse Cổ Thấp', N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.', N'Chất vải dày dặn, form giày cứng cáp.
Đế giày cao được phủ bóng để dễ dàng dễ vệ sinh.
Đệm chân Ortholite mềm mại hỗ trợ đi lại cả ngày.
 Khoen xỏ lỗ giày và khoen bên hông giày được làm từ kim loại cao cấp chống rỉ sét', N'../public/image/product/xoa-phong-2-688.jpg', 200000, 99000, 44, N'Đen vàng', 23, 1, 5)
GO
SET IDENTITY_INSERT [dbo].[tb_products] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_role] ON 

GO
INSERT [dbo].[tb_role] ([id], [role_name], [status]) VALUES (1, N'administration', 1)
GO
SET IDENTITY_INSERT [dbo].[tb_role] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_users] ON 

GO
INSERT [dbo].[tb_users] ([id], [username], [password], [email], [role_id], [status]) VALUES (2, N'admin', N'1aadfddcf9713b4bf8eb1597f34127e7fe7c50695c849d3a7fdc053f75dffea7', N'vandong1x99@gmail.com', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tb_users] OFF
GO
ALTER TABLE [dbo].[tb_cart]  WITH CHECK ADD  CONSTRAINT [FK_tb_cart_tb_customers] FOREIGN KEY([cusomer_id])
REFERENCES [dbo].[tb_customers] ([id])
GO
ALTER TABLE [dbo].[tb_cart] CHECK CONSTRAINT [FK_tb_cart_tb_customers]
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
ALTER TABLE [dbo].[tb_users]  WITH CHECK ADD  CONSTRAINT [FK_tb_users_tb_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[tb_role] ([id])
GO
ALTER TABLE [dbo].[tb_users] CHECK CONSTRAINT [FK_tb_users_tb_role]
GO
/****** Object:  StoredProcedure [dbo].[sp_addCustomer]    Script Date: 10/14/2020 11:54:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_addProduct]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_addProduct](
@name NVARCHAR(255),
@description NTEXT,
@detail NTEXT,
@img NVARCHAR(255),
@price FLOAT,
@discount_price FLOAT,
@size INT,
@color NVARCHAR(50),
@quantity INT,
@status INT,
@category_id int
)AS 
BEGIN
	IF EXISTS (SELECT * FROM dbo.tb_category WHERE id = @category_id)
		BEGIN
			INSERT INTO dbo.tb_products
					(
					  name ,
					  description ,
					  detail ,
					  img ,
					  price ,
					  discount_price ,
					  size ,
					  color ,
					  quantity ,
					  status ,
					  category_id
					)
			VALUES  ( 
					  @name , -- name - nvarchar(255)
					  @description , -- description - ntext
					  @detail , -- detail - ntext
					  @img , -- img - nvarchar(255)
					  @price , -- price - float
					  @discount_price , -- discount_price - float
					  @size , -- size - int
					  @color , -- color - nvarchar(50)
					  @quantity , -- quantitty - int
					  @status , -- status - int
					  @category_id  -- category_id - bigint
					)
		END
	ELSE RETURN N'Không có loại sản phẩm đã chọn';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddToCart]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddToCart](
@customer_id INT,
@product_id INT,
@quantity INT
)
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.tb_customers WHERE id = @customer_id)
		BEGIN
			IF EXISTS (SELECT * FROM dbo.tb_cart_item WHERE product_id = @product_id)
				BEGIN
					UPDATE dbo.tb_cart_item
					SET quantity = quantity + @quantity
					WHERE product_id = @product_id
				END
			ELSE
				BEGIN
					DECLARE @cart_id INT
					SELECT @cart_id = tb_cart.id FROM dbo.tb_cart,dbo.tb_customers, dbo.tb_cart_item
					WHERE cusomer_id = @customer_id AND cusomer_id = tb_customers.id  
					INSERT INTO dbo.tb_cart_item( cart_id, product_id, quantity )
					VALUES  (@cart_id , @product_id , @quantity)
				END
		END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_create_order_detail]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_create_order_detail](
@order_id INT,
@product_id INT,
@quantity INT 
)
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.tb_orders WHERE id = @order_id)
		BEGIN
			INSERT INTO dbo.tb_order_detail
			        ( order_id, product_id, quantity )
			VALUES  ( @order_id, -- order_id - int
			          @product_id, -- product_id - int
			          @quantity  -- quantity - int
			          )
			DELETE FROM dbo.tb_cart_item WHERE product_id = @product_id
		END
END

EXEC dbo.sp_create_order_detail @order_id = 0, -- int
    @product_id = 0, -- int
    @quantity = 0 -- int



GO
/****** Object:  StoredProcedure [dbo].[sp_CreateOrder]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_CreateOrder](
@customer_id INT,
@order_date DATETIME,
@order_note NTEXT,
@order_total_price FLOAT,
@order_status int
)
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.tb_customers WHERE id = @customer_id)
		BEGIN
			INSERT INTO dbo.tb_orders
			        ( customer_id ,
			          order_date ,
			          order_note ,
			          order_total_price ,
			          order_status
			        )
			VALUES  ( @customer_id , -- customer_id - int
			          @order_date , -- order_date - datetime
			          @order_note , -- order_note - ntext
			          @order_total_price , -- order_total_price - float
			          @order_status  -- order_status - int
			        )
			SELECT CAST(scope_identity() AS int);
		END
END

EXECUTE dbo.sp_CreateOrder @customer_id = 0, -- int
    @order_date = '2020-10-13 06:50:07', -- datetime
    @order_note = NULL, -- ntext
    @order_total_price = 0.0, -- float
    @order_status = 0 -- int

-- proc tao order_detail

GO
/****** Object:  StoredProcedure [dbo].[sp_editProduct]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_editProduct](
@id INT,
@name NVARCHAR(255),
@description NTEXT,
@detail NTEXT,
@img NVARCHAR(255),
@price FLOAT,
@discount_price FLOAT,
@size INT,
@color NVARCHAR(50),
@quantity INT,
@status INT,
@category_id int
)AS 
BEGIN
	IF EXISTS (SELECT * FROM dbo.tb_category WHERE id = @category_id)
		BEGIN
			UPDATE dbo.tb_products
			SET name = @name, description = @description, detail = @detail,
				img = @img, price = @price, discount_price = @discount_price,
				size = @size, color = @color, quantity = @quantity, status = @status, category_id = @category_id
			WHERE id = @id 			
		END
	ELSE RETURN N'Không có loại sản phẩm đã chọn';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_getCartWithID]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_getCartWithID](
@customer_id INT
)
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.tb_customers WHERE id = @customer_id)
		BEGIN
			SELECT product.name AS product_name, item.product_id,
			product.price AS product_price,item.quantity, product.price * item.quantity AS thanhtien
			FROM dbo.tb_cart AS cart,
			dbo.tb_cart_item AS item,
			dbo.tb_customers AS customer,
			dbo.tb_products AS product
			WHERE cart.cusomer_id = @customer_id 
			AND item.cart_id = cart.id 
			AND item.product_id = product.id 
			AND cart.cusomer_id = customer.id
		END
	ELSE PRINT N'Khách hàng này không tồn tại trong CSDL'
END

EXEC dbo.sp_getCartWithID @customer_id = 1 -- int



GO
/****** Object:  StoredProcedure [dbo].[sp_getProductWithID]    Script Date: 10/14/2020 11:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_getProductWithID](
@product_id INT
)
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.tb_products WHERE id = @product_id)
		BEGIN
			SELECT product.id AS product_id,
			product.name AS product_name,
			product.detail,
			product.img,product.price, product.discount_price,
			product.size,
			product.color,
			product.quantity,
			product.description,
			category.name AS category_name,
			category.id AS category_id
			FROM dbo.tb_products AS product LEFT JOIN dbo.tb_category AS category ON
			category.id = product.id WHERE product.id = @product_id
		END
END
GO
