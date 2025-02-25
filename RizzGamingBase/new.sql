USE [master]
GO
/****** Object:  Database [Rizz]    Script Date: 2024/1/26 下午 05:41:37 ******/
CREATE DATABASE [Rizz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rizz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Rizz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rizz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Rizz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Rizz] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rizz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rizz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rizz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rizz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rizz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rizz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rizz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rizz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rizz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rizz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rizz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rizz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rizz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rizz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rizz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rizz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rizz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rizz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rizz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rizz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rizz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rizz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rizz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rizz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Rizz] SET  MULTI_USER 
GO
ALTER DATABASE [Rizz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rizz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rizz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rizz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rizz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Rizz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Rizz] SET QUERY_STORE = ON
GO
ALTER DATABASE [Rizz] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Rizz]
GO
/****** Object:  User [sa5]    Script Date: 2024/1/26 下午 05:41:37 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[GameId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developers]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](256) NOT NULL,
	[Number] [int] NULL,
 CONSTRAINT [PK_Developers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountItems]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountItems](
	[Id] [int] NOT NULL,
	[DiscountId] [int] NOT NULL,
	[GameId] [int] NOT NULL,
 CONSTRAINT [PK_DiscountItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Persent] [int] NOT NULL,
	[DiscountType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerDiscounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DLCs]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DLCs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[AttachmentGameId] [int] NOT NULL,
 CONSTRAINT [PK_DLC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Introduction] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Price] [int] NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[DeveloperId] [int] NOT NULL,
	[MaxPercent] [int] NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameTags]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_GameTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[DisplayImage] [nvarchar](3000) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[AvatarURL] [nvarchar](200) NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[BanTime] [datetime] NULL,
	[Bonus] [int] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[Birthday] [datetime] NULL,
	[NickName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 2024/1/26 下午 05:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[DisplayVideo] [nvarchar](3000) NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Developers] ON 

INSERT [dbo].[Developers] ([Id], [Name], [Account], [Password], [Mail], [Number]) VALUES (1, N'qwe', N'qwe', N'qwe', N'qwe', 123)
INSERT [dbo].[Developers] ([Id], [Name], [Account], [Password], [Mail], [Number]) VALUES (2, N'asd', N'asd', N'asd', N'asd', 1)
INSERT [dbo].[Developers] ([Id], [Name], [Account], [Password], [Mail], [Number]) VALUES (3, N'zxc', N'zxc', N'zxc', N'zxc', 2)
INSERT [dbo].[Developers] ([Id], [Name], [Account], [Password], [Mail], [Number]) VALUES (4, N'qaz', N'qaz', N'qaz', N'qaz', 4)
INSERT [dbo].[Developers] ([Id], [Name], [Account], [Password], [Mail], [Number]) VALUES (5, N'qsc', N'qsc', N'qsc', N'qsc', 5)
SET IDENTITY_INSERT [dbo].[Developers] OFF
GO
INSERT [dbo].[DiscountItems] ([Id], [DiscountId], [GameId]) VALUES (1, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([Id], [StartDate], [EndDate], [Persent], [DiscountType]) VALUES (1, CAST(N'2024-01-25' AS Date), CAST(N'2024-02-10' AS Date), 90, N'123')
INSERT [dbo].[Discounts] ([Id], [StartDate], [EndDate], [Persent], [DiscountType]) VALUES (2, CAST(N'2024-01-23' AS Date), CAST(N'2024-02-15' AS Date), 95, N'123')
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[DLCs] ON 

INSERT [dbo].[DLCs] ([Id], [GameId], [AttachmentGameId]) VALUES (1, 5, 1)
INSERT [dbo].[DLCs] ([Id], [GameId], [AttachmentGameId]) VALUES (2, 4, 1)
SET IDENTITY_INSERT [dbo].[DLCs] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([Id], [Name], [Introduction], [Description], [ReleaseDate], [Price], [Image], [DeveloperId], [MaxPercent]) VALUES (1, N'守望先鋒', N'多人戰略遊戲，英雄對決與團隊合作', N'以未來科技背景，多元文化的戰場，豐富多樣的地圖設計。', CAST(N'2016-05-24' AS Date), 999, N'111.jpg', 1, NULL)
INSERT [dbo].[Games] ([Id], [Name], [Introduction], [Description], [ReleaseDate], [Price], [Image], [DeveloperId], [MaxPercent]) VALUES (2, N'荒野大?客2', N'開放世界的西部冒險遊戲', N'極具細緻和真實感，深刻的敘事、精湛的設計和壯麗的畫面。', CAST(N'2018-10-26' AS Date), 1999, N'222.jpg', 2, NULL)
INSERT [dbo].[Games] ([Id], [Name], [Introduction], [Description], [ReleaseDate], [Price], [Image], [DeveloperId], [MaxPercent]) VALUES (3, N'絕地求生：大逃殺', N'沉浸式的生存競技遊戲', N'以緊張刺激的玩法著稱，玩家在縮小的戰場中爭奪生存。', CAST(N'2017-12-20' AS Date), 599, N'333.jpg', 3, NULL)
INSERT [dbo].[Games] ([Id], [Name], [Introduction], [Description], [ReleaseDate], [Price], [Image], [DeveloperId], [MaxPercent]) VALUES (4, N'動物森友會', N'建立夢幻島嶼的社交模擬遊戲', N'融合創意、種植花草、打造家園，與可愛的動物居民互動。', CAST(N'2020-03-20' AS Date), 1299, N'444.jpg', 4, 80)
INSERT [dbo].[Games] ([Id], [Name], [Introduction], [Description], [ReleaseDate], [Price], [Image], [DeveloperId], [MaxPercent]) VALUES (5, N'英雄聯盟', N'多人線上戰術射擊遊戲', N'豐富的遊戲性和獨特的英雄角色，不斷更新和平衡調整，全球數百萬玩家參與。', CAST(N'2020-07-14' AS Date), 0, N'555.jpg', 5, NULL)
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[GameTags] ON 

INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (3, 1, 1)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (4, 1, 3)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (5, 1, 4)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (6, 2, 2)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (7, 2, 3)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (8, 2, 7)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (9, 2, 4)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (10, 3, 1)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (11, 3, 8)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (12, 4, 5)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (13, 4, 6)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (14, 5, 8)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (15, 5, 7)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (16, 5, 4)
INSERT [dbo].[GameTags] ([Id], [GameId], [TagId]) VALUES (17, 5, 5)
SET IDENTITY_INSERT [dbo].[GameTags] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1, N'FPS')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2, N'RPG')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3, N'8BIT')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4, N'第三人稱')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (5, N'123')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (6, N'456')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (7, N'789')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (8, N'159')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (9, N'6328')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (10, N'74')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (11, N'炸')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Videos] ON 

INSERT [dbo].[Videos] ([Id], [GameId], [DisplayVideo]) VALUES (1, 1, N'123456789')
SET IDENTITY_INSERT [dbo].[Videos] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Games] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Games]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Members]
GO
ALTER TABLE [dbo].[DiscountItems]  WITH CHECK ADD  CONSTRAINT [FK_DiscountItems_Discounts] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([Id])
GO
ALTER TABLE [dbo].[DiscountItems] CHECK CONSTRAINT [FK_DiscountItems_Discounts]
GO
ALTER TABLE [dbo].[DiscountItems]  WITH CHECK ADD  CONSTRAINT [FK_DiscountItems_Games] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[DiscountItems] CHECK CONSTRAINT [FK_DiscountItems_Games]
GO
ALTER TABLE [dbo].[DLCs]  WITH CHECK ADD  CONSTRAINT [FK_DLC_AttachmentGame] FOREIGN KEY([AttachmentGameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[DLCs] CHECK CONSTRAINT [FK_DLC_AttachmentGame]
GO
ALTER TABLE [dbo].[DLCs]  WITH CHECK ADD  CONSTRAINT [FK_DLC_Games] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[DLCs] CHECK CONSTRAINT [FK_DLC_Games]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Developers] FOREIGN KEY([DeveloperId])
REFERENCES [dbo].[Developers] ([Id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Developers]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Games] FOREIGN KEY([Id])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Games]
GO
ALTER TABLE [dbo].[GameTags]  WITH CHECK ADD  CONSTRAINT [FK_GameTags_Games] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[GameTags] CHECK CONSTRAINT [FK_GameTags_Games]
GO
ALTER TABLE [dbo].[GameTags]  WITH CHECK ADD  CONSTRAINT [FK_GameTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[GameTags] CHECK CONSTRAINT [FK_GameTags_Tags]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Games] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Games]
GO
ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_Videos_Games] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_Videos_Games]
GO
USE [master]
GO
ALTER DATABASE [Rizz] SET  READ_WRITE 
GO
