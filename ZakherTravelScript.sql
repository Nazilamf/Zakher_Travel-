USE [master]
GO
/****** Object:  Database [Zakher_Web]    Script Date: 23.09.2023 19:00:32 ******/
CREATE DATABASE [Zakher_Web]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zakher_Web', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Zakher_Web.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zakher_Web_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Zakher_Web_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Zakher_Web] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zakher_Web].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zakher_Web] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zakher_Web] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zakher_Web] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zakher_Web] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zakher_Web] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zakher_Web] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Zakher_Web] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zakher_Web] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zakher_Web] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zakher_Web] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zakher_Web] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zakher_Web] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zakher_Web] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zakher_Web] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zakher_Web] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Zakher_Web] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zakher_Web] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zakher_Web] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zakher_Web] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zakher_Web] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zakher_Web] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Zakher_Web] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zakher_Web] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Zakher_Web] SET  MULTI_USER 
GO
ALTER DATABASE [Zakher_Web] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zakher_Web] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zakher_Web] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zakher_Web] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zakher_Web] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Zakher_Web] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Zakher_Web] SET QUERY_STORE = ON
GO
ALTER DATABASE [Zakher_Web] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Zakher_Web]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](20) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advantages]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advantages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](25) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Advantages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ImageName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](max) NULL,
	[FullName] [nvarchar](35) NULL,
	[Email] [nvarchar](35) NULL,
	[Phone] [nvarchar](15) NULL,
	[Text] [nvarchar](200) NULL,
	[Subject] [nvarchar](35) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartureLocations]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartureLocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DepartureLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destinations]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[ImageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Destinations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Months]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Months](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Months] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
	[UnitDiscountPrice] [decimal](18, 2) NOT NULL,
	[UnitCostPrice] [decimal](18, 2) NOT NULL,
	[UnitSalePrice] [decimal](18, 2) NOT NULL,
	[TourName] [nvarchar](35) NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[FullName] [nvarchar](35) NULL,
	[Email] [nvarchar](35) NULL,
	[Adress] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](25) NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Desc] [nvarchar](200) NULL,
	[ButtonText] [nvarchar](150) NULL,
	[ButtonUrl] [nvarchar](150) NULL,
	[ButtonBackgroundColor] [nvarchar](30) NULL,
	[ImageName] [nvarchar](300) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourImages]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[ImageName] [nvarchar](300) NOT NULL,
	[PosterStatus] [bit] NOT NULL,
 CONSTRAINT [PK_TourImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourReviews]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[Rate] [tinyint] NOT NULL,
	[Text] [nvarchar](200) NULL,
	[ReviewDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TourReviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Desc] [nvarchar](1000) NULL,
	[CostPrice] [decimal](18, 2) NOT NULL,
	[SalePrice] [decimal](18, 2) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Rate] [tinyint] NOT NULL,
	[PersonCount] [int] NOT NULL,
	[Transfer] [bit] NOT NULL,
	[Insurance] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[DestinationId] [int] NOT NULL,
	[DepartureLocationId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DiscountPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Tours] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishlistItems]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishlistItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_WishlistItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 23.09.2023 19:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](25) NOT NULL,
	[Position] [nvarchar](25) NULL,
	[ImageName] [nvarchar](300) NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826210640_TablesCreated', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230826235029_DepartureLocationRelations', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230827215441_IsDeletedTourImage', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230827220053_DiscountPrice', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230828214129_WorkerSettingTables', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230910000423_OrderTable', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230910000723_CreatenewOrder', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230910204349_WishlistItem', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230912110637_ContactUs', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230912122931_Branch', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230913001710_ReviewTable', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230915215207_AdminPage', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230916010951_TourTableUpdate', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230916210738_UpdateAppUser', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230917234816_FileLenghtUpdate', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230920213507_OrderItem', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230921113917_MonthTable', N'6.0.21')
GO
SET IDENTITY_INSERT [dbo].[Advantages] ON 

INSERT [dbo].[Advantages] ([Id], [Title], [Desc], [Icon]) VALUES (2, N'Seçilmiş Otellər', N' Peşəkar və yüksək xidmət', N'4bdb532e-8147-45cd-9862-a9d155102cfa235889.png')
INSERT [dbo].[Advantages] ([Id], [Title], [Desc], [Icon]) VALUES (4, N'Operativ Xidmət', N'Vaxtınıza qənaət edin!', N'935308fd-3bee-4f67-8394-a4f19fe62988345628.png')
INSERT [dbo].[Advantages] ([Id], [Title], [Desc], [Icon]) VALUES (1002, N'Fərqlı İstiqamətlər', N'Dünyanın hər nöqtəsinə!', N'75091e01-4028-47f9-98ed-52b053545f78215796.png')
SET IDENTITY_INSERT [dbo].[Advantages] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'27297b0e-72a8-4776-9a91-4c6fc16b8330', N'SuperAdmin', N'SUPERADMIN', N'4c239343-501a-46fe-9243-4f560eff8e35')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3f9f09a3-8c59-417d-ba33-5ae488725e1c', N'Member', N'MEMBER', N'e41a3a2b-d002-4ed4-b7cd-368ad56fa383')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'88b0c49f-9b9a-42c0-bc6f-e16d16b40d76', N'Admin', N'ADMIN', N'fdcbc1d6-62b8-4821-b406-be71c203351f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8ed1cd60-a7ce-42f8-a474-af713a5b6ce5', N'27297b0e-72a8-4776-9a91-4c6fc16b8330')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', N'3f9f09a3-8c59-417d-ba33-5ae488725e1c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8478bf22-8cd2-4891-bb9a-30557043e79f', N'3f9f09a3-8c59-417d-ba33-5ae488725e1c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5a17d755-5992-43fb-b383-a5b2447bb493', N'88b0c49f-9b9a-42c0-bc6f-e16d16b40d76')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'5a17d755-5992-43fb-b383-a5b2447bb493', N'AppUser', N'Nigar Mahmudova', N'nigaradmin', N'NIGARADMIN', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEFTQzzMlAXhtMcpaTjITyxl5girnjGyEwJL7NHkPMTlRIcVu5riSDQ0LBenGvINIZw==', N'F3MQHHF5WX6VDONJMY2P346LJ5Q3L64W', N'c36e93fd-68e6-4ee6-a35f-5ce2b4282368', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', N'AppUser', N'Nazila Farajova', N'nazilamf', N'NAZILAMF', N'nazilamf@code.edu.az', N'NAZILAMF@CODE.EDU.AZ', 0, N'AQAAAAEAACcQAAAAEJ1SsSpm8hLXTaWB51LQgjTN1qEJq3iGkVinO0WX6/ZERsk5uvIZOcR0Mjm6V5xGRA==', N'QRR56JOFYYB6B6KPCT6NJDYRLTBE7HU7', N'4c83ba92-c2e7-4739-acc1-9db4fe14fdc5', N'0555555555', 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'8478bf22-8cd2-4891-bb9a-30557043e79f', N'AppUser', N'ZakherTravel', N'zakhertravel', N'ZAKHERTRAVEL', N'zakhertravel92@gmail.com', N'ZAKHERTRAVEL92@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFCqdGZEpjpeBiwpeqguSu56+0Km9VwNrpBVhmnHgu9sRtQnV9Xp1RrqSQEEk4Z1Mg==', N'BEFHSNBY7BSWKYUVEKUYXFPHZIXW4R6U', N'76bda56a-b3e4-4b6c-8d2a-52add61e53f6', N'0552324547', 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsAdmin]) VALUES (N'8ed1cd60-a7ce-42f8-a474-af713a5b6ce5', N'AppUser', N'SuperAdmin', N'SuperAdmin', N'SUPERADMIN', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEGjB9+k2U5Oc511gCEDXQkFmzG+Sx09rDw4ykSvCL23mxz5tGVx/EYd/70FV1UqcCw==', N'MYMSNNFDBAVQWKBM4F76E4J76AMEZBGO', N'033419cd-c923-472f-b7de-83c9aea2fa5d', NULL, 0, 0, NULL, 1, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Branches] ON 

INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (1, N'Azərbaycan', N'33cee7c0-a504-4592-bed7-12261c8ff557az.jpg')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (2, N'Polşa', N'f1c96fa0-07fc-4424-a6ce-3edc5039013bPoland-.jpg')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (3, N'Kazaxstan', N'caabafbb-311e-442b-8704-06f839010da8Kazakhstan.jpg')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (4, N'Kırgızistan', N'0cc6a7e6-aa21-42a1-a8d5-39d33d6b31bfKyrgyzstan-.jpg')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (5, N'Ukrayna', N'4aec54c1-2cfb-450b-91c5-07204d310d6aukraine.jpg')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (6, N'Gürcüstan', N'51d8d09b-a9f0-472b-af99-77de6febbce9georgia.jpg')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (9, N'BƏƏ', N'649f36de-656b-419e-ba6d-a03fd1de5f96uae.png')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (10, N'Rusiya', N'd8973dc4-def6-47f9-a99a-fdea3793fe18rus.jpg')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (11, N'Uzbekistan', N'3998549c-f9fd-402a-9c5c-a0f2180f939buzbek.jpg')
INSERT [dbo].[Branches] ([Id], [Name], [ImageName]) VALUES (12, N'Türkiyə', N'd46fff3f-610c-4baf-b951-ce74e3106e99turk.png')
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1002, N'Ailəvi turlar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1003, N'Bal ayı turları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1004, N'Ekstrim turları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1005, N'Kruiz turları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1006, N'Müalicəvi turlar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1007, N'Viza tələb olunmayan turlar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1008, N'Xaricilər üçün ekskursiyalar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1009, N'Yay turları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1010, N'Yeni il turları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1011, N'Çimərlik turları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1012, N'Paket Tur')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([Id], [AppUserId], [FullName], [Email], [Phone], [Text], [Subject], [CreatedDate]) VALUES (4, NULL, N'Nazila Farajova', N'nazilamf@code.edu.az', N'0555555555', N'Tur haqqinda etrfali melumat almaq isterdim', N'Paris Turu', CAST(N'2023-09-12T16:13:34.2565390' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartureLocations] ON 

INSERT [dbo].[DepartureLocations] ([Id], [Name]) VALUES (2, N'İstanbul Atatürk Havalimanı')
INSERT [dbo].[DepartureLocations] ([Id], [Name]) VALUES (1002, N'Bakı Beynəlxalq Avtovağzal Kompleksi')
INSERT [dbo].[DepartureLocations] ([Id], [Name]) VALUES (1003, N'Qəbələ Beynəlxalq Hava Limanı ')
INSERT [dbo].[DepartureLocations] ([Id], [Name]) VALUES (1004, N'Heydər Əliyev Beynəlxalq Aeroportu')
INSERT [dbo].[DepartureLocations] ([Id], [Name]) VALUES (1005, N'Gəncə Beynəlxalq Hava Limanı')
SET IDENTITY_INSERT [dbo].[DepartureLocations] OFF
GO
SET IDENTITY_INSERT [dbo].[Destinations] ON 

INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1008, N'ABŞ', N'b097f6bd-d28a-411b-81e4-49e250e8142c999.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1011, N'Almaniya', N'6df8bee3-d7fa-4d9b-9f03-36221e7ff8a9101010.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1012, N'Avstraliya', N'3579945c-5514-4fb9-89bb-56e1c480e71c202020.jpeg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1014, N'Azərbaycan', N'e4bd5cfe-df76-40b7-85be-459da28b57c35014.jpeg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1016, N'Belarusiya', N'75b60cf0-9ac8-4ec1-921b-a41f52ff35a944555.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1018, N'Birləşmiş Ərəb Əmirliklər', N'3ebc6774-f93d-45c5-b5d5-09aac5dd06b84655210.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1021, N'Böyük Britaniya', N'965c330c-de2d-40f2-8516-47a26950603712772.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1024, N'Fransa', N'e7bf1bd0-39bf-4d1a-acef-2334726678f01235.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1025, N'Gürcüstan', N'0237d24a-9586-480f-99eb-ac12a678257c95154.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1026, N'Macarıstan', N'612bd928-dfe2-45d5-8025-d3b60be532ce33333.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1027, N'Maldiv adaları', N'facb81ac-444c-4375-82dc-8b05828e39a77777.jpeg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1028, N'Misir', N'71674f4a-ca47-4cc3-a32f-ac9bd140ff66451.jpeg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1029, N'Monteneqro', N'9f4600e2-1b86-40f6-9bc8-ad1b6e73ca31654.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1032, N'Portuqaliya', N'8e220463-e172-4235-beef-36d122b6baa04444.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1033, N'Rusiya', N'93e9aa9c-9800-43f2-8fce-acebab3413e0122.jpeg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1035, N'Tayland', N'f78e70c9-96f9-4a95-90ab-c4cd055f1b378787.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1036, N'Türkiyə', N'09e5041e-1cb3-4dc1-bc43-30563fba2ee84445.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1037, N'Yunanıstan', N'196bfe98-cad7-47bc-a5d7-0e4755e03383136.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1038, N'Çexiya', N'32176a2f-aba5-46fb-8cc9-fd70c3b68311366.jpeg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1039, N'İspaniya', N'05ca65dd-256a-4b32-b997-f877852ae1b84112.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1041, N'İtaliya', N'd7c0048b-be41-434b-9606-a84c299a2073Tourist.jpg')
INSERT [dbo].[Destinations] ([Id], [Name], [ImageName]) VALUES (1045, N'Sinqapur', N'cda3629d-bbc6-48af-aaaf-417fef7c769f11.jpeg')
SET IDENTITY_INSERT [dbo].[Destinations] OFF
GO
SET IDENTITY_INSERT [dbo].[Months] ON 

INSERT [dbo].[Months] ([Id], [Name]) VALUES (1, N'Yanvar')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (2, N'Fevral')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (3, N'Mart')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (4, N'Aprel')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (5, N'May')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (6, N'Iyun')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (7, N'Iyul')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (8, N'Avgust')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (9, N'Sentyabr')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (10, N'Oktyabr')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (11, N'Noyabr')
INSERT [dbo].[Months] ([Id], [Name]) VALUES (12, N'Dekabr')
SET IDENTITY_INSERT [dbo].[Months] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [OrderId], [TourId], [UnitDiscountPrice], [UnitCostPrice], [UnitSalePrice], [TourName]) VALUES (7, 7, 1019, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(699.00 AS Decimal(18, 2)), N'Belarusiya-Amaks Vizit Hotel')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [TourId], [UnitDiscountPrice], [UnitCostPrice], [UnitSalePrice], [TourName]) VALUES (8, 8, 1010, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1153.00 AS Decimal(18, 2)), N'Almaniya-Hotel Topas Tur')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [TourId], [UnitDiscountPrice], [UnitCostPrice], [UnitSalePrice], [TourName]) VALUES (9, 9, 1047, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(3480.00 AS Decimal(18, 2)), N'Fairmont Hotel Singapore Turu')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [TourId], [UnitDiscountPrice], [UnitCostPrice], [UnitSalePrice], [TourName]) VALUES (10, 10, 1045, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1240.00 AS Decimal(18, 2)), N'İspaniya Madrid-Dinastia Turu')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [TourId], [UnitDiscountPrice], [UnitCostPrice], [UnitSalePrice], [TourName]) VALUES (11, 11, 1016, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(38.00 AS Decimal(18, 2)), N'İSMAYILLI İVANOVKA TURU')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [TourId], [UnitDiscountPrice], [UnitCostPrice], [UnitSalePrice], [TourName]) VALUES (12, 12, 1020, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1186.00 AS Decimal(18, 2)), N'2024 - u Minskdə qarşılayın')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [TourId], [UnitDiscountPrice], [UnitCostPrice], [UnitSalePrice], [TourName]) VALUES (13, 13, 1010, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1153.00 AS Decimal(18, 2)), N'Almaniya-Hotel Topas Tur')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [TourId], [UnitDiscountPrice], [UnitCostPrice], [UnitSalePrice], [TourName]) VALUES (14, 14, 1022, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(799.00 AS Decimal(18, 2)), N'Dubay-Hues Boutique Hotel')
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [TotalAmount], [Note], [CreatedDate], [Status]) VALUES (7, N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', N'Nazila Farajova', N'nazilamf@code.edu.az', N'Baku', N'0555555555', CAST(699.00 AS Decimal(18, 2)), N'Salam', CAST(N'2023-09-21T01:48:12.2699026' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [TotalAmount], [Note], [CreatedDate], [Status]) VALUES (8, N'8478bf22-8cd2-4891-bb9a-30557043e79f', N'ZakherTravel', N'zakhertravel92@gmail.com', N'Baku', N'0552324547', CAST(1153.00 AS Decimal(18, 2)), N'Tesekkurler!', CAST(N'2023-09-21T02:11:16.4600987' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [TotalAmount], [Note], [CreatedDate], [Status]) VALUES (9, N'8478bf22-8cd2-4891-bb9a-30557043e79f', N'ZakherTravel', N'zakhertravel92@gmail.com', N'Sumqayit', N'0552324547', CAST(3480.00 AS Decimal(18, 2)), N'Thanks!', CAST(N'2023-09-21T02:15:54.6263120' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [TotalAmount], [Note], [CreatedDate], [Status]) VALUES (10, N'8478bf22-8cd2-4891-bb9a-30557043e79f', N'ZakherTravel', N'zakhertravel92@gmail.com', N'Yasamal', N'0552324547', CAST(1240.00 AS Decimal(18, 2)), N'Cox sagolun!', CAST(N'2023-09-21T02:40:54.9895255' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [TotalAmount], [Note], [CreatedDate], [Status]) VALUES (11, N'8478bf22-8cd2-4891-bb9a-30557043e79f', N'ZakherTravel', N'zakhertravel92@gmail.com', N'Baku', N'0552324547', CAST(38.00 AS Decimal(18, 2)), N'Thanks...', CAST(N'2023-09-21T02:54:24.3136926' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [TotalAmount], [Note], [CreatedDate], [Status]) VALUES (12, N'8478bf22-8cd2-4891-bb9a-30557043e79f', N'ZakherTravel', N'zakhertravel92@gmail.com', N'Baku', N'0552324547', CAST(1186.00 AS Decimal(18, 2)), N'Salam', CAST(N'2023-09-23T01:06:09.1203830' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [TotalAmount], [Note], [CreatedDate], [Status]) VALUES (13, N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', N'Nazila Farajova', N'nazilamf@code.edu.az', N'Baku', N'0555555555', CAST(1153.00 AS Decimal(18, 2)), N'Salam', CAST(N'2023-09-23T05:50:18.9523591' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [TotalAmount], [Note], [CreatedDate], [Status]) VALUES (14, N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', N'Nazila Farajova', N'nazilamf@code.edu.az', N'Yasamal', N'0555555555', CAST(799.00 AS Decimal(18, 2)), N'Salam', CAST(N'2023-09-23T05:55:05.4909192' AS DateTime2), 3)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (1, N'Address', N'Mammad Araz, 109, Baku, Narimanov, AZ1069 9 floor')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (2, N'Office Phone', N'+994 12 310 09 32')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (3, N'Cell Phone', N'+994 50 253 22 00, +994 50 253 22 09, +994 50 253 22 08,  ')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (4, N'WhatsApp', N'+994 50 253 22 00')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (5, N'Email', N'info@zakher.travel')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (6, N'Logo', N'logo.png')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (1002, N'Title', N'Who we are?')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Order], [Title], [Desc], [ButtonText], [ButtonUrl], [ButtonBackgroundColor], [ImageName]) VALUES (1, 1, N' Dünyanı bizimlə kəşf edin!', N'Elə indi bizim turlar ilə tanış olun!', N'Ətraflı', N'buuuuuu', N'grey', N'ea06a784-2f02-4350-a8a0-8a02fe404847gettyi.jpg')
INSERT [dbo].[Sliders] ([Id], [Order], [Title], [Desc], [ButtonText], [ButtonUrl], [ButtonBackgroundColor], [ImageName]) VALUES (3, 2, N'Azərbaycanı bir yerdə gezək!', N'Turlar ilə tanış ol və çantanı hazırla!', N'İndi al!', N'gvkbdsh', N'grey', N'ce065b00-9224-4e26-baac-ff312b400d9aXanbulanğ_.jpg')
INSERT [dbo].[Sliders] ([Id], [Order], [Title], [Desc], [ButtonText], [ButtonUrl], [ButtonBackgroundColor], [ImageName]) VALUES (4, 3, N'Azerbaijan: The Land of Fire!', N'Bakının gözəl və tarixi məkanları!', N'Ətraflı', N'gfdf', N'rgrg', N'0d21de62-455d-407f-a2f6-27c2491f67daBaku-F.jpg')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[TourImages] ON 

INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1008, 1008, N'0b1a7d67-e22b-43e4-a2ea-39ad6e8bef96ny1.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1009, 1008, N'7eed24d2-f3e4-4148-841f-c2caf570216fny2.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1010, 1008, N'f6371bc9-46cb-4a63-8aa4-8aa70935cff7ny3.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1011, 1009, N'6c64719c-e744-4ac8-a877-aa357dd44557183_149293361596.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1012, 1009, N'fb9313e7-21c7-4e7a-98b6-e43a2ca1a139183_0.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1013, 1009, N'cc9ab636-d167-48d3-b3dd-3ded42ff5e0b183_149293360032.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1014, 1009, N'9a225c0c-d82e-4536-a912-492349c95553183_149293361596.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1015, 1009, N'd1d66ccf-091e-46ca-af81-731b47a4255b183_149293363966.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1016, 1008, N'59e57b2c-36e0-4342-ac3a-2d67992109b2ny1.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1017, 1010, N'd5f14c9a-4784-4222-886a-f4d4e93cfe50182_0.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1018, 1010, N'cdde0f0a-e11a-4db4-b338-ece64873b09a2.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1019, 1010, N'f45155fc-9210-4268-81f9-af5c609ae6463.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1020, 1010, N'edf35485-bf35-4e73-ab82-c946eebd37f7182_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1021, 1011, N'ae4f70cd-b409-4fda-8d1c-b958367a1d7b127_149198813518.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1022, 1011, N'd4eb6b03-e5b8-4620-ade0-fe34d26ed23a127_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1023, 1011, N'f7c4ab65-a585-444f-9223-b7ce731186e0127_149198811775.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1024, 1011, N'fc90289c-2a20-4deb-aa36-1d895b315b40127_149198816170.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1025, 1011, N'1c87e419-dbcc-432c-b643-80182972073b127_149198821150.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1026, 1012, N'6f9d2464-9f10-4292-9331-aa066925f539188_149301743832.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1027, 1012, N'fc526df4-dfdf-4a6e-a22c-8ebd526798c1188_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1028, 1012, N'38f65f3a-0461-4b05-84c8-9ae684f34004188_149301728757.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1029, 1012, N'66ba7b17-00e3-4e02-a81d-b25317abba52188_149301734354.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1030, 1013, N'78fa63a3-35f5-45cb-8a5c-300b4cf1619f15771379447143070605e01371824778.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1031, 1013, N'd600d6a1-fde3-48df-9b61-73257b127fda157852815219448996605e166d987c3ad.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1032, 1013, N'9c468823-26ff-4fdd-a243-3e6d538445d2Без названия (1).jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1033, 1014, N'144e2207-d9ce-4020-b065-6b66329f63d2155194295815310043105c80c52e7b266.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1034, 1014, N'535f2223-c11a-4873-b2b5-4d17a8e7d1d9images.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1035, 1014, N'4d339fe2-ccee-4bce-9386-fa33a25d536bozobijon-waterfall-slide.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1036, 1015, N'43c98299-d2ab-4626-aef6-ba9c32f2c85a416_0.jpeg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1037, 1015, N'f508b914-209c-4d6a-8248-42cb6020785513974-BIG.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1038, 1015, N'a2040c05-5a37-4105-bc6e-eb2bfee3850anar_bayrami_icon_01-article_thumb.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1039, 1015, N'9a45cd80-cc72-44b3-9a60-cafb137dd906thumbs_b2_bd70ba165a35e13d81a3ec3f2ac77895.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1040, 1016, N'b833e625-8057-4ca3-813f-6fef61d7b794ivanovka-village-azerbaijan-tour.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1041, 1016, N'66be4ea9-2235-4a97-9538-b29eef80a3bf81438fc2-c2ec-48fe-93ab-2f904e7fdcc6-caption.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1042, 1016, N'00cef1b3-99cb-4a40-b9fe-6017ff65a2c6Ivanovka_Azerbaijan.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1043, 1016, N'1f9a63bb-8150-4470-9881-4ee2bfc314e4ivanovka-village-azerbaijan-tour.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1044, 1017, N'e3e77d88-cf71-4ef5-a962-8f11d49eaeb8photo0jpg.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1045, 1017, N'a11aba86-fb58-4eea-b545-4a377f259d9f48826262366_55702f5cc5_b.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1046, 1017, N'2b233ce5-55c0-4c00-9388-07b5b9195ad9photo0jpg (1).jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1047, 1017, N'd9c9c3de-e4bb-4cf9-8c36-61e014eb9bbephoto0jpg.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1048, 1018, N'a1761a3a-874b-430d-a7b7-a44a1009d4ffБез названия.jpeg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1049, 1018, N'd0eaa84a-5882-462f-982c-0d365ec30ce6129_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1050, 1018, N'f249fcaf-cb1f-44d1-966b-dafb6b4ea941Без названия (1).jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1051, 1018, N'159ef328-7b8a-4f0a-a4ab-ac4e3bca10f1Без названия.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1052, 1019, N'7b85ec00-64b7-4f2f-83b2-5cd0f3a1eb0a95_149112155262.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1053, 1019, N'946a88ef-fbed-4239-8db8-b26e9aac438895_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1054, 1019, N'cf0b50a7-d29f-46ae-933e-7b79539cf76d95_149112155262.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1055, 1019, N'ddd24ad7-ff87-4d1b-b638-908b5dfbe704Webp.net-resizeimage-11-1.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1056, 1020, N'4ab09a44-2773-4903-aefe-4e8f356c65de85_0.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1057, 1020, N'c46a88b2-b194-4de3-8a5c-87fea9f92ef585_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1058, 1020, N'c15d340e-0632-4949-83a5-1804287976e485_149085437095.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1059, 1020, N'f6b7e168-ac66-4cd8-96d9-585e86476e5b85_149085437898.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1060, 1021, N'bb24ab17-38c7-4631-b887-3e95a00bb0d8dubay-3-1024x683.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1061, 1021, N'db7a1e7f-8f71-49a6-bfa6-988017ee67cbdubay-3-1024x683.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1062, 1021, N'0e90eb4c-1c9c-4631-ac6d-77c972c21745EEjg5aOVAAAmjjI.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1063, 1021, N'cf543e74-508e-44c9-be42-a75c2ee50a15images.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1064, 1021, N'99bf6e2e-274f-4701-ad42-fc61ea0b6e1aistockphoto-1157424768-612x612.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1065, 1022, N'f107823b-e0da-4876-9765-175f16a00cd7dubai.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1066, 1022, N'bf0d5d5d-bc4c-4ce6-9b30-0547083ec73f350px-5018_Dubai_Metro_in_Dubai_UAE.png', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1067, 1022, N'3b86ba1f-de68-4c09-b185-a658a3f58591dubai.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1068, 1022, N'1d55f01f-13da-4ee2-bcac-fde9f52506f5Dubay-1.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1069, 1023, N'c2a11ade-1896-4bf8-b2f7-843c2e93c3028187f1ab-ba08-4456-8469-bae482a22ca1.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1070, 1023, N'343dcc53-afa6-49d1-a662-21ceda502f00108_149137980359.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1071, 1023, N'8e202d34-4bf4-4d45-a251-b35c0092fbfa8187f1ab-ba08-4456-8469-bae482a22ca1.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1072, 1023, N'aa6cfc2a-4a62-4fa4-ae3a-17f802f5df181538407641480374300.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1073, 1023, N'61da76b2-894b-4144-8f6a-8e57fd9c1f61gbo-uae-to-become-guls-fastest-growing-economy.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1074, 1024, N'992efdfe-8876-4782-b903-179659f03467142_0.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1075, 1024, N'71a4e26e-5869-4ef6-a5d2-c46ade70c77c142_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1076, 1024, N'c3738110-00d7-4927-94aa-eb6c69e0fbf7142_149214964599.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1077, 1024, N'9354c439-6a1a-4261-b19f-af010bb78a98142_149214968380.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1078, 1025, N'c7e37494-fe10-4b6a-a167-d46623b29b78150_149225210581.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1079, 1025, N'748d173e-7a1a-4a9d-b478-8aed05c6e796150_149225202617.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1080, 1025, N'58f0bc41-4da5-44ed-86f5-21a93c0ec4fb150_149225210581.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1081, 1025, N'7505b8c4-ae49-483d-b4e4-20c8f0dbebbd150_149225215015.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1082, 1026, N'f344cf2d-8e38-42ca-9f0f-5d57ccbd4541110_0.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1083, 1026, N'ce08046c-abbc-45e0-94d2-24a8b47c0dbf110_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1084, 1026, N'f6d4e9a8-dc2b-485d-920b-f311c0d3de65110_149139524922.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1085, 1026, N'933fcb91-daa6-4ad3-9504-b2e37301a5cc110_149139527577.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1086, 1027, N'42ad4940-7497-41a5-b9e8-584691fe5af7images.jpeg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1087, 1027, N'bb8252b5-a4bc-43c9-8ef8-a48c039204b7bigstock-tbilisi-georgia-august-432553958-990x556.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1088, 1027, N'0331f154-02b9-4ab8-9243-ba8823ee0d69images (1).jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1089, 1027, N'7d6ee51c-0295-4abc-8ace-da69e7b95513images.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1090, 1028, N'43377440-6320-4553-9847-92c49b81b3ed104_0.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1091, 1028, N'7834adbc-4452-4303-94e9-314726e0bdd3104_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1092, 1028, N'b54cda72-863d-43d6-8db3-aa2b5db71f1f104_149129547226.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1093, 1028, N'60f2e951-a173-44d1-8ff5-40a8f68c4f90104_149129548144.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1094, 1029, N'0bddf78f-b666-44ea-a395-716744a95a50395_0.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1095, 1029, N'9db2c6b2-a49b-4ffd-8069-ac6be6ecb41a395_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1096, 1029, N'a10d9f51-b88f-47e2-bf32-74e92fe63a27395_156828666634.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1097, 1029, N'8d9d6607-45a6-4596-b832-cb0148b28620395_156828670729.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1098, 1030, N'b9be5e4a-fcde-4fa4-90e1-42b853f19d0d395_156828673396.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1099, 1030, N'a4b7c360-7d96-484d-bbdf-bea8b270897c393_156828403627.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1100, 1030, N'9618f1f7-0469-48af-83c8-7ebc3143fd35393_156828405480.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1101, 1030, N'641400c7-fb42-4c37-97ca-79d5aa7c9391395_156828673396.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1102, 1031, N'b68b3427-a97c-4ed8-911d-850c128d4e88394_0.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1103, 1031, N'9be75d9d-16d7-4379-b303-e3ec9d05a752394_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1104, 1031, N'435e3684-5b67-4e03-9ce9-39db777ae5a5394_156828497852.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1105, 1031, N'5e539b26-ae33-4005-a50c-d5ba085c2bcd394_156828499462.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1106, 1031, N'4618c784-3a20-4818-a27f-5ccaeb003b39394_156828518230.jpg', 0)
GO
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1107, 1032, N'cf03abf5-6b67-4d3d-b370-9009730c1962176_149268282589.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1108, 1032, N'221ee59b-de01-4231-b3a3-97f433cb9b92176_149268253031.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1109, 1032, N'50072e58-e255-4624-ae20-618674d1e9e4176_149268262253.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1110, 1032, N'2aff3b71-6352-4124-b01b-fd96b50bf8d3176_149268282589.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1111, 1033, N'0fabb805-b268-4599-8615-0ad40b021dd3d1168da1-bd85-471e-bd4c-b11ef9639d0c-1024.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1112, 1033, N'39bf5256-4e45-4274-b151-a0eacc38f0fdbash2222853.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1113, 1033, N'33de96e5-945b-4476-b56d-f1a11509b0d8d1168da1-bd85-471e-bd4c-b11ef9639d0c-1024.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1114, 1033, N'ef9ee9af-8d81-4f68-bd62-433a5c1f3be5faruk-kaymak-b_e5k7b3mzq-unsplash-1320x742.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1115, 1034, N'4bf1f0a4-5675-4c9b-829c-0f9bfb1f2004baki-sankt-peterburq-bilet-qiymetleri.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1116, 1034, N'9e1da24d-34bb-4274-81f7-54667a0b8a71baki-sankt-peterburq-bilet-qiymetleri.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1117, 1034, N'fa9fb8f5-3ac0-478e-b3d9-cf061189c440images.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1118, 1034, N'd8242f3a-67c6-4c43-a668-01054328c5d2sankt.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1119, 1034, N'22385691-d35b-438a-b6f9-b2aa326a44d1Без названия.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1120, 1035, N'd509433e-2d3f-451b-8dcd-df51a3f36864341_0.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1121, 1035, N'351a318b-2eae-4102-8474-f7156967cbef341_0.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1122, 1035, N'92dc6b3b-9f89-4f05-a612-22cadddc4dea341_153823253829.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1123, 1035, N'a8bda024-c23f-4f8d-a1ae-a70fc6c2686f341_153823265233.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1124, 1036, N'e5c60a25-c2e1-4d68-8fa5-68f9998de27emoscow-new-years-eve-celebrate.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1125, 1036, N'ce4290b1-6fa3-401c-8562-7ac8c400c2efmoscow-new-years-eve-celebrate.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1126, 1036, N'5939d93e-bca8-42db-8983-f6ba5f301789new-year-in-moscow-russia.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1127, 1036, N'83f9c567-2233-41a2-a4e1-d4da539f2189OG-for-new-year-in-moscow.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1128, 1036, N'0bec477a-8afc-4728-9197-aebca5ae955frussia-moscow-kremlin-new-year-1-1.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1129, 1037, N'03e20f14-bd14-4445-b760-a2cb474c67f61641278654.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1130, 1037, N'0b9c43c2-5fc3-4256-9c5d-1253ab7e88de1641278654.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1131, 1037, N'963e798c-3e38-4617-bcc3-5179907e02dcThailand-1.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1132, 1037, N'ab0299fd-f1d0-4203-939d-98874eceda6evietnam-phuket-singapur-aralik-2022-700x500.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1133, 1038, N'f01d72df-01e0-4522-9299-b54ff8f48b33187_149301669129.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1134, 1038, N'bcc62d05-675b-4e03-a818-61f56bdcbe98187_149301649654.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1135, 1038, N'ed518864-bbfb-40a7-b8c6-ea317af37077187_149301651540.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1136, 1038, N'85f15901-1e5b-488d-b0b6-fc76fe08c2ee187_149301669129.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1137, 1039, N'bbb20804-d682-4d0a-8d39-01c32fa28230Istanbul.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1138, 1039, N'3354df9d-74d6-4080-a7d6-4083625934c9image.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1139, 1039, N'e7ae5da1-7b6e-4148-8ab8-9273829e2314Istanbul.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1140, 1039, N'93b872f1-76cd-49d9-8165-5dc8bb545366Без названия (1).jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1141, 1039, N'189bba8e-e358-47ae-8579-574c27d54b21Без названия.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1142, 1040, N'e226ffd7-2694-41a2-a602-b7bd31845128Kapadokya-transfer.png', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1143, 1040, N'258ef048-5e46-4450-ab1a-198d02387b11282138754.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1144, 1040, N'04efd94b-c216-49e1-9771-0afe15cad8dakapadokya-deve-turu.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1145, 1040, N'ea1a7bf2-dd2b-4824-8d9c-8acd2573fe99Kapadokya-transfer.png', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1146, 1040, N'01d16660-775c-4a04-a4b9-e37daa74b933the-cappadocia-hotel-4.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1147, 1041, N'cc7615f4-ef5c-4b82-b07a-ad57f570cf59View-Of-Antalya-Old-Town-Kaleici-Antalya-Turkey.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1148, 1041, N'25e9a7e4-2c0e-48d1-9537-69fcb4067821images.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1149, 1041, N'a4a2608c-a5e1-409e-9707-dfed70a1c02ekaleici-antalya-turkey.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1150, 1041, N'e02b8353-0b44-499a-bbae-c98d87603302View-Of-Antalya-Old-Town-Kaleici-Antalya-Turkey.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1151, 1042, N'49c3a828-6488-4c3c-b201-fcb192cfa80bthings-to-do-in-Kusadasi-Turkey.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1152, 1042, N'd4d6957e-145c-4cc1-974c-58bdd6ab7d1615680938d9d8abaecd15d9067baca2e5.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1153, 1042, N'5e5b0374-31a8-451e-97e8-5049aac8ba97kusadasi.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1154, 1042, N'4d4ebd67-27f1-4602-9922-5d6f7d24882dthings-to-do-in-Kusadasi-Turkey.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1155, 1043, N'cae0e426-050d-49d2-89f0-f494ad979b09images.jpeg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1156, 1043, N'ab8b2d9a-e7b9-4a5f-8626-236a90219875kapak_150022.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1157, 1043, N'e38abf6d-a401-4704-b8cf-5f697ba3ddb6turkiyeye-yakin-olan-yunan-adalari.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1158, 1043, N'9910883b-e9c0-4f91-b739-41b627d0fe0fБез названия.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1159, 1044, N'1a9322dd-ed7d-4075-8719-8d478e7d706fpraqa-1024x640.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1160, 1044, N'3ccbe1ac-93e2-473a-8544-7a689d63679f07dcd44a5526347f-1024x576.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1161, 1044, N'1f46c005-07c4-4042-b2ed-67740938e096praqa-1024x640.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1162, 1044, N'bd07137f-ce8a-4dbb-9f8d-656cec9edee2Без названия.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1163, 1045, N'e3755aaa-eaf7-422a-997f-97a3840181b7istockphoto-514769480-612x612.jpg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1164, 1045, N'ed525d22-8c66-4be5-a478-024b9d227af8istockphoto-514769480-612x612.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1165, 1045, N'7bcc74fb-1db1-41f5-9e75-50565f9e86b6MAD32860.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1166, 1045, N'657cba5a-c66e-4192-b6a0-e81b3bc9995amadrid-3021998_1280.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1167, 1046, N'15af38dc-87f6-4550-a52c-9bfebd8e5610images.jpeg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1168, 1046, N'e3b58163-8b39-4296-a2a0-60e8da1df545Florensiya.png', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1169, 1046, N'315e88f2-56cd-44dd-a1f6-b8c1c51cdaaaimages.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1170, 1046, N'9d540997-9b53-432e-be2c-11b5e0f56478Без названия.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1171, 1047, N'50c456ca-4403-48f3-a031-7964c8e97e2511.jpeg', 1)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1172, 1047, N'f24f806c-cc72-49df-8e97-38cc4124a2b511.jpeg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1173, 1047, N'7a8b6e5d-532b-4118-9225-4ef0cc799a17Singapure2.jpg', 0)
INSERT [dbo].[TourImages] ([Id], [TourId], [ImageName], [PosterStatus]) VALUES (1174, 1047, N'b8e6a245-6fa9-4265-80fb-f0869002ce23sinqapur-1024x683.jpg', 0)
SET IDENTITY_INSERT [dbo].[TourImages] OFF
GO
SET IDENTITY_INSERT [dbo].[TourReviews] ON 

INSERT [dbo].[TourReviews] ([Id], [TourId], [AppUserId], [Rate], [Text], [ReviewDate]) VALUES (3, 1023, N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', 5, N'Amazing Tour!', CAST(N'2023-09-18T19:24:59.2512286' AS DateTime2))
INSERT [dbo].[TourReviews] ([Id], [TourId], [AppUserId], [Rate], [Text], [ReviewDate]) VALUES (4, 1046, N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', 4, N'Çox sərfəli ve gözəl tur!', CAST(N'2023-09-18T19:26:04.3990703' AS DateTime2))
INSERT [dbo].[TourReviews] ([Id], [TourId], [AppUserId], [Rate], [Text], [ReviewDate]) VALUES (5, 1026, N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', 3, N'Daha büdcəli olmağın istərdim!', CAST(N'2023-09-18T19:26:30.8707611' AS DateTime2))
INSERT [dbo].[TourReviews] ([Id], [TourId], [AppUserId], [Rate], [Text], [ReviewDate]) VALUES (7, 1015, N'7f4a2cc1-3a80-41c7-b4dc-086b4d1b3ce2', 5, N'Çox maraqlı olacaq!', CAST(N'2023-09-18T20:02:25.5327504' AS DateTime2))
INSERT [dbo].[TourReviews] ([Id], [TourId], [AppUserId], [Rate], [Text], [ReviewDate]) VALUES (8, 1025, N'8478bf22-8cd2-4891-bb9a-30557043e79f', 4, N'Ela turdu!', CAST(N'2023-09-22T20:00:39.6975720' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TourReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Tours] ON 

INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1008, N'NewYork-Monterey Inn Hotel', N'ZK2001', N'North Bergendə yerləşən bu komfortlu otel, New York Citydəki cazibə mərkəzlərinə yalnız bir neçə dəqiqə məsafədə müasir imkanlar təklif edir.  Howard Johnson oteli New York City-ə 10 km uzaqlıqdadır. Buradan şəhəri asanlıqla kəşf etmək olur. New Yorka gedən ictimai nəqliyyat qısa məsafədə tapılar. Beləcə qonaqlar Giants Stadionu, Liberty Əyalət Parkı və Liberty Elm Mərkəzinə tez çata bilər.  Otel rahat qalmaq imkanı verir. Howard Johnson otelində Wi-Fi internet, gündəlik kontinental səhər yeməyi və yaxşı təchiz olunmuş bir fitness mərkəzi tapılar.', CAST(1500.00 AS Decimal(18, 2)), CAST(2343.00 AS Decimal(18, 2)), CAST(N'2023-11-10T03:51:00.0000000' AS DateTime2), CAST(N'2023-11-17T03:51:00.0000000' AS DateTime2), 5, 1, 1, 1, 1008, 1008, 1004, 0, CAST(2105.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1009, N'Almaniya-Acomhotel München', N'ZK2002', N'Münhenin şərqində iştirak edən bu müasir iş oteli, A99 şosesi və ICM sərgi mərkəzinə avtomobil ilə yalnız bir neçə dəqiqəlik məsafədədir.  Acomhotel München-Haarın işıqlı otaqlarında düz ekran TV, kondisioner və duş var.  Otelin qarşısında duran avtobus, sizi 25 dəqiqə içində Münhen şəhər mərkəzinə çatdırar. Eyni zamanda bir qaraj da vardır.  München-Haar Acomhotel bir nahar restoranı təklif edir və qonaqlar, lobbi barda 24 saat içki və qəlyanaltı sifariş edə bilər.', CAST(800.00 AS Decimal(18, 2)), CAST(1096.00 AS Decimal(18, 2)), CAST(N'2023-10-19T03:56:00.0000000' AS DateTime2), CAST(N'2023-10-26T03:56:00.0000000' AS DateTime2), 4, 1, 1, 1, 1012, 1011, 1004, 0, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1010, N'Almaniya-Hotel Topas Tur', N'ZK2003', N'Bu otel, Frankfurtda qatar stansiyasına yalnız 5 dəqiqəlik gəzmək məsafəsindədir. Hotspot üzərindən ödənişsiz Wi-Fi girişi, gündəlik açıq bufet səhər yeməyi və xüsusi avtopark təqdim olunur.  Hotel Topasdakı siqaret çəkilməyən müasir otaqların hamısında digital TV, minibar və iş masası var. Hələ 2015-ci ildə yenilənən standart otaqlarda minibar və yeni bir vanna vardır.  Hotel Topasın resepşn personalı 24 saat xidmət edir.  Topas, Frankfurt Messe sərgi mərkəzinə 10 dəqiqəlik gəzmək məsafəsindədir. Fərqli tramvay, metro və şəhər içi relsli sistem stansiyalarına gedərək 5 dəqiqədən qısa müddətdə çatıla bilər.', CAST(905.00 AS Decimal(18, 2)), CAST(1226.00 AS Decimal(18, 2)), CAST(N'2023-10-10T04:00:00.0000000' AS DateTime2), CAST(N'2023-09-14T04:00:00.0000000' AS DateTime2), 5, 1, 1, 1, 1012, 1011, 1003, 0, CAST(1153.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1011, N'Comfort Hotel Lichtenberg Tur', N'ZK2004', N'Berlinin ən canlı bölgələrindən  Neuköllndə fəaliyyət göstərən müasir Comfort Hotel Lichtenberg,  otelinin otaqlarının hamısında pulsuz Wi-Fi, kabel TV və kondisioner var. Qonaqlar, otelin qarşısındakı spa və saunadan pulsuz istifadə edə bilərlər.', CAST(842.00 AS Decimal(18, 2)), CAST(1104.00 AS Decimal(18, 2)), CAST(N'2023-10-20T04:03:00.0000000' AS DateTime2), CAST(N'2023-09-27T04:03:00.0000000' AS DateTime2), 4, 1, 1, 1, 1008, 1011, 1005, 0, CAST(1005.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1012, N'Avstraliya-Devere Hotel Tur', N'ZK2005', N'Populyar bir yer olan Potts Pointdə olan otel Devere , düz ekran TV ehtiva edən kondisionerli otaqlar ilə xidmət verir. Oteldə restoran və iş mərkəzi yerləşir. Sidney gecə həyatının paytaxtı Kings Cross 5 dəqiqə uzaqlıqdadır.  Hotel Devere, Woolloomooloo və Elizabeth qəsəbəsinə piyada 10 dəqiqədən daha yaxın məsafədədir. Məşhur Sidney Opera Evinə avtomobillə yalnız 10 dəqiqədə çatıla bilər.Devere Hotelin tur masası, qonaqlara turistik məkanlar haqqında tövsiyə verə bilər və səyahət tənzimləmələri mövzusunda köməkçi ola bilər. Otelde quru təmizləmə və camaşırxana xidmətləri də təmin edilməkdədir.', CAST(2000.00 AS Decimal(18, 2)), CAST(2990.00 AS Decimal(18, 2)), CAST(N'2023-07-18T04:06:00.0000000' AS DateTime2), CAST(N'2023-07-22T04:06:00.0000000' AS DateTime2), 5, 1, 1, 1, 1009, 1012, 1004, 0, CAST(2851.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1013, N'Qəbələ-City Hotel Gabala Turu', N'ZK2005', N'▶ Vip nəqliyyat ▶ Oteldə Gecələmə ( City Hotel Gabala) ▶ Gülərüz tur rəhbəri ▶ Foto Çəkiliş  ▶ Səhər yeməyi ( 2 dəfə yolda və Oteldə) ▶ Çay süfrəsi və Disco  ▶ Yol boyu əyləncəli oyunlar Ekskursiyalar: ▶ Qəbələ, Tufandağ ▶ Qəbələnd Əyləncə mərkəzi ( Lunapark) ▶ Əvəzsiz görüntüsü olan - Nohurgöl ▶ Şəki Şəki Xan sarayı, ▶ Karvansaray,  ▶Əlövsət şirniyyat evi.', CAST(40.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(N'2024-02-18T04:11:00.0000000' AS DateTime2), CAST(N'2024-02-19T04:11:00.0000000' AS DateTime2), 4, 1, 1, 1, 1010, 1014, 1002, 0, CAST(62.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1014, N'LƏNKƏRAN ASTARA LERİK ', N'ZK2005', N'Qiymətə daxildir: Komfortlu nəqliyyat Oteldə gecələmək (Mandarin hotel)  Turun ilk günü restoranda səhər yeməyi Turun ikinci günü (oteldə səhər yeməyi) Axşam yeməyi (sac quzu,toyuq ləvəngi,salatlar,təndir çörəyi,xususi kompot)Axşam restaranda diskoteka Bakıya qayıdışda axşam çay süfrəsiFotosesiya (link 3 iş günü müddətində təqdim olunur) Tur rəhbə rEkskursiyalar Lənkəran qala qapıları Lənkəran samovarı Xanbulan gölü Lerik Relax gəzintisi  Astara bulvarı Turun başlama və bitiş tarixləri və saatları:⤵ Toplaşma vaxtı 06:30 Toplaşma yeri Gənclik M/S Yola düşmə 07:00 Bakıya geri dönüş 08 Mart axşam saatlarında Bakıya çatmaq 23:00 Finiş Gənclik M/S', CAST(55.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(N'2023-05-30T04:18:00.0000000' AS DateTime2), CAST(N'2023-05-31T04:18:00.0000000' AS DateTime2), 5, 1, 1, 1, 1009, 1014, 1002, 0, CAST(85.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1015, N'Göyçay Nar Festivalı Turu', N'ZK2008', N'Göyçay Nar Festivalı Turu Tarix 9-10 Noyabr Qiymət 20 azn Qiymətə daxildir 1⃣Komfortlu VİP nəqliyyat 2⃣ Səhər yeməyi (Yağ,Bal, Pendir,Yumurta,Çörək və Pünrəngi Çay ) 3⃣Təcrübəli Tur Rəhbəri 4 Limitsiz Foto çəkiliş (Şəkillər 3 gün sonra link vasitəsiylə göndərilir) 5⃣Çay 6⃣Avtobusda eyləncəli oyunlar - Ekskursiyalar ‍‍ Göyçay Nar Festivalına Giris Toplanış vaxtı: 06:30 Toplanış Yeri Genclik m 07:00 Yola düşmə', CAST(10.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(N'2023-11-10T04:20:00.0000000' AS DateTime2), CAST(N'2023-11-11T04:21:00.0000000' AS DateTime2), 5, 1, 1, 0, 1008, 1014, 1002, 0, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1016, N'İSMAYILLI İVANOVKA TURU', N'ZK2008', N'Payız çox gözəldir həmdə İsmayıllıda  İSMAYILLI  İVANOVKA QARANOHUR TURU Tarix: 13 Oktyabr Müddət: 1 gün Qiymət: 23 Azn Qiymətə daxildir: Komfortlu nəqliyyat Səhər yeməyi Çay süfrəsi Tur rəhbər Əyləncəli oyunlar və hədiyyələr Fotosessiya (şəkillər turdan sonra 3 gün ərzində verilir)  QEYD  Turdan daha çox piknik abu-havalı 1 gün (Xənəyə kəndində) Ekskursiyalar:  İvanovka kəndi   Xənəyə kəndi   Qaranohur gölü  Qeyd:6 yaşa qədər uşaqlara (avtobusda yer verilməzsə) ödənişsiz.   6 yaşdan yuxarı tam ödəniş Tur zamanı spirtli içkilərin istifadəsi qadağandır. Toplanış yeri və saatı:  06:30 da Gənclik M/S 07:00 da Yola düşmə 22:00 Bakıya çatma', CAST(26.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(N'2023-10-13T04:25:00.0000000' AS DateTime2), CAST(N'2023-10-14T04:25:00.0000000' AS DateTime2), 3, 1, 1, 0, 1002, 1014, 1002, 0, CAST(38.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1017, N'Şəki Kiş kəndi Tarixi Tur', N'ZK2009', N'HƏR ŞEY DAXİL  Qiymətə daxildir  Komfortlu nəqliyyat Tur bələdçi Səhər yeməy Möhtəşəm diskoteka Kiş kəndində Narın qalada Limitsiz Foto sesiya pulsuz turdan sonra təqdim olunur Axşam Samavar çay süfrəsi Maraqlı oyunlar və hədiyyələr Nahar yeməyi Kiş kəndində ( Şəki pitisi,sirkə soğan,kələm tutması,baş soğan,kompot,kənd çöyəri) Ekskursiyalari Kiş kəndi gəzintisi Alban məbədi Narın qala istirahət mərkəzi Narın qalada möhtəşəm canlı diskoteka -Toplanış: 06:30 - 07:00 Təyin olunmuş yerdə toplaşma (Gənclik metrosu) • 07:00 yola düşmə vaxtı • 23:00 Bakıya çatmaq', CAST(25.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(N'2023-10-21T04:28:00.0000000' AS DateTime2), CAST(N'2023-10-22T04:28:00.0000000' AS DateTime2), 4, 1, 1, 0, 1002, 1014, 1002, 0, CAST(37.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1018, N'Belarusiya-Victoria Hotel Tur', N'ZK2012', N'Minskdə yamyaşıl bir bölgədə yerləşən  Hotel, pulsuz avtopark xidməti təklif edir.  Otaqlarda iş sahəsi və kabel TV mövcuddur.  Otelin restoranında Belarus və Avropa mətbəxlərinin dadına baxa bilərsiniz. Otel daxilində bir bar da mövcuddur. Otaqlarda kabelli internet, lobbdə isə pulsuz Wi-Fi mövcuddur.   ', CAST(896.00 AS Decimal(18, 2)), CAST(1242.00 AS Decimal(18, 2)), CAST(N'2023-10-21T04:33:00.0000000' AS DateTime2), CAST(N'2023-10-25T04:33:00.0000000' AS DateTime2), 4, 2, 1, 1, 1012, 1016, 1004, 0, CAST(1160.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1019, N'Belarusiya-Amaks Vizit Hotel', N'ZK2015', N'Hotel Gomelin Dəmiryol stansiyasından 5 dəqiqəlik məsafədə yerləşir. Həmçinin Gomelin gəzməli yerlərindən olan Gomel Sarayına və Park Ensemble kimi yerlərə 20 dəqiqəlik yeriş məsafəsində yerləşir. ', CAST(521.00 AS Decimal(18, 2)), CAST(790.00 AS Decimal(18, 2)), CAST(N'2023-11-23T04:36:00.0000000' AS DateTime2), CAST(N'2023-11-27T04:36:00.0000000' AS DateTime2), 3, 1, 0, 1, 1002, 1016, 1004, 0, CAST(699.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1020, N'2024 - u Minskdə qarşılayın', N'ZK2021', N'Yeni ili Minskda qarşılamaq şansı!', CAST(752.00 AS Decimal(18, 2)), CAST(1235.00 AS Decimal(18, 2)), CAST(N'2023-12-29T04:39:00.0000000' AS DateTime2), CAST(N'2024-01-02T04:39:00.0000000' AS DateTime2), 3, 1, 0, 1, 1010, 1016, 1004, 0, CAST(1186.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1021, N'BƏƏ-Dubay-Grandeur Hotel', N'ZK2032', N'Grandeur Hotel mərkəzində Al Barsha bölgəsində, Əmirliklər AVMlərindən və Ski Dubaydan bir neçə dəqiqəlik məsafədə yerləşir. İdman salonu və dam örtüyü hovuzu var.  Bütün otaqlar müasir üslubda zərif şəkildə bəzədilib. Hər otaqda saç qurutma maşını və hamam ilə mərmər vanna otağı var. Buraya mikroavtobus və peyk televiziyası daxildir.Hotel Grandeur Media City-nin sərbəst iqtisadi zonasına, habelə şəhərin ən yaxşı çimərliklərinə və ticarət mərkəzlərinə asanlıqla çıxışı təmin edir. Dubai Beynəlxalq Hava Limanı 30 dəqiqəlik məsafədədir. Emirates Mall və Outlet Mall-a, habelə Kite Beach-ə pulsuz nəqliyyat xidməti təklif edir. Köçürmə qrafikini qəbulda tapa bilərsiniz (şərtlər tətbiq olunur).', CAST(524.00 AS Decimal(18, 2)), CAST(870.00 AS Decimal(18, 2)), CAST(N'2024-01-04T05:01:00.0000000' AS DateTime2), CAST(N'2024-01-09T05:01:00.0000000' AS DateTime2), 3, 1, 1, 0, 1002, 1018, 1004, 0, CAST(650.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1022, N'Dubay-Hues Boutique Hotel', N'ZK2029', N'4 ulduzlu oteldə günəş salonu olan açıq hovuz, pulsuz Wi-Fi və kondisioner olan otaqlar, 24 saat ön masa, idman salonu və masaj salonu olan sağlamlıq klubu təklif olunur.  Hues Boutique Otelindəki otaqlar düz ekranlı bir peyk TV, minibar və pulsuz çay / qəhvə hazırlayan qurğuları əhatə edir. Şəxsi vanna otağı tualet əşyaları və xalatlarla birlikdə gəlir. Bütün otaqlar parlaq rənglərlə bəzədilib. Bəzilərində Deira Corniche Promenade''in fikirləri var.  Hues, müxtəlif beynəlxalq yeməklərə və bufet yeməyinə xidmət edən bufet restoranına sahibdir, qonaqlar müasir lobbidə istirahət edə və barda içki içə bilərlər.  Otel Qızıl Bazardan cəmi 3 km məsafədədir. Dubai Beynəlxalq Hava Limanı 13 km məsafədədir. Hava limanında servis xidməti mövcuddur. Dubay Beynəlxalq Konvensiya və Sərgi Mərkəzi 9 km məsafədədir.', CAST(620.00 AS Decimal(18, 2)), CAST(960.00 AS Decimal(18, 2)), CAST(N'2024-01-10T05:06:00.0000000' AS DateTime2), CAST(N'2024-01-16T05:06:00.0000000' AS DateTime2), 4, 1, 0, 1, 1003, 1018, 1004, 0, CAST(799.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1023, N'Abu-Dhabi - Centro Capital ', N'ZK2045', N'Abu Dabi Milli Sərgi Mərkəzinə yalnız 5 dəqiqə gəzmək məsafəsində olan Centro Capital Centre, müasir və zərif bir otelidir. Obyektin açıq hovuz və 24 saat xidmət verən bir idman salonu mövcuddur. Otel, IDEX 2017də (Beynəlxalq Müdafiə Sərgisi və Konfransı) ev sahibliyi edəcək Sərgi Mərkəzinə yaxındır. Centro Capital Centredən, möhtəşəm bir memarlıq əsəri olan Şeyx Zayed Məscidinə avtomobillə 5 dəqiqədə, Abu Dabi Beynəlxalq Hava isə avtomobillə 20 dəqiqədə çata bilərsiniz.', CAST(961.00 AS Decimal(18, 2)), CAST(1330.00 AS Decimal(18, 2)), CAST(N'2024-02-08T05:09:00.0000000' AS DateTime2), CAST(N'2024-02-12T05:09:00.0000000' AS DateTime2), 5, 1, 0, 1, 1003, 1018, 1003, 0, CAST(1250.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1024, N'London-The County Hotel', N'ZK4210', N'Euston, St Pancras və Kings Cross: Şəhər 3 ana xətt stansiyalarının yaxınlığında mərkəzi London Hotel üçün fövqəladə bir dəyər təklif edir. Hamamlar 4 otaq arasında paylaşılar və hər otaqda bir tualet var.   Russell Meydanı - 7 dəqiqəlik yeriyiş British Muzeyi - 11 dəqiqəlik gəzinti Oxford Prospekti - gedərək 18 dəqiqə Covent Garden - 25 dəqiqəlik gəzinti Theatreland - 26 dəqiqəlik gəzinti', CAST(852.00 AS Decimal(18, 2)), CAST(1120.00 AS Decimal(18, 2)), CAST(N'2024-03-05T05:12:00.0000000' AS DateTime2), CAST(N'2024-03-10T05:12:00.0000000' AS DateTime2), 5, 1, 1, 0, 1008, 1021, 2, 0, CAST(1189.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1025, N'Fransa-Bristol République', N'ZK5210', N'- Bakı-Paris-Bakı marşrut xətti ilə uçuş  - Transfer hava limanı-otel-hava limanı  - Oteldə qalmaq və səhər yeməkləri ilə qidalanma  - Avtobusla Parisdə qrup gəzinti turu  - Montmartreyə gəzinti turu  - Parisin tarixi mərkəzinə gəzinti turu  - Fragonard ətir muzeyinə ziyarət  - Sena çayı üzərində gəmi turu üçün bilet  - Tibbi sığorta', CAST(1021.00 AS Decimal(18, 2)), CAST(1790.00 AS Decimal(18, 2)), CAST(N'2024-05-15T05:15:00.0000000' AS DateTime2), CAST(N'2024-05-22T05:16:00.0000000' AS DateTime2), 4, 1, 0, 1, 1003, 1024, 2, 0, CAST(1700.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1026, N'Fransa-Paris-Murat Hotel', N'ZK5365', N'Otel, Père Lachaise''e 15 dəqiqə gəzmək  məsafəsində olub 24 saat resepsion xidməti təklif edir və otaqlarda TV və telefon var. 20. Ménilmontant, abidələr, muzeylər və arxitektura ilə maraqlanan səyyahlar üçün çox gözəl bir variantdır. ', CAST(985.00 AS Decimal(18, 2)), CAST(1374.00 AS Decimal(18, 2)), CAST(N'2023-12-17T05:18:00.0000000' AS DateTime2), CAST(N'2023-12-22T05:18:00.0000000' AS DateTime2), 3, 1, 1, 0, 1003, 1024, 2, 0, CAST(1245.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1027, N'Gürcüstan-Mtsxeta-Tbilisi Turu', N'ZK6541', N' Foto çəkiliş qrup şəklində.  Komfortlu nəqliyyat.  Wifi yalnız sərhədi keçəndən sonra aktiv olacaq.(Wifi haqqında məlumatı qeyd bölməsində ətraflı oxumağınız xahiş olunur.)  Maraqlı viktorinalar. Ekskursiyalar.⤵  Mtsxeta şəhəri.  Svetiçxoveli kilsəsi.  Jvari kilsəsi (Kür və Araqvi çayının birləşmə məkanı).  Tbilisi Mall.  Tbilisi şəhəri.  Qədimi hamamlar (Abanutubani).  Heydər Əliyev parkı.  Arzular körpüsü.  Qədimi Tbilisi Şəlaləsi.  İ Love Tbilisi.  Sevgililər körpüsü (Sülh körpüsü) Tbilisi Kanatı (Narikala) istəyə uyğun 5 lari  Gürcü Anası (Kartlis Deda) Gürcüstanın bir abidəsidir.', CAST(232.00 AS Decimal(18, 2)), CAST(362.00 AS Decimal(18, 2)), CAST(N'2023-11-23T05:24:00.0000000' AS DateTime2), CAST(N'2023-11-26T05:24:00.0000000' AS DateTime2), 3, 1, 0, 0, 1007, 1025, 1003, 0, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1028, N'Macarıstan-Hotel Fortuna Turu', N'ZK6841', N'6 gecə oteldə gecələmə gün ərzində 3 dəfə yemək həkim müayinəsi 6 müalicəvi prossedur müalicə kursu Heviz termal gölünə 10 giriş', CAST(845.00 AS Decimal(18, 2)), CAST(1290.00 AS Decimal(18, 2)), CAST(N'2023-08-10T05:30:00.0000000' AS DateTime2), CAST(N'2023-08-17T05:30:00.0000000' AS DateTime2), 5, 1, 1, 1, 1006, 1026, 1004, 0, CAST(1199.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1029, N'Maldiv Turu-Kurumba Maldives', N'ZK6725', N'Kurumba Maldiv adaları Resort, Şimali Kişi Atollun xüsusi tropik adasında, gözəl ağ qum çimərlikləri və gözəl hindistan cevizi ağacları ilə əhatə olunmuşdur. Hava limanına qayıqla getmək yalnız 10 dəqiqə çəkir, gün ərzində servis xidməti mövcuddur. Bütün otaqlarda, 8 restoranda və 4 barda pulsuz Wi-Fi təqdim edir.  Kurortda 2 açıq şirin su hovuzu, 3 tennis kortu və idman mərkəzi var. Veli Spa Diveha Baysın unikal müalicəsi də daxil olmaqla müxtəlif müasir və ənənəvi müalicə üsullarını təklif edir. Ada turları, balıqçılıq və xüsusi ekskursiyalar təşkil olunur.  Lüks otaqlar və villalarda çimərlik mənzərələri olan xüsusi bir teras var. Hər otaqda Çin kabel kanalları olan bir kabel / peyk televiziyası, bir təhlükəsizlik depoziti və iş masası var. Soyuducu və çay / qəhvə hazırlayan qurğu daxildir. Hamam və duş olan xüsusi bir vanna otağı var. Çimərlik çantası, terlik və elektrikli bir çay dəsti verilir.  Kurumba Resort restoranları italyan, yapon, hind və livan mətbəxlərinə xidmət göstərir', CAST(3621.00 AS Decimal(18, 2)), CAST(5110.00 AS Decimal(18, 2)), CAST(N'2024-04-02T05:33:00.0000000' AS DateTime2), CAST(N'2024-04-09T05:34:00.0000000' AS DateTime2), 5, 1, 1, 1, 1011, 1027, 2, 0, CAST(4950.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1030, N'Maldiv-The White Harp Beach', N'ZK7521', N'White Harp Beach Beach, Hulhumale adasının sahilində, Ferry Terminal Parkından 200 metr məsafədə yerləşir. Bura bir restoran, ortaq salon və bağ daxildir. Bu 4 ulduzlu qonaq evində pulsuz bir Wi-Fi və xüsusi bir vanna otağı olan xüsusi çimərlik və kondisionerli otaqlar var. 24 saat ön masa və tur masası var.  Hər otaqda bir şkaf var. White Harp Beach Otelindəki otaqlarda masa və düz ekranlı televizor var.  Bir kontinental və ya Asiya səhər yeməyi verilir.  White Harp Beach-də bir teras var.', CAST(2651.00 AS Decimal(18, 2)), CAST(3430.00 AS Decimal(18, 2)), CAST(N'2024-04-02T05:37:00.0000000' AS DateTime2), CAST(N'2024-04-09T05:37:00.0000000' AS DateTime2), 4, 1, 1, 0, 1011, 1027, 2, 0, CAST(3211.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1031, N'Maldiv-Lux South Ari Atoll', N'ZK7965', N'LUX * South Ari Atoll''da böyük bir xidmətdən zövq alın LUX * South Ari Atoll Resort & Spa, spa, fitness mərkəzi və açıq hovuz var. Lüks açıq planlı otaqlar büllur təmiz su və tropik yaşıllıqlar ilə əhatə olunmuşdur. Otel 8 restoran və 5 bara malikdir və Maldiv adalarında motorlu və motor olmayan su idman növlərinin ən geniş seçimini təklif edir.  5 ulduzlu LUX * South Ari Atoll Resort, qaranlıq ağac mebelləri, açıq oturma yerləri və çimərlik və laguna birbaşa girmə ilə zərif otaqlar təklif edir. Düz ekranlı televizor və günəş şamları var. Otaqlar ayrıca bir qəhvə maşını və minibarla təchiz edilmişdir.  Spa müxtəlif gözəllik müalicələri və rahatlaşdırıcı masajlar təklif edir. LUX * South Ari Atollda bilyard və dart ilə bir oyun otağı var. Pulsuz Wi-Fi iş mərkəzində mövcuddur.', CAST(3100.00 AS Decimal(18, 2)), CAST(4600.00 AS Decimal(18, 2)), CAST(N'2024-04-05T05:40:00.0000000' AS DateTime2), CAST(N'2024-04-13T05:40:00.0000000' AS DateTime2), 5, 1, 1, 1, 1003, 1027, 2, 0, CAST(4399.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1032, N'Sentido Mamlouk Palace Tur', N'ZK8741', N'Bu təsis çimərliyə 5 dəqiqə gəzmək. Hurgada''da iştirak edən bu sahil təsisində xüsusi çimərlik və geniş bir bağça sahəsiylə çevrili iki böyük açıq hovuz mövcuddur. Sentido Mamlouk Palace Resort xüsusi balkonlu geniş odalarla xidmət verməkdədir.  Sentido Mamlouk Palace Resort''un açıq rənglərlə bəzədilmiş otaqları mebel balkona açılan böyük pəncərələrə malikdir. Kondisionerli otaqların hər birində peyk TV və oturma sahəsi vardır.  Obyektin beynəlxalq yeməkləri və çox müxtəlif yerli içkiləri tadabileceğiniz 1 açıq bufet restoranın yanında Asiya və Meksika yeməkləri yeyə biləcəyiniz 3 alakart restoran var.  Sentido Mamlouk Palace Resort''ta 2 tennis kortu, fitness mərkəzi və spa imkanları mövcuddur. Ayrıca çimərlik voleybolu və külək sörfü kimi müxtəlif idman fəaliyyətləri təqdim olunur.', CAST(1805.00 AS Decimal(18, 2)), CAST(2338.00 AS Decimal(18, 2)), CAST(N'2024-02-10T05:44:00.0000000' AS DateTime2), CAST(N'2024-02-17T05:44:00.0000000' AS DateTime2), 4, 1, 1, 0, 1002, 1028, 1004, 0, CAST(2135.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1033, N'Monteneqro-Marija 2 Hotel', N'ZK9524', N'Bu təsis çimərliyə 7 dəqiqəlik gəzinti mesafesində yerləşir. Historic Boutique Hotel Cattaro UNESCO tərəfindən qoruma altına alınan Qədim Kotor şəhərinin mərkəzində yerləşir. Historic Boutique Hotel Cattaro, Kotor Köhnə Şəhər Meydanında bölgənin ən böyük gecə klublarından biri olan Maximus''a ev sahibliyi etməkdədir.', CAST(3214.00 AS Decimal(18, 2)), CAST(3954.00 AS Decimal(18, 2)), CAST(N'2024-07-07T05:47:00.0000000' AS DateTime2), CAST(N'2024-07-14T05:48:00.0000000' AS DateTime2), 4, 2, 0, 0, 1009, 1029, 2, 0, CAST(3900.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1034, N'Sankt Peterburq-Rusiya Turu', N'ZK9110', N'Şirin bir bahçe temalı dekor, zəngin kahvaltı büfesi ve pulsuz Wi-Fi sunan bu 4 yıldızlı dizayn otel, Sankt-Peterburg''da Vasilyevski Adasında sessiz bir konuma malikdir. Vasileostrovskaya Metro İstasyonu 500 metr məsafədə yerləşir.  Lenexpo Sərgi Mərkəzindən yalnız 10 dəqiqəlik avtobus marşrutu, Nashotel canlı çiçək rəngləri ilə bəzədilmişdir.  Nashotel''teki geniş ses yalıtımlı odalarda düz ekran TV, kasa ve masa bulunmaktadır. Hər bir banyoda pulsuz banyo materialı, terlik, saç kurutma maşını və bornoz mövcuddur.  Nashotelin zərif La Botanique restoranında nadir lampalara sahib olan restoranlarda rus və Avropa yeməkləri istifadə edilə bilər. Həyət terrası yaz aylarında ideal bir yer təmin edir. Sitede ATM də var.  Saray Meydanı Nashotel Sankt-Peterburqdan təxminən 2 km məsafədədir. Moskovski Stansiyası 7 km məsafədədir.', CAST(340.00 AS Decimal(18, 2)), CAST(580.00 AS Decimal(18, 2)), CAST(N'2023-11-01T05:53:00.0000000' AS DateTime2), CAST(N'2023-11-11T05:53:00.0000000' AS DateTime2), 3, 1, 0, 1, 1002, 1033, 1005, 0, CAST(532.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1035, N'Sanatoriya Dubrovaya Rosha', N'ZK3777', N'"Oak Grove" sanatoriyası ekoloji cəhətdən təmiz bir meşə ərazisində yerləşir və hər kəsə sağlamlıq yaxşılaşdırma prosesinin geniş spektrini təklif edir. Digər mühüm amil Rusiya prezidentinin sanatoriya halda idarəetmə sisteminə aid edir, yüksək keyfiyyətli və xidmətləri səviyyəsi Kremlin tibb ənənəsini davam göstərilən deyir.  Sanatoriyanın yüksək ixtisaslı kadr sidik və həzm sistemi, sinir sistemi xəstəlikləri və ginekologiya, ürək-damar xəstəlikləri və kas sistemi, tiroid və maddələr mübadiləsi üçün müalicə təklif edir.  ərazisində yalnız böyüklər müalicə imkanı tapa, həm də uşaqlar üçün - (May sentyabr əməliyyat) 6 15 il qonaqlar yaş qrupu üçün müstəqil uşaq palata iş.  Ziyarətçilərə sanatoriya mükəmməl balanslaşdırılmış pəhriz proqramları təklif etməklə yanaşı fərdi qidalanma proqramlarının da inkişaf etdirilməsini təklif edəcək.  sağlamlıq bərpa və müalicə mənbə "Smirnovsky" və "Slavyan" dan mineral su qəbul verir. Tambukan gölünün terapevtik çamuru da qonaqlara təqdim edilir.', CAST(2005.00 AS Decimal(18, 2)), CAST(2950.00 AS Decimal(18, 2)), CAST(N'2023-07-07T05:56:00.0000000' AS DateTime2), CAST(N'2023-07-16T05:56:00.0000000' AS DateTime2), 5, 1, 0, 1, 1006, 1033, 1005, 0, CAST(2879.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1036, N'Moskvada - Möhtəşəm Yeni il', N'ZK3666', N'Hotel hər səhər açıq bufet səhər yeməyi xidmət edilməkdədir. Qəşəng restoranda və otelin pizzaçısında müxtəlif yeməklər təqdim olunur. Barda içkilər xidmət edilməkdədir.', CAST(850.00 AS Decimal(18, 2)), CAST(1220.00 AS Decimal(18, 2)), CAST(N'2023-12-28T06:00:00.0000000' AS DateTime2), CAST(N'2024-01-02T06:00:00.0000000' AS DateTime2), 3, 1, 1, 0, 1010, 1033, 1004, 0, CAST(1130.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1037, N'Tayland-Amata Patong Hotel', N'ZK5444', N'Pateja Patong Otağından Amata Otelə 10 dəqiqəlik məsafədə. 2 rəsmi hovuz: Sala na 1 mərhələ hovuzu və Sky na kishye zdaniya hovuzu. Tayland restoranı tikən bir oteldə. Gosti mogut pulsuz Wi-Fi.  Amata kurortu, sevimli Phuket şəhərindən 20 dəqiqəlik məsafədə yerləşir. 5 dəqiqəlik oteli Jungceylon və Bangla Road ticarət mərkəzinə aparın. Phuket beynəlxalq hava limanına qədər məsafə 40 km-dir.  Nomera və kurort otelləri zərif derevyannoy mebel və yemək otağının dekorasiyasındadır. Kiçik bir mini bar və kabel kanalları olan televizoru mənimsəyin. Otaqda xahiş edirəm bir kek tort götürün, çay / qəhvəyinizə bir az ləzzət əlavə edin.', CAST(1230.00 AS Decimal(18, 2)), CAST(1740.00 AS Decimal(18, 2)), CAST(N'2024-04-09T06:03:00.0000000' AS DateTime2), CAST(N'2024-04-15T06:04:00.0000000' AS DateTime2), 4, 1, 1, 0, 1011, 1035, 2, 0, CAST(1660.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1038, N'Tayland-Cassia Phuket Hotel', N'ZK8845', N'Otel Plyajdan 4 dəqiqəlik məsadəfə yerləşir. Otaqlar hovuz və bağ mənzərəli balkonlara malikdir. ', CAST(2105.00 AS Decimal(18, 2)), CAST(2570.00 AS Decimal(18, 2)), CAST(N'2023-06-08T06:07:00.0000000' AS DateTime2), CAST(N'2023-06-15T06:07:00.0000000' AS DateTime2), 5, 1, 1, 1, 1011, 1035, 1004, 0, CAST(2499.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1039, N'Türkiyə-POINT HOTEL TAKSIM', N'ZK4711', N'Taksim meydanından cəmi 500 m məsafədə və Lütfi Kirdar Konqres Mərkəzindən 0.6 mildən az məsafədə yerləşən Point Hotel, müasir İstanbulda pulsuz WiFi olan otaqlar təklif edir. Qonaqlar bir spa, qapalı hovuz və müasir fitness mərkəzinə pulsuz giriş əldə edə bilərlər.  Otaqların dekorasiyası yüngül və təbii rənglərdən ibarətdir. Hər otaqda sakit bir oturma və divan üçün ikiqat şüşəli şüşələr var. Buraya HD TV, Digiturk və LigTV (futbol kanalı) daxildir. Bəzi otaqlarda icra salonuna pulsuz giriş də mövcuddur.  Ən yüksək mərtəbəli View Point restoranı Boğaziçi mənzərələrini təqdim edir və səhər yeməyi, nahar və şam yeməyi üçün açıqdır. Orijinal Yapon restoranı və 2 kafe barı da var.', CAST(895.00 AS Decimal(18, 2)), CAST(1190.00 AS Decimal(18, 2)), CAST(N'2023-11-23T06:12:00.0000000' AS DateTime2), CAST(N'2023-11-28T06:12:00.0000000' AS DateTime2), 4, 1, 1, 1, 1007, 1036, 1004, 0, CAST(1150.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1040, N'Türkiyə- Möhtəşəm Kapadokya', N'ZK6662', N'Komfortlu nəqliyyat ilə gediş-dönüş  Tur rəhbər Foto çəkiliş Batumidə oteldə 1 gecə qonaqlama ( 3* hotel) Kapadokyada oteldə 2 gecə qonaqlama (3* və 4* hotel) Hoteldə Səhər yeməyi Gəzintilər Batumi şəhər gəzintisi ,Göreme, Ürgüp, Avanos, Kapadokya Forum) Toplaşma: 19 mart - 19:30 Çıxış: 19 mart- 20:00 ( 28mall qarşısı)  Dönüş: 25 mart - 20:00 (Bakı)  Qiymət 2 və ya 3 nəfərlik otaqda 1 nəfər üçün nəzərdə tutulmuşdur. Muzeylərə giriş biletləri qiymətə daxil deyil. 0-5 yaşına kimi uşaqlar nəqliyyatda və oteldə yer tutmasalar ödənişsizdir.  xüsusi qeyd : göstərilən qiymətlər 18 fevral tarixinə kimi qüvvədədir , daha sonra otellərə görə qiymətlərdə artım olunacaq. İndidən tur paket almaq istəyənlər üçün hissə-hissə ödəniş edə bilərlər', CAST(355.00 AS Decimal(18, 2)), CAST(560.00 AS Decimal(18, 2)), CAST(N'2024-03-14T06:17:00.0000000' AS DateTime2), CAST(N'2024-03-19T06:18:00.0000000' AS DateTime2), 4, 1, 0, 1, 1004, 1036, 1004, 0, CAST(515.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1041, N'Antalya-MICHELL HOTEL TUR', N'ZK5554', N'Toros dağları ilə Aralıq dənizi arasında inşa edilən Michel Hotel & Spa, yalnız 400 metr məsafədə özəl plaj sahəsinə malikdir. Oteldə açıq bir hovuz, spa mərkəzi, tennis kortu və fitness mərkəzi mövcuddur.  Müasir üslubda dekore edilmiş olan Michell Hotel & Spa düz ekran TV, klima və minibara malikdir. Hər bir otaqda dənizin görünüşü və ya bağ görünüşü olan bir balkon vardır.  Otelin əsas restoranı açıq büfe olaraq Türk və beynəlxalq mətbəxlərə xidmət göstərir. Oteldə Avropa qida xidmət edən alakart restoran mövcuddur. Günün istənilən vaxtında yerli və ya idxal olunan spirtli və spirtsiz içkilərdən də istifadə edə bilərsiniz.  Alanya şəhər mərkəzi oteldən 6 km məsafədədir. Antalya Havaalanı 130 km məsafədədir.', CAST(961.00 AS Decimal(18, 2)), CAST(1278.00 AS Decimal(18, 2)), CAST(N'2024-05-31T06:22:00.0000000' AS DateTime2), CAST(N'2024-06-08T06:22:00.0000000' AS DateTime2), 4, 1, 1, 0, 1005, 1036, 1004, 0, CAST(1230.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1042, N'Kuşadası - FANTASIA DELUXE ', N'ZK9985', N'Kuşadası''nda yer alan bu sahil otel, kapalı ve açıq bir yüzme havuzuna, spa ve fitness merkezine malikdir.Bütün otaqlar bir peyk televiziyası və mini bar ilə təchiz olunmuşdur. Fantasia Deluxe Hotel-də klimalı və çay-qəhvə qurğuları vardır.Egey dənizi mənzərələri bəzi otaqlarda səsləndirilib. Mükafatlar, sauna və Türk hamamından zövq verə bilər və ya Fantasia Deluxe-in spa və sağlamlıq klubunda masajla istirahət edə bilərsiniz.Fantasia müəssisələrinə həmçinin bir tennis kortu və bir dalış məktəbi daxildir.Allegro Restaurant qəlyanaltılar və türk pancakes təklif edir, beynəlxalq və türk mətbəxi Nostalji restoranında xidmət göstərir.Ballade Bar yerli içki və təravətli kokteyllər təklif edir. Virgin Mary Evi Hotel Fantasia Deluxe-dən 25 dəqiqəlik məsafədədir.Oteldə pulsuz park yeri mümkündür. Dilinizi danışırıq!', CAST(1100.00 AS Decimal(18, 2)), CAST(1570.00 AS Decimal(18, 2)), CAST(N'2024-06-21T06:25:00.0000000' AS DateTime2), CAST(N'2024-06-30T06:25:00.0000000' AS DateTime2), 5, 1, 1, 1, 1005, 1036, 2, 0, CAST(1400.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1043, N'Yunanıstan-Anixi Boutique TUR', N'ZK2224', N'Egey dənizində Mikonos adasında 4* lu Giannoulaki Hotelinin lüks otaq və suitlərində yayın isti günləririn dadını çıxarmaq şansı. ', CAST(1235.00 AS Decimal(18, 2)), CAST(1568.00 AS Decimal(18, 2)), CAST(N'2023-08-25T06:28:00.0000000' AS DateTime2), CAST(N'2023-09-03T06:28:00.0000000' AS DateTime2), 5, 1, 1, 1, 1003, 1037, 1004, 0, CAST(1499.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1044, N'Praqa - Hotel EhrlichTuru!', N'ZK7878', N'Praqa mərkəzində yerləşən Hotel Ehrlich, Černínova Avtobus Dayanacağı''nın dərhal yanında, şəhər mərkəzinə və O2 Arena''ya təxminən 15 dəqiqəlik uzaqlıqda xidmət verən, kondisioner ilə təchiz edilmiş müasir bir oteldir. Otaqlarda pulsuz simli internet təmin edilməkdədir.  Café Ehrlich qəlyanaltılar və desertlər təklif edir. Ortaq sahələrdə pulsuz Wi-Fi giriş mövcuddur.  Biskupcova Tramvay Dayanacağına 300 metr məsafədədir. Synotyp Arena''ya avtomobillə 8 dəqiqədə çatıla bilər.  ', CAST(641.00 AS Decimal(18, 2)), CAST(785.00 AS Decimal(18, 2)), CAST(N'2023-09-10T06:32:00.0000000' AS DateTime2), CAST(N'2023-09-15T06:32:00.0000000' AS DateTime2), 3, 1, 0, 0, 1012, 1038, 1005, 0, CAST(750.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1045, N'İspaniya Madrid-Dinastia Turu', N'ZK4444', N'Hotel Dinastia, Madridin mərkəzinə qısa bir sürücülük məsafəsindəki Getafe''de yerləşən müasir bir oteldir.  Bütün müasir və qəşəng otaqlarda düz ekran TV və pulsuz Wi-Fi girişi mövcuddur. Dinastia''da masaj stolu da vardır.  Dinastiaya bitişik yerləşən otelin öz restoranında beynəlxalq yeməklər və Şərq ləzzətləri xidmət edilməkdədir. Oteldə həmçinin geniş bir bar var.', CAST(954.00 AS Decimal(18, 2)), CAST(1265.00 AS Decimal(18, 2)), CAST(N'2023-06-18T06:35:00.0000000' AS DateTime2), CAST(N'2023-06-23T06:35:00.0000000' AS DateTime2), 4, 1, 0, 1, 1008, 1039, 1003, 0, CAST(1240.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1046, N'Florensiya-Hotel Basilea Turu', N'ZK3334', N'Hotel Basileadan Accademia Qalereyasına və Florensiya Stansiyasına gedərək 5 dəqiqədə çata bilərsiniz. Otelə çatdığınızda gülər üzlü personal sizə pulsuz şəhər xəritələri verəcəkdir. Wi-Fi girişi pulsuzdur.  Basilea, Florensiyanı gəzərək  kəşf etmək üçün uyğun bir mövqedədir. Məşhur Duomo (katedral) yalnız 5 dəqiqəlik gəzmək məsafəsindədir.  Hotel Basileanın otaqlarında kondisioner və minibar mövcuddur. Ətraf haqqında faydalı məlumatlar ala biləcəyiniz resepşnda ayrıca pulsuz əmanət kassası xidməti verilməkdədir.  Əlavə olaraq baqaj mühafizəsi xidmətindən də pulsuz olaraq faydalana bilərsiniz.  San Lorenzo, katedrallar, yemək və sənət ilə maraqlanan səyyahlar üçün gözəl bir seçimdir.', CAST(1985.00 AS Decimal(18, 2)), CAST(2350.00 AS Decimal(18, 2)), CAST(N'2023-06-12T06:38:00.0000000' AS DateTime2), CAST(N'2023-06-17T06:39:00.0000000' AS DateTime2), 4, 1, 1, 0, 1012, 1041, 2, 0, CAST(2299.00 AS Decimal(18, 2)))
INSERT [dbo].[Tours] ([Id], [Name], [Code], [Desc], [CostPrice], [SalePrice], [StartDate], [EndDate], [Rate], [PersonCount], [Transfer], [Insurance], [CategoryId], [DestinationId], [DepartureLocationId], [IsDeleted], [DiscountPrice]) VALUES (1047, N'Fairmont Hotel Singapore Turu', N'ZK7771', N'Hotel Fairmont, Bras Basah Sinqapur İncəsənət dairəsindəki City Hall Metro Stansiyasının üstündə yerləşir. Raffles City Mall-a birbaşa giriş oteldəndir. Burada 6 yemək variantı, açıq hovuz və pulsuz Wi-Fi mövcuddur.  Fairmont Singapore Hotel Raffles City Konvensiya Mərkəzində yerləşir. Esplanade Teatrı təxminən 400 metr məsafədədir. Orchard Road alış-veriş küçəsi 5 dəqiqəlik məsafədədir.  Fairmontdakı geniş otaqlar kondisionerlidir. Bəzilərinin xüsusi eyvanı var. Bəzi otaqlar şəhər səma xəttinin və Marina Bay gəzintisinin mənzərələrini təqdim edir. Rahatlıqlara kabel televiziyası və çay / qəhvə hazırlama vasitələri daxildir.  Otel, Qərb, Çin və Yapon yeməkləri ilə beynəlxalq səhər yeməyi bufetində xidmət göstərir. Asiya Market Kafesi açıq mətbəxə malikdir və halal da daxil olmaqla bir çox Asiya yeməklərinə xidmət göstərir. Qəşəng, müasir Anti: dot bar kokteyllər və tapalara xidmət edir.', CAST(2998.00 AS Decimal(18, 2)), CAST(3575.00 AS Decimal(18, 2)), CAST(N'2024-01-18T06:45:00.0000000' AS DateTime2), CAST(N'2024-01-25T06:45:00.0000000' AS DateTime2), 5, 1, 1, 1, 1008, 1045, 2, 0, CAST(3480.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Tours] OFF
GO
SET IDENTITY_INSERT [dbo].[WishlistItems] ON 

INSERT [dbo].[WishlistItems] ([Id], [TourId], [AppUserId]) VALUES (54, 1024, N'8478bf22-8cd2-4891-bb9a-30557043e79f')
INSERT [dbo].[WishlistItems] ([Id], [TourId], [AppUserId]) VALUES (59, 1043, N'8478bf22-8cd2-4891-bb9a-30557043e79f')
SET IDENTITY_INSERT [dbo].[WishlistItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([Id], [FullName], [Position], [ImageName]) VALUES (1, N'Leyla Quliyeva', N'HR', N'842eb27e-e30a-416e-9beb-51c50020bf43hr.jpg')
INSERT [dbo].[Workers] ([Id], [FullName], [Position], [ImageName]) VALUES (2, N'Rüfət Bayramov', N'CEO', N'd998ea85-5a71-47b1-a28a-756ed3f90302Ceo.jpg')
INSERT [dbo].[Workers] ([Id], [FullName], [Position], [ImageName]) VALUES (3, N'Sabina Muradova', N'Programmer', N'8fee2871-e998-4bf8-adab-282b279af217Screenshot.jpg')
INSERT [dbo].[Workers] ([Id], [FullName], [Position], [ImageName]) VALUES (1002, N'Ceyla Babayeva', N'SMM', N'1a025900-3e6e-44c8-a574-a3d0f874576eScreenshot 1.jpg')
INSERT [dbo].[Workers] ([Id], [FullName], [Position], [ImageName]) VALUES (1003, N'Nicat Əliyev', N'HelpDesk', N'09e3a2a8-8b13-4b12-a62e-a537dc96fbb1Screenshot 2.jpg')
INSERT [dbo].[Workers] ([Id], [FullName], [Position], [ImageName]) VALUES (1004, N'Fuad Səfərli', N'Finance', N'019cb4c4-4461-45ac-a8c7-be661336b1b3account.jpg')
INSERT [dbo].[Workers] ([Id], [FullName], [Position], [ImageName]) VALUES (1005, N'Fidan Məlikova', N'Call-operator', N'954961fb-cd61-4631-9a66-f305d427ce70Finance.jpg')
INSERT [dbo].[Workers] ([Id], [FullName], [Position], [ImageName]) VALUES (1006, N'Cavid Şükürov', N'Travel Agent', N'f20d10ad-f7e8-4f38-9e25-c9cde27e8c1atour.jpg')
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 23.09.2023 19:00:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 23.09.2023 19:00:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_TourId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_TourId] ON [dbo].[OrderItems]
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_AppUserId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_AppUserId] ON [dbo].[Orders]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TourImages_TourId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_TourImages_TourId] ON [dbo].[TourImages]
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TourReviews_AppUserId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_TourReviews_AppUserId] ON [dbo].[TourReviews]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TourReviews_TourId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_TourReviews_TourId] ON [dbo].[TourReviews]
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tours_CategoryId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_Tours_CategoryId] ON [dbo].[Tours]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tours_DepartureLocationId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_Tours_DepartureLocationId] ON [dbo].[Tours]
(
	[DepartureLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tours_DestinationId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_Tours_DestinationId] ON [dbo].[Tours]
(
	[DestinationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WishlistItems_AppUserId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_WishlistItems_AppUserId] ON [dbo].[WishlistItems]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WishlistItems_TourId]    Script Date: 23.09.2023 19:00:33 ******/
CREATE NONCLUSTERED INDEX [IX_WishlistItems_TourId] ON [dbo].[WishlistItems]
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TourImages] ADD  DEFAULT (CONVERT([bit],(0))) FOR [PosterStatus]
GO
ALTER TABLE [dbo].[Tours] ADD  DEFAULT ((0)) FOR [DepartureLocationId]
GO
ALTER TABLE [dbo].[Tours] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Tours] ADD  DEFAULT ((0.0)) FOR [DiscountPrice]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Tours_TourId] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tours] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Tours_TourId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[TourImages]  WITH CHECK ADD  CONSTRAINT [FK_TourImages_Tours_TourId] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tours] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourImages] CHECK CONSTRAINT [FK_TourImages_Tours_TourId]
GO
ALTER TABLE [dbo].[TourReviews]  WITH CHECK ADD  CONSTRAINT [FK_TourReviews_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TourReviews] CHECK CONSTRAINT [FK_TourReviews_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[TourReviews]  WITH CHECK ADD  CONSTRAINT [FK_TourReviews_Tours_TourId] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tours] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourReviews] CHECK CONSTRAINT [FK_TourReviews_Tours_TourId]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [FK_Tours_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [FK_Tours_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [FK_Tours_DepartureLocations_DepartureLocationId] FOREIGN KEY([DepartureLocationId])
REFERENCES [dbo].[DepartureLocations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [FK_Tours_DepartureLocations_DepartureLocationId]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [FK_Tours_Destinations_DestinationId] FOREIGN KEY([DestinationId])
REFERENCES [dbo].[Destinations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [FK_Tours_Destinations_DestinationId]
GO
ALTER TABLE [dbo].[WishlistItems]  WITH CHECK ADD  CONSTRAINT [FK_WishlistItems_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WishlistItems] CHECK CONSTRAINT [FK_WishlistItems_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[WishlistItems]  WITH CHECK ADD  CONSTRAINT [FK_WishlistItems_Tours_TourId] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tours] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WishlistItems] CHECK CONSTRAINT [FK_WishlistItems_Tours_TourId]
GO
USE [master]
GO
ALTER DATABASE [Zakher_Web] SET  READ_WRITE 
GO
