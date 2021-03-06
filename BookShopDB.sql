use [BookShopDB]
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] PRIMARY KEY,
	[BookName] [nvarchar](250) NOT NULL,
	[Author] [nvarchar](500) NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [int] NOT NULL,
	)
GO
/*SET IDENTITY_INSERT [dbo].[Books] ON*/
INSERT [dbo].[Books] ([BookID], [BookName], [Author], [Amount], [Price]) VALUES (1, N'Lập trình Hướng đối tượng với C# 2010', N'Phạm Hữu Khang', 19, 85000)
INSERT [dbo].[Books] ([BookID], [BookName], [Author], [Amount], [Price]) VALUES (2, N'Lập trình ADO.NET 3.5', N'Nguyễn Văn Quyết', 28, 90000)
INSERT [dbo].[Books] ([BookID], [BookName], [Author], [Amount], [Price]) VALUES (3, N'Lập trình Web với ASP.NET', N'Nguyễn Văn Quyết', 100, 100000)
INSERT [dbo].[Books] ([BookID], [BookName], [Author], [Amount], [Price]) VALUES (4, N'Nhập môn CSDL quan hệ', N'Nguyễn Bá Tường', 15, 25000)
INSERT [dbo].[Books] ([BookID], [BookName], [Author], [Amount], [Price]) VALUES (5, N'Cấu trúc dữ liệu và giải thuật', N'Lê Minh Hoàng', 11, 40000)
GO

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] PRIMARY KEY,
	[CustomerName] [nvarchar](100) NULL,
	[OrderDate] [datetime] NULL,
	[Total] [int] NULL,
)
GO
/*SET IDENTITY_INSERT [dbo].[Orders] ON*/
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (4, N'Nguyễn Thị Huyền', CAST(0x0000A00A00CF2DE4 AS DateTime), 175000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (5, N'Trần Quang Thắng', CAST(0x0000A00A00CF9E64 AS DateTime), 260000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (6, N'Lê Thị Hương', CAST(0x0000A06600CFAA1C AS DateTime), 535000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (7, N'Trương Thanh Tuyền', CAST(0x0000A0660188C8BC AS DateTime), 360000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (8, N'Lê Phương Anh', CAST(0x0000A066018A6E9C AS DateTime), 85000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (9, N'Trần Thanh Tùng', CAST(0x0000A066018AFB3C AS DateTime), 265000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (10, N'Hoa Ngọc Bích', CAST(0x0000A066018B418C AS DateTime), 185000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (11, N'', CAST(0x0000A08400036204 AS DateTime), 85000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (12, N'Trần Thị An', CAST(0x0000A08400042A68 AS DateTime), 170000)
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [OrderDate], [Total]) VALUES (13, N'Vương Thị Hoàn', CAST(0x0000A08400056DD8 AS DateTime), 85000)
GO
CREATE TABLE [dbo].[OrderDetails](
	[RecordID] [int] PRIMARY KEY,
	[OrderID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
)
GO
/*SET IDENTITY_INSERT [dbo].[OrderDetails] ON*/
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (1, 4, 1, 1, 85000, 85000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (2, 4, 2, 1, 90000, 90000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (3, 5, 1, 2, 85000, 170000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (4, 5, 2, 1, 90000, 90000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (5, 6, 1, 1, 85000, 85000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (6, 6, 2, 5, 90000, 450000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (7, 7, 1, 2, 85000, 170000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (8, 7, 3, 1, 100000, 100000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (9, 7, 2, 1, 90000, 90000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (10, 8, 1, 1, 85000, 85000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (11, 9, 1, 1, 85000, 85000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (12, 9, 2, 2, 90000, 180000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (13, 10, 1, 1, 85000, 85000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (14, 10, 3, 1, 100000, 100000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (15, 11, 1, 1, 85000, 85000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (16, 12, 1, 2, 85000, 170000)
INSERT [dbo].[OrderDetails] ([RecordID], [OrderID], [BookID], [Quantity], [Price], [TotalPrice]) VALUES (17, 13, 1, 1, 85000, 85000)
/*SET IDENTITY_INSERT [dbo].[OrderDetails] OFF*/
/****** Object:  Default [DF__Orders__OrderDat__07020F21]    Script Date: 04/08/2012 00:44:39 ******/

ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__OrderDat__07020F21]  DEFAULT (getdate()) FOR [OrderDate]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Books]    Script Date: 04/08/2012 00:44:39 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Books]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Orders]    Script Date: 04/08/2012 00:44:39 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
