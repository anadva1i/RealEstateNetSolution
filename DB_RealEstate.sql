USE [DB_RealEstate]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](100) NOT NULL,
	[ContentId] [int] NOT NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConnectedUsers]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConnectedUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User1] [int] NOT NULL,
	[User2] [int] NOT NULL,
 CONSTRAINT [PK_ConnectedUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](10) NOT NULL,
	[Symbol] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrentStatus]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContentId] [int] NOT NULL,
 CONSTRAINT [PK_CurrentStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPs]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IPs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Abbr] [nvarchar](5) NOT NULL,
	[Flag] [nvarchar](max) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[Latitude] [decimal](10, 8) NULL,
	[Longitude] [decimal](11, 8) NULL,
	[CityId] [int] NOT NULL,
	[Zip] [int] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaUrl] [nvarchar](max) NOT NULL,
	[PropertyId] [int] NOT NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConnectedUserId] [int] NOT NULL,
	[SenderId] [int] NOT NULL,
	[Message] [nvarchar](300) NULL,
	[SendingDate] [datetime] NOT NULL,
	[Seen] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PropertySize] [decimal](18, 2) NOT NULL,
	[PropertyTypeId] [int] NULL,
	[StatusId] [int] NULL,
	[StateId] [int] NULL,
	[CadastralCode] [nvarchar](20) NULL,
	[Floor] [int] NULL,
	[Floors] [int] NULL,
	[Rooms] [int] NOT NULL,
	[Bedrooms] [int] NOT NULL,
	[CeilingSize] [decimal](18, 2) NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[WholePrice] [decimal](18, 2) NOT NULL,
	[DatePublished] [datetime] NOT NULL,
	[UserDetailsId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Bathrooms] [int] NULL,
	[Garages] [int] NULL,
	[LocationId] [int] NULL,
	[CurrentStatusId] [int] NULL,
	[CurrencyId] [int] NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyContent]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[propertyId] [int] NOT NULL,
	[contentId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyFeature]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyFeature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
	[Availability] [bit] NOT NULL,
 CONSTRAINT [PK_PropertyFeature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyServices]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyServices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServicesId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[ActivationDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PropertyServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyType]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyViews]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyViews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[IpId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyViews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] NOT NULL,
	[UserDetailsId] [int] NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
	[PropertyId] [int] NOT NULL,
	[Stars] [int] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialMediaLinks]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialMediaLinks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SocialMediaLinks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translations]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[LanguageId] [int] NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivities]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[VisitorId] [int] NULL,
	[PropertyId] [int] NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_UserActivities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 11/4/2021 6:11:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[Name] [nvarchar](128) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[LocationId] [int] NULL,
	[UserDetailsId] [int] NULL,
	[Picture] [nvarchar](max) NULL,
	[Website] [nvarchar](128) NULL,
	[Landscaping] [decimal](18, 2) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202011210953542_InitialCreate', N'RealEstateNet.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E2F70FE83A0A79E22B572E92EF604F616A9939C137473C13ABBE8DB82966847588952452A9BE0A0BFEC3CF427F52F9CA144C9122FBAD88AED140B2C2C72F8CD70382487C361FEFADF9FE39F9FC2C07AC409F52332B18F4687B685891B793E594EEC942D7E7C67FFFCFE1FDF8D2FBCF0C9FA5CD09D703A6849E8C47E602C3E751CEA3EE010D151E8BB4944A3051BB951E8202F728E0F0FFFE51C1D3918206CC0B2ACF1C794303FC4D9077C4E23E2E298A528B88E3C1C50510E35B30CD5BA4121A63172F1C4FE885170411962F806B3514E6F5B67818F4096190E16B68508898000243DFD44F18C251159CE622840C1FD738C816E81028A450F4E57E45D3B7378CC3BE3AC1A16506E4A5914F6043C3A11DA71E4E66BE9D82EB507FABB003DB367DEEB4C8713FBCAC359D1C7280005C80C4FA741C28927F675C9E28CC65CD345C3510E799900DCB728F93AAA221E589DDB1D94D6743C3AE4FF0EAC691AB034C113825396A0E0C0BA4BE781EFFE8A9FEFA3AF984C4E8EE68B93776FDE22EFE4ED4FF8E44DB5A7D057A0AB1540D15D12C53801D9F0A2ECBF6D39F5768EDCB06C5669936B056C0926866D5DA3A70F982CD9034C99E377B675E93F61AF2811C6F589F8308FA0114B52F8BC498300CD035CD63B8D3CF9FF0D5C8FDFBC1D84EB0D7AF497D9D04BFC61E22430AF3EE220ABA50F7E9C4FAFDA787F1164974914F2EFBA7DE5B55F66519AB8BC339191E41E254BCCEAD28D9D95F17632690E35BC5917A8FB6FDA5C52D5BCB5A4BC43EBCC8482C5B6674321EFCBF2ED6C7167710C83979916D74893C1E9B6AB91D4FEC0AA51ADCCE7A8ABF910E8D6DF7935BC08911F0CB01C76E002BEC8C24F425CF6F297088C0F91DE32DF214A6135F0FE83E84383E8F07300D167D84D1330D2194361FCE2DCEE1E22826FD270CE6D7F7BBC061B9AFB6FD1257259945C10DE6A63BC0F91FB354AD905F1CE610A7F626E01C83FEFFDB03BC020E29CB92EA6F4128C197BD3085CED02F08AB093E3DE707C89DAB53B320D901FEAFD116931FD5290AE7C123D85E29718C874BE4993A81FA2A54FBA895A909A45CD295A4515647D45E560DD24159466413382563973AAC1BCBD6C848677F732D8FDF7F736DBBC4D6B41458D335821F1BF31C1092C63DE1D620C276435025DD68D5D380BD9F071A62FBE37659C3EA3201D9AD55AB3215B04869F0D19ECFECF864C4C287EF43DEE9574380415C400DF895E7FBE6A9F739264DB9E0EB56E6E9BF976D600D37439A33472FD6C1668C25F227851971F7C38AB3D9291F7468E8640C7C0D07DBEE54109F4CD968DEA969CE300336C9DB97978708AA88B3C558DD021AF8760C58EAA116C1515A90BF783C2132C1D27BC11E287200A33D5274C9D163E71FD1805AD5A925A76DCC278DF4B1E72CD398E31E10C5B35D185B93E08C20528F94883D2A6A1B153B1B866433478ADA6316F736157E3AEC426B662932DBEB3C12E85FFF62286D9ACB12D1867B34ABA08600CE8EDC240C559A5AB01C807977D3350E9C4643050E1526DC540EB1ADB8181D655F2EA0C343FA2761D7FE9BCBA6FE6593F286F7F5B6F54D70E6CB3A68F3D33CDDCF784360C5AE04435CFF339AFC44F4C73380339C5F98C0A575736110E3EC3AC1EB259F9BB5A3FD46906918DA8097065682DA0E22A50015226540FE18A585EA374C28BE8015BC4DD1A61C5DA2FC1566C40C5AE5E895608CD17A7B271763A7D943D2BAD4131F24E87850A8EC620E4C5ABDEF10E4A31C56555C574F185FB78C3958E89C16850508BE76A5052D199C1B5549866BB96740E591F976C232D49EE93414B456706D792B0D17625699C821E6EC1462AAA6FE1034DB622D251EE3665DDD8C973A544C1D83124558DAF511CFB645949B21225D62CCFB09AFE38EB9F7814E6188E4B35F947A5B4252716256889A55A600D925EFA0965E788A139E2719EA9172A64DABDD5B0FC172CABDBA73A88C53E5050F3DFA285EE02BFB6DBAAEE8840B9843E86DCA7C902E91A0BD037B778DA1B0A50A289DD4FA3200D89D9C532B7CE6FF0AAEDF3121561EC48F22B2E94A22FC5D1AD2BBFD3D0A8D362B0612A7D98F587CA0C615278E18156556EF24ACD284590AA8A620A5CED6CE84CCE4CCFE1923DC5FEA3D58AF032734BA4A7540144514F8C4A86830256A9EB8E5A4F42A962D66BBA234A99265548A9AA8794D57C929A90D58AB5F00C1AD55374E7A0669054D1D5DAEEC89A5C922AB4A67A0D6C8DCC725D77544DBA49155853DD1D7B957B222FA37BBC7B19CF2F1B6C5FF92177B3FDCB80F1326BE230DB5FE52EBF0A5429EE89256EEB153051BE97F6643CE96D604F797463337B326098579FDA3D787DF169BCBC3763D62EB76B0B7CD3E5BE19AF9FD5BEA86D28473D99A4E45E1EF9A4A3DD581CB3DA1FD528E7AE9CC4B60A35C2E6FE4C190E479C6034FB3D98063EE64B7941708D88BFC094E5091DF6F1E1D1B1F42A677F5EC838947A81E6986A7A26531FB32DE466914794B80F28513325367845B2025582D057C4C34F13FBBF59ABD32C9EC17F65C507D615FD44FCDF53A8B84F526CFDA1667E0E9355DFE11D4729E81FAFE2814477955FFDF6256F7A60DD26309D4EAD4349D1EB0C7FFDD9442F69F2A61B48B3F6638AD73BDB6AAF14B4A8D26C59FF51C2DC67833C4828A4FC3E444FFFEC2B9AF6D1C146889A870543E10DA242D3C38175B08C8F063CF864D9A3817E9DD53F22584734E303029FF407939F0F745F868A963BDC873447A66D2C49999E5BD3AF37CAC5DCF5DEA464696F34D1D54CEC1E7083665B6FE6A2BCB22CE6C1B64E4D92F260D8BBB4FB17CF4CDE9764E495D3BEDB1CE46DA61D375C2BFDADB28DF7203F4E93EFB3FB9CE26DDB9A2906BCE78999FD3287F7CCD8C436BFFBFCE06D1B9B2940BCE7C6D62B0B78CF6C6D57FBE78E2DADF316BAF39C5E353DC97097A38B22B7E5ECE6217738FECF233082DCA3CC9F5AEA93C49A125C5B18AE48CC4CCDD969326365E2287C158A66B6FDFA2A36FCC6CE0A9A66B6869CCE26DE62FD6FE42D689A791B322577916DACCD55D46580B7AC634D4954AF29BBB8D6939664F6369FB5F162FE3525130FA294DAEC31DC2EBF9EDCE1415432E4D4E9912BAC5E14C3DE59F91B8DB07F537FB982E07FB19160B7B66B9634576411159BB7245141224568AE31431E6CA96709F317C86550CD03D0D95BF12CA8C7AF41E6D8BB22B7298B53065DC6E13CA805BCB813D0C43F4B88AECB3CBE8DF9171DA20B20A6CF03F7B7E497D40FBC52EE4B4D4CC800C1BD0B11EEE563C978D877F95C22DD44A42390505FE914DDE3300E008CDE92197AC4EBC806E6F7012F91FBBC8A009A40DA07A2AEF6F1B98F96090AA9C058B5874FB0612F7C7AFF7FD8CB68A2AA540000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[Activities] ON 

INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (1, N'Property Upload', N'flaticon-home', 233)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (2, N'Property Update', N'flaticon-home', 234)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (3, N'Property Activation', N'flaticon-home', 235)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (4, N'Property Deactivation', N'flaticon-home', 236)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (5, N'Property Activation Continue', N'flaticon-home', 237)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (6, N'Profile Update', N'flaticon-user', 238)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (7, N'Password Change', N'flaticon-password', 239)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (8, N'Property Remove', N'flaticon-home', 240)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (9, N'Message', N'flaticon-chat', 241)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (11, N'Add to Favorites', N'flaticon-heart', 242)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (12, N'Remove from Favorites', N'flaticon-heart', 243)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (13, N'Review', N'flaticon-chat', 244)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (14, N'Buy Package', N'flaticon-money-bag', 245)
INSERT [dbo].[Activities] ([Id], [Name], [Icon], [ContentId]) VALUES (15, N'Update Package', N'flaticon-transfer', 246)
SET IDENTITY_INSERT [dbo].[Activities] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Single User')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Agent')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Multi User')
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'104023689638963818497', N'ee316bc0-8a39-40ac-a562-b3c7b7f13e00')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'117987862390991809233', N'52e93efa-d5c1-42a2-9687-6b0cbd82e514')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'080f21ee-3feb-446a-8bfe-206f9d462695', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'52e93efa-d5c1-42a2-9687-6b0cbd82e514', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e35f8a7-a4df-41a4-a170-6566560aa05e', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'659085cd-a5b4-4998-a130-abdcdfeeb3e6', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8f251745-179d-4012-ae00-d0d5820d2e29', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c8ffa3af-4f02-46a9-a98e-b70b853db0c7', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd67edb28-b62d-4ce1-a4b8-4272afab1272', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e2d5e8c6-08fc-46e6-b5fd-8aee66466efe', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e3b95172-a806-4f74-b1d2-9bba98e0dd87', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ee316bc0-8a39-40ac-a562-b3c7b7f13e00', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f23f1ff0-7523-4e76-8d16-42e3dc4ce7b5', N'1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'080f21ee-3feb-446a-8bfe-206f9d462695', N'Ana@dvl.com', 0, N'ACTF+Bz8gm8F4RL8ZMPv2R8N2omxp61MQjLaGesKyO3lK+dt/otB3Xw8pGdDXeufUQ==', N'67b88f6e-d833-4927-bb87-dc03edc8d5b0', NULL, 0, 0, NULL, 1, 0, N'Ana@dvl.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0923e72f-9c96-429d-bb1a-1e40ea6e540e', N'advali@gmail.com', 0, N'AHrFg5C+8T9254NpHHBSbb8eLkloN/laf9wK89UtFAIr8KXOZ3qYlBOh0ytkhrii6A==', N'baf67502-f374-4225-8877-ff3993604533', NULL, 0, 0, NULL, 1, 0, N'advali@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'52e93efa-d5c1-42a2-9687-6b0cbd82e514', N'dvaliana9@gmail.com', 0, NULL, N'74b8be43-a8b2-4c7f-abf0-d7204dd9faa5', NULL, 0, 0, NULL, 1, 0, N'dvaliana9@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5e35f8a7-a4df-41a4-a170-6566560aa05e', N'dfgh@fjdks.com', 0, N'APNRYi+ztJ/FN+zXSS/AX9KN7LBFklsAhyIYerrlEB/L7kxi6L0W9BJEKUGjq8JYcQ==', N'4e2acbd8-b95e-48cb-bf4b-de3b671727da', NULL, 0, 0, NULL, 1, 0, N'dfgh@fjdks.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'659085cd-a5b4-4998-a130-abdcdfeeb3e6', N'test@test.com', 0, N'AMoDVgv8g0MZuRN+/XHRusz4lF4txaW+nzX2jH49qZMZgEtfmgrrh+oGhb/bUN6TRw==', N'2f15ee74-a2b1-4450-b474-5e94df7c54f6', NULL, 0, 0, NULL, 1, 0, N'test@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8f251745-179d-4012-ae00-d0d5820d2e29', N'a.dvl@gmail.com', 0, N'AA28l6NmBm3kpymUGtxyOLIILLXEc4ZNgfccEZDeaGgdKWgJrL29wwK5urkVLNU86A==', N'b4c64096-b659-44ff-ac9f-b8e9e0d0979b', NULL, 0, 0, NULL, 1, 0, N'a.dvl@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'be08fde7-087e-468a-9851-57db53625289', N'Asd@gm.com', 0, N'ALrLaJPzxnessnpvrB0mEBoxi9nIngRe6HIAKCy27KSDRIrKhEjYAoRE2ZnTlSSNhg==', N'9f42b957-881a-4a4a-bc60-29c3be551615', NULL, 0, 0, NULL, 1, 0, N'Asd@gm.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c8ffa3af-4f02-46a9-a98e-b70b853db0c7', N'mamukakurtskhalidze@getech.support', 0, N'AO6KBF4l7CnKrnBqWlMmUSUpBdHCDZFWoKpHBbIK9mkZCXaJy6S/1s7o/iC8YtQMLQ==', N'4303d6fe-a174-4950-90b5-ff7f06a94d0d', NULL, 0, 0, NULL, 1, 0, N'mamukakurtskhalidze@getech.support')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd67edb28-b62d-4ce1-a4b8-4272afab1272', N'Ana.dvak@gmail.com', 0, N'AMB7amwGAlvPaVjNu7/264RAz3IH+KXi+8Y79dwZPzj1grMDhA//76yQZ4w/2SZxQw==', N'0b621e81-75ee-4325-9d85-3cb4d46851b1', NULL, 0, 0, NULL, 1, 0, N'Ana.dvak@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e2d5e8c6-08fc-46e6-b5fd-8aee66466efe', N'Ana.dvali@getech.support', 0, N'AG+/sLt/KIpZ8A6OGQe6fYaEkPloCxy3UfXwSeYk7MLtxmf3vFfU11B1ecfY8epTXg==', N'284da14e-b17d-494a-96e5-b24b078db299', NULL, 0, 0, NULL, 1, 0, N'Ana.dvali@getech.support')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e3b95172-a806-4f74-b1d2-9bba98e0dd87', N'tes2t@test.com', 0, N'AEhZTeTYRMm3qssjaXDpG4rycNly6tEQKDKXghciz29iKsMF4FD3Eof/OD6OF838Rw==', N'395cdedc-16cd-4389-bed8-7a096e2c137c', NULL, 0, 0, NULL, 1, 0, N'tes2t@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ee316bc0-8a39-40ac-a562-b3c7b7f13e00', N'mamukakurtskhalidze@gmail.com', 0, NULL, N'499ea2ea-89df-4942-910b-04779e5039ea', NULL, 0, 0, NULL, 1, 0, N'mamukakurtskhalidze@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f23f1ff0-7523-4e76-8d16-42e3dc4ce7b5', N'mamuka@kurtskhalidze.com', 0, N'AH9jfj/+ap53p4D4lUszwwadt/uAiu/QE6059qYC9b+y9nTu4K4/I3sLf6ZTgagdXA==', N'5ce0fd9e-d85e-4e46-ba07-ebf62534bc6b', NULL, 0, 0, NULL, 1, 0, N'mamuka@kurtskhalidze.com')
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [ContentId], [CountryId]) VALUES (1, 47, 1)
INSERT [dbo].[Cities] ([Id], [ContentId], [CountryId]) VALUES (2, 48, 1)
INSERT [dbo].[Cities] ([Id], [ContentId], [CountryId]) VALUES (3, 49, 1)
INSERT [dbo].[Cities] ([Id], [ContentId], [CountryId]) VALUES (4, 198, 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[ConnectedUsers] ON 

INSERT [dbo].[ConnectedUsers] ([Id], [User1], [User2]) VALUES (1, 1, 3)
INSERT [dbo].[ConnectedUsers] ([Id], [User1], [User2]) VALUES (2, 1, 2)
INSERT [dbo].[ConnectedUsers] ([Id], [User1], [User2]) VALUES (3, 1, 4)
SET IDENTITY_INSERT [dbo].[ConnectedUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([Id], [Type]) VALUES (1, N'PropertyType_Label')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (2, N'PropertyType_Apartment')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (4, N'PropertyType_Condo')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (5, N'PropertyType_House')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (6, N'PropertyType_Land')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (7, N'PropertyType_SingleFamily')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (8, N'PropertyStatus_Rent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (9, N'PropertyStatus_Buy')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (10, N'AddNewProperty_Heading')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (11, N'AddNewProperty_Description')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (12, N'CreateListing')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (13, N'PropertyTitleEN')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (14, N'PropertyDescriptionEN')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (15, N'PropertyType')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (16, N'PropertyStatus')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (17, N'PropertyPrice')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (18, N'PropertyArea')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (19, N'PropertyRooms')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (20, N'Location')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (21, N'AddressEN')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (22, N'Regions')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (23, N'City')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (24, N'Zip')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (25, N'Country')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (26, N'Latitude')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (27, N'Longitude')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (28, N'DetailedInformation')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (29, N'PropertyId')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (30, N'Bedrooms')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (31, N'Bathrooms')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (32, N'Garages')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (33, N'CeilingSize')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (34, N'State')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (35, N'Amenities')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (36, N'PropertyMedia')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (37, N'Attachments')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (38, N'SelectAttachments')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (39, N'Next')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (40, N'PropertyTitleRU')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (41, N'PropertyTitleGE')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (42, N'PropertyDescriptionRU')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (43, N'PropertyDescriptionGE')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (44, N'AddressRU')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (45, N'AddressGE')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (46, N'Georgia')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (47, N'Tbilisi')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (48, N'Batumi')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (49, N'Kutaisi')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (50, N'Feature_AirConditioning')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (51, N'Feature_Yard')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (52, N'Feature_SwimmingPool')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (53, N'Feature_Fireplace')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (54, N'Feature_TV')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (55, N'Feature_Refrigirator')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (56, N'Feature_Wifi')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (57, N'Feature_Sauna')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (58, N'Feature_WindowCoverings')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (128, N'Status_new')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (129, N'Status_old')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (130, N'Status_underConstraction')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (164, N'ListingTitle54')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (165, N'ListingDescription54')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (166, N'ListingAddress54')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (188, N'ListingTitle62')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (189, N'ListingDescription62')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (190, N'ListingAddress62')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (191, N'ListingTitle63')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (192, N'ListingDescription63')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (193, N'ListingAddress63')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (194, N'ServiceVIP')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (195, N'ServiceSuperVIP')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (196, N'ServiceVIP+')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (197, N'ServiceUrgently')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (198, N'Mtskheta')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (199, N'PropertyStatus_DailyRent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (200, N'ListingTitle23')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (201, N'ListingAddress23')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (214, N'ListingTitle68')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (215, N'ListingDescription68')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (216, N'ListingAddress68')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (217, N'ListingTitle69')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (218, N'ListingDescription69')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (219, N'ListingAddress69')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (220, N'StatusPending')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (221, N'StatusPublished')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (222, N'StatusProcessing')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (223, N'ListingTitle70')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (224, N'ListingDescription70')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (225, N'ListingAddress70')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (226, N'ListingTitle71')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (227, N'ListingDescription71')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (228, N'ListingAddress71')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (229, N'PropertyStatus_Mortgage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (230, N'PropertyStatus_Lease')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (231, N'PropertyType_Commercial')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (232, N'PropertyType_Hotels')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (233, N'Activity_PropertyUpload')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (234, N'Activity_PropertyUpdate')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (235, N'Activity_PropertyActivate')
GO
INSERT [dbo].[Content] ([Id], [Type]) VALUES (236, N'Activity_PropertyDeactivate')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (237, N'Activity_ActiveContinue')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (238, N'Activity_ProfileUpdate')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (239, N'Activity_PasswordChange')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (240, N'Activity_PropertyRemove')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (241, N'Activity_MessageAlert')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (242, N'Activity_InsertFavorites')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (243, N'Activity_RemoveFavorites')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (244, N'Activity_Review')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (245, N'Activity_BuyPackage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (246, N'Activity_UpdatePackage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (247, N'ListingTitle72')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (248, N'ListingDescription72')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (249, N'ListingAddress72')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (250, N'ServiceAutomaticUpdate')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (251, N'ServiceBorder')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (252, N'PropertyType_Apartment&PropertyStatus_Rent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (253, N'PropertyType_Apartment&PropertyStatus_Buy')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (254, N'PropertyType_Apartment&PropertyStatus_DailyRent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (257, N'PropertyType_Apartment&PropertyStatus_Mortgage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (258, N'PropertyType_Apartment&PropertyStatus_Lease')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (259, N'PropertyType_House&PropertyStatus_Rent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (260, N'PropertyType_House&PropertyStatus_Buy')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (261, N'PropertyType_House&PropertyStatus_DailyRent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (262, N'PropertyType_House&PropertyStatus_Mortgage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (263, N'PropertyType_House&PropertyStatus_Lease')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (264, N'PropertyType_Land&ProeprtyStatus_Rent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (265, N'PropertyType_Land&PropertyStatus_Buy')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (266, N'PropertyType_Land&PropertyStatus_DailyRent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (267, N'PropertyType_Land&PropertyStatus_Mortgage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (268, N'PropertyType_Land&PropertyStatus_Lease')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (269, N'PropertyType_Commercial&PropertyStatus_Rent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (270, N'PropertyType_Commercial&ProeprtyStatus_Buy')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (271, N'PropertyType_Commercial&PropertyStatus_DailyRent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (272, N'PropertyType_Commercial&ProeprtyStatus_Mortgage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (273, N'PropertyType_Commercial&PropertyStatus_Lease')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (274, N'PropertyType_Hotels&PropertyStatus_Rent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (275, N'PropertyType_Hotels&PropertyStatus_Buy')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (276, N'PropertyType_Hotels&ProeprtyStatus_DailyRent')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (277, N'PropertyType_Hotels&PropertyStatus_Mortgage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (278, N'PropertyType_Hotels&PropertyStatus_Lease')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (279, N'Header_Language')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (280, N'Header_Login')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (281, N'Header_Register')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (282, N'Home_Heading')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (283, N'Search_Keyword')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (284, N'Search_Location')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (285, N'Search_type')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (286, N'Search_Price')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (287, N'Search_Advanced')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (288, N'Search_Search')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (289, N'Search_Amenities')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (290, N'Search_Bath')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (291, N'Search_Bed')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (292, N'Search_State')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (293, N'Search_Area')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (294, N'Search_hide')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (295, N'Property_SqMtr')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (296, N'Property_Description')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (297, N'Property_Details')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (298, N'Property_CadastralCode')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (299, N'Property_Status')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (300, N'Property_Garage')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (301, N'Property_CeilingSize')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (302, N'Property_ListedBy')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (303, N'Property_Subject')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (304, N'Property_Email')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (305, N'Property_Body')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (306, N'Property_SendEmail')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (307, N'Property_Features')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (308, N'Property_PaymentCalculator')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (309, N'Property_Reviews')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (310, N'Property_WriteReview')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (311, N'Property_Similar')
INSERT [dbo].[Content] ([Id], [Type]) VALUES (312, N'Property_RecentlyViewed')
SET IDENTITY_INSERT [dbo].[Content] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [ContentId]) VALUES (1, 46)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Currencies] ON 

INSERT [dbo].[Currencies] ([Id], [CurrencyName], [Symbol]) VALUES (1, N'USD', N'$')
INSERT [dbo].[Currencies] ([Id], [CurrencyName], [Symbol]) VALUES (2, N'GEL', N'₾')
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[CurrentStatus] ON 

INSERT [dbo].[CurrentStatus] ([Id], [Name], [ContentId]) VALUES (1, N'Pending', 220)
INSERT [dbo].[CurrentStatus] ([Id], [Name], [ContentId]) VALUES (2, N'Published', 221)
INSERT [dbo].[CurrentStatus] ([Id], [Name], [ContentId]) VALUES (3, N'Processing', 222)
SET IDENTITY_INSERT [dbo].[CurrentStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (1, 50)
INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (2, 51)
INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (3, 52)
INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (4, 53)
INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (5, 54)
INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (6, 55)
INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (7, 56)
INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (8, 57)
INSERT [dbo].[Features] ([Id], [ContentId]) VALUES (9, 58)
SET IDENTITY_INSERT [dbo].[Features] OFF
GO
SET IDENTITY_INSERT [dbo].[IPs] ON 

INSERT [dbo].[IPs] ([Id], [Address]) VALUES (1, N'192.168.1.14')
INSERT [dbo].[IPs] ([Id], [Address]) VALUES (2, N'149.3.58.28')
INSERT [dbo].[IPs] ([Id], [Address]) VALUES (3, N'31.146.53.57')
INSERT [dbo].[IPs] ([Id], [Address]) VALUES (4, N'37.232.82.197')
INSERT [dbo].[IPs] ([Id], [Address]) VALUES (5, N'93.186.215.202')
INSERT [dbo].[IPs] ([Id], [Address]) VALUES (6, N'160.153.155.187')
SET IDENTITY_INSERT [dbo].[IPs] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([Id], [Name], [Abbr], [Flag]) VALUES (1, N'Georgian', N'GE', NULL)
INSERT [dbo].[Language] ([Id], [Name], [Abbr], [Flag]) VALUES (2, N'English', N'EN', NULL)
INSERT [dbo].[Language] ([Id], [Name], [Abbr], [Flag]) VALUES (3, N'Russian', N'RU', NULL)
SET IDENTITY_INSERT [dbo].[Language] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [ContentId], [Latitude], [Longitude], [CityId], [Zip]) VALUES (7, 166, CAST(12.00000000 AS Decimal(10, 8)), CAST(12.00000000 AS Decimal(11, 8)), 1, 12)
INSERT [dbo].[Location] ([Id], [ContentId], [Latitude], [Longitude], [CityId], [Zip]) VALUES (13, 190, CAST(12.00000000 AS Decimal(10, 8)), CAST(12.00000000 AS Decimal(11, 8)), 1, 12)
INSERT [dbo].[Location] ([Id], [ContentId], [Latitude], [Longitude], [CityId], [Zip]) VALUES (14, 193, CAST(3.00000000 AS Decimal(10, 8)), CAST(3.00000000 AS Decimal(11, 8)), 1, 3)
INSERT [dbo].[Location] ([Id], [ContentId], [Latitude], [Longitude], [CityId], [Zip]) VALUES (15, 216, CAST(41.72330036 AS Decimal(10, 8)), CAST(44.96854897 AS Decimal(11, 8)), 1, 0)
INSERT [dbo].[Location] ([Id], [ContentId], [Latitude], [Longitude], [CityId], [Zip]) VALUES (16, 219, CAST(41.84352661 AS Decimal(10, 8)), CAST(44.71212979 AS Decimal(11, 8)), 4, 0)
INSERT [dbo].[Location] ([Id], [ContentId], [Latitude], [Longitude], [CityId], [Zip]) VALUES (17, 225, CAST(41.63551894 AS Decimal(10, 8)), CAST(41.60954352 AS Decimal(11, 8)), 2, 0)
INSERT [dbo].[Location] ([Id], [ContentId], [Latitude], [Longitude], [CityId], [Zip]) VALUES (18, 228, CAST(41.71561255 AS Decimal(10, 8)), CAST(44.75980874 AS Decimal(11, 8)), 1, 0)
INSERT [dbo].[Location] ([Id], [ContentId], [Latitude], [Longitude], [CityId], [Zip]) VALUES (19, 249, CAST(41.69408179 AS Decimal(10, 8)), CAST(44.77903481 AS Decimal(11, 8)), 1, 0)
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (1, N'../../Content/images/property/54/1.png', 54)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (2, N'../../Content/images/property/54/2.jpeg', 54)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (3, N'../../Content/images/property/54/3.jpeg', 54)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (10, N'../../Content/images/property/62/1.png', 62)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (11, N'../../Content/images/property/62/2.jpeg', 62)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (12, N'../../Content/images/property/63/1.png', 63)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (13, N'../../Content/images/property/63/2.jpeg', 63)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (14, N'../../Content/images/property/63/3.jpeg', 63)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (18, N'../../Content/images/property/63/3.jpeg', 23)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (19, N'../../Content/images/property/68/1.jpeg', 68)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (20, N'../../Content/images/property/68/2.jpeg', 68)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (21, N'../../Content/images/property/69/1.jpeg', 69)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (22, N'../../Content/images/property/69/2.jpeg', 69)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (23, N'../../Content/images/property/69/3.jpeg', 69)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (24, N'../../Content/images/property/70/1.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (25, N'../../Content/images/property/70/2.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (26, N'../../Content/images/property/70/3.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (27, N'../../Content/images/property/70/4.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (28, N'../../Content/images/property/70/5.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (29, N'../../Content/images/property/70/6.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (30, N'../../Content/images/property/70/7.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (31, N'../../Content/images/property/70/8.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (32, N'../../Content/images/property/70/9.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (33, N'../../Content/images/property/70/10.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (34, N'../../Content/images/property/70/10.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (35, N'../../Content/images/property/70/10.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (36, N'../../Content/images/property/70/10.jpeg', 70)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (37, N'../../Content/images/property/72/1.jpeg', 72)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (38, N'../../Content/images/property/72/2.jpeg', 72)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (39, N'../../Content/images/property/72/3.jpeg', 72)
INSERT [dbo].[Media] ([Id], [MediaUrl], [PropertyId]) VALUES (40, N'../../Content/images/property/72/4.jpeg', 72)
SET IDENTITY_INSERT [dbo].[Media] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (2, 1, 1, N'Hello', CAST(N'2021-06-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (4, 2, 2, N'I was interested in your property', CAST(N'2021-06-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (5, 2, 1, N'Hello', CAST(N'2021-06-28T12:21:38.000' AS DateTime), 0)
INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (6, 1, 1, N'hi', CAST(N'2021-06-28T12:25:02.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (7, 1, 3, N'morning', CAST(N'2021-07-12T15:08:48.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (8, 1, 1, N'hello how are you?', CAST(N'2021-07-12T15:08:54.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (9, 1, 3, N'I am fine,. you?', CAST(N'2021-07-12T15:09:01.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (10, 1, 3, N'asdasdasd', CAST(N'2021-07-12T15:09:31.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([Id], [ConnectedUserId], [SenderId], [Message], [SendingDate], [Seen]) VALUES (11, 1, 1, N':)))', CAST(N'2021-07-12T15:09:43.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (23, CAST(899.00 AS Decimal(18, 2)), CAST(898.00 AS Decimal(18, 2)), 1, 1, 1, N'80809', NULL, NULL, 989, 8080, CAST(9808.00 AS Decimal(18, 2)), NULL, CAST(899.00 AS Decimal(18, 2)), CAST(N'2020-11-29T17:11:29.933' AS DateTime), 1, 1, 80980, 8098, 7, 2, 1)
INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (54, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, 1, 1, N'lkj', NULL, NULL, 1, 1, CAST(1.00 AS Decimal(18, 2)), NULL, CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-12-03T16:50:23.063' AS DateTime), 1, 1, 1, 1, 7, 2, 2)
INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (62, CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 1, 1, 1, N'sdf', NULL, NULL, 12, 2, CAST(2.00 AS Decimal(18, 2)), NULL, CAST(12.00 AS Decimal(18, 2)), CAST(N'2020-12-04T17:25:37.777' AS DateTime), 1, 1, 1, 1, 13, 2, 1)
INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (63, CAST(78.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1, 1, 1, NULL, NULL, NULL, 1, 0, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(78.00 AS Decimal(18, 2)), CAST(N'2020-12-04T17:34:15.673' AS DateTime), 1, 1, 0, 0, 14, 2, 1)
INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (68, CAST(21200.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 1, 1, 1, NULL, NULL, NULL, 12, 8, CAST(3.00 AS Decimal(18, 2)), NULL, CAST(21200.00 AS Decimal(18, 2)), CAST(N'2021-02-01T12:33:23.457' AS DateTime), 1, 1, 1, 1, 15, 2, 1)
INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (69, CAST(5000.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 4, 1, 1, N'143934', NULL, NULL, 8, 3, CAST(4.00 AS Decimal(18, 2)), NULL, CAST(5000.00 AS Decimal(18, 2)), CAST(N'2021-03-06T14:07:59.360' AS DateTime), 2, 1, 3, 2, 16, 2, 1)
INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (70, CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, 3, 1, NULL, NULL, NULL, 5, 4, CAST(2.00 AS Decimal(18, 2)), NULL, CAST(100.00 AS Decimal(18, 2)), CAST(N'2021-05-09T16:21:13.157' AS DateTime), 4, 1, 2, 2, 17, NULL, 2)
INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (71, CAST(120.00 AS Decimal(18, 2)), CAST(76.00 AS Decimal(18, 2)), 1, 3, 2, N'1112333', NULL, NULL, 1, 1, CAST(3.00 AS Decimal(18, 2)), NULL, CAST(120.00 AS Decimal(18, 2)), CAST(N'2021-05-12T16:02:51.507' AS DateTime), 2, 1, 1, 0, 18, 2, 2)
INSERT [dbo].[Property] ([Id], [Price], [PropertySize], [PropertyTypeId], [StatusId], [StateId], [CadastralCode], [Floor], [Floors], [Rooms], [Bedrooms], [CeilingSize], [PhoneNumber], [WholePrice], [DatePublished], [UserDetailsId], [Active], [Bathrooms], [Garages], [LocationId], [CurrentStatusId], [CurrencyId]) VALUES (72, CAST(120.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, 3, 1, NULL, NULL, NULL, 2, 1, CAST(3.00 AS Decimal(18, 2)), NULL, CAST(120.00 AS Decimal(18, 2)), CAST(N'2021-05-26T14:09:14.403' AS DateTime), 1, 1, 1, 0, 19, 2, 2)
SET IDENTITY_INSERT [dbo].[Property] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyContent] ON 

INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (24, 54, 164)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (25, 54, 165)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (40, 62, 188)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (41, 62, 189)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (42, 63, 191)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (43, 63, 192)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (44, 23, 200)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (45, 23, 201)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (46, 68, 214)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (47, 68, 215)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (48, 69, 217)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (49, 69, 218)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (50, 70, 223)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (51, 70, 224)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (52, 71, 226)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (53, 71, 227)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (54, 72, 247)
INSERT [dbo].[PropertyContent] ([Id], [propertyId], [contentId]) VALUES (55, 72, 248)
SET IDENTITY_INSERT [dbo].[PropertyContent] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyFeature] ON 

INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (1, 54, 1, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (2, 54, 2, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (3, 54, 3, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (4, 54, 5, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (5, 54, 4, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (6, 54, 6, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (7, 54, 7, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (8, 54, 8, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (9, 54, 9, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (55, 62, 1, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (56, 62, 2, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (57, 62, 3, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (58, 62, 5, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (59, 62, 4, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (60, 62, 6, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (61, 62, 7, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (62, 62, 8, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (63, 62, 9, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (64, 63, 1, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (65, 63, 2, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (66, 63, 3, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (67, 63, 5, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (68, 63, 4, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (69, 63, 6, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (70, 63, 7, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (71, 63, 8, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (72, 63, 9, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (73, 68, 1, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (74, 68, 2, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (75, 68, 3, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (76, 68, 5, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (77, 68, 4, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (78, 68, 6, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (79, 68, 7, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (80, 68, 8, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (81, 68, 9, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (82, 69, 1, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (83, 69, 2, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (84, 69, 3, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (85, 69, 5, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (86, 69, 4, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (87, 69, 6, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (88, 69, 7, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (89, 69, 8, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (90, 69, 9, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (91, 70, 1, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (92, 70, 2, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (93, 70, 3, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (94, 70, 5, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (95, 70, 4, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (96, 70, 6, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (97, 70, 7, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (98, 70, 8, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (99, 70, 9, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (100, 71, 1, 1)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (101, 71, 2, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (102, 71, 3, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (103, 71, 5, 1)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (104, 71, 4, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (105, 71, 6, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (106, 71, 7, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (107, 71, 8, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (108, 71, 9, 1)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (109, 72, 1, 1)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (110, 72, 2, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (111, 72, 3, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (112, 72, 5, 1)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (113, 72, 4, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (114, 72, 6, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (115, 72, 7, 0)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (116, 72, 8, 1)
INSERT [dbo].[PropertyFeature] ([Id], [PropertyId], [FeatureId], [Availability]) VALUES (117, 72, 9, 0)
SET IDENTITY_INSERT [dbo].[PropertyFeature] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyServices] ON 

INSERT [dbo].[PropertyServices] ([Id], [ServicesId], [PropertyId], [ActivationDate], [Active]) VALUES (4, 1, 54, CAST(N'2020-12-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[PropertyServices] ([Id], [ServicesId], [PropertyId], [ActivationDate], [Active]) VALUES (8, 3, 62, CAST(N'2020-12-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[PropertyServices] ([Id], [ServicesId], [PropertyId], [ActivationDate], [Active]) VALUES (9, 4, 63, CAST(N'2020-12-17T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PropertyServices] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyType] ON 

INSERT [dbo].[PropertyType] ([Id], [ContentId]) VALUES (1, 2)
INSERT [dbo].[PropertyType] ([Id], [ContentId]) VALUES (3, 4)
INSERT [dbo].[PropertyType] ([Id], [ContentId]) VALUES (4, 5)
INSERT [dbo].[PropertyType] ([Id], [ContentId]) VALUES (5, 6)
INSERT [dbo].[PropertyType] ([Id], [ContentId]) VALUES (6, 7)
INSERT [dbo].[PropertyType] ([Id], [ContentId]) VALUES (7, 231)
INSERT [dbo].[PropertyType] ([Id], [ContentId]) VALUES (8, 232)
SET IDENTITY_INSERT [dbo].[PropertyType] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyViews] ON 

INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (1, 54, 1)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (2, 54, 2)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (3, 62, 2)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (6, 63, 2)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (15, 68, 2)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (16, 69, 2)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (17, 54, 3)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (20, 70, 4)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (21, 54, 4)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (22, 63, 4)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (23, 70, 2)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (24, 71, 2)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (25, 54, 5)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (26, 72, 5)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (27, 23, 5)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (28, 63, 5)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (29, 71, 5)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (30, 62, 5)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (31, 63, 6)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (32, 54, 6)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (33, 62, 6)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (34, 72, 6)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (35, 71, 6)
INSERT [dbo].[PropertyViews] ([Id], [PropertyId], [IpId]) VALUES (36, 68, 5)
SET IDENTITY_INSERT [dbo].[PropertyViews] OFF
GO
INSERT [dbo].[Reviews] ([Id], [UserDetailsId], [ReviewDate], [Comment], [PropertyId], [Stars]) VALUES (0, 1, CAST(N'2021-01-22T15:02:26.590' AS DateTime), N'lkhlhkj kdh ssdkd saslkd', 54, 3)
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([Id], [ContentId], [Price]) VALUES (1, 194, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([Id], [ContentId], [Price]) VALUES (2, 195, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([Id], [ContentId], [Price]) VALUES (3, 196, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([Id], [ContentId], [Price]) VALUES (4, 197, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([Id], [ContentId], [Price]) VALUES (5, 251, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Services] ([Id], [ContentId], [Price]) VALUES (6, 250, CAST(1.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
INSERT [dbo].[State] ([Id], [ContentId]) VALUES (1, 128)
INSERT [dbo].[State] ([Id], [ContentId]) VALUES (2, 129)
INSERT [dbo].[State] ([Id], [ContentId]) VALUES (3, 130)
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [ContentId]) VALUES (1, 8)
INSERT [dbo].[Status] ([Id], [ContentId]) VALUES (2, 9)
INSERT [dbo].[Status] ([Id], [ContentId]) VALUES (3, 199)
INSERT [dbo].[Status] ([Id], [ContentId]) VALUES (4, 229)
INSERT [dbo].[Status] ([Id], [ContentId]) VALUES (5, 230)
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Translations] ON 

INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (1, 2, N'Apartment', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (2, 2, N'ბინა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (3, 2, N'квартира', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (7, 5, N'House', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (8, 5, N'კერძო სახლი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (9, 5, N'дом', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (10, 6, N'Land', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (11, 6, N'მიწის ნაკვეთი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (12, 6, N'
земельные участки', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (13, 1, N'Type', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (14, 1, N'ტიპი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (15, 1, N'тип', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (16, 8, N'Rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (18, 9, N'Buy', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (19, 10, N'Add New Property', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (20, 11, N'We are glad to see you again!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (21, 12, N'Create Listing', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (22, 13, N'Property Title (English)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (23, 14, N'Description (English)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (25, 15, N'Type', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (26, 16, N'Status', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (27, 17, N'Price', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (28, 18, N'Area', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (29, 19, N'Rooms', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (30, 20, N'Location', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (31, 21, N'Address (English)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (32, 22, N'Regions', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (33, 23, N'City', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (34, 24, N'Zip', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (35, 25, N'Country', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (36, 26, N'Latitude', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (37, 27, N'Longitude', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (38, 28, N'Detailed Information', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (40, 29, N'Cadastral Code', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (41, 30, N'Bedrooms', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (42, 31, N'Bathrooms', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (43, 32, N'Garages', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (44, 33, N'Ceiling Size', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (45, 34, N'State', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (46, 35, N'Amenities', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (47, 36, N'Property Media', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (48, 37, N'Attachments', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (49, 38, N'Select Attachments', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (50, 39, N'Next', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (51, 41, N'Property Title (Georgian)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (52, 40, N'Property Title (Russian)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (53, 43, N'Description (Georgian)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (54, 42, N'Description (Russian)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (56, 44, N'Address (Russian)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (57, 45, N'Address (Georgian)', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (58, 46, N'Georgia', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (59, 46, N'საქართველო', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (60, 46, N'
Грузия', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (61, 47, N'Tbilisi', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (62, 47, N'თბილისი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (63, 47, N'Тбилиси', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (64, 48, N'Batumi', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (65, 48, N'ბათუმი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (66, 48, N'Батуми', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (67, 49, N'Kutaisi', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (68, 49, N'ქუთაისი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (69, 49, N'Кутаиси', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (70, 50, N'Air Conditioning', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (71, 50, N'კონდენციონერი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (72, 50, N'Кодиционер', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (73, 51, N'Yard', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (74, 51, N'ეზო', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (75, 51, N'Двор', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (76, 52, N'Swimming Pool', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (77, 52, N'საცურაო აუზი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (78, 52, N'
плавательный бассейн', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (79, 53, N'Fireplace', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (80, 53, N'ბუხარი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (81, 53, N'Камин', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (82, 54, N'TV', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (83, 54, N'ტელევიზორი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (84, 54, N'Телевизор', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (85, 55, N'Refrigirator', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (86, 55, N'მაცივარი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (87, 55, N'Холодильник', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (88, 56, N'Wifi', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (89, 56, N'უსადენო ინტერნეტი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (90, 56, N'Беспроводной интернет', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (91, 57, N'Sauna', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (92, 57, N'საუნა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (93, 57, N'Сауна', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (94, 58, N'Window Coverings', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (95, 58, N'ფარდები', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (96, 58, N'шторы', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (98, 128, N'ახალ აშენებული', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (99, 128, N'Newly built', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (100, 128, N'
Недавно построенный', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (101, 129, N'ძველი აშენებული', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (102, 129, N'Старый построен', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (103, 129, N'Old built', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (104, 130, N'Under construction', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (105, 130, N'მშენებარე', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (106, 130, N'
В разработке', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (107, 8, N'ქირავდება', 1)
GO
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (108, 8, N'
в аренду', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (109, 9, N'იყიდება', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (110, 9, N'
продается', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (210, 164, N'განახლებული ბინა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (211, 164, N'k;l', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (212, 164, N'k;l', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (213, 165, N'kjl', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (214, 165, N'kjl', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (215, 165, N'kjl', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (216, 166, N's;kj', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (217, 166, N's;kj', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (218, 166, N's;kj', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (282, 188, N'cgbcb', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (283, 188, N'cgbcb', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (284, 188, N'cgbcb', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (285, 189, N'dgchdfgd', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (286, 189, N'dgchdfgd', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (287, 189, N'dgchdfgd', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (288, 190, N'fdsfsdf', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (289, 190, N'fdsfsdf', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (290, 190, N'fdsfsdf', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (291, 191, N'kjhkjh', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (292, 191, N'kjhkjh', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (293, 191, N'kjhkjh', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (294, 192, N'kjhkjh', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (295, 192, N'kjhkjh', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (296, 192, N'kjhkjh', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (297, 193, N';lk;lklkj', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (298, 193, N';lk;lklkj', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (299, 193, N';lk;lklkj', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (300, 198, N'Mtskheta', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (301, 198, N'მცხეთა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (302, 198, N'Мцхета', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (303, 199, N'დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (304, 199, N'Rent Daily', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (305, 199, N'посуточно', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (306, 200, N'Property', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (307, 200, N'Property', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (308, 200, N'Property', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (309, 201, N'Description', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (310, 201, N'Description', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (311, 201, N'Descrip', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (312, 214, N'lksfjlk', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (313, 214, N'lkjsldfjl', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (314, 214, N'lkjlk', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (315, 215, N'jlkjl', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (316, 215, N'kjlkj', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (317, 215, N'lkj', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (318, 216, N'3 Aliosha Jafaridze St, Didi Lilo, Georgia', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (319, 216, N'3 Aliosha Jafaridze St, Didi Lilo, Georgia', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (321, 216, N'3 Aliosha Jafaridze St, Didi Lilo, Georgia', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (322, 217, N'ქირავდება სახლი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (323, 217, N'for Rent in Mtskheta', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (324, 217, N'ქირავდება სახლი', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (325, 218, N'ქირავდება დღიურად, თვიურად, წლიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (326, 218, N'For rent ', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (327, 218, N'ქირავდება დღიურად, თვიურად, წლიურად', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (328, 219, N'ჭავჭავაძის ქუჩა, Mtskheta, Georgia', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (329, 219, N'ჭავჭავაძის ქუჩა, Mtskheta, Georgia', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (330, 219, N'ჭავჭავაძის ქუჩა, Mtskheta, Georgia', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (331, 220, N'Pending', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (332, 220, N'ელოდება', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (333, 220, N'в ожидании', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (334, 221, N'Published', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (335, 221, N'опубликовано', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (336, 221, N'გამოქვეყნდა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (337, 222, N'Processing', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (338, 222, N'მუშავდება', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (339, 222, N'обработка', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (340, 223, N'ბინა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (341, 223, N'bina', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (342, 223, N'ბინა', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (343, 224, N'qiravdeba dgiurad', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (344, 224, N'qiravdeba dgiurad ', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (345, 224, N'qiravdeba dgiurad', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (346, 225, N'20 Inasaridze St, Batumi, Georgia', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (347, 225, N'20 Inasaridze St, Batumi, Georgia', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (348, 225, N'20 Inasaridze St, Batumi, Georgia', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (349, 226, N'ქირავდება დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (350, 226, N'ქირავდება დღიურად', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (351, 226, N'ქირავდება დღიურად', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (352, 227, N'ქირავდება ბინა დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (353, 227, N'ქირავდება ბინა დღიურად', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (354, 227, N'ქირავდება ბინა დღიურად', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (355, 228, N'12v Nikolioz Kipshidze St, T''bilisi 0179, Georgia', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (356, 228, N'12v Nikolioz Kipshidze St, T''bilisi 0179, Georgia', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (357, 228, N'12v Nikolioz Kipshidze St, T''bilisi 0179, Georgia', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (358, 229, N'Mortgage', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (359, 229, N'გირავდება', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (360, 229, N'Ипотека', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (361, 230, N'იჯარით', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (362, 230, N'Lease', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (363, 230, N'Арендовать', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (364, 231, N'Commercial Real Estate', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (365, 231, N'კომერციული ფართები', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (366, 231, N'Коммерческая площадь', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (367, 232, N'Гостиницa', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (368, 232, N'Hotel', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (369, 232, N'სასტუმრო', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (370, 233, N'Your property has been Uploaded!', 2)
GO
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (372, 233, N'თქვენი ქონება აიტვირთა!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (373, 233, N'ваша недвижимость была загружена!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (374, 234, N'Your property has been updated!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (375, 234, N'ваша недвижимость была обновлена!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (376, 234, N'თქვენი ქონება განახლდა!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (377, 235, N'Your property has been activated!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (378, 235, N'თქვენი ქონება გააქტიურებულია!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (379, 235, N'
Ваша недвижимость активирована!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (380, 236, N'Your property has been deactivated!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (381, 236, N'
Ваша недвижимость деактивирована!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (382, 236, N'
თქვენი ქონება დეაქტივირებულია!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (383, 237, N'Your property activation has been continued!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (384, 237, N'
თქვენი ქონების აქტივაცია გაგრძელდა!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (385, 237, N'
Активация вашей недвижимость продолжается!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (386, 240, N'Your property has been removed!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (387, 240, N'Ваша недвижимость удалена!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (388, 240, N'
თქვენი ქონება წაიშალა!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (389, 238, N'Your profile has been updated!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (390, 238, N'
თქვენი პროფილი განახლებულია!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (391, 238, N'
Ваш профиль обновлен!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (392, 239, N'Your password has been changed!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (393, 239, N'
Ваш пароль был изменен!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (394, 239, N'
თქვენი პაროლი შეიცვალა!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (395, 241, N'Someone sent you a message!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (396, 241, N'
ვიღაცამ გამოგიგზავნათ შეტყობინება!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (397, 241, N'
Кто-то отправил вам сообщение!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (398, 242, N'Someone added your property to favorites!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (399, 242, N'
Кто-то добавил вашу недвижимость в избранное!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (400, 242, N'
ვიღაცამ დაამატა თქვენი ქონება ფავორიტებში!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (401, 243, N'Someone removed your property from favorites!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (402, 243, N'
ვიღაცამ წაშალა თქვენი ქონება ფავორიტებიდან!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (403, 243, N'
Кто-то удалил вашу недвижимость из избранного!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (404, 244, N'Someone left the review on your property!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (405, 244, N'
Кто-то оставил отзыв о вашей недвижимости!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (406, 244, N'ვიღაცამ დატოვა განხილვა თქვენს ქონებაზე!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (407, 245, N'You have bought a package for your property!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (408, 245, N'
თქვენ შეიძინეთ პაკეტი თქვენი ქონებისთვის!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (409, 245, N'Вы купили пакет для своей недвижимости!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (410, 246, N'You have updated the package for your property!', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (411, 246, N'
Вы обновили пакет для своей собственности!', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (412, 246, N'თქვენ განაახლეთ თქვენი ქონების პაკეტი!', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (413, 247, N'ქირავდება ბინა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (414, 247, N'ქირავდება ბინა', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (415, 247, N'ქირავდება ბინა', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (416, 248, N'ქირავდება ბინა დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (417, 248, N'ქირავდება ბინა დღიურად', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (418, 248, N'ქირავდება ბინა დღიურად', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (419, 249, N'9 ქაქუცა ჩოლოყაშვილის ქუჩა, T''bilisi, Georgia', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (420, 249, N'9 ქაქუცა ჩოლოყაშვილის ქუჩა, T''bilisi, Georgia', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (421, 249, N'9 ქაქუცა ჩოლოყაშვილის ქუჩა, T''bilisi, Georgia', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (422, 250, N'ავტომატური განახლება', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (423, 250, N'Automatic Update', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (424, 250, N'
автоматическое обновление', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (425, 194, N'VIP', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (426, 194, N'VIP', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (427, 194, N'VIP', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (428, 196, N'VIP+', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (429, 196, N'VIP+', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (430, 196, N'VIP+', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (431, 195, N'Super VIP', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (432, 195, N'супер VIP', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (433, 195, N'სუპერ VIP', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (434, 251, N'ფერის დამატება', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (435, 251, N'Add Color', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (436, 251, N'
добавить цвет', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (437, 252, N'ქირავდება ბინა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (438, 253, N'იყიდება ბინა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (439, 254, N'ქირავდება ბინა დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (440, 257, N'გირავდება ბინა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (441, 258, N'გაიცემა ბინა იჯარით', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (442, 259, N'ქირავდება კერძო სახლი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (444, 260, N'იყიდება კერძო სახლი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (445, 261, N'ქირავდება კერძო სახლი დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (446, 262, N'გირავდება კერძო სახლი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (447, 263, N'გაიცემა კერძო სახლი იჯარით', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (448, 264, N'ქირავდება მიწის ნაკვეთი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (449, 265, N'იყიდება მიწის ნაკვეთი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (450, 266, N'ქირავდება მიწის ნაკვეთი დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (451, 267, N'გირავდება მიწის ნაკვეთი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (452, 268, N'გაიცემა მიწის ნაკვეთი იჯარით', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (453, 269, N'ქირავდება კომერციული ფართი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (454, 270, N'იყიდება კომერციული ფართი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (455, 271, N'ქირავდება კომერციული ფართი დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (456, 272, N'გირავდება კომერციული ფართი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (457, 273, N'გაიცემა კომერციული ფართი იჯარით', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (458, 274, N'ქირავდება სასტუმრო', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (459, 275, N'იყიდება სასტუმრო', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (460, 276, N'ქირავდება სასტუმრო დღიურად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (461, 277, N'გირავდება სასტუმრო', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (462, 278, N'გაიცემა სასტუმრო იჯარით', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (463, 252, N'
flat for rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (465, 253, N'Apartment for sale
', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (466, 254, N'Apartment for daily rent
', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (467, 257, N'Lease the apartment
', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (468, 258, N'Apartment for lease', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (469, 259, N'House for rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (470, 260, N'House for sale', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (471, 261, N'House for daily rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (472, 262, N'Lease the house', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (473, 263, N'House for lease', 2)
GO
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (474, 264, N'Land for rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (475, 265, N'Land for sale', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (476, 266, N'Land for daily rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (477, 267, N'Lease the land', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (478, 268, N'Land for lease', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (480, 269, N'Commercial space for rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (481, 270, N'Commercial space for sale', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (482, 271, N'Commercial space for daily rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (483, 272, N'Lease the commercial space', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (484, 273, N'Commercial space for lease', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (485, 274, N'Hotel for rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (486, 275, N'Hotel for sale', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (487, 276, N'Hotel for daily rent', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (488, 277, N'Lease the hotel', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (489, 278, N'Hotel for lease', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (490, 252, N'
квартира в аренду', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (491, 253, N'Продажа квартиры
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (493, 254, N'Квартира посуточно
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (494, 257, N'Сдам квартиру
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (495, 258, N'Аренда квартиры
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (496, 259, N'сдается дом
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (497, 260, N'дом на продажу
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (498, 261, N'Дом посуточно
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (499, 262, N'Сдам дом
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (501, 263, N'Аренда дома
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (502, 264, N'Аренда земли
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (503, 265, N'Земля для продажи
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (504, 266, N'Земельный участок в аренду посуточно
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (505, 267, N'Сдам землю в аренду
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (506, 268, N'Аренда земли
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (508, 269, N'Аренда коммерческой площади
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (509, 270, N'Продажа коммерческой площади
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (510, 271, N'Коммерческое помещение в аренду посуточно
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (511, 272, N'Сдам в аренду торговую площадь
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (512, 273, N'Аренда коммерческой площади
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (513, 274, N'Аренда гостиницы
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (514, 275, N'Продажа гостиницы
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (515, 276, N'Гостиница посуточно
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (516, 277, N'Сдам в аренду отель
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (517, 278, N'Аренда гостиницы
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (518, 279, N'ენა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (519, 280, N'შესვლა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (520, 281, N'რეგისტრაცია', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (521, 282, N'იპოვე შენი ოცნების სახლი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (522, 283, N'საძიებო სიტყვა...', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (523, 284, N'მდებარეობა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (524, 285, N'საკუთრების ტიპი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (525, 286, N'ფასი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (526, 287, N'ვრცლად', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (527, 288, N'ძებნა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (528, 289, N'კეთილმოწყობა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (529, 290, N'სველი წერტილი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (530, 291, N'საძინებელი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (531, 292, N'მდგომარეობა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (532, 293, N'ფართი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (533, 294, N'დახურვა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (534, 279, N'Language', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (535, 280, N'Login', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (536, 281, N'Register', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (537, 282, N'Find Your Dream Home', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (538, 283, N'Enter Keyword...', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (539, 284, N'Location', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (540, 285, N'Property Type', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (541, 286, N'Price', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (542, 287, N'Advanced', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (543, 288, N'Search', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (544, 289, N'Amenities', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (545, 290, N'Baths', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (546, 291, N'Beds', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (547, 292, N'State', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (548, 293, N'Built-up Area', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (549, 294, N'Hide', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (550, 279, N'Язык', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (551, 280, N'Авторизоваться', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (552, 281, N'Pегистрироваться', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (553, 282, N'Найдите дом своей мечты', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (554, 283, N'ключевое слово...', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (555, 284, N'место нахождения', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (556, 285, N'Тип недвижимости', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (557, 286, N'Цена', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (558, 287, N'Другой', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (559, 288, N'Поиск', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (560, 289, N'Удобства', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (561, 290, N'Ванные комнаты', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (562, 291, N'Спальни', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (563, 292, N'Состояние', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (564, 293, N'Площадь застройки
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (565, 294, N'Закрыть', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (566, 295, N'Sq Mtr.', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (567, 296, N'Description', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (568, 297, N'Property Details', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (569, 298, N'Cadastral Code', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (570, 299, N'Property Status', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (571, 300, N'Garage', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (572, 301, N'Ceiling Size', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (573, 302, N'Listed By', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (574, 303, N'Subject', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (575, 304, N'Email', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (577, 305, N'I''m interested in [Listing Single]', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (578, 306, N'Send Email', 2)
GO
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (579, 307, N'Features', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (580, 308, N'Payment Calculator', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (581, 309, N'Reviews', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (582, 310, N'Write a Review', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (583, 311, N'Similar Properties', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (585, 312, N'Recently Viewed', 2)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (586, 295, N'კვ. მ.', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (587, 296, N'აღწერა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (588, 297, N'ქონების დეტალები
', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (589, 298, N'საკადასტრო კოდი
', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (590, 299, N'საკუთრების სტატუსი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (591, 300, N'ავტოფარეხი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (592, 301, N'ჭერის სიმაღლე', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (593, 302, N'ამტვირთველი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (594, 303, N'სათაური', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (595, 304, N'თქვენი ელ. მისამართი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (596, 305, N'მე მაინტერესებს...', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (597, 306, N'გაგზავნა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (598, 307, N'აღჭურვილობა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (599, 308, N'გადახდის კალკულატორი', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (600, 309, N'მიმოხილვები', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (601, 310, N'მიმოხილვის დაწერა', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (602, 311, N'მსგავსი საკუთრებები', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (603, 312, N'ახლახანს ნახული', 1)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (604, 295, N'Кв. М.', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (605, 296, N'Описание', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (607, 297, N'
Детали недвижимости', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (608, 298, N'
Кадастровый код', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (609, 299, N'Статус собственности
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (611, 300, N'Гараж', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (612, 301, N'Высота потолка
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (613, 302, N'Загрузчик', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (614, 303, N'тема', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (616, 304, N'Эл. адрес', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (617, 305, N'
Я думаю ...', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (618, 306, N'послать', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (619, 307, N'Особенности', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (620, 308, N'
Калькулятор платежей', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (621, 309, N'Отзывы', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (622, 310, N'
написать рецензию', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (623, 311, N'аналогичные свойства
', 3)
INSERT [dbo].[Translations] ([Id], [ContentId], [Text], [LanguageId]) VALUES (624, 312, N'Недавно просмотренные
', 3)
SET IDENTITY_INSERT [dbo].[Translations] OFF
GO
SET IDENTITY_INSERT [dbo].[UserActivities] ON 

INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (1, 1, NULL, 72, 1)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (2, 1, NULL, 54, 1)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (3, 1, NULL, NULL, 6)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (6, 1, NULL, NULL, 8)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (8, 1, 1, 54, 11)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (9, 1, 1, 54, 12)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (10, 1, 1, 54, 13)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (11, 1, 1, 54, 11)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (12, 2, 1, 71, 11)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (13, 1, 1, 72, 11)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (14, 2, 1, 71, 11)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (15, 2, 1, 71, 12)
INSERT [dbo].[UserActivities] ([Id], [UserId], [VisitorId], [PropertyId], [ActivityId]) VALUES (16, 1, 1, 54, 12)
SET IDENTITY_INSERT [dbo].[UserActivities] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

INSERT [dbo].[UserDetails] ([Id], [UserId], [Name], [LastName], [Phone], [LocationId], [UserDetailsId], [Picture], [Website], [Landscaping]) VALUES (1, N'e2d5e8c6-08fc-46e6-b5fd-8aee66466efe', N'Ana', N'Dvalii', N'555528498', NULL, NULL, N'../../Content/images/agents/pnk mrbl.jpg', NULL, NULL)
INSERT [dbo].[UserDetails] ([Id], [UserId], [Name], [LastName], [Phone], [LocationId], [UserDetailsId], [Picture], [Website], [Landscaping]) VALUES (2, N'080f21ee-3feb-446a-8bfe-206f9d462695', N'Ana', N'Dvali', N'555528490', NULL, NULL, N'../../Content/images/agents/pnk mrbl.jpg', NULL, NULL)
INSERT [dbo].[UserDetails] ([Id], [UserId], [Name], [LastName], [Phone], [LocationId], [UserDetailsId], [Picture], [Website], [Landscaping]) VALUES (3, N'f23f1ff0-7523-4e76-8d16-42e3dc4ce7b5', N'Mamuka', N'Kurtskhalidze', N'555204528', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserDetails] ([Id], [UserId], [Name], [LastName], [Phone], [LocationId], [UserDetailsId], [Picture], [Website], [Landscaping]) VALUES (4, N'ee316bc0-8a39-40ac-a562-b3c7b7f13e00', N'Mamuka', N'Kurtskhalidze', N'995 555 28 45 20', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserDetails] ([Id], [UserId], [Name], [LastName], [Phone], [LocationId], [UserDetailsId], [Picture], [Website], [Landscaping]) VALUES (5, N'c8ffa3af-4f02-46a9-a98e-b70b853db0c7', N'mamukakurtskhalidze', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_Content]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Content]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[ConnectedUsers]  WITH CHECK ADD  CONSTRAINT [FK_ConnectedUsers_UserDetails] FOREIGN KEY([User1])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[ConnectedUsers] CHECK CONSTRAINT [FK_ConnectedUsers_UserDetails]
GO
ALTER TABLE [dbo].[ConnectedUsers]  WITH CHECK ADD  CONSTRAINT [FK_ConnectedUsers_UserDetails1] FOREIGN KEY([User2])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[ConnectedUsers] CHECK CONSTRAINT [FK_ConnectedUsers_UserDetails1]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Content]
GO
ALTER TABLE [dbo].[CurrentStatus]  WITH CHECK ADD  CONSTRAINT [FK_CurrentStatus_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[CurrentStatus] CHECK CONSTRAINT [FK_CurrentStatus_Content]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Property]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_UserDetails]
GO
ALTER TABLE [dbo].[Features]  WITH CHECK ADD  CONSTRAINT [FK_Features_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[Features] CHECK CONSTRAINT [FK_Features_Content]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Cities]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Content1] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Content1]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Property]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_ConnectedUsers] FOREIGN KEY([ConnectedUserId])
REFERENCES [dbo].[ConnectedUsers] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_ConnectedUsers]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_UserDetails] FOREIGN KEY([SenderId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_UserDetails]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Currencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Currencies]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_CurrentStatus] FOREIGN KEY([CurrentStatusId])
REFERENCES [dbo].[CurrentStatus] ([Id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_CurrentStatus]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Location]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_PropertyType] FOREIGN KEY([PropertyTypeId])
REFERENCES [dbo].[PropertyType] ([Id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_PropertyType]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_State]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Status]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_UserDetails] FOREIGN KEY([UserDetailsId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_UserDetails]
GO
ALTER TABLE [dbo].[PropertyContent]  WITH CHECK ADD  CONSTRAINT [FK_PropertyContent_Content] FOREIGN KEY([contentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[PropertyContent] CHECK CONSTRAINT [FK_PropertyContent_Content]
GO
ALTER TABLE [dbo].[PropertyContent]  WITH CHECK ADD  CONSTRAINT [FK_PropertyContent_Property] FOREIGN KEY([propertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[PropertyContent] CHECK CONSTRAINT [FK_PropertyContent_Property]
GO
ALTER TABLE [dbo].[PropertyFeature]  WITH CHECK ADD  CONSTRAINT [FK_PropertyFeature_Features] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Features] ([Id])
GO
ALTER TABLE [dbo].[PropertyFeature] CHECK CONSTRAINT [FK_PropertyFeature_Features]
GO
ALTER TABLE [dbo].[PropertyFeature]  WITH CHECK ADD  CONSTRAINT [FK_PropertyFeature_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[PropertyFeature] CHECK CONSTRAINT [FK_PropertyFeature_Property]
GO
ALTER TABLE [dbo].[PropertyServices]  WITH CHECK ADD  CONSTRAINT [FK_PropertyServices_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[PropertyServices] CHECK CONSTRAINT [FK_PropertyServices_Property]
GO
ALTER TABLE [dbo].[PropertyServices]  WITH CHECK ADD  CONSTRAINT [FK_PropertyServices_Services] FOREIGN KEY([ServicesId])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[PropertyServices] CHECK CONSTRAINT [FK_PropertyServices_Services]
GO
ALTER TABLE [dbo].[PropertyType]  WITH CHECK ADD  CONSTRAINT [FK_PropertyType_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[PropertyType] CHECK CONSTRAINT [FK_PropertyType_Content]
GO
ALTER TABLE [dbo].[PropertyViews]  WITH CHECK ADD  CONSTRAINT [FK_PropertyViews_IPs] FOREIGN KEY([IpId])
REFERENCES [dbo].[IPs] ([Id])
GO
ALTER TABLE [dbo].[PropertyViews] CHECK CONSTRAINT [FK_PropertyViews_IPs]
GO
ALTER TABLE [dbo].[PropertyViews]  WITH CHECK ADD  CONSTRAINT [FK_PropertyViews_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[PropertyViews] CHECK CONSTRAINT [FK_PropertyViews_Property]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Property]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Property1] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Property1]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_UserDetails] FOREIGN KEY([UserDetailsId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_UserDetails]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_UserDetails1] FOREIGN KEY([UserDetailsId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_UserDetails1]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Content]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Content]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Content]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([Id])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Content]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Language]
GO
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD  CONSTRAINT [FK_UserActivities_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[UserActivities] CHECK CONSTRAINT [FK_UserActivities_Activities]
GO
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD  CONSTRAINT [FK_UserActivities_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([Id])
GO
ALTER TABLE [dbo].[UserActivities] CHECK CONSTRAINT [FK_UserActivities_Property]
GO
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD  CONSTRAINT [FK_UserActivities_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[UserActivities] CHECK CONSTRAINT [FK_UserActivities_UserDetails]
GO
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD  CONSTRAINT [FK_UserActivities_UserDetails1] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[UserActivities] CHECK CONSTRAINT [FK_UserActivities_UserDetails1]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_Location]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_UserDetails] FOREIGN KEY([UserDetailsId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_UserDetails]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_Users]
GO
USE [master]
GO
ALTER DATABASE [DB_RealEstate] SET  READ_WRITE 
GO
