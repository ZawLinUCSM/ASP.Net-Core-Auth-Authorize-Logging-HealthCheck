USE [master]
GO
/****** Object:  Database [HPlusSport]    Script Date: 3/11/2021 1:36:40 PM ******/
CREATE DATABASE [HPlusSport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HPlusSport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HPlusSport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HPlusSport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HPlusSport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HPlusSport] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HPlusSport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HPlusSport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HPlusSport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HPlusSport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HPlusSport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HPlusSport] SET ARITHABORT OFF 
GO
ALTER DATABASE [HPlusSport] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HPlusSport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HPlusSport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HPlusSport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HPlusSport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HPlusSport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HPlusSport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HPlusSport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HPlusSport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HPlusSport] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HPlusSport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HPlusSport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HPlusSport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HPlusSport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HPlusSport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HPlusSport] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HPlusSport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HPlusSport] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HPlusSport] SET  MULTI_USER 
GO
ALTER DATABASE [HPlusSport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HPlusSport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HPlusSport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HPlusSport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HPlusSport] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HPlusSport] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HPlusSport] SET QUERY_STORE = OFF
GO
USE [HPlusSport]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/11/2021 1:36:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/11/2021 1:36:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/11/2021 1:36:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sku] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/11/2021 1:36:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Active Wear - Men')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Active Wear - Women')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Mineral Water')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Publications')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Supplements')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (1, N'AWMGSJ', N'Grunge Skater Jeans', NULL, CAST(68.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (2, N'AWMPS', N'Polo Shirt', NULL, CAST(35.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (3, N'AWMSGT', N'Skater Graphic T-Shirt', NULL, CAST(33.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (4, N'AWMSJ', N'Slicker Jacket', NULL, CAST(125.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (5, N'AWMTFJ', N'Thermal Fleece Jacket', NULL, CAST(60.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (6, N'AWMUTV', N'Unisex Thermal Vest', NULL, CAST(95.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (7, N'AWMVNP', N'V-Neck Pullover', NULL, CAST(65.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (8, N'AWMVNS', N'V-Neck Sweater', NULL, CAST(65.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (9, N'AWMVNT', N'V-Neck T-Shirt', NULL, CAST(17.00 AS Decimal(18, 2)), 1, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (10, N'AWWBTSC', N'Bamboo Thermal Ski Coat', NULL, CAST(99.00 AS Decimal(18, 2)), 1, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (11, N'AWWCTT', N'Cross-Back Training Tank', NULL, CAST(0.00 AS Decimal(18, 2)), 0, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (12, N'AWWGSJ', N'Grunge Skater Jeans', NULL, CAST(68.00 AS Decimal(18, 2)), 1, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (13, N'AWWSJ', N'Slicker Jacket', NULL, CAST(125.00 AS Decimal(18, 2)), 1, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (14, N'AWWSDP', N'Stretchy Dance Pants', NULL, CAST(55.00 AS Decimal(18, 2)), 1, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (15, N'AWWUTT', N'Ultra-Soft Tank Top', NULL, CAST(22.00 AS Decimal(18, 2)), 1, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (16, N'AWWUTV', N'Unisex Thermal Vest', NULL, CAST(95.00 AS Decimal(18, 2)), 1, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (17, N'AWWVNT', N'V-Next T-Shirt', NULL, CAST(17.00 AS Decimal(18, 2)), 1, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (18, N'MWB', N'Blueberry Mineral Water', NULL, CAST(2.80 AS Decimal(18, 2)), 1, 3, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (19, N'MWLL', N'Lemon-Lime Mineral Water', NULL, CAST(2.80 AS Decimal(18, 2)), 1, 3, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (20, N'MWO', N'Orange Mineral Water', NULL, CAST(2.80 AS Decimal(18, 2)), 1, 3, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (21, N'MWP', N'Peach Mineral Water', NULL, CAST(2.80 AS Decimal(18, 2)), 1, 3, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (22, N'MWR', N'Raspberry Mineral Water', NULL, CAST(2.80 AS Decimal(18, 2)), 1, 3, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (23, N'MWS', N'Strawberry Mineral Water', NULL, CAST(2.80 AS Decimal(18, 2)), 1, 3, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (24, N'PITK', N'In the Kitchen with H+ Sport', NULL, CAST(24.99 AS Decimal(18, 2)), 1, 4, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (25, N'SC400', N'Calcium 400 IU (150 tablets)', NULL, CAST(9.99 AS Decimal(18, 2)), 1, 5, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (26, N'SFO100', N'Flaxseed Oil 100 mg (90 capsules)', NULL, CAST(12.49 AS Decimal(18, 2)), 1, 5, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (27, N'SI65', N'Iron 65 mg (150 caplets)', NULL, CAST(13.99 AS Decimal(18, 2)), 1, 5, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (28, N'SM250', N'Magnesium 250 mg (100 tablets)', NULL, CAST(12.49 AS Decimal(18, 2)), 1, 5, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (29, N'SMV', N'Multi-Vitamin (90 capsules)', NULL, CAST(9.99 AS Decimal(18, 2)), 1, 5, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (30, N'SVA', N'Vitamin A 10,000 IU (125 caplets)', NULL, CAST(11.99 AS Decimal(18, 2)), 1, 5, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (31, N'SVB', N'Vitamin B-Complex (100 caplets)', NULL, CAST(12.99 AS Decimal(18, 2)), 1, 5, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (32, N'SVC', N'Vitamin C 1000 mg (100 tablets)', NULL, CAST(9.99 AS Decimal(18, 2)), 1, 5, NULL)
GO
INSERT [dbo].[Products] ([Id], [Sku], [Name], [Description], [Price], [IsAvailable], [CategoryId], [OrderId]) VALUES (33, N'SVD3', N'Vitamin D3 1000 IU (100 tablets)', NULL, CAST(12.49 AS Decimal(18, 2)), 1, 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Email]) VALUES (1, N'adam@example.com')
GO
INSERT [dbo].[Users] ([Id], [Email]) VALUES (2, N'barbara@example.com')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 3/11/2021 1:36:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 3/11/2021 1:36:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_OrderId]    Script Date: 3/11/2021 1:36:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_OrderId] ON [dbo].[Products]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Orders_OrderId]
GO
USE [master]
GO
ALTER DATABASE [HPlusSport] SET  READ_WRITE 
GO
