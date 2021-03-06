USE [master]
GO
/****** Object:  Database [Amrit-Tulya]    Script Date: 06/30/2020 23:49:18 ******/
CREATE DATABASE [Amrit-Tulya]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Amrit-Tulya', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Amrit-Tulya.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Amrit-Tulya_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Amrit-Tulya_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Amrit-Tulya] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Amrit-Tulya].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Amrit-Tulya] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET ARITHABORT OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Amrit-Tulya] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Amrit-Tulya] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Amrit-Tulya] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Amrit-Tulya] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Amrit-Tulya] SET  MULTI_USER 
GO
ALTER DATABASE [Amrit-Tulya] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Amrit-Tulya] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Amrit-Tulya] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Amrit-Tulya] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Amrit-Tulya] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Amrit-Tulya] SET QUERY_STORE = OFF
GO
USE [Amrit-Tulya]
GO
/****** Object:  Table [dbo].[TeaShop]    Script Date: 06/30/2020 23:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeaShop](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentName] [varchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Picture] [nvarchar](100) NULL,
	[Deleted] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[AlternateText] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TeaShop] ON 

INSERT [dbo].[TeaShop] ([ComponentId], [ComponentName], [Description], [Price], [Picture], [Deleted], [Created], [Modified], [AlternateText]) VALUES (19, N'Cold tea', N'Takes care of hydration
Compared to its hotter version, a glass of iced tea accounts for better hydration. In fact, Harvard Public School of Health lists it as the second best source of hydration after water. Its website states, “Drunk plain, they are calorie-free beverages brimming with antioxidants, flavonoids, and other biologically active substances that may be good for health”. The researchers at Harvard specify that it’s the addition of cream, sugar and milk that turns tea from being a healthy beverage to a not-so-healthy one.', 500, N'~/Images/coldtea.jpg', NULL, NULL, NULL, N'coldtea.jpg')
INSERT [dbo].[TeaShop] ([ComponentId], [ComponentName], [Description], [Price], [Picture], [Deleted], [Created], [Modified], [AlternateText]) VALUES (40, N'Black Tea', N'Black tea is a type of tea that is more oxidized than oolong, yellow, white and green teas. Black tea is generally stronger in flavor than other teas. All four types are made from leaves of the shrub (or small tree) Camellia sinensis. Two principal varieties of the species are used – the small-leaved Chinese variety plant (C. sinensis var. sinensis), used for most other types of teas, and the large-leaved Assamese plant (C. sinensis var. assamica), which was traditionally mainly used for black tea, although in recent years some green and white teas have been produced. In China, where black tea was developed,[1] the beverage is called "red tea", due to the color of the oxidized leaves when processed appropriately', 10, N'~/Images/Black tea.jpg', NULL, NULL, NULL, N'Black tea.jpg')
INSERT [dbo].[TeaShop] ([ComponentId], [ComponentName], [Description], [Price], [Picture], [Deleted], [Created], [Modified], [AlternateText]) VALUES (41, N'Green Tea', N'Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.[1] Green tea originated in China, but its production and manufacture has spread to other countries in East Asia.

Several varieties of green tea exist, which differ substantially based on the variety of C. sinensis used, growing conditions, horticultural methods, production processing, and time of harvest. Although there has been considerable research on the possible health effects of consuming green tea regularly, there is little evidence that drinking green tea has any effects on health.[2]', 20, N'~/Images/GreenTea.jpg', NULL, NULL, NULL, N'GreenTea.jpg')
INSERT [dbo].[TeaShop] ([ComponentId], [ComponentName], [Description], [Price], [Picture], [Deleted], [Created], [Modified], [AlternateText]) VALUES (43, N'Masala Tea', N' Masala meaning a mixture of spices, is brewed along with milk tea. To make masala tea, one can use any of their favorite spices like star anise, green cardamoms, cloves, fennel, cinnamon, pepper corn and nutmeg. Masala chai is made in so many flavors all to suit one''s liking. There are 2 basic ways to make it.', 10, N'~/Images/Tea.jpg', NULL, NULL, NULL, N'Tea.jpg')
INSERT [dbo].[TeaShop] ([ComponentId], [ComponentName], [Description], [Price], [Picture], [Deleted], [Created], [Modified], [AlternateText]) VALUES (45, N'Biscuit', N'Parle Products Private Limited is an Indian food products company. It owns the famous biscuit brand Parle-G. As of 2012, it had a 35% dominant share of the Indian biscuit market. As of 2011, as per Nielsen, it was the largest selling biscuit brand in the world.', 10, N'~/Images/Parle.jpg', NULL, NULL, NULL, N'Parle.jpg')
SET IDENTITY_INSERT [dbo].[TeaShop] OFF
USE [master]
GO
ALTER DATABASE [Amrit-Tulya] SET  READ_WRITE 
GO
