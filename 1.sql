USE [master]
GO
/****** Object:  Database [PetShop]    Script Date: 10/23/2023 9:18:22 PM ******/
CREATE DATABASE [PetShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PetShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PetShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PetShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PetShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PetShop] SET  MULTI_USER 
GO
ALTER DATABASE [PetShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PetShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [PetShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PetShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/23/2023 9:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 10/23/2023 9:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/23/2023 9:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[ShippingAddress] [nvarchar](255) NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/23/2023 9:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Image] [text] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK__Products__B40CC6ED7BDF0742] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/23/2023 9:18:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name], [Description]) VALUES (1, N'Thức ăn cho chó', N'Thức ăn cho chó')
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description]) VALUES (2, N'Thức ăn cho mèo', N'Thức ăn cho mèo')
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description]) VALUES (3, N'Đồ chơi cho thú cưng', NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description]) VALUES (4, N'Qùa thưởng ', N'Đồ ăn vặt cho thú cưng, khích lệ thú cưng')
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description]) VALUES (5, N'Phụ Kiện', N'Aó, Vòng cổ, nệm , thẻ tên,....')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 3, 3, 1, CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 3, 2, 2, CAST(405.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ShippingAddress], [TotalAmount], [UserID]) VALUES (3, CAST(N'2023-10-22' AS Date), N'Ha Noi', CAST(880.00 AS Decimal(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (2, 2, N'Thức Ăn Cho Mèo Con Hạt Me-O Kitten Vị Cá Biển 400gr', CAST(405.00 AS Decimal(10, 2)), N'https://cunyeushop.vn/cdn/images/202111/goods_img/thuc-an-hat-me-o-kitten-cho-meo-con-goi-11kg-G5223-1636185870636.jpg', N'Đối tượng sử dụng
Mèo con

Hướng dẫn sử dụng
Bạn có thể cho thú cưng ăn trực tiếp hoặc phối trộn với nhiều loại thực phẩm khác nhau mang đến sự mới lạ trong bữa ăn.', CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (3, 2, N'Thức Ăn Cho Mèo Con Hạt Me-O Kitten , Adult Túi 1,1kg và 1,2 Kg', CAST(70.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/100/091/443/products/hieuunganh-com-5e9066b48c276.png?v=1586522083473', N'Đối tượng sử dụng
Mèo con

Hướng dẫn sử dụng
Bạn có thể cho thú cưng ăn trực tiếp hoặc phối trộn với nhiều loại thực phẩm khác nhau mang đến sự mới lạ trong bữa ăn.', CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (4, 1, N'Thức ăn cho chó trưởng thành vị bò Classic Pets túi 400g', CAST(20.00 AS Decimal(10, 2)), N'https://petshopsaigon.vn/wp-content/uploads/2022/01/thuc-an-cho-cho-truong-thanh-classic-pet-20kg-vi-bo-50-goi-400g-1.jpg', N'Thức ăn cho chó Classic Adult hương vị thịt bò, dành cho chó trưởng thành, từ 12 tháng tuổi trở lên
Thành phần:Thức ăn dành cho chó trưởng thành C.P Classic tổng hợp các thành phần dinh dưỡng : 
Tinh Bột: là nguồn năng lượng chính trong cơ thể của thú nuôi, ngoài ra tinh bột trong thức ăn viên khô giúp ngăn chặn bệnh táo bón ruột. Chất Béo kích thích sự ăn uống ngon miệng, cung cấp axit béo cần thiết giúp duy làn da và bộ lông khỏe mạnh mượt mà. Khoáng Chất hình thành xương và sụn  (như Ca và P), tạo ra các phản ứng Enzyme giúp tiêu hóa tốt, duy trì và cân bằng chất lỏng, ổn định sự co thắt của cơ bắp và chức năng thần kinh. Vitamin giúp chống lão hóa, cân bằng Canxi trong máu, tạo khoáng chất cho xương và răng, ổn định thể trạng trong sinh sản, tăng cường hệ miễn dịch, tăng cường thị giác. Nước là một môi trường lỏng cho máu và hệ thống bạch huyết giúp ổn định nhiệt độ cơ thể.', CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (5, 1, N'Thức ăn cho chó trưởng thành Smartheart - túi 400g Vị Bò Nướng', CAST(228.00 AS Decimal(10, 2)), N'https://luckypetshop.vn/wp-content/uploads/2020/03/thuc-an-smartheart-vi-thit-bo-nuong-400g-cho-cho-truong-thanh.jpg', N'MÔ TẢ SẢN PHẨM
- Giúp tim mạch khỏe mạnh: Axit béo Omega-3 từ dầu cá cho tim mạch khỏe mạnh.
- Tăng cường hệ thống miễn dịch: Vitamin E và Selenium giúp tăng cường hệ thống miễn dịch.
- Hệ tiêu hóa khỏe mạnh: Với thành phần dễ tiêu hóa giúp hấp thụ chất dinh dưỡng tối ưu.
- Da và lông khỏe mạnh: Axit béo Omega 3 & 6 cân bằng và đảm bảo cho da khỏe và lông óng mượt.
- Xương và răng khỏe mạnh: Canxi và Photpho cho xương hông chắc và răng khỏe mạnh.', CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (7, 3, N'Đồ chơi giảm stress cho thú cưng- Cà rốt bông', CAST(18.00 AS Decimal(10, 2)), N'https://lzd-img-global.slatic.net/g/p/f5ada261493c5c60b97d795f879433aa.jpg_720x720q80.jpg', N'Đồ chơi giảm stress cho thú cưng', CAST(N'2023-03-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (13, 3, N'Đồ chơi giảm stress cho thú cưng- Cần câu mèo', CAST(185.00 AS Decimal(10, 2)), N'https://cf.shopee.vn/file/sg-11134201-22110-8v24498xj9jv40', N'Đò chơi giảm stress cho thú cưng', CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (14, 4, N'Xúc Xích Siêu Rẻ Cho Chó Mèo', CAST(90.00 AS Decimal(10, 2)), N'https://cunsieupham.com/wp-content/uploads/2019/08/juniehouse-xuc-xich-cho-cho-meo1.jpg', N'THÔNG TIN SẢN PHẨM
- Xúc Xích chứa Vitamin & khoáng chất cho cơ thể những thú cưng luôn khỏe mạnh, linh hoạt. Chất xơ cho hệ thống tiêu hóa tốt, tăng cường khả năng hấp thu chất dinh dưỡng, góp phần vào sự phát triển đồng đều cho thú cưng.
- Chọn nguyên liệu tươi tự nhiên chất lượng cao, tất cả các nguyên liệu được kiểm tra nghiêm ngặt.
- Xúc Xích  với đầy đủ dưỡng chất giúp bé ăn ngon.', CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (15, 4, N'Xương Bàn Chải Xương Gặm Orgo Sạch Răng Thơm Miệng Cho Chó', CAST(169.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/100/229/172/products/xuong-orgo-2.jpg?v=1584297361957', N'Xương gặm sạch răng Orgo 1 gói có 6 cái dành cho chó 
- Đóng gói: túi 6 cái.
- Trọng lương: 90g', CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (16, 5, N'Vòng cổ cho thú cưng chó mèo gắn chuông họa tiết đáng yêu', CAST(100.00 AS Decimal(10, 2)), N'https://lh3.googleusercontent.com/lVc8ljKYpFHbFAmGeYPGZauLuzEkrj3bE22Va1YPdt3ZpkoKvJV4-BNLjX1OWn8xorFQdKfGNhlpm4oP_hsXFsmie_Ky-9FQ5_dLrsVGCzyc4n3LiQ=w570-e365', N'Vòng cổ cho thú cưng chó mèo gắn chuông họa tiết đáng yêu

Với những ai đang nuôi thú cưng thì chắc chắn đều gặp rắc rối với những chú cún luôn thích chạy nhảy linh tinh và trêu đùa những vật nuôi khác mỗi khi được dắt đi dạo. Vậy nên, việc trang bị cho cún một chiếc vòng cổ để kiểm soát chúng mỗi khi ra ngoài là điều cần thiết.

Vòng đeo cổ cho chó cảnh không chỉ thể hiện chú cún đó đã có chủ mà còn giúp người nuôi quản lý thú cưng một một cách dễ dàng hơn. Những chiếc vòng xinh xắn còn giúp cún tăng vẻ đáng yêu, tạo điểm nhấn và vẻ năng động trong mắt mọi người. Chiếc vòng cổ cho chó mèo còn có một tác dụng khác khá hữu ích: Nếu được in số điện thoại lên vòng thì khi cún đi lạc, sẽ có người liên lạc với bạn và khả năng tìm được cún sẽ cao hơn.', CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Products] ([ProductID], [CategoryID], [Name], [Price], [Image], [Description], [CreatedDate]) VALUES (17, 5, N'Dây dắt chó mèo kèm vòng cổ', CAST(180.00 AS Decimal(10, 2)), N'https://lzd-img-global.slatic.net/g/p/d60775d6e51a2a1aa0077e745db8efde.jpg_720x720q80.jpg', N' Màu sắc: Đen, đỏ, hồng, tím, cam, xanh lá, xanh dương...

* Chất liệu: Vải dệt chắc chắn và thiết kế dày dặn cho độ bền cao, đồng thời tạo cảm giác êm ái khi đeo.

Thiết kế dễ thương, màu sắc bắt mắt
', CAST(N'2023-12-01' AS Date))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [IsAdmin]) VALUES (2, N'123', N'123@gmail.com', N'123', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [IsAdmin]) VALUES (3, N'456', N'456@gmail.com', N'456', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [IsAdmin]) VALUES (4, N'thuyvy', N'thuyvy@gmail.com', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [IsAdmin]) VALUES (7, N'congviet', N'congviet@gmail.com', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [IsAdmin]) VALUES (8, N'congchuong', N'congchuong@gmail.com', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [IsAdmin]) VALUES (9, N'hoangxuan', N'hoangxuan@gmail.com', N'123456', 0)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Password], [IsAdmin]) VALUES (10, N'789', N'789@gmail.com', N'789', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK__OrderItem__Produ__534D60F1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK__OrderItem__Produ__534D60F1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__5535A963] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__5535A963]
GO
USE [master]
GO
ALTER DATABASE [PetShop] SET  READ_WRITE 
GO
