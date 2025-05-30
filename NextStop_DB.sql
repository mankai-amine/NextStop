/****** Object:  Database [nextstopbuses]    Script Date: 2024-12-19 12:41:23 PM ******/
CREATE DATABASE [nextstopbuses]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [nextstopbuses] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [nextstopbuses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nextstopbuses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nextstopbuses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nextstopbuses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nextstopbuses] SET ARITHABORT OFF 
GO
ALTER DATABASE [nextstopbuses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nextstopbuses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nextstopbuses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nextstopbuses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nextstopbuses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nextstopbuses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nextstopbuses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nextstopbuses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nextstopbuses] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [nextstopbuses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nextstopbuses] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [nextstopbuses] SET  MULTI_USER 
GO
ALTER DATABASE [nextstopbuses] SET ENCRYPTION ON
GO
ALTER DATABASE [nextstopbuses] SET QUERY_STORE = ON
GO
ALTER DATABASE [nextstopbuses] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2024-12-19 12:41:23 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2024-12-19 12:41:23 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2024-12-19 12:41:23 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2024-12-19 12:41:23 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2024-12-19 12:41:23 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2024-12-19 12:41:23 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2024-12-19 12:41:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
	[Name] [nvarchar](max) NULL,
	[ProfilePic] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2024-12-19 12:41:23 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 2024-12-19 12:41:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](max) NOT NULL,
	[Manufacturer] [nvarchar](max) NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Buses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024-12-19 12:41:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TripId] [int] NOT NULL,
	[CustomerId] [nvarchar](450) NULL,
	[NumOfPassengers] [int] NOT NULL,
	[NumOfDiscounts] [int] NOT NULL,
	[DateOfTravel] [datetime2](7) NOT NULL,
	[BookingTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 2024-12-19 12:41:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [nvarchar](450) NULL,
	[Origin] [nvarchar](max) NOT NULL,
	[Destination] [nvarchar](max) NOT NULL,
	[DepartureDay] [int] NOT NULL,
	[DepartureTime] [time](7) NOT NULL,
	[ArrivalTime] [time](7) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[BusId] [int] NOT NULL,
 CONSTRAINT [PK_Trips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241212001234_CreateDatabase', N'9.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241212193230_UpdateAppUser', N'9.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241212194740_UpdateAppU2', N'9.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241212201326_UserRoles', N'9.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241213180127_bustrip', N'9.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241213191004_bustrip2', N'9.0.0')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'13a57245-4660-49df-b314-4e5eff12bb4f', N'Customer', N'CUSTOMER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'207c132e-7aa9-4195-b815-eb012e5eabdf', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6eb35140-683b-43ad-8281-f90740c947b1', N'Driver', N'DRIVER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'05c0fa4f-8a0b-4d41-9da1-d469224e1c09', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1b722c38-9255-47b2-ad81-c957d3379a2d', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2feda83b-8c4a-4ea0-8ed4-4c27782b9c4a', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'75581ab3-b894-45df-8fea-816793f0384e', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7e1d1cc1-6f0a-46e4-ab29-cd164185d6a4', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7e85cf28-a607-413d-889e-b654daa7b40e', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bb13bf35-438d-4f49-9b97-770fb7cac893', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bceab819-e621-4634-a901-a782f3904b70', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c4c2f616-21a1-4f9c-a380-b8bba5cfb68b', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e185360c-8c76-42b4-b065-a41ddc429e66', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ec58edd5-cc04-410e-9512-009818eec519', N'13a57245-4660-49df-b314-4e5eff12bb4f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29c265b0-cc0d-42c9-8261-5c2a41c1244f', N'207c132e-7aa9-4195-b815-eb012e5eabdf')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'36aa5a68-4bde-474b-abc2-15af32d7ef8e', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6a859510-b59e-4b1b-ad7b-35d937bc002f', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7310106e-9e0b-4dc9-9388-7d41666bfcd3', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'732eb55e-ca32-4da6-9949-6bd4ec4973d0', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'87dd9f33-3e39-4cd8-936a-3edc1002bb09', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'89d4383b-442d-4cc7-85d8-ef868e79ce40', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9194d44e-758e-44ad-b02e-cc7ed6999560', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c1a73f4a-30fa-4414-8bfe-ec5c5c09fe77', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd353e3f9-f982-4263-9f7b-443aefd4b4cb', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e5d24ce0-e4f3-40b0-9513-a475f6122967', N'6eb35140-683b-43ad-8281-f90740c947b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f5d442a1-67b3-40ee-92bc-cab005342dfd', N'6eb35140-683b-43ad-8281-f90740c947b1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'05c0fa4f-8a0b-4d41-9da1-d469224e1c09', N'seano3', N'SEANO3', N'seano3@sean.com', N'SEANO3@SEAN.COM', 0, N'AQAAAAIAAYagAAAAEE9+uabSpo0iQVExYaK1MdWrtZ0Nztv13rUWFy8k7Todwb6JaocwnO4bmSoCQHcH+Q==', N'B6NZEO3HLXLZ37DWAD6NGSSNS4PSKMGQ', N'0264882b-fd7f-4a18-a027-b0d189fa7522', NULL, 0, 0, NULL, 1, 0, N'Seano, the third', N'https://nextstopblobs.blob.core.windows.net/profilepictures/8aa7cb1f-229d-4539-9f64-f953d019287e.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'0da67a43-3202-4adf-ae1a-39fb2bed5b28', NULL, NULL, NULL, NULL, 0, NULL, N'63b87260-f9ca-41f9-8586-07c58a7c83be', N'af727434-38b5-43d2-a49e-566d15e623f0', NULL, 0, 0, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'1b722c38-9255-47b2-ad81-c957d3379a2d', N'seano4', N'SEANO4', N'seano4@sean.com', N'SEANO4@SEAN.COM', 0, N'AQAAAAIAAYagAAAAEOBfFTgMQn0f/CWXSUzpZCqC0tVrugfrgVRXOVyUjPLnHDm2FeDIsAMI8KFhqEsTdg==', N'UI3E76D574UBDUVVF5LNYTFYU4U34DOA', N'5720f227-fce0-4160-8f6a-d85eac0b3cf3', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'29c265b0-cc0d-42c9-8261-5c2a41c1244f', N'admin', N'ADMIN', N'admin@nextstop.com', N'ADMIN@NEXTSTOP.COM', 1, N'AQAAAAIAAYagAAAAEIfc/dVo2kwZ6S9/95wcT5gCnoRf68YI21ApKp/IcpfgKT7SbUK12/ht98yHaoSWEg==', N'6JNANWVUOHJOOAGZ6Y6TIODZM6SGP7ZH', N'2ea5df9c-4e0a-4313-8ad8-3f40aa6bf0a8', NULL, 0, 0, NULL, 1, 0, N'Administrator', N'https://nextstopblobs.blob.core.windows.net/profilepictures/12e01587-24ab-48f7-8ac0-ab4e0e1f1199.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'2feda83b-8c4a-4ea0-8ed4-4c27782b9c4a', N'seanotest1', N'SEANOTEST1', N'seanotest1@test.com', N'SEANOTEST1@TEST.COM', 0, N'AQAAAAIAAYagAAAAELp4QlifSwFRCksb6y+/YOjcs74SpvfuhQdO/2YzFU99QURXgYw8Dnb0JzffiwHuAA==', N'XNUZIYEEW2OVPON25OS7SXW4OHMLIQ3P', N'28b94d20-f0b3-47cd-8e71-3839ab44ed60', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'36aa5a68-4bde-474b-abc2-15af32d7ef8e', N'teddriver', N'TEDDRIVER', N'teddriver@nextstop.com', N'TEDDRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAELBdDv3ZKdGXhHxDw2KwxIbFaml5HK3l6gU2uFuTgaatFGM0KMdp5pjTe7rGpKT9rw==', N'4PWIWSOVEZYMSZC7GJGVEANDYO5GAV5A', N'6e94e9b3-0865-478e-b937-ab0817eb0d5c', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'48e19044-9115-4c3d-8b54-fe610c991440', NULL, NULL, NULL, NULL, 0, NULL, N'0cb45242-a3af-4796-8385-6c47bbc14545', N'1f73531b-432d-4cbe-a13b-1f4a22026308', NULL, 0, 0, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'4b1f4444-e994-4026-b29a-8b1c1be439e3', NULL, NULL, NULL, NULL, 0, NULL, N'd95fdf76-ea96-45c1-9c4f-e530b03d1b1e', N'9ff82722-4d81-4363-a23c-4725234e6bbc', NULL, 0, 0, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'6a859510-b59e-4b1b-ad7b-35d937bc002f', N'seandriver', N'SEANDRIVER', N'seandriver@nextstop.com', N'SEANDRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAEJqRYIn0tzx5lutx7ZD3fF1xDKy4674ZgydGltrWQcV5d2sCAqkFCK38iXQcxwkwpg==', N'NLV66IZLFGENI5BFLHQD44PS2L7YHLEN', N'52ab079b-cb3b-4106-8a3f-9792e0914d06', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'7310106e-9e0b-4dc9-9388-7d41666bfcd3', N'amdriver', N'AMDRIVER', N'amdriver@mail.com', N'AMDRIVER@MAIL.COM', 0, N'AQAAAAIAAYagAAAAEHhWye28hL4zfh7i61SgL8PZ3VAelsblSPmJCEYHttAhx6Endyobw+PMD2OgD2EJUA==', N'W2JCD55BFBGE6RXXAOG7G3R4X54YOCO3', N'505fa715-bb7c-4139-8d0f-b2a42991ee82', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'732eb55e-ca32-4da6-9949-6bd4ec4973d0', N'bobtest', N'BOBTEST', N'bobtest@nextstop.com', N'BOBTEST@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAEHyP9ONtoq8XcmPh6cT+TQvls6B2BE5bLADzmjKa7N2ZewL/tG0rPCL8MZXrMe/Mmw==', N'RVBKKURQBE4RUYGY64NHDIFGO56TLBND', N'9bdbd5a4-24fc-4816-bef7-3b1b813387dd', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'75581ab3-b894-45df-8fea-816793f0384e', N'seano6', N'SEANO6', N'seano6@sean.com', N'SEANO6@SEAN.COM', 0, N'AQAAAAIAAYagAAAAEP4s8hFu76mZvcyh4GUhuh2X7jTdLbsVxxlYwAuPDgDtM1e+PxrOHrGUOMVHURQNyg==', N'VHXB2AHGLTR7OAMVHDX6ZOTW6TXTCDLC', N'8019e2eb-8299-4d6b-abbe-b93d712621c6', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'7e1d1cc1-6f0a-46e4-ab29-cd164185d6a4', N'seano5', N'SEANO5', N'seano5@sean.com', N'SEANO5@SEAN.COM', 0, N'AQAAAAIAAYagAAAAEG5FMRkJ72JK6seiRBTOKCC8vydE/lowq0SkEiDnxPArDSuO/1477OIn6eK2fE3X6w==', N'XBVA2KQDTUH3T6I2RGM47QH6YRPPNWLU', N'29369979-4fe8-4dc0-8253-b28b9d2e7ca4', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'7e85cf28-a607-413d-889e-b654daa7b40e', N'webappuser', N'WEBAPPUSER', N'webappuser@web.com', N'WEBAPPUSER@WEB.COM', 0, N'AQAAAAIAAYagAAAAEJL/pCKo5lSRaUX/WIQUV/t+NninzLIfHJikNIiTM4n76hSA2uHmh93aTVHVoWb8ZA==', N'LPYTMZEH7W3JKI6QTFXF7Z4QCCPUAI7Z', N'b10ce124-9d8c-48c0-8be9-b1ab9aa85fbd', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'87dd9f33-3e39-4cd8-936a-3edc1002bb09', N'zachdriver', N'ZACHDRIVER', N'zachdriver@nextstop.com', N'ZACHDRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAEBsNdzCSTQOho2BnQ/6WSjQvGF5FuiN9X97pNEg01eJ7pXRECmw/xbknI14S38N4Ag==', N'JZOWQSWVRJDBSW2UN3FAII3U7TRFRDGH', N'3b7389fc-ce42-4e9d-a7b4-cf53b11ef222', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'89d4383b-442d-4cc7-85d8-ef868e79ce40', N'bestdriver', N'BESTDRIVER', N'bestdriver@mail.com', N'BESTDRIVER@MAIL.COM', 0, N'AQAAAAIAAYagAAAAEHdUdOmp6/5E8CtiH6XhCfWa6QegKlFniCvY3tunD4MDoQzTP0+zMtltqdJcx9g1MA==', N'K3AOXB2NWHHKEMCYWHRK6WBSKLESHJNM', N'bc5c5c00-62c5-4028-8bee-4c152400d0bb', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'8f0f7ff6-1025-4c21-a895-cedfe0cd4806', NULL, NULL, NULL, NULL, 0, NULL, N'7dc89f37-b22a-40c1-a2e4-96ddc5f9ee37', N'584e3465-0ce5-4a9d-a97e-fd6d8173b19d', NULL, 0, 0, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'9194d44e-758e-44ad-b02e-cc7ed6999560', N'janedriver', N'JANEDRIVER', N'janedriver@nextstop.com', N'JANEDRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAEF/KeSZgtqA51JVCJtShfN9wzlA6kVkXFRI/+Es9NsMci+yhN5EhfVqV22j96efOEg==', N'GJLKX2YZKQO22TZJCQBL2LSJW2WI2DBZ', N'5e0a6a29-f8b8-4748-9818-e1af3a6cc2c2', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'9fd64818-e3bf-4104-b62b-98be387da9f2', NULL, NULL, NULL, NULL, 0, NULL, N'eaec09be-acb5-4582-ae71-eea1d91feeb2', N'fefbba94-1cf5-4a74-ada2-a328be4eff2d', NULL, 0, 0, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'bb13bf35-438d-4f49-9b97-770fb7cac893', N'james', N'JAMES', N'jamesuser@email.com', N'JAMESUSER@EMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBzowA0lqUqm4hVxdqOuTQUcg00GgYyDNWmmfr94atLDDKwwkBfx/CsIzICFN1s0/Q==', N'XMM4L63VSSLZ2ZVNW27UNX4PJF6P6F2C', N'c1728bd9-7740-4b06-9912-af901a423ee7', NULL, 0, 0, NULL, 1, 0, N'James bond', N'https://nextstopblobs.blob.core.windows.net/profilepictures/6d693e34-5310-4074-a876-116f639b668a.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'bceab819-e621-4634-a901-a782f3904b70', N'amuser', N'AMUSER', N'amuser@mail.com', N'AMUSER@MAIL.COM', 0, N'AQAAAAIAAYagAAAAEAB7OuGgZtkfCW6ZA7g1RwnoCPiSElpCEP+mlY+Gl/Tw8XF1LRkYIhN2ncK9yQ/PyQ==', N'E2EQT3LQKDOMU5JAALVHCOQCYPD4DCOV', N'7220ee18-ac8b-4c9c-9684-fe4f14cb69a3', NULL, 0, 0, NULL, 1, 0, N'Amine', N'https://nextstopblobs.blob.core.windows.net/profilepictures/39333694-21be-4923-a76b-097fd7e5c8d1.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'c1a73f4a-30fa-4414-8bfe-ec5c5c09fe77', N'javedriver', N'JAVEDRIVER', N'jakedriver@nextstop.com', N'JAKEDRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAENWpk41mCypXe8Ow9ytbD/K97S2+ZWNzuqY5D38tZYTZ1hdjT8vUy0pdbCduLq0XSw==', N'S7RQFCHHFJZZXA5CRFRMIQA3VWNGQ5W3', N'1b182c49-55ac-4340-9d37-f9102b6caa06', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'c4c2f616-21a1-4f9c-a380-b8bba5cfb68b', N'joedriver', N'JOEDRIVER', N'joedriver@nextstop.com', N'JOEDRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAEKPur++fuHEpSl+FtQGT2Byso5dcQx9BQXGK2qxwxVroo0TlxUXOHgSgG3Qd8PRouw==', N'G7X24WTVXCVIQICUN5SHHVLLU5B4MFTL', N'aa9e6020-1926-4318-bacd-bb2c79aba21b', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'c8e39225-2b41-4a7e-9ab9-8004daa49003', NULL, NULL, NULL, NULL, 0, NULL, N'45ae3033-eff3-4c66-b6a6-22bb3919a674', N'41684beb-9fcf-4f87-b890-1b0909dd3f49', NULL, 0, 0, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'cffb24cb-11d1-4ec1-904f-e1039f7efec7', N'amine@mail.com', N'AMINE@MAIL.COM', N'amine@mail.com', N'AMINE@MAIL.COM', 0, N'AQAAAAIAAYagAAAAEM/91QWobId9nHN6hxigvGUHx8QjFE1FKiQuqclKztQxP2eXN+BsAlNNQxIyeHMJZw==', N'4674VCH46DEXFT22LTVTNUXPZC5E5CR4', N'11b5e57c-2d23-45fc-8613-ca72462e232d', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'd2bb3011-f5cd-4b62-8ebf-9933c4ba24dc', NULL, NULL, NULL, NULL, 0, NULL, N'6e5467fa-d075-4ae7-856f-36b6023aaaa9', N'1d6e66a3-3994-48fa-90c4-83be34a3339f', NULL, 0, 0, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'd353e3f9-f982-4263-9f7b-443aefd4b4cb', N'bobdriver', N'BOBDRIVER', N'bobdriver@nextstop.com', N'BOBDRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAEMpNV5StePnczw6lvFwlRlLZaKo2vl1fhXQ5oDI/mhF1o2U0HOyblwaYAvZi6Mu1JA==', N'6DCEQIMUCX54K7U2KXMGO32XU7QTG5BX', N'd5e7da8a-567b-43e9-9c2b-5cbbf9effda8', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'd71d65b8-cdab-4762-85ea-234c8a1fbf1a', N'seano2', N'SEANO2', N'seano2@sean.com', N'SEANO2@SEAN.COM', 0, N'AQAAAAIAAYagAAAAEPT5qf39xB03gyxJOBD44FybAe38LdGmOkRy8E4eUTAFZ2djZIedLZttrNV+rnMGhQ==', N'JOUXSFMNMTAYKO5EK6ES65U5WUTGT5CJ', N'e9617d09-36dc-42db-a63f-8f960a66fe0f', NULL, 0, 0, NULL, 1, 0, N'seano2!', N'https://nextstopblobs.blob.core.windows.net/profilepictures/9c5c300f-ae9c-42e0-8687-53dd1c84beac.png')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'de2a9ace-9f0c-4788-a20f-949857b6e27c', NULL, NULL, NULL, NULL, 0, NULL, N'16f5d49d-78e6-47e1-83c8-f67822bbe967', N'419f4208-1b1f-4267-b949-406a30594eb2', NULL, 0, 0, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'e185360c-8c76-42b4-b065-a41ddc429e66', N'bobuser', N'BOBUSER', N'bobuser@email.com', N'BOBUSER@EMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGqCvJw3Dg0zdDUtyOprOOoazLWBhtMmp6jXnlW7DLN4cNTJbMrIV1nJvqTyYNt7mg==', N'REI6JDEYIYMCJJJQFOZEYIDYLO5M4XKF', N'0891dcfe-6332-44eb-bd19-2d8f182aaebd', NULL, 0, 0, NULL, 1, 0, N'Bob', N'https://nextstopblobs.blob.core.windows.net/profilepictures/c43f1a48-cca5-4b08-9f6a-377cd547093f.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'e32fe71e-d4c9-47d3-8aac-86e323f9deb2', N'seano', N'SEANO', N'seano@sean.com', N'SEANO@SEAN.COM', 0, N'AQAAAAIAAYagAAAAEEpv2y3YKMrNdn68Jh3J81VKNzHADk2NXQEmuOVaIOBLq63aEKDwAi0l58IMrzLy8Q==', N'3B2BOXEOEWUM7TDHFNMGQMI3EQLTLDE3', N'93716121-27f8-4844-9a2d-89faa15965d2', NULL, 0, 0, NULL, 1, 0, N'Seano, the first of many!', N'https://nextstopblobs.blob.core.windows.net/profilepictures/53063964-688f-4aa6-857d-f6e31be2b557.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'e5d24ce0-e4f3-40b0-9513-a475f6122967', N'claradriver', N'CLARADRIVER', N'claradriver@nextstop.com', N'CLARADRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAEKh5tau10Pyqp90zdnO4wIMfIn6e9Vs6lAQNknSqnVtP08zM08EnHoqdJtF/mnZ2ng==', N'INQNVIXAE4RNM53CEZXIGZAQ6HX6OXNG', N'd1ff5d43-16e4-4213-9bee-16ac5f01f086', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'ec58edd5-cc04-410e-9512-009818eec519', N'blorbuser', N'BLORBUSER', N'blorbuser@blorb.com', N'BLORBUSER@BLORB.COM', 0, N'AQAAAAIAAYagAAAAEDvd1euvnrwF0dUExh+5MeXrjzsIiEY8Dr9m4pP3Xu+gLcEOJx1/bDOnJc61wEIgHg==', N'2VG33XT6LNUAG3CHLL5U2IKFKXULKTSV', N'178b95c0-df0d-440f-840c-c880fb0ecdf7', NULL, 0, 0, NULL, 1, 0, N'Blorb', N'https://nextstopblobs.blob.core.windows.net/profilepictures/9790ddf5-f0e3-49ad-8667-68a881d67008.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [ProfilePic]) VALUES (N'f5d442a1-67b3-40ee-92bc-cab005342dfd', N'johndriver', N'JOHNDRIVER', N'johndriver@nextstop.com', N'JOHNDRIVER@NEXTSTOP.COM', 0, N'AQAAAAIAAYagAAAAEKhQimQ+lWbxKIqfu1FaogUpbrSU4sslpiDsXNGKTFiYLUYENX4+WT9s94aJILEA5Q==', N'BQNO2KNS57HCDK7IFV2PQ7FEFQZXBGJO', N'fb5c2c72-bc0c-4dec-a178-22d62988e9f5', NULL, 0, 0, NULL, 1, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([Id], [Model], [Manufacturer], [Capacity]) VALUES (1, N'Volvo 9700', N'Volvo', 50)
INSERT [dbo].[Buses] ([Id], [Model], [Manufacturer], [Capacity]) VALUES (2, N'Mercedes-Benz Tourismo', N'Mercedes-Benz', 45)
INSERT [dbo].[Buses] ([Id], [Model], [Manufacturer], [Capacity]) VALUES (3, N'Scania Interlink HD', N'Scania', 60)
INSERT [dbo].[Buses] ([Id], [Model], [Manufacturer], [Capacity]) VALUES (4, N'Minibus Express Lite', N'The Tiny Bus Company', 3)
SET IDENTITY_INSERT [dbo].[Buses] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (1, 1, N'bceab819-e621-4634-a901-a782f3904b70', 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-15T17:45:07.0270021' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (2, 3, N'bceab819-e621-4634-a901-a782f3904b70', 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-15T19:08:38.0003428' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (3, 3, N'bceab819-e621-4634-a901-a782f3904b70', 2, 0, CAST(N'2024-12-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-15T19:14:12.0007034' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (4, 1, N'bceab819-e621-4634-a901-a782f3904b70', 1, 0, CAST(N'2024-12-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-15T19:19:21.0006469' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (5, 7, N'bceab819-e621-4634-a901-a782f3904b70', 1, 0, CAST(N'2024-12-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-16T01:03:37.0008899' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (6, 7, NULL, 1, 0, CAST(N'2024-12-20T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-16T17:46:25.0009463' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (7, 7, N'bceab819-e621-4634-a901-a782f3904b70', 2, 0, CAST(N'2024-12-27T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-16T19:32:59.0008156' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (8, 1, N'bceab819-e621-4634-a901-a782f3904b70', 1, 0, CAST(N'2024-12-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-16T19:38:52.0005701' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (9, 1, N'bceab819-e621-4634-a901-a782f3904b70', 2, 0, CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-16T22:46:59.0003432' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (10, 7, N'bceab819-e621-4634-a901-a782f3904b70', 3, 0, CAST(N'2024-12-27T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-16T22:55:10.0000034' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (11, 6, N'bceab819-e621-4634-a901-a782f3904b70', 2, 0, CAST(N'2024-12-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-16T23:01:29.0008035' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (12, 1, N'bceab819-e621-4634-a901-a782f3904b70', 2, 1, CAST(N'2024-12-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-16T23:14:42.0000571' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (13, 5, N'e32fe71e-d4c9-47d3-8aac-86e323f9deb2', 4, 2, CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T01:07:00.0003890' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (14, 1, N'e32fe71e-d4c9-47d3-8aac-86e323f9deb2', 40, 0, CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T01:11:20.0008421' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (15, 1, N'e32fe71e-d4c9-47d3-8aac-86e323f9deb2', 8, 0, CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T01:16:27.0005949' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (16, 1, N'bceab819-e621-4634-a901-a782f3904b70', 2, 1, CAST(N'2024-12-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T14:03:22.0009452' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (17, 5, N'd71d65b8-cdab-4762-85ea-234c8a1fbf1a', 1, 0, CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T14:06:37.0009718' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (18, 6, N'e32fe71e-d4c9-47d3-8aac-86e323f9deb2', 1, 0, CAST(N'2024-12-19T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T15:29:36.0005255' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (19, 10, N'd71d65b8-cdab-4762-85ea-234c8a1fbf1a', 1, 0, CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T15:47:31.0007169' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (20, 10, N'd71d65b8-cdab-4762-85ea-234c8a1fbf1a', 1, 0, CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T15:47:30.0009372' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (21, 5, N'd71d65b8-cdab-4762-85ea-234c8a1fbf1a', 1, 0, CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T15:48:55.0007736' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (22, 5, N'd71d65b8-cdab-4762-85ea-234c8a1fbf1a', 1, 0, CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T15:48:55.0008200' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (23, 6, N'd71d65b8-cdab-4762-85ea-234c8a1fbf1a', 1, 0, CAST(N'2024-12-19T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T15:49:38.0009139' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (24, 4, N'bceab819-e621-4634-a901-a782f3904b70', 1, 0, CAST(N'2024-12-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T16:05:09.0009766' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (25, 6, N'bceab819-e621-4634-a901-a782f3904b70', 1, 0, CAST(N'2024-12-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T16:06:29.0005408' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (26, 10, N'bceab819-e621-4634-a901-a782f3904b70', 1, 0, CAST(N'2024-12-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T16:08:10.0000540' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (27, 6, N'bceab819-e621-4634-a901-a782f3904b70', 1, 0, CAST(N'2024-12-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T16:20:07.0006972' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (28, 10, N'd71d65b8-cdab-4762-85ea-234c8a1fbf1a', 1, 0, CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-17T17:14:20.0002938' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (29, 6, N'bceab819-e621-4634-a901-a782f3904b70', 1, 0, CAST(N'2024-12-19T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-18T16:19:19.0008824' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (30, 7, N'e185360c-8c76-42b4-b065-a41ddc429e66', 1, 0, CAST(N'2024-12-20T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-18T20:19:12.0003522' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (31, 12, N'ec58edd5-cc04-410e-9512-009818eec519', 2, 1, CAST(N'2024-12-27T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-19T13:27:27.0006641' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [TripId], [CustomerId], [NumOfPassengers], [NumOfDiscounts], [DateOfTravel], [BookingTime]) VALUES (32, 7, N'bb13bf35-438d-4f49-9b97-770fb7cac893', 2, 1, CAST(N'2024-12-27T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-19T14:08:29.0008904' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (1, N'9194d44e-758e-44ad-b02e-cc7ed6999560', N'Montreal', N'Ottawa', 1, CAST(N'08:30:00' AS Time), CAST(N'11:00:00' AS Time), CAST(35.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (2, N'd353e3f9-f982-4263-9f7b-443aefd4b4cb', N'Toronto', N'Montreal', 5, CAST(N'14:00:00' AS Time), CAST(N'20:30:00' AS Time), CAST(120.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (3, N'e5d24ce0-e4f3-40b0-9513-a475f6122967', N'Vancouver', N'Calgary', 6, CAST(N'09:45:00' AS Time), CAST(N'16:00:00' AS Time), CAST(150.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (4, N'f5d442a1-67b3-40ee-92bc-cab005342dfd', N'Quebec City', N'Saint John', 6, CAST(N'08:45:00' AS Time), CAST(N'15:00:00' AS Time), CAST(120.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (5, N'9194d44e-758e-44ad-b02e-cc7ed6999560', N'Calgary', N'Edmonton', 3, CAST(N'08:15:00' AS Time), CAST(N'10:45:00' AS Time), CAST(22.50 AS Decimal(18, 2)), 2)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (6, N'd353e3f9-f982-4263-9f7b-443aefd4b4cb', N'Manitoba', N'Vancouver', 4, CAST(N'14:15:00' AS Time), CAST(N'17:30:00' AS Time), CAST(35.50 AS Decimal(18, 2)), 3)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (7, N'e5d24ce0-e4f3-40b0-9513-a475f6122967', N'Victoria', N'Yellowknife', 5, CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(48.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (8, N'f5d442a1-67b3-40ee-92bc-cab005342dfd', N'Ottawa', N'Montréal', 1, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), CAST(35.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (9, N'89d4383b-442d-4cc7-85d8-ef868e79ce40', N'Moncton', N'Saskatoon', 5, CAST(N'06:00:00' AS Time), CAST(N'17:00:00' AS Time), CAST(50.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (10, N'7310106e-9e0b-4dc9-9388-7d41666bfcd3', N'Montréal', N'Québec City', 3, CAST(N'10:15:00' AS Time), CAST(N'15:00:00' AS Time), CAST(45.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (11, N'36aa5a68-4bde-474b-abc2-15af32d7ef8e', N'New York', N'Montreal', 6, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), CAST(25.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (12, N'89d4383b-442d-4cc7-85d8-ef868e79ce40', N'Winnipeg', N'Montreal', 5, CAST(N'05:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(50.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (13, N'89d4383b-442d-4cc7-85d8-ef868e79ce40', N'Saskatoon', N'Winnipeg', 3, CAST(N'05:00:00' AS Time), CAST(N'09:00:00' AS Time), CAST(20.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Trips] ([Id], [DriverId], [Origin], [Destination], [DepartureDay], [DepartureTime], [ArrivalTime], [Price], [BusId]) VALUES (14, N'87dd9f33-3e39-4cd8-936a-3edc1002bb09', N'Toronto', N'Nowhere', 4, CAST(N'05:00:00' AS Time), CAST(N'17:00:00' AS Time), CAST(25.25 AS Decimal(18, 2)), 3)
SET IDENTITY_INSERT [dbo].[Trips] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_TripId]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_TripId] ON [dbo].[Orders]
(
	[TripId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Trips_BusId]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Trips_BusId] ON [dbo].[Trips]
(
	[BusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Trips_DriverId]    Script Date: 2024-12-19 12:41:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Trips_DriverId] ON [dbo].[Trips]
(
	[DriverId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Trips] ADD  DEFAULT ((0)) FOR [BusId]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_CustomerId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Trips_TripId] FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Trips_TripId]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_Trips_AspNetUsers_DriverId] FOREIGN KEY([DriverId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_Trips_AspNetUsers_DriverId]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_Trips_Buses_BusId] FOREIGN KEY([BusId])
REFERENCES [dbo].[Buses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_Trips_Buses_BusId]
GO
ALTER DATABASE [nextstopbuses] SET  READ_WRITE 
GO
