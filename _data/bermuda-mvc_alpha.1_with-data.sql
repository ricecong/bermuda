USE [master]
GO
/****** Object:  Database [bermuda-mvc]    Script Date: 2018/6/6 17:39:59 ******/
CREATE DATABASE [bermuda-mvc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bermuda-mvc', FILENAME = N'E:\studiospace\Database\_msserver\bermuda-mvc\bermuda-mvc.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bermuda-mvc_log', FILENAME = N'E:\studiospace\Database\_msserver\bermuda-mvc\bermuda-mvc_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bermuda-mvc] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bermuda-mvc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bermuda-mvc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bermuda-mvc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bermuda-mvc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bermuda-mvc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bermuda-mvc] SET ARITHABORT OFF 
GO
ALTER DATABASE [bermuda-mvc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bermuda-mvc] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bermuda-mvc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bermuda-mvc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bermuda-mvc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bermuda-mvc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bermuda-mvc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bermuda-mvc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bermuda-mvc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bermuda-mvc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bermuda-mvc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bermuda-mvc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bermuda-mvc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bermuda-mvc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bermuda-mvc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bermuda-mvc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bermuda-mvc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bermuda-mvc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bermuda-mvc] SET RECOVERY FULL 
GO
ALTER DATABASE [bermuda-mvc] SET  MULTI_USER 
GO
ALTER DATABASE [bermuda-mvc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bermuda-mvc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bermuda-mvc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bermuda-mvc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bermuda-mvc', N'ON'
GO
USE [bermuda-mvc]
GO
/****** Object:  Table [dbo].[BmdConsignee]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdConsignee](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[Consignee] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[PhoneNum] [char](11) NULL,
 CONSTRAINT [PK_BmdConsignee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdCurrent]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdCurrent](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[Title] [varchar](100) NULL,
	[Text] [text] NULL,
	[CmntCount] [bigint] NULL CONSTRAINT [DF_current_cmnt_count]  DEFAULT ((0)),
	[StarCount] [bigint] NULL CONSTRAINT [DF_current_star_count]  DEFAULT ((0)),
	[PraiseCount] [bigint] NULL CONSTRAINT [DF_current_praise_count]  DEFAULT ((0)),
	[CreatedAt] [datetime] NULL CONSTRAINT [DF_BmdCurrent_CreatedAt]  DEFAULT (getdate()),
 CONSTRAINT [pk_current] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdCurrentCmnt]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdCurrentCmnt](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CurrentId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[Contents] [varchar](280) NULL,
	[CmntDate] [datetime] NULL,
	[PraiseCount] [bigint] NULL,
	[ReplyCount] [bigint] NULL,
 CONSTRAINT [PK_current_cmnt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdCurrentCmntPraise]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdCurrentCmntPraise](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CmntId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[PraiseDate] [datetime] NULL,
 CONSTRAINT [PK_BmdCurrentCmntPraise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdCurrentCmntReply]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdCurrentCmntReply](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CmntId] [bigint] NULL,
	[AimsId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[Contents] [varchar](280) NULL,
	[ReplyDate] [datetime] NULL,
	[PraiseCount] [bigint] NULL,
 CONSTRAINT [pk_current_reply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdCurrentCmntReplyPraise]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdCurrentCmntReplyPraise](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReplyId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[PraiseDate] [datetime] NULL,
 CONSTRAINT [PK_BmdCurrentCmntReplyPraise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdCurrentPraise]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdCurrentPraise](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CurrentId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[PraiseDate] [datetime] NULL,
 CONSTRAINT [PK_BmdCurrentPraise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdCurrentStar]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdCurrentStar](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CurrentId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[StarDate] [datetime] NULL,
 CONSTRAINT [pk_current_star] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdNotice]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdNotice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[SpecieId] [bigint] NULL,
	[Type] [char](8) NULL,
	[Title] [varchar](100) NULL,
	[Place] [varchar](100) NULL,
	[FullPlace] [varchar](200) NULL,
	[EventTimeDesc] [varchar](100) NULL,
	[ImgUrl] [varchar](200) NULL,
	[ContactWay] [varchar](100) NULL,
	[Detail] [varchar](280) NULL,
	[CreatedAt] [datetime] NULL,
	[CmntCount] [bigint] NULL CONSTRAINT [DF_notice_cmnt_count]  DEFAULT ((0)),
	[TraceCount] [bigint] NULL CONSTRAINT [DF_notice_trace_count]  DEFAULT ((0)),
	[IsSolved] [tinyint] NULL CONSTRAINT [DF_BmdNotice_Status]  DEFAULT ((0)),
 CONSTRAINT [pk_notice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdNoticeCmnt]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdNoticeCmnt](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[NoticeId] [bigint] NULL,
	[Contents] [varchar](280) NULL,
	[CmntDate] [datetime] NULL,
	[ReplyCount] [bigint] NULL,
 CONSTRAINT [pk_notice_cmnt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdNoticeCmntReply]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdNoticeCmntReply](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CmntId] [bigint] NULL,
	[AimsId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[Contents] [varchar](280) NULL,
	[ReplyDate] [datetime] NULL,
 CONSTRAINT [pk_notice_reply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdNoticeSpecie]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdNoticeSpecie](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[ImgUrl] [varchar](200) NULL,
	[NoticeCount] [bigint] NULL CONSTRAINT [DF_species_notice_count]  DEFAULT ((0)),
 CONSTRAINT [pk_species] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdNoticeTrace]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdNoticeTrace](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NoticeId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[TraceDate] [datetime] NULL,
 CONSTRAINT [pk_notice_trace] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdOrder]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdOrder](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BuyerId] [bigint] NULL,
	[SellerId] [bigint] NULL,
	[ConsigneeId] [bigint] NULL,
	[CreateDate] [datetime] NULL,
	[TotalPrice] [decimal](8, 2) NULL,
 CONSTRAINT [PK_BmdOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdOrderItem]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdOrderItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[ProductId] [bigint] NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_BmdOrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdProduct]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdProduct](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[Title] [varchar](50) NULL,
	[Category] [varchar](10) NULL,
	[Tag] [varchar](10) NULL,
	[Price] [decimal](8, 2) NULL,
	[Inventory] [int] NULL CONSTRAINT [DF_BmdProduct_Qty]  DEFAULT ((0)),
	[ImgUrl] [varchar](200) NULL,
	[Tale] [text] NULL,
	[CreatedAt] [datetime] NULL CONSTRAINT [DF_BmdProduct_CreatedAt]  DEFAULT (getdate()),
 CONSTRAINT [PK_BmdProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdRoot]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdRoot](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Permission] [tinyint] NULL,
	[PhoneNum] [varchar](11) NULL,
	[Email] [varchar](200) NULL,
	[Avatar] [varchar](200) NULL,
	[Remark] [varchar](200) NULL,
 CONSTRAINT [pk_bmd_root] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdShoppingCart]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdShoppingCart](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[ProductId] [bigint] NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_BmdShoppingCart_Qty]  DEFAULT ((1)),
	[CreatedAt] [datetime] NULL CONSTRAINT [DF_BmdShoppingCart_CreatedAt]  DEFAULT (getdate()),
 CONSTRAINT [PK_BmdShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdTopic]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdTopic](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[Name] [varchar](50) NULL,
	[Detail] [varchar](100) NULL,
	[JoinCount] [bigint] NULL CONSTRAINT [DF_topic_join_count]  DEFAULT ((0)),
	[ImgUrl] [varchar](200) NULL,
	[IsPassed] [tinyint] NULL CONSTRAINT [DF_topic_is_passed]  DEFAULT ((0)),
	[CreatedAt] [datetime] NULL CONSTRAINT [DF_BmdTopic_CreatedAt]  DEFAULT (getdate()),
 CONSTRAINT [pk_topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdTopicJoin]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdTopicJoin](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TopicId] [bigint] NULL,
	[CurrentId] [bigint] NULL,
	[JoinDate] [datetime] NULL,
 CONSTRAINT [pk_topic_join] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BmdUser]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BmdUser](
	[Id] [bigint] IDENTITY(10001,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Sex] [char](2) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [varchar](200) NULL,
	[Type] [varchar](20) NULL,
	[Pwd] [varchar](16) NOT NULL,
	[AvatarUrl] [varchar](200) NULL CONSTRAINT [DF_bmd_user_avatar]  DEFAULT ('/assets/avatar-tmp.svg'),
	[FollowingCount] [bigint] NULL CONSTRAINT [DF_bmd_user_following_count]  DEFAULT ((0)),
	[FollowerCount] [bigint] NULL CONSTRAINT [DF_bmd_user_follower_count]  DEFAULT ((0)),
	[LostCount] [bigint] NULL CONSTRAINT [DF_BmdUser_LostCount]  DEFAULT ((0)),
	[FoundCount] [bigint] NULL CONSTRAINT [DF_BmdUser_FoundCount]  DEFAULT ((0)),
	[HelpCount] [bigint] NULL CONSTRAINT [DF_BmdUser_HelpCount]  DEFAULT ((0)),
	[Rating] [decimal](2, 1) NULL CONSTRAINT [DF_bmd_user_rate]  DEFAULT ((0.0)),
	[Credit] [int] NULL CONSTRAINT [DF_BmdUser_Credit]  DEFAULT ((0)),
	[CreatedAt] [datetime] NULL CONSTRAINT [DF_BmdUser_CreateAt]  DEFAULT (getdate()),
 CONSTRAINT [pk_bmd_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BmdUserFollow]    Script Date: 2018/6/6 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BmdUserFollow](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[FollowingId] [bigint] NULL,
 CONSTRAINT [PK_follow_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BmdCurrent] ON 

INSERT [dbo].[BmdCurrent] ([Id], [UserId], [Title], [Text], [CmntCount], [StarCount], [PraiseCount], [CreatedAt]) VALUES (1, 10001, N'test current title', N'hello bermuda', 0, 0, 0, CAST(N'2018-06-06 17:35:20.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[BmdCurrent] OFF
SET IDENTITY_INSERT [dbo].[BmdNotice] ON 

INSERT [dbo].[BmdNotice] ([Id], [UserId], [SpecieId], [Type], [Title], [Place], [FullPlace], [EventTimeDesc], [ImgUrl], [ContactWay], [Detail], [CreatedAt], [CmntCount], [TraceCount], [IsSolved]) VALUES (1, 10001, 1, N'招领启示', N'test 1', N'test place 1', N'test full place 1', N'2015-2-14', N'/assets/img/notices/test.jpg', N'电话18170826687', N'test detail 1', CAST(N'2017-12-14 00:00:00.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[BmdNotice] ([Id], [UserId], [SpecieId], [Type], [Title], [Place], [FullPlace], [EventTimeDesc], [ImgUrl], [ContactWay], [Detail], [CreatedAt], [CmntCount], [TraceCount], [IsSolved]) VALUES (2, 10001, 2, N'寻物启示', N'test 2', N'test place 2', N'test full place 2', N'2015-3-14', N'/assets/template.svg', N'QQ1203953195', N'test detail 2', CAST(N'2018-03-12 00:00:00.000' AS DateTime), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[BmdNotice] OFF
SET IDENTITY_INSERT [dbo].[BmdNoticeSpecie] ON 

INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (1, N'钱', N'/assets/img/species/money.jpg', 0)
INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (2, N'卡类', N'/assets/img/species/card.jpg', 3)
INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (4, N'证件', N'/assets/img/species/cred.jpg', 2)
INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (5, N'饰品', N'/assets/img/species/acce.jpg', 0)
INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (6, N'箱包', N'/assets/img/species/bag.jpg', 0)
INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (7, N'文具', N'/assets/img/species/stati.jpg', 0)
INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (8, N'图书', N'/assets/img/species/book.jpg', 0)
INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (9, N'生活用具', N'/assets/img/species/living.jpg', 0)
INSERT [dbo].[BmdNoticeSpecie] ([Id], [Name], [ImgUrl], [NoticeCount]) VALUES (10, N'电子数码', N'/assets/img/species/elect.jpg', 0)
SET IDENTITY_INSERT [dbo].[BmdNoticeSpecie] OFF
SET IDENTITY_INSERT [dbo].[BmdProduct] ON 

INSERT [dbo].[BmdProduct] ([Id], [UserId], [Title], [Category], [Tag], [Price], [Inventory], [ImgUrl], [Tale], [CreatedAt]) VALUES (1, 10001, N'iPad 4 Mini', N'', N'电子数码', CAST(3800.01 AS Decimal(8, 2)), 2, N'/assets/template.svg', N'test tale', CAST(N'2018-06-02 19:25:46.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[BmdProduct] OFF
SET IDENTITY_INSERT [dbo].[BmdShoppingCart] ON 

INSERT [dbo].[BmdShoppingCart] ([Id], [UserId], [ProductId], [Quantity], [CreatedAt]) VALUES (1, 10001, 1, 1, CAST(N'2018-06-03 16:32:07.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[BmdShoppingCart] OFF
SET IDENTITY_INSERT [dbo].[BmdTopic] ON 

INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (1, 10001, N'测试话题', N'这是一个测试话题', 5, N'/assets/template.svg', 0, CAST(N'2018-04-15 00:00:00.000' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (2, 10001, N'公益', N'公益活动，献出你的爱心', 6, N'/assets/img/topics/help.jpg', 1, CAST(N'2018-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (3, 10001, N'人文', N'人文世界', 1, N'/assets/img/topics/renwen.jpg', 1, CAST(N'2018-01-07 12:39:24.293' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (4, 10001, N'旅行', N'有人说：“人生至少要有两次冲动：一场奋不顾身的爱情和一段走就走的旅行。”', 3, N'/assets/img/topics/bike.jpg', 1, CAST(N'2018-01-07 14:00:03.830' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (5, 10001, N'创意', N'敏于观察，勤于思考，善于综合，勇于创新。', 4, N'/assets/img/topics/idea.jpg', 1, CAST(N'2018-01-07 14:15:22.340' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (6, 10001, N'校园', N'静思笃行，持中秉正', 0, N'/assets/img/topics/jxnu.jpg', 1, CAST(N'2018-01-07 14:17:47.873' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (7, 10001, N'美食', N'世间情动，不过寒冬南昌瓦罐汤', 0, N'/assets/img/topics/food.jpg', 1, CAST(N'2018-01-07 14:28:53.223' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (8, 10001, N'科技', N'科学技术是第一生产力！', 0, N'/assets/img/topics/keji.jpg', 1, CAST(N'2018-01-07 14:31:53.530' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (9, 10001, N'运动', N'生命在于运动', 0, N'/assets/img/topics/sport.jpg', 1, CAST(N'2018-01-07 14:33:06.590' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (10, 10001, N'二次元', N'愿以百年挽朝夕', 0, N'/assets/img/topics/boy.jpg', 1, CAST(N'2018-01-07 14:38:00.033' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (11, 10001, N'义卖进行时', N'义卖活动', 1, N'/assets/img/topics/girl.jpg', 1, CAST(N'2018-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[BmdTopic] ([Id], [UserId], [Name], [Detail], [JoinCount], [ImgUrl], [IsPassed], [CreatedAt]) VALUES (12, 10001, N'First Topic', N'this is first topic from client', 0, N'http://localhost:53595/public/img/9f95acbf-a9f1-4b11-a213-65091e5a770c.jpg', 0, CAST(N'2018-06-01 13:12:18.743' AS DateTime))
SET IDENTITY_INSERT [dbo].[BmdTopic] OFF
SET IDENTITY_INSERT [dbo].[BmdUser] ON 

INSERT [dbo].[BmdUser] ([Id], [Name], [Sex], [PhoneNumber], [Email], [Type], [Pwd], [AvatarUrl], [FollowingCount], [FollowerCount], [LostCount], [FoundCount], [HelpCount], [Rating], [Credit], [CreatedAt]) VALUES (10001, N'test', N'男', N'18170826687', N'test@test.com', N'学生', N'test123', N'/assets/avatar-tmp.svg', 0, 0, 0, 0, 0, CAST(0.0 AS Decimal(2, 1)), 0, CAST(N'2018-05-19 10:19:18.587' AS DateTime))
INSERT [dbo].[BmdUser] ([Id], [Name], [Sex], [PhoneNumber], [Email], [Type], [Pwd], [AvatarUrl], [FollowingCount], [FollowerCount], [LostCount], [FoundCount], [HelpCount], [Rating], [Credit], [CreatedAt]) VALUES (10002, N'bermuda', NULL, NULL, N'bermuda@bmd.com', NULL, N'bmd123', N'/assets/avatar-tmp.svg', 0, 0, 0, 0, 0, CAST(0.0 AS Decimal(2, 1)), 0, CAST(N'2018-05-02 10:19:18.587' AS DateTime))
INSERT [dbo].[BmdUser] ([Id], [Name], [Sex], [PhoneNumber], [Email], [Type], [Pwd], [AvatarUrl], [FollowingCount], [FollowerCount], [LostCount], [FoundCount], [HelpCount], [Rating], [Credit], [CreatedAt]) VALUES (10003, N'_king', NULL, NULL, N'_king@bmd.com', NULL, N'_king123', N'/assets/avatar-tmp.svg', 0, 0, 0, 0, 0, CAST(0.0 AS Decimal(2, 1)), 0, CAST(N'2018-05-03 10:19:18.587' AS DateTime))
INSERT [dbo].[BmdUser] ([Id], [Name], [Sex], [PhoneNumber], [Email], [Type], [Pwd], [AvatarUrl], [FollowingCount], [FollowerCount], [LostCount], [FoundCount], [HelpCount], [Rating], [Credit], [CreatedAt]) VALUES (10004, N'John Doe', NULL, NULL, N'john@bmd.com', NULL, N'john123', N'/assets/avatar-tmp.svg', 0, 0, 0, 0, 0, CAST(0.0 AS Decimal(2, 1)), 0, CAST(N'2018-05-04 10:19:18.587' AS DateTime))
INSERT [dbo].[BmdUser] ([Id], [Name], [Sex], [PhoneNumber], [Email], [Type], [Pwd], [AvatarUrl], [FollowingCount], [FollowerCount], [LostCount], [FoundCount], [HelpCount], [Rating], [Credit], [CreatedAt]) VALUES (10005, N'Leo', NULL, NULL, N'leo@bmd.com', NULL, N'leo123', N'/assets/avatar-tmp.svg', 0, 0, 0, 0, 0, CAST(0.0 AS Decimal(2, 1)), 0, CAST(N'2018-05-05 10:19:18.587' AS DateTime))
INSERT [dbo].[BmdUser] ([Id], [Name], [Sex], [PhoneNumber], [Email], [Type], [Pwd], [AvatarUrl], [FollowingCount], [FollowerCount], [LostCount], [FoundCount], [HelpCount], [Rating], [Credit], [CreatedAt]) VALUES (10006, N'Tom', NULL, NULL, N'tom@bmd.com', NULL, N'tom123', N'/assets/avatar-tmp.svg', 0, 0, 0, 0, 0, CAST(0.0 AS Decimal(2, 1)), 0, CAST(N'2018-05-06 10:19:18.587' AS DateTime))
INSERT [dbo].[BmdUser] ([Id], [Name], [Sex], [PhoneNumber], [Email], [Type], [Pwd], [AvatarUrl], [FollowingCount], [FollowerCount], [LostCount], [FoundCount], [HelpCount], [Rating], [Credit], [CreatedAt]) VALUES (10007, N'Jack', NULL, NULL, N'jack@bmd.com', NULL, N'jack123', N'/assets/avatar-tmp.svg', 0, 0, 0, 0, 0, CAST(0.0 AS Decimal(2, 1)), 0, CAST(N'2018-05-12 10:19:18.587' AS DateTime))
INSERT [dbo].[BmdUser] ([Id], [Name], [Sex], [PhoneNumber], [Email], [Type], [Pwd], [AvatarUrl], [FollowingCount], [FollowerCount], [LostCount], [FoundCount], [HelpCount], [Rating], [Credit], [CreatedAt]) VALUES (10008, N'百慕大', NULL, NULL, N'bmd@bmd.com', NULL, N'bmd123', N'/assets/avatar-tmp.svg', 0, 0, 0, 0, 0, CAST(0.0 AS Decimal(2, 1)), 0, CAST(N'2018-05-22 10:19:18.587' AS DateTime))
SET IDENTITY_INSERT [dbo].[BmdUser] OFF
ALTER TABLE [dbo].[BmdCurrentCmnt] ADD  CONSTRAINT [DF_current_cmnt_praise_count]  DEFAULT ((0)) FOR [PraiseCount]
GO
ALTER TABLE [dbo].[BmdCurrentCmnt] ADD  CONSTRAINT [DF_current_cmnt_reply_count]  DEFAULT ((0)) FOR [ReplyCount]
GO
ALTER TABLE [dbo].[BmdCurrentCmntReply] ADD  CONSTRAINT [DF_current_reply_praise_count]  DEFAULT ((0)) FOR [PraiseCount]
GO
ALTER TABLE [dbo].[BmdNoticeCmnt] ADD  CONSTRAINT [DF_notice_cmnt_reply_count]  DEFAULT ((0)) FOR [ReplyCount]
GO
USE [master]
GO
ALTER DATABASE [bermuda-mvc] SET  READ_WRITE 
GO
