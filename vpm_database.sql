USE [master]
GO
/****** Object:  Database [VPM]    Script Date: 1/9/2023 12:39:22 PM ******/
CREATE DATABASE [VPM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VPM', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\VPM.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VPM_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\VPM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VPM] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VPM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VPM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VPM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VPM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VPM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VPM] SET ARITHABORT OFF 
GO
ALTER DATABASE [VPM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VPM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VPM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VPM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VPM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VPM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VPM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VPM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VPM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VPM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VPM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VPM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VPM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VPM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VPM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VPM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VPM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VPM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VPM] SET  MULTI_USER 
GO
ALTER DATABASE [VPM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VPM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VPM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VPM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VPM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VPM] SET QUERY_STORE = OFF
GO
USE [VPM]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [VPM]
GO
/****** Object:  Table [dbo].[vpm_tbl_lov]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_lov](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NULL,
	[Name] [varchar](100) NULL,
	[Category_Id] [int] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_Date] [datetime] NULL,
 CONSTRAINT [PK_pooling_vpm_tbl_lov] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_lov_category]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_lov_category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [varchar](100) NULL,
	[Is_Active] [bit] NOT NULL,
	[Created_Date] [datetime] NULL,
 CONSTRAINT [PK_pooling_vpm_tbl_lov_category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_menu_master]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_menu_master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Link] [varchar](200) NULL,
	[Title] [varchar](200) NULL,
	[css_Class] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modify_By] [varchar](50) NULL,
	[Modify_Date] [datetime] NULL,
 CONSTRAINT [PK_pooling_vpm_tbl_menu_master] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_menu_role_mapping]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_menu_role_mapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modify_By] [varchar](50) NULL,
	[Modify_Date] [datetime] NULL,
 CONSTRAINT [PK_pooling_vpm_tbl_menu_role_mapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_Party_Master]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_Party_Master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PartyName] [varchar](max) NULL,
	[Location] [nvarchar](50) NULL,
	[Address1] [varchar](max) NULL,
	[Address2] [varchar](max) NULL,
	[Address3] [varchar](max) NULL,
	[State] [nvarchar](50) NULL,
	[Pincode] [nvarchar](10) NULL,
	[BankId] [int] NULL,
	[IFSCCode] [varchar](20) NULL,
	[AccountNo] [varchar](20) NULL,
	[GSTNO] [varchar](20) NULL,
	[PANNO] [varchar](255) NULL,
	[HSNNO] [numeric](18, 0) NULL,
	[Remark] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_vpm_tbl_Party_Masters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_Party_Master_12]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_Party_Master_12](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartyName] [varchar](max) NULL,
	[Location] [varchar](50) NULL,
	[Address1] [varchar](max) NULL,
	[Address2] [varchar](max) NULL,
	[Address3] [varchar](max) NULL,
	[State] [varchar](50) NULL,
	[Pincode] [varchar](10) NULL,
	[BankId] [int] NULL,
	[IFSCCode] [varchar](20) NULL,
	[AccountNo] [varchar](20) NULL,
	[GSTNO] [varchar](20) NULL,
	[PANNO] [varchar](50) NULL,
	[Remark] [varchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__tblVende__3214EC078882BBB5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_Party_Payment]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_Party_Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ETYPE] [varchar](50) NULL,
	[inwarddate] [datetime] NULL,
	[Department] [varchar](max) NULL,
	[PartyId] [int] NULL,
	[PartyAddress] [varchar](max) NULL,
	[PANNO] [varchar](20) NULL,
	[GSTRNo] [varchar](20) NULL,
	[PVDate] [datetime] NULL,
	[PVNO] [varchar](50) NULL,
	[VoucherTypeId] [int] NULL,
	[PK] [varchar](100) NULL,
	[SchCode] [varchar](100) NULL,
	[GLCode] [varchar](100) NULL,
	[BillDate] [datetime] NULL,
	[BillNo] [varchar](50) NULL,
	[BillAmount] [decimal](18, 2) NULL,
	[GLCODE_SGST] [varchar](50) NULL,
	[SGSTRate] [decimal](18, 2) NULL,
	[SGSTAmount] [decimal](18, 2) NULL,
	[RCMSGSTAMOUNT] [decimal](18, 2) NULL,
	[GLCODE_CGST] [varchar](50) NULL,
	[CGSTRate] [decimal](18, 2) NULL,
	[CGSTAmount] [decimal](18, 2) NULL,
	[RCMCGSTAMOUNT] [decimal](18, 2) NULL,
	[GLCODE_IGST] [varchar](50) NULL,
	[IGSTRate] [decimal](18, 2) NULL,
	[IGSTAmount] [decimal](18, 2) NULL,
	[RCMIGSTAMOUNT] [decimal](18, 2) NULL,
	[TotalBill] [decimal](18, 2) NULL,
	[GLCODE_INCOMETAX] [varchar](50) NULL,
	[IncomeTaxRate] [decimal](18, 2) NULL,
	[IncomeTaxAmount] [decimal](18, 2) NULL,
	[GLCODE_TDSUnderSGST] [varchar](50) NULL,
	[TDSUnderSGSTRate] [decimal](18, 2) NULL,
	[TDSUnderSGSTAmount] [decimal](18, 2) NULL,
	[GLCODE_TDSUnderCGST] [varchar](50) NULL,
	[TDSUnderCGSTRate] [decimal](18, 2) NULL,
	[TDSUnderCGSTAmount] [decimal](18, 2) NULL,
	[GLCODE_TDSUnderIGST] [varchar](50) NULL,
	[TDSUnderIGSTRate] [decimal](18, 2) NULL,
	[TDSUnderIGSTAmount] [decimal](18, 2) NULL,
	[GLCODE_BANK_NETAMOUNT] [varchar](50) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[PayableAtId] [int] NULL,
	[PayableAtNumber] [varchar](50) NULL,
	[PayableAtDate] [datetime] NULL,
	[HSNCode] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_vpm_tbl_Party_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_Party_Payment_multiple_scheme]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_Party_Payment_multiple_scheme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[inwarddate] [datetime] NULL,
	[Department] [varchar](max) NULL,
	[PartyId] [int] NULL,
	[PartyAddress] [varchar](max) NULL,
	[PANNO] [varchar](20) NULL,
	[GSTRNo] [varchar](20) NULL,
	[PVDate] [datetime] NULL,
	[PVNO] [varchar](50) NULL,
	[VoucherTypeId] [int] NULL,
	[PK] [varchar](100) NULL,
	[BillDate] [datetime] NULL,
	[BillNo] [varchar](50) NOT NULL,
	[NetBillAmount] [decimal](18, 2) NULL,
	[NetTotalBill] [decimal](18, 2) NULL,
	[GLCODE_INCOMETAX] [varchar](50) NULL,
	[IncomeTaxRate] [decimal](18, 2) NULL,
	[GLCODE_TDSUnderSGST] [varchar](50) NULL,
	[TDSUnderSGSTRate] [decimal](18, 2) NULL,
	[GLCODE_TDSUnderCGST] [varchar](50) NULL,
	[TDSUnderCGSTRate] [decimal](18, 2) NULL,
	[GLCODE_TDSUnderIGST] [varchar](50) NULL,
	[TDSUnderIGSTRate] [decimal](18, 2) NULL,
	[GLCODE_BANK_NETAMOUNT] [varchar](50) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[PayableAtId] [int] NULL,
	[PayableAtNumber] [varchar](50) NULL,
	[PayableAtDate] [datetime] NULL,
	[HSNCode] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[IncomeTaxAmount] [decimal](18, 2) NULL,
	[TDSUnderSGSTAmount] [decimal](18, 2) NULL,
	[TDSUnderCGSTAmount] [decimal](18, 2) NULL,
	[TDSUnderIGSTAmount] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_payment_multiple_scheme]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_payment_multiple_scheme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [varchar](50) NULL,
	[BillDate] [datetime] NULL,
	[SchCode] [varchar](100) NULL,
	[GLCode] [varchar](100) NULL,
	[BillAmount] [decimal](18, 0) NULL,
	[GLCODE_SGST] [varchar](50) NULL,
	[SGSTRate] [decimal](18, 2) NULL,
	[GLCODE_CGST] [varchar](50) NULL,
	[CGSTRate] [decimal](18, 2) NULL,
	[GLCODE_IGST] [varchar](50) NULL,
	[IGSTRate] [decimal](18, 0) NULL,
	[TotalBill] [decimal](18, 2) NULL,
	[SGSTAmount] [decimal](18, 2) NULL,
	[CGSTAmount] [decimal](18, 2) NULL,
	[IGSTAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_payment_multiple_scheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_role_master]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_role_master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NULL,
	[Name] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modify_By] [varchar](50) NULL,
	[Modify_Date] [datetime] NULL,
 CONSTRAINT [PK_pooling_vpm_tbl_role_master] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_Tax]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_Tax](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_Taxation_Master]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_Taxation_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaxId] [int] NULL,
	[TaxPercentage] [decimal](5, 2) NULL,
	[Remark] [varchar](100) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__tblTaxat__3214EC07086CD1D3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_temp_payment_multiple_scheme]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_temp_payment_multiple_scheme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [varchar](50) NULL,
	[BillDate] [datetime] NULL,
	[SchCode] [varchar](100) NULL,
	[GLCode] [varchar](100) NULL,
	[BillAmount] [decimal](18, 0) NULL,
	[GLCODE_SGST] [varchar](50) NULL,
	[SGSTRate] [decimal](18, 2) NULL,
	[GLCODE_CGST] [varchar](50) NULL,
	[CGSTRate] [decimal](18, 2) NULL,
	[GLCODE_IGST] [varchar](50) NULL,
	[IGSTRate] [decimal](18, 0) NULL,
	[TotalBill] [decimal](18, 2) NULL,
	[SGSTAmount] [decimal](18, 2) NULL,
	[CGSTAmount] [decimal](18, 2) NULL,
	[IGSTAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_temp_payment_multiple_scheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_Temp_Taxation_Master]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_Temp_Taxation_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaxId] [int] NULL,
	[TaxPercentage] [decimal](5, 2) NULL,
	[Remark] [varchar](100) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__tblTempT__3214EC07876679A7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vpm_tbl_user_master]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vpm_tbl_user_master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](200) NULL,
	[Email] [varchar](100) NULL,
	[RoleID] [int] NULL,
	[fullaccess] [bit] NULL,
	[IsActive] [bit] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Modify_By] [varchar](100) NULL,
	[Modify_Date] [datetime] NULL,
 CONSTRAINT [PK_pooling_vpm_tbl_user_master] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[vpm_tbl_lov]  WITH CHECK ADD  CONSTRAINT [FK_Lov_LovCategory_CategoryId_Id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[vpm_tbl_lov_category] ([Id])
GO
ALTER TABLE [dbo].[vpm_tbl_lov] CHECK CONSTRAINT [FK_Lov_LovCategory_CategoryId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_menu_master]  WITH CHECK ADD  CONSTRAINT [FK_MenuMaster_UserMaster_CreatedBy_Code] FOREIGN KEY([Created_By])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_menu_master] CHECK CONSTRAINT [FK_MenuMaster_UserMaster_CreatedBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_menu_master]  WITH CHECK ADD  CONSTRAINT [FK_MenuMaster_UserMaster_ModifyBy_Code] FOREIGN KEY([Modify_By])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_menu_master] CHECK CONSTRAINT [FK_MenuMaster_UserMaster_ModifyBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_menu_role_mapping]  WITH CHECK ADD  CONSTRAINT [FK_MenuRoleMapping_MenuMaster_MenuId_Id] FOREIGN KEY([MenuID])
REFERENCES [dbo].[vpm_tbl_menu_master] ([ID])
GO
ALTER TABLE [dbo].[vpm_tbl_menu_role_mapping] CHECK CONSTRAINT [FK_MenuRoleMapping_MenuMaster_MenuId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_menu_role_mapping]  WITH CHECK ADD  CONSTRAINT [FK_MenuRoleMapping_UserMaster_CreatedBy_Code] FOREIGN KEY([Created_By])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_menu_role_mapping] CHECK CONSTRAINT [FK_MenuRoleMapping_UserMaster_CreatedBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_menu_role_mapping]  WITH CHECK ADD  CONSTRAINT [FK_MenuRoleMapping_UserMaster_ModifyBy_Code] FOREIGN KEY([Modify_By])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_menu_role_mapping] CHECK CONSTRAINT [FK_MenuRoleMapping_UserMaster_ModifyBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_menu_role_mapping]  WITH CHECK ADD  CONSTRAINT [FK_MenuRoleMapping_UserMaster_RoleId_Id] FOREIGN KEY([RoleID])
REFERENCES [dbo].[vpm_tbl_role_master] ([ID])
GO
ALTER TABLE [dbo].[vpm_tbl_menu_role_mapping] CHECK CONSTRAINT [FK_MenuRoleMapping_UserMaster_RoleId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Master_12]  WITH CHECK ADD  CONSTRAINT [FK_PartyMaster_Lov_BankId_Id] FOREIGN KEY([BankId])
REFERENCES [dbo].[vpm_tbl_lov] ([Id])
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Master_12] CHECK CONSTRAINT [FK_PartyMaster_Lov_BankId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Master_12]  WITH CHECK ADD  CONSTRAINT [FK_PartyMaster_UserMaster_CreatedBy_Code] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Master_12] CHECK CONSTRAINT [FK_PartyMaster_UserMaster_CreatedBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Payment]  WITH CHECK ADD  CONSTRAINT [FK_PartyPayment_Lov_PayableAtId_Id] FOREIGN KEY([PayableAtId])
REFERENCES [dbo].[vpm_tbl_lov] ([Id])
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Payment] CHECK CONSTRAINT [FK_PartyPayment_Lov_PayableAtId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Payment]  WITH CHECK ADD  CONSTRAINT [FK_PartyPayment_Lov_VoucherTypeId_Id] FOREIGN KEY([VoucherTypeId])
REFERENCES [dbo].[vpm_tbl_lov] ([Id])
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Payment] CHECK CONSTRAINT [FK_PartyPayment_Lov_VoucherTypeId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Payment]  WITH CHECK ADD  CONSTRAINT [FK_PartyPayment_PartyMaster_PartyId_Id] FOREIGN KEY([PartyId])
REFERENCES [dbo].[vpm_tbl_Party_Master_12] ([Id])
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Payment] CHECK CONSTRAINT [FK_PartyPayment_PartyMaster_PartyId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Payment]  WITH CHECK ADD  CONSTRAINT [FK_PartyPayment_UserMaster_CreatedBy_Code] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_Party_Payment] CHECK CONSTRAINT [FK_PartyPayment_UserMaster_CreatedBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_role_master]  WITH CHECK ADD  CONSTRAINT [FK_RoleMaster_UserMaster_CreatedBy_Code] FOREIGN KEY([Created_By])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_role_master] CHECK CONSTRAINT [FK_RoleMaster_UserMaster_CreatedBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_role_master]  WITH CHECK ADD  CONSTRAINT [FK_RoleMaster_UserMaster_ModifyBy_Code] FOREIGN KEY([Modify_By])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_role_master] CHECK CONSTRAINT [FK_RoleMaster_UserMaster_ModifyBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_Taxation_Master]  WITH CHECK ADD  CONSTRAINT [FK_TaxationMaster_Tax_TaxId_Id] FOREIGN KEY([TaxId])
REFERENCES [dbo].[vpm_tbl_Tax] ([Id])
GO
ALTER TABLE [dbo].[vpm_tbl_Taxation_Master] CHECK CONSTRAINT [FK_TaxationMaster_Tax_TaxId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_Taxation_Master]  WITH CHECK ADD  CONSTRAINT [FK_TaxationMaster_UserMaster_CreatedBy_Code] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_Taxation_Master] CHECK CONSTRAINT [FK_TaxationMaster_UserMaster_CreatedBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_Taxation_Master]  WITH CHECK ADD  CONSTRAINT [FK_TaxationMaster_UserMaster_ModifyBy_Code] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_Taxation_Master] CHECK CONSTRAINT [FK_TaxationMaster_UserMaster_ModifyBy_Code]
GO
ALTER TABLE [dbo].[vpm_tbl_Temp_Taxation_Master]  WITH CHECK ADD  CONSTRAINT [FK_TempTaxationMaster_Tax_TaxId_Id] FOREIGN KEY([TaxId])
REFERENCES [dbo].[vpm_tbl_Tax] ([Id])
GO
ALTER TABLE [dbo].[vpm_tbl_Temp_Taxation_Master] CHECK CONSTRAINT [FK_TempTaxationMaster_Tax_TaxId_Id]
GO
ALTER TABLE [dbo].[vpm_tbl_Temp_Taxation_Master]  WITH CHECK ADD  CONSTRAINT [FK_TempTaxationMaster_UserMaster_CreatedBy_Code] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[vpm_tbl_user_master] ([Code])
GO
ALTER TABLE [dbo].[vpm_tbl_Temp_Taxation_Master] CHECK CONSTRAINT [FK_TempTaxationMaster_UserMaster_CreatedBy_Code]
GO
/****** Object:  StoredProcedure [dbo].[sp_vpm_summary_tds_under_gst]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <21-03-2021>
-- Description:	<summary TDS under GST >
-- =============================================
create PROCEDURE [dbo].[sp_vpm_summary_tds_under_gst] 
(@fromDate datetime, @ToDate datetime)
AS
BEGIN
if ((@fromDate is null) and (@ToDate is null))
begin
select tpp.PartyId,tpm.PartyName,tpm.GSTNO,sum(BillAmount) as 'SumOfTaxableAmount',
sum((BillAmount*(TDSUnderSGSTRate/100))) as 'SumOfTDSUnderSGSTAmount',
sum((BillAmount*(TDSUnderCGSTRate/100))) as 'SumOfTDSUnderCGSTAmount',
sum((BillAmount*(TDSUnderIGSTRate/100))) as 'SumOfTDSUnderIGSTAmount',
(
sum((BillAmount*(TDSUnderSGSTRate/100)))+
sum((BillAmount*(TDSUnderCGSTRate/100)))+
sum((BillAmount*(TDSUnderIGSTRate/100)))) as 'Total' 
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
group by tpp.PartyId, tpm.PartyName,tpm.GSTNO;
end
else if ((@fromDate is not null) and (@ToDate is not null))
begin
select tpp.PartyId,tpm.PartyName,tpm.GSTNO,sum(BillAmount) as 'SumOfTaxableAmount',
sum((BillAmount*(TDSUnderSGSTRate/100))) as 'SumOfTDSUnderSGSTAmount',
sum((BillAmount*(TDSUnderCGSTRate/100))) as 'SumOfTDSUnderCGSTAmount',
sum((BillAmount*(TDSUnderIGSTRate/100))) as 'SumOfTDSUnderIGSTAmount',
(sum((BillAmount*(TDSUnderSGSTRate/100)))+sum((BillAmount*(TDSUnderCGSTRate/100)))+
sum((BillAmount*(TDSUnderIGSTRate/100)))) as 'Total'
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
where inwarddate between @fromDate and @ToDate
group by tpp.PartyId, tpm.PartyName,tpm.GSTNO;
end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_vpm_summary_tds_under_gst1]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <21-03-2021>
-- Description:	<summary TDS under GST >
-- =============================================
create PROCEDURE [dbo].[sp_vpm_summary_tds_under_gst1] 
(@fromDate datetime, @ToDate datetime)
AS
BEGIN
if ((@fromDate is null) and (@ToDate is null))
begin
select tpp.PartyId,tpm.PartyName,tpm.GSTNO,sum(BillAmount) as 'SumOfTaxableAmount',
sum((BillAmount*(TDSUnderSGSTRate/100))) as 'SumOfTDSUnderSGSTAmount',
sum((BillAmount*(TDSUnderCGSTRate/100))) as 'SumOfTDSUnderCGSTAmount',
sum((BillAmount*(TDSUnderIGSTRate/100))) as 'SumOfTDSUnderIGSTAmount',
(
sum((BillAmount*(TDSUnderSGSTRate/100)))+
sum((BillAmount*(TDSUnderCGSTRate/100)))+
sum((BillAmount*(TDSUnderIGSTRate/100)))) as 'Total' 
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
group by tpp.PartyId, tpm.PartyName,tpm.GSTNO;
end
else if ((@fromDate is not null) and (@ToDate is not null))
begin
select tpp.PartyId,tpm.PartyName,tpm.GSTNO,sum(BillAmount) as 'SumOfTaxableAmount',
sum((BillAmount*(TDSUnderSGSTRate/100))) as 'SumOfTDSUnderSGSTAmount',
sum((BillAmount*(TDSUnderCGSTRate/100))) as 'SumOfTDSUnderCGSTAmount',
sum((BillAmount*(TDSUnderIGSTRate/100))) as 'SumOfTDSUnderIGSTAmount',
(sum((BillAmount*(TDSUnderSGSTRate/100)))+sum((BillAmount*(TDSUnderCGSTRate/100)))+
sum((BillAmount*(TDSUnderIGSTRate/100)))) as 'Total'
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
where inwarddate between @fromDate and @ToDate
group by tpp.PartyId, tpm.PartyName,tpm.GSTNO;
end
END
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Login]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <11-12-2020>
-- Description:	<USP for User LOGIN>
-- =============================================
create PROCEDURE [dbo].[usp_User_Login]
	(@userName varchar(50),@password varchar(20))
AS
BEGIN
	-- select statement for login process
	if exists (select  *  from tblUser where UserName=@userName and Pwd=@password and isuserActive=1)
	begin
		select  Id,name  from tblUser where UserName=@userName and Pwd=@password and isuserActive=1
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_delete_lov_Category_records]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<SP for to Deleting records from  tblLovCategory>

/* 
Remark 
QRV=1 Record Saved Successfully
QRV=2 Duplicate Record
QRV=3 Id is not Valid
QRV=4 Record Deleted Successfully
*/

create PROCEDURE [dbo].[vpm_sp_delete_lov_Category_records](@PId int, @QRS int out)
AS
BEGIN
if (@PId>0)
BEGIN
	delete from  vpm_tbl_lov_category where id=@PId;
	set @QRS=1;
END
else
begin
	set @QRS=3;
end
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_delete_lov_records]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<SP for to Deleting records from  tblLov>

/* 
Remark 
QRV=1 Record Saved Successfully
QRV=2 Duplicate Record
QRV=3 Id is not Valid
QRV=4 Record Deleted Successfully
*/

create PROCEDURE [dbo].[vpm_sp_delete_lov_records](@PId int, @QRS int out)
AS
BEGIN
if (@PId>0)
BEGIN
	delete from  vpm_tbl_lov where id=@PId;
	set @QRS=4;
END
else
begin
	set @QRS=3;
end
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_delete_payment_multiple_scheme]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<usp for deleting records from vpm_tbl_payment_multiple_scheme>
-- =============================================
create PROCEDURE  [dbo].[vpm_sp_delete_payment_multiple_scheme] 
(@Id int, @QRS int out)
AS
BEGIN

if (@id>0)
begin
	if  Exists (select  *  from  vpm_tbl_temp_payment_multiple_scheme where Id=@Id)
	begin
		delete from  vpm_tbl_temp_payment_multiple_scheme where Id=@Id;
			set @QRS=4;
		End
	else 
	begin
		set @QRS=3;
	end
End
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_delete_payment_multiple_scheme1]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<usp for delete records from vpm_tbl_payment_multiple_scheme
-- =============================================
create PROCEDURE [dbo].[vpm_sp_delete_payment_multiple_scheme1]
(@Id int)
AS
BEGIN
	if(@Id<>0)
	begin
		delete  from  vpm_tbl_payment_multiple_scheme	
		where Id=@Id;
	end
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_delete_Taxation_record_by_Id]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <27-02-2021>
-- Description:	<SP EDIT TAXATION RECORD By Id>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_delete_Taxation_record_by_Id]
	(@Id int,@QRS int out)
AS
BEGIN
	if exists (Select * from vpm_tbl_Taxation_Master where Id=@Id)
	Begin
	delete from  vpm_tbl_Taxation_Master where Id=@Id; 
	set @QRS=4;
	End
	else
	begin
	set @QRS=3;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_delete_TempTaxation_Records]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <22-12-2020>
-- Description:	<Delete TempTaxationMaster Table Records>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_delete_TempTaxation_Records]
	(@Id int,@QRS int out)
AS
BEGIN
	if exists(select  *  from  vpm_tbl_Temp_Taxation_Master where id=@Id)
	Begin
	delete from vpm_tbl_Temp_Taxation_Master where id=@id;
	set @QRS=4;
	End
	else
	begin
	set @QRS=3;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_delete_vendor_records]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<SP for to Deleting records from  tblLovCategory>

/* 
Remark 
QRV=1 Record Saved Successfully
QRV=2 Duplicate Record
QRV=3 Id is not Valid
QRV=4 Record Deleted Successfully
*/

create PROCEDURE [dbo].[vpm_sp_delete_vendor_records](@PId int, @QRS int out)
AS
BEGIN
if (@PId>0)
BEGIN
	delete from  vpm_tbl_party_master where id=@PId;
	set @QRS=1;
END
else
begin
	set @QRS=3;
end
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_Edit_Taxation_record_by_Id]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <27-02-2021>
-- Description:	<SP EDIT TAXATION RECORD By Id>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_Edit_Taxation_record_by_Id]
	(@Id int,@TaxId varchar(100),@TaxPercentage decimal(5,2),@Remark varchar(100),
	@Createdby int,@QRS int out)
AS
BEGIN
	if exists (Select * from vpm_tbl_Taxation_Master where Id=@Id)
	Begin
	update vpm_tbl_Taxation_Master set TaxId=@TaxId,TaxPercentage=@TaxPercentage,remark=@remark,
	ModifiedBy=@Createdby,ModifiedDate=getdate() where Id=@Id; 
	set @QRS=1;
	End
	else
	begin
	set @QRS=3;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_generate_ddl]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[vpm_sp_generate_ddl](@category_code varchar(100))
As
BEGIN
	select 0 as ID,'Select' as Name
	union
	select lov2.id,lov2.name from vpm_tbl_lov_category lovc2 inner join vpm_tbl_lov lov2 on lov2.category_id=lovc2.id
	where lovc2.code=@category_code  and lovc2.is_active=1 and lov2.is_active=1;
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_category_types]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <27-02-2021>
-- Description:	<GET CATEGOTY TYPES>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_category_types]
AS
BEGIN
select 0 as ID,'Select' as Name
                union select lovc.ID,lovc.Name from vpm_tbl_lov_category lovc
                where lovc.Is_Active=1;
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_Lov_Category_details]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<usp for fetching record from tblLovCategory>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_Lov_Category_details]
	(@Id int)
AS
BEGIN
	if (@Id>0)
	BEGIN
		select  *  from  vpm_tbl_lov_category where Id=@Id;
	End
	Else
	Begin
		select  *  from  vpm_tbl_lov_category order by Code;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_Lov_details]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<usp for fetching record from tblLov>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_Lov_details]
	(@Id int)
AS
BEGIN
	if (@Id>0)
	BEGIN
		select lov.id,lov.category_id, lovc.code as 'CategoryCode',lov.code as 'SubCode',lov.name,lov.is_active  
		from vpm_tbl_lov lov inner join vpm_tbl_lov_CATEGORY lovc on lov.category_id=lovc.id where lov.Id=@Id;
		
	End
	Else
	Begin
		select lov.id,lov.category_id, lovc.code as 'CategoryCode',lov.code as 'SubCode',
		lov.name,lov.is_active  from vpm_tbl_lov lov inner join vpm_tbl_lov_CATEGORY lovc on lov.category_id=lovc.id 
		order by lovc.code , lov.code;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_menus]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <03-03-2021>
-- Description:	<GET MENUS>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_menus](@userid int)
	
AS
BEGIN	select  mm2.ID , mm2.link,mm2.title,mm2.css_class,mm2.IsActive 
    from vpm_tbl_user_master um
    inner join vpm_tbl_role_master rm on um.RoleID = rm.ID
    inner join vpm_tbl_menu_role_mapping mm on mm.RoleID =rm.ID
    inner join vpm_tbl_menu_master mm2 on mm2.ID=mm.MenuID
    where um.Code=@userid;
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_Party_Payment_Multiple_Scheme_Records]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<usp for getting records from vpm_sp_get_Party_Payment_Multiple_Scheme_Records>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_Party_Payment_Multiple_Scheme_Records] 
(@CreatedBy int, @Id int)
AS
BEGIN
	if(@Id>0)
	begin

			--- select Party_Payment_Multiple_Scheme_Records
			select tpp.Id,CONVERT(Date,inwarddate,106) as 'InwardDate',Department,
			PartyId,PartyName,tpp.PartyAddress,tpp.PanNo,GSTRNo,
			PVDate,PVNo,VoucherTypeId,PK,CONVERT(Date,BillDate,106) as 'BillDate',BillNo,
			NetBillAmount,NetTotalBill,IncomeTaxRate,TDSUnderSGSTRate,
			TDSUnderCGSTRate,TDSUnderIGSTRate,NetAmount,PayableAtId,PayableAtNumber,
			CONVERT(Date,PayableAtDate,106) as 'PayableAtDate',HSNCode,GLCODE_INCOMETAX,
			GLCODE_TDSUnderIGST,GLCODE_TDSUnderSGST ,GLCODE_TDSUnderCGST,GLCODE_BANK_NETAMOUNT
			from  
			vpm_tbl_Party_Payment_multiple_scheme tpp
			inner join 
			vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
			where tpp.Id=@Id;

			-- load vpm_tbl_payment_multiple_scheme record into vpm_tbl_temp_payment_multiple_scheme
			declare @BillNo Varchar(50);
			Set @BillNo =  (select  
									BillNo
							from	
									vpm_tbl_Party_Payment_multiple_scheme where Id=@Id
							);
			--select @BillNo as 'BillNo';
			--delete privious records from vpm_tbl_temp_Payment_multiple_scheme
			truncate table vpm_tbl_temp_Payment_multiple_scheme;
			-- load new records from vpm_tbl_Payment_multiple_scheme records into vpm_tbl_temp_Payment_multiple_scheme
	insert into vpm_tbl_temp_payment_multiple_scheme ([BillNo]
      ,[BillDate]
      ,[SchCode]
      ,[GLCode]
      ,[BillAmount]
      ,[GLCODE_SGST]
      ,[SGSTRate]
      ,[GLCODE_CGST]
      ,[CGSTRate]
      ,[GLCODE_IGST]
      ,[IGSTRate]
      ,[TotalBill])
	SELECT 
       [BillNo]
      ,[BillDate]
      ,[SchCode]
      ,[GLCode]
      ,[BillAmount]
      ,[GLCODE_SGST]
      ,[SGSTRate]
      ,[GLCODE_CGST]
      ,[CGSTRate]
      ,[GLCODE_IGST]
      ,[IGSTRate]
      ,[TotalBill]
  FROM [dbo].[vpm_tbl_payment_multiple_scheme] where BillNo=@BillNo;


	end
	else 
	begin 
			select tpp.Id,CONVERT(Date,inwarddate,106) as 'InwardDate',Department,PartyId,
			PartyName,tpp.PartyAddress,tpp.PanNo,GSTRNo,PVDate,PVNo,VoucherTypeId,
			PK,CONVERT(Date,BillDate,106) as 'BillDate',BillNo,NetBillAmount,NetTotalBill,
			IncomeTaxRate,TDSUnderSGSTRate,TDSUnderCGSTRate,TDSUnderIGSTRate,NetAmount,
			PayableAtId,PayableAtNumber,CONVERT(Date,PayableAtDate,106) as 'PayableAtDate',
			HSNCode,GLCODE_INCOMETAX,GLCODE_TDSUnderIGST,GLCODE_TDSUnderSGST,
			GLCODE_TDSUnderCGST,GLCODE_BANK_NETAMOUNT
			from  
			vpm_tbl_Party_Payment_multiple_scheme tpp
			inner join 
			vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
			where cast(tpp.CreatedDate as date)=cast(getdate() as Date);
	End
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_PartyMaster_details]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<usp for fetching record from vpm_tbl_Party_Master>
-- =============================================
CREATE PROCEDURE [dbo].[vpm_sp_get_PartyMaster_details]
	(@CreatedBy varchar(50), @Id int)
AS
BEGIN
	if (@Id>0)
		BEGIN
		select  pm.Id, PartyName,Location,Address1,Address2,Address3,State,Pincode,BankId,lov.Name as 'BankName',AccountNo,GSTNO,PANNO,IFSCCode,Remark,
		pm.IsActive
		from  vpm_tbl_Party_Master pm left join vpm_tbl_lov lov on pm.BankId=lov.Id
		where pm.Id=@Id;
		End
	Else
	Begin
	select  pm.Id, PartyName,Location,Address1,Address2,Address3,State,Pincode,BankId,lov.Name as 'BankName',AccountNo,GSTNO,PANNO,IFSCCode,Remark,
		pm.IsActive
		from  vpm_tbl_Party_Master pm left join vpm_tbl_lov lov on pm.BankId=lov.Id
		order by PartyName ;
		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_Get_PartyNames]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <21-12-2020>
-- Description:	<USP Get PartyName from vpm_tbl_Party_Master>
-- =============================================
CREATE PROCEDURE [dbo].[vpm_sp_Get_PartyNames]
(@CreatedBy int)	
AS
BEGIN
	
	select 0 as ID,'Select' as Name
    union 
		select  Id,PartyName as 'Name' from vpm_tbl_Party_Master
		order by Name asc;
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_PartyPaymentRecords]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<usp for getting records from vpm_tbl_Party_Payment>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_PartyPaymentRecords]
(@CreatedBy int, @Id int)
AS
BEGIN
	if(@Id>0)
	begin
	select tpp.Id,tpp.ETYPE,CONVERT(Date,inwarddate,106) as 'InwardDate',Department,PartyId,PartyName,tpp.PartyAddress,tpp.PanNo,GSTRNo,
PVDate,PVNo,VoucherTypeId,PK,SchCode,GLCode,CONVERT(Date,BillDate,106) as 'BillDate',BillNo,
BillAmount,SGSTRate,CGSTRate,IGSTRate,TotalBill,IncomeTaxRate,TDSUnderSGSTRate,
TDSUnderCGSTRate,TDSUnderIGSTRate,NetAmount,PayableAtId,PayableAtNumber,CONVERT(Date,PayableAtDate,106) as 'PayableAtDate',
HSNCode, GLCODE_CGST ,GLCODE_SGST,GLCODE_IGST,GLCODE_INCOMETAX,GLCODE_TDSUnderIGST,
GLCODE_TDSUnderSGST ,GLCODE_TDSUnderCGST,GLCODE_BANK_NETAMOUNT
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
	where tpp.Id=@Id;

	 declare @BillNo varchar(30);
	SET @BillNo = (
					SELECT 
							BillNo
					FROM 
							vpm_tbl_Party_Payment_multiple_scheme tpp where tpp.Id=@Id
				  );
	-- copy vpm_tbl_temp_Payment_multiple_scheme records into vpm_tbl_Payment_multiple_scheme
	insert into vpm_tbl_temp_payment_multiple_scheme ([BillNo]
      ,[BillDate]
      ,[SchCode]
      ,[GLCode]
      ,[BillAmount]
      ,[GLCODE_SGST]
      ,[SGSTRate]
      ,[GLCODE_CGST]
      ,[CGSTRate]
      ,[GLCODE_IGST]
      ,[IGSTRate]
      ,[TotalBill])
	SELECT 
       [BillNo]
      ,[BillDate]
      ,[SchCode]
      ,[GLCode]
      ,[BillAmount]
      ,[GLCODE_SGST]
      ,[SGSTRate]
      ,[GLCODE_CGST]
      ,[CGSTRate]
      ,[GLCODE_IGST]
      ,[IGSTRate]
      ,[TotalBill]
  FROM [dbo].[vpm_tbl_payment_multiple_scheme] where BillNo=@BillNo
 
   end
	else 
	begin 
			select tpp.Id,tpp.ETYPE,CONVERT(Date,inwarddate,106) as 'InwardDate',Department,PartyId,PartyName,tpp.PartyAddress,tpp.PanNo,GSTRNo,
PVDate,PVNo,VoucherTypeId,PK,SchCode,GLCode,CONVERT(Date,BillDate,106) as 'BillDate',BillNo,
BillAmount,SGSTRate,CGSTRate,IGSTRate,TotalBill,IncomeTaxRate,TDSUnderSGSTRate,
TDSUnderCGSTRate,TDSUnderIGSTRate,NetAmount,PayableAtId,PayableAtNumber,CONVERT(Date,PayableAtDate,106) as 'PayableAtDate',
HSNCode,GLCODE_CGST ,GLCODE_SGST,GLCODE_IGST,GLCODE_INCOMETAX,GLCODE_TDSUnderIGST,
GLCODE_TDSUnderSGST ,GLCODE_TDSUnderCGST,GLCODE_BANK_NETAMOUNT
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
	where cast(tpp.CreatedDate as date)=cast(getdate() as Date);
	End
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_payment_multiple_scheme_by_BillNo]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <05-05-2021>
-- Description:	<usp for getting sum of  totalbill against billno from vpm_tbl_payment_multiple_scheme
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_payment_multiple_scheme_by_BillNo]
(@BillNo varchar(50))
AS
BEGIN
	if(@BillNo<>null or @BillNo<>'')
	begin
		select 
		sum(BillAmount) as NetBillAmount,sum(TotalBill) as NetTotalBill
		from  vpm_tbl_temp_payment_multiple_scheme
		where BillNo=@BillNo
       end
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_payment_multiple_scheme_List_by_BillNo]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<usp for getting records from vpm_tbl_payment_multiple_scheme
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_payment_multiple_scheme_List_by_BillNo]
(@BillNo varchar(50))
AS
BEGIN
	if(@BillNo<>null or @BillNo<>'')
	begin
	-- Return Multiple Payment Scheme entry 
		select Id,CONVERT(Date,BillDate,106) as 'BillDate',BillNo,SchCode,GLCode,
		BillAmount,GLCODE_SGST,SGSTRate,GLCODE_CGST ,CGSTRate,GLCODE_IGST,IGSTRate,
		TotalBill from  vpm_tbl_temp_payment_multiple_scheme	
		where BillNo=@BillNo;

	end
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_Taxation_record_by_Id]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <27-02-2021>
-- Description:	<SP GET TAXATION RECORD BY ID 
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_Taxation_record_by_Id]
	(@Id int)
AS
BEGIN
	if(@Id>0)
	Begin
	select  Id,TaxId,TaxPercentage,Remark,Createdby from vpm_tbl_Taxation_Master where Id=@Id;
	End
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_Get_TaxationRecords]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <17-12-2020>
-- Description:	<usp Get Taxation Record>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_Get_TaxationRecords]
(@CreatedBy int, @status varchar(10))	
AS
BEGIN
if(@status='IMaintbl')	--If block start when Status is IMaintbl
	begin
		if exists (select  *  from  vpm_tbl_Taxation_Master)
		begin
			 select  tm.Id,TaxName,TaxPercentage,Remark,Createdby from vpm_tbl_Taxation_Master tm
			 inner join vpm_tbl_Tax on tm.TaxId=vpm_tbl_Tax.Id;
			
		end
	end
else if(@status='ITemptbl')
	begin --Else block start when Status is ITemptbl 
		if exists (select  *  from  vpm_tbl_Temp_Taxation_Master where CreatedBy=@CreatedBy)
		begin
			 select  ttm.Id,TaxName,TaxPercentage,Remark,Createdby from vpm_tbl_Temp_Taxation_Master ttm
			 inner join vpm_tbl_Tax on ttm.TaxId=vpm_tbl_Tax.Id
			 where CreatedBy=@CreatedBy;
		end
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_get_TaxNames]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <17-12-2020>
-- Description:	<usp Get TaxNames from tblTax>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_get_TaxNames]
AS
BEGIN
if exists(select  *  from  vpm_tbl_Tax)
begin
  select Id,TaxName as 'Name' from vpm_tbl_Tax order by TaxName
end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_Get_TaxRateDetails]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_Get_TaxRateDetails]    Script Date: 28-02-2021 20:41:00 ******/
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<Get Tax Rate Detals from vpm_tbl_Taxation_Master>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_Get_TaxRateDetails]
(@TaxId int)
as
Begin
	select distinct(TaxPercentage) as 'TaxPercentage'  from vpm_tbl_Taxation_Master where TaxId=@TaxId;
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_insert_update_Lov]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<USP for to inserting/Updateing records into tblLov>

/* 
Remark 
QRV=1 Record Saved Successfully
QRV=2 Duplicate Record
QRV=3 Id is not Valid
*/

create PROCEDURE [dbo].[vpm_sp_insert_update_Lov](@PId int,@PCategoryId int, @PCode varchar(20), @PName varchar(100), 
@PIsActive bit,@QRS int out)
as 
BEGIN
IF (@PId=0)
BEGIN
	IF NOT EXISTS (SELECT *  FROM vpm_tbl_lov where code=@PCode AND NAME=@PName AND Category_Id=@PCategoryId)
	BEGIN
		INSERT INTO vpm_tbl_lov (Category_Id,CODE,NAME,Is_active,Created_Date) values (@PCategoryId,@PCode,@PName,@PIsActive,GETDATE());
		set @QRS=1;
	END
	else
	begin
		set @QRS=2;
	end
END
else if (@PId>0)
BEGIN
	if exists (select * from  vpm_tbl_lov where ID=@PId)
	Begin
		update vpm_tbl_lov set Category_Id=@PCategoryId,Code=@PCode, name=@PName, is_Active=@PIsActive where Id=@Pid;
		set @QRS=1;
	End
	else
	begin
		set @QRS=3;
	end
END
END


GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_insert_update_Lov_Category]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<USP for to inserting/Updateing records into tblLovCategory>

/* 
Remark 
QRV=1 Record Saved Successfully
QRV=2 Duplicate Record
QRV=3 Id is not Valid
*/

create PROCEDURE [dbo].[vpm_sp_insert_update_Lov_Category](@PId int, @PCode varchar(20), @PName varchar(100), 
@PIsActive bit,@QRS int out)
as 
BEGIN
IF (@PId=0)
BEGIN
	IF NOT EXISTS (SELECT *  FROM vpm_tbl_lov_category where code=@PCode AND NAME=@PName)
	BEGIN
		INSERT INTO vpm_tbl_lov_category (CODE,NAME,Is_active,Created_Date) values (@PCODE,@PNAME,@PIsActive,GETDATE());
		set @QRS=1;
	END
	else
	begin
		set @QRS=2;
	end
END
else if (@PId>0)
BEGIN
	if exists (select * from  vpm_tbl_lov_category where ID=@PId)
	Begin
		update vpm_tbl_lov_category set Code=@PCode, name=@PName, is_Active=@PIsActive where Id=@Pid;
		set @QRS=1;
	End
	else
	begin
		set @QRS=3;
	end
END
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_Insert_update_PartyMaster_details]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<USP for to inserting records into vpm_tbl_Party_Master>

/* 
Remark 
QRV=1 Record Saved Successfully
QRV=2 Duplicate Record
QRV=3 Id is not Valid
*/

-- =============================================
CREATE PROCEDURE [dbo].[vpm_sp_Insert_update_PartyMaster_details] 
	(@Id int, @PartyName varchar(max),@Location varchar(max),@Address1 varchar(max),
	@Address2 varchar(max),@Address3 varchar(max), @State varchar(50),@Pincode varchar(10),@BankId int,
	@IFSCCode varchar(20), @AccountNo varchar(20),@GSTNo varchar(20),@PANNO varchar(50),@Remark varchar(max),
	@IsActive bit,@CreatedBy int ,@QRS int out)
AS
BEGIN
	if (@Id=0)
	begin
			if not exists (select  *  from  vpm_tbl_Party_Master where PartyName=@PartyName)
			Begin
						insert into vpm_tbl_Party_Master (PartyName,Location,Address1,Address2,Address3,State,Pincode,BankId,IFSCCode,AccountNO,GSTNO,
						PANNO,Remark,IsActive,CreatedBy,CreatedDate) values 
						(@PartyName,@Location,@Address1,@Address2,@Address3,@state,@Pincode,@BankId,@IFSCCode,@AccountNo,@GSTNo,@PanNo,@Remark,@IsActive,@CreatedBy,GETDATE())
						set @QRS=1;
			End
			else
			begin
						set @QRS=2;
			end
	end
	else if (@Id>0)
	BEGIN
			if exists (select * from  vpm_tbl_Party_Master where ID=@Id)
			Begin
				update vpm_tbl_Party_Master set 
				PartyName=@PartyName,Location=@Location,Address1=@Address1,
				Address2=@Address2,Address3=@Address3,State=@State,Pincode=@Pincode,
				BankId=@BankId,IFSCCode=@IFSCCode,AccountNO=@AccountNo,GSTNO=@GSTNo,PANNO=@PANNO,
				Remark=@Remark,IsActive=@IsActive
				where id=@Id;
				set @QRS=1;
			End
			else
			begin
				set @QRS=3;
			end
	End
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_insert_update_PartyPayment]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<usp for inserting records int vpm_tbl_Party_Payment>
-- =============================================
CREATE PROCEDURE  [dbo].[vpm_sp_insert_update_PartyPayment] 
(@Id int,@ETYPE VARCHAR(50),@InwardDate datetime,@Department varchar(max),@PartyId int,
@PartyAddress varchar(Max),@PANNO varchar(20), @GSTRNO varchar(20),
@PVDate datetime,@PVNo varchar(50),@VoucherTypeId int,@PK varchar(100),@SchCode varchar(100),
@GLCode varchar(100),@BillDate datetime,@BillNo varchar(50),@BillAmount decimal(18, 2),
@SGSTRate decimal(18,2),@CGSTRate decimal(18, 2),@IGSTRate decimal(18, 2),
@TotalBill decimal(18,2),@IncomeTaxRate decimal(18, 2),@TDSUnderSGSTRate decimal(18, 2),
@TDSUnderCGSTRate decimal(18,2),@TDSUnderIGSTRate decimal(18, 2),@NetAmount decimal(18, 2),
@PayableAtId int,@PayableAtNumber varchar(50),@PayableAtDate datetime=null,
@HSNCode varchar(50),@CreatedBy int,@GLCODE_SGST varchar(50),@GLCODE_CGST varchar(50),
@GLCODE_IGST varchar(50),@GLCODE_TDSUnderSGST varchar(50),@GLCODE_TDSUnderCGST varchar(50),
@GLCODE_TDSUnderIGST varchar(50),@GLCODE_INCOMETAX varchar(50),@GLCODE_BANK_NETAMOUNT varchar(50)
,@QRS int out)
AS
BEGIN
if(@id=0)
begin
	insert into vpm_tbl_Party_Payment
	(ETYPE,InwardDate,Department,PartyId,PartyAddress,PANNO,GSTRNO,PVDate,PvNo,VoucherTypeId,
	PK,SchCode,GLCode,BillDate,BillNo,BillAmount,SGSTRate,CGSTRate,IGSTRate,TotalBill,
	IncomeTaxRate,TDSUnderSGSTRate,TDSUnderCGSTRate,TDSUnderIGSTRate,NetAmount,PayableAtId,
	PayableAtNumber,PayableAtDate,HSNCode,CreatedBy,CreatedDate,GLCODE_SGST,
	GLCODE_CGST,GLCODE_IGST,GLCODE_TDSUnderSGST,GLCODE_TDSUnderCGST,GLCODE_TDSUnderIGST,
	GLCODE_INCOMETAX,GLCODE_BANK_NETAMOUNT,
	SGSTAmount,CGSTAmount,IGSTAmount,IncomeTaxAmount,TDSUnderSGSTAmount,TDSUnderCGSTAmount,TDSUnderIGSTAmount
	,RCMSGSTAMOUNT,RCMCGSTAMOUNT,RCMIGSTAMOUNT)
	values (@ETYPE,@InwardDate,@Department,@PartyId,@PartyAddress,@PANNO,@GSTRNO,
	@PVDate,@PvNo,@VoucherTypeId,@PK,@SchCode,@GLCode,@BillDate,@BillNo,@BillAmount,@SGSTRate,
	@CGSTRate,@IGSTRate,@TotalBill,@IncomeTaxRate,@TDSUnderSGSTRate,@TDSUnderCGSTRate,
	@TDSUnderIGSTRate,@NetAmount,@PayableAtId,@PayableAtNumber,@PayableAtDate,@HSNCode,
	@CreatedBy,getdate(),@GLCODE_SGST,@GLCODE_CGST,@GLCODE_IGST,@GLCODE_TDSUnderSGST,
	@GLCODE_TDSUnderCGST,@GLCODE_TDSUnderIGST,@GLCODE_INCOMETAX,@GLCODE_BANK_NETAMOUNT,
	(@BillAmount*(@SGSTRate/100)),(@BillAmount*(@CGSTRate/100)),(@BillAmount*(@IGSTRate/100)),
	CEILING(@BillAmount*(@IncomeTaxRate/100)),CEILING(@BillAmount*(@TDSUnderSGSTRate/100)),
	CEILING(@BillAmount*(@TDSUnderCGSTRate/100)),CEILING(@BillAmount*(@TDSUnderIGSTRate/100)),
	 CASE @ETYPE WHEN 'RCM' THEN (@BillAmount*(@SGSTRate/100)) ELSE 0 END , 
	 CASE @ETYPE WHEN 'RCM' THEN (@BillAmount*(@CGSTRate/100)) ELSE 0 END ,
	 CASE @ETYPE WHEN 'RCM' THEN (@BillAmount*(@IGSTRate/100)) ELSE 0 END
	)
	set @QRS=1;
end

if (@id>0)
begin
	update vpm_tbl_Party_Payment set 
	ETYPE=@ETYPE,
	InwardDate=@InwardDate,Department=@Department,PartyId=@PartyId,PartyAddress=@PartyAddress,
	PANNO=@PANNO,GSTRNO=@GSTRNO,PVDate=@PVDate,PVNo=@PVNo,VoucherTypeId=@VoucherTypeId,PK=@PK,
	SchCode=@SchCode,GLCode=@GLCode,BillDate=@BillDate,BillNo=@BillNo,BillAmount=@BillAmount,
	SGSTRate=@SGSTRate,CGSTRate=@CGSTRate,IGSTRate=@IGSTRate,TotalBill=@TotalBill,
	IncomeTaxRate=@IncomeTaxRate,TDSUnderSGSTRate=@TDSUnderSGSTRate,
	TDSUnderCGSTRate=@TDSUnderCGSTRate,TDSUnderIGSTRate=@TDSUnderIGSTRate,
	NetAmount=@NetAmount,PayableAtId=@PayableAtId,PayableAtNumber=@PayableAtNumber,PayableAtDate=@PayableAtDate,
	HSNCode=@HSNCode,CreatedBy=@CreatedBy,GLCODE_SGST=@GLCODE_SGST,GLCODE_CGST=@GLCODE_CGST,
	GLCODE_IGST=@GLCODE_IGST,GLCODE_TDSUnderSGST=@GLCODE_TDSUnderSGST,
	GLCODE_TDSUnderCGST=@GLCODE_TDSUnderCGST,GLCODE_TDSUnderIGST=@GLCODE_TDSUnderIGST,
	GLCODE_INCOMETAX=@GLCODE_INCOMETAX,GLCODE_BANK_NETAMOUNT=@GLCODE_BANK_NETAMOUNT,
	SGSTAmount=(@BillAmount*(@SGSTRate/100)),
	CGSTAmount=(@BillAmount*(@CGSTRate/100)),
	IGSTAmount=(@BillAmount*(@IGSTRate/100)),
	IncomeTaxAmount=CEILING(@BillAmount*(@IncomeTaxRate/100)),
	TDSUnderSGSTAmount=CEILING(@BillAmount*(@TDSUnderSGSTRate/100)),
	TDSUnderCGSTAmount=CEILING(@BillAmount*(@TDSUnderCGSTRate/100)),
	TDSUnderIGSTAmount=CEILING(@BillAmount*(@TDSUnderIGSTRate/100)),
	RCMSGSTAMOUNT= CASE @ETYPE WHEN 'RCM' THEN (@BillAmount*(@SGSTRate/100)) ELSE 0 END , 
	RCMCGSTAMOUNT= CASE @ETYPE WHEN 'RCM' THEN (@BillAmount*(@CGSTRate/100)) ELSE 0 END ,
	RCMIGSTAMOUNT= CASE @ETYPE WHEN 'RCM' THEN (@BillAmount*(@IGSTRate/100)) ELSE 0 END
	where Id=@Id;
	set @QRS=1;
End
End
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_insert_update_PartyPayment_multiple_scheme]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<usp for inserting records int vpm_tbl_Party_Payment>
-- =============================================
CREATE PROCEDURE  [dbo].[vpm_sp_insert_update_PartyPayment_multiple_scheme] 
(@Id int,@InwardDate datetime,@Department varchar(max),@PartyId int,
@PartyAddress varchar(Max),@PANNO varchar(20), @GSTRNO varchar(20),
@PVDate datetime,@PVNo varchar(50),@VoucherTypeId int,@PK varchar(100),@BillDate datetime,
@BillNo varchar(50),@NetBillAmount decimal(18, 2),
@NetTotalBill decimal(18,2),@IncomeTaxRate decimal(18, 2),@TDSUnderSGSTRate decimal(18, 2),
@TDSUnderCGSTRate decimal(18,2),@TDSUnderIGSTRate decimal(18, 2),@NetAmount decimal(18, 2),
@PayableAtId int,@PayableAtNumber varchar(50),@PayableAtDate datetime=null,
@HSNCode varchar(50),@CreatedBy int,@GLCODE_TDSUnderSGST varchar(50),@GLCODE_TDSUnderCGST varchar(50),
@GLCODE_TDSUnderIGST varchar(50),@GLCODE_INCOMETAX varchar(50),@GLCODE_BANK_NETAMOUNT varchar(50)
,@QRS int out)
AS
BEGIN
if(@id=0)
begin
if not Exists (select  *  from  vpm_tbl_Party_Payment_multiple_scheme where BillNo=@BillNo)
begin

	--insert records into vpm_tbl_Party_Payment_multiple_scheme 
	insert into vpm_tbl_Party_Payment_multiple_scheme
	(InwardDate,Department,PartyId,PartyAddress,PANNO,GSTRNO,PVDate,PvNo,VoucherTypeId,
	PK,BillDate,BillNo,NetBillAmount,NetTotalBill,
	IncomeTaxRate,TDSUnderSGSTRate,TDSUnderCGSTRate,TDSUnderIGSTRate,NetAmount,PayableAtId,
	PayableAtNumber,PayableAtDate,HSNCode,CreatedBy,CreatedDate,GLCODE_TDSUnderSGST,GLCODE_TDSUnderCGST,GLCODE_TDSUnderIGST,
	GLCODE_INCOMETAX,GLCODE_BANK_NETAMOUNT,IncomeTaxAmount,TDSUnderSGSTAmount,TDSUnderCGSTAmount,TDSUnderIGSTAmount)
	values (@InwardDate,@Department,@PartyId,@PartyAddress,@PANNO,@GSTRNO,
	@PVDate,@PvNo,@VoucherTypeId,@PK,@BillDate,@BillNo,@NetBillAmount,@NetTotalBill,@IncomeTaxRate,@TDSUnderSGSTRate,@TDSUnderCGSTRate,
	@TDSUnderIGSTRate,@NetAmount,@PayableAtId,@PayableAtNumber,@PayableAtDate,@HSNCode,
	@CreatedBy,getdate(),@GLCODE_TDSUnderSGST,
	@GLCODE_TDSUnderCGST,@GLCODE_TDSUnderIGST,@GLCODE_INCOMETAX,@GLCODE_BANK_NETAMOUNT
	,CEILING(@NetBillAmount*(@IncomeTaxRate/100)),CEILING(@NetBillAmount*(@TDSUnderSGSTRate/100))
    ,CEILING(@NetBillAmount*(@TDSUnderCGSTRate/100)),CEILING(@NetBillAmount*(@TDSUnderIGSTRate/100)))
	set @QRS=1;

	-- copy vpm_tbl_temp_Payment_multiple_scheme records into vpm_tbl_Payment_multiple_scheme
	insert into vpm_tbl_payment_multiple_scheme ([BillNo]
      ,[BillDate]
      ,[SchCode]
      ,[GLCode]
      ,[BillAmount]
      ,[GLCODE_SGST]
      ,[SGSTRate]
      ,[GLCODE_CGST]
      ,[CGSTRate]
      ,[GLCODE_IGST]
      ,[IGSTRate]
      ,[TotalBill]
	    ,[SGSTAmount]
	  ,[CGSTAmount]
	  ,[IGSTAmount])
	SELECT 
       [BillNo]
      ,[BillDate]
      ,[SchCode]
      ,[GLCode]
      ,[BillAmount]
      ,[GLCODE_SGST]
      ,[SGSTRate]
      ,[GLCODE_CGST]
      ,[CGSTRate]
      ,[GLCODE_IGST]
      ,[IGSTRate]
      ,[TotalBill]
	    ,[SGSTAmount]
	  ,[CGSTAmount]
	  ,[IGSTAmount]
  FROM [dbo].[vpm_tbl_temp_payment_multiple_scheme] where BillNo=@BillNo
  -- delete all records from vpm_tbl_temp_payment_multiple_scheme
  truncate table vpm_tbl_temp_payment_multiple_scheme;
end
else
	begin
		set @QRS=2;
	end
end

if (@id>0)
begin
	update vpm_tbl_Party_Payment_multiple_scheme set 
	InwardDate=@InwardDate,Department=@Department,PartyId=@PartyId,PartyAddress=@PartyAddress,
	PANNO=@PANNO,GSTRNO=@GSTRNO,PVDate=@PVDate,PVNo=@PVNo,VoucherTypeId=@VoucherTypeId,PK=@PK,
	BillDate=@BillDate,BillNo=@BillNo,NetBillAmount=@NetBillAmount,
	NetTotalBill=@NetTotalBill,
	IncomeTaxRate=@IncomeTaxRate,TDSUnderSGSTRate=@TDSUnderSGSTRate,
	TDSUnderCGSTRate=@TDSUnderCGSTRate,TDSUnderIGSTRate=@TDSUnderIGSTRate,
	NetAmount=@NetAmount,PayableAtId=@PayableAtId,PayableAtNumber=@PayableAtNumber,PayableAtDate=@PayableAtDate,
	HSNCode=@HSNCode,CreatedBy=@CreatedBy,GLCODE_TDSUnderSGST=@GLCODE_TDSUnderSGST,
	GLCODE_TDSUnderCGST=@GLCODE_TDSUnderCGST,GLCODE_TDSUnderIGST=@GLCODE_TDSUnderIGST,
	GLCODE_INCOMETAX=@GLCODE_INCOMETAX,GLCODE_BANK_NETAMOUNT=@GLCODE_BANK_NETAMOUNT,
	IncomeTaxAmount =CEILING(@NetBillAmount*(@IncomeTaxRate/100)),TDSUnderSGSTAmount=CEILING(@NetBillAmount*(@TDSUnderSGSTRate/100)),
	TDSUnderCGSTAmount=CEILING(@NetBillAmount*(@TDSUnderCGSTRate/100)),TDSUnderIGSTAmount=CEILING(@NetBillAmount*(@TDSUnderIGSTRate/100))
	where Id=@Id;
	set @QRS=1;

	-- delete from  vpm_tbl_Payment_multiple_scheme
	delete from  vpm_tbl_Payment_multiple_scheme where BillNo=@BillNo;

	-- copy vpm_tbl_temp_Payment_multiple_scheme records into vpm_tbl_Payment_multiple_scheme
	insert into vpm_tbl_payment_multiple_scheme ([BillNo]
      ,[BillDate]
      ,[SchCode]
      ,[GLCode]
      ,[BillAmount]
      ,[GLCODE_SGST]
      ,[SGSTRate]
      ,[GLCODE_CGST]
      ,[CGSTRate]
      ,[GLCODE_IGST]
      ,[IGSTRate]
      ,[TotalBill]
	  ,[SGSTAmount]
	  ,[CGSTAmount]
	  ,[IGSTAmount])
	SELECT 
       [BillNo]
      ,[BillDate]
      ,[SchCode]
      ,[GLCode]
      ,[BillAmount]
      ,[GLCODE_SGST]
      ,[SGSTRate]
      ,[GLCODE_CGST]
      ,[CGSTRate]
      ,[GLCODE_IGST]
      ,[IGSTRate]
      ,[TotalBill]
	   ,[SGSTAmount]
	  ,[CGSTAmount]
	  ,[IGSTAmount]
  FROM [dbo].[vpm_tbl_temp_payment_multiple_scheme] where BillNo=@BillNo
   -- delete all records from vpm_tbl_temp_payment_multiple_scheme
  truncate table vpm_tbl_temp_payment_multiple_scheme;
End
End


GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_Insert_update_Tax_Details]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<USP for to inserting/Updateing records into tblTax>
/* 
Remark 
QRV=1 Record Saved Successfully
QRV=2 Duplicate Record
QRV=3 Id is not Valid
*/
create PROCEDURE [dbo].[vpm_sp_Insert_update_Tax_Details]
	(@TaxName varchar(100),@QRS int out)
AS
BEGIN
	if Not exists (select * from vpm_tbl_Tax where TaxName=@TaxName)
	begin
	 insert into vpm_tbl_Tax (TaxName) values (@TaxName)
	set @QRS=1;
	end
	else
	begin
	set @QRS=2;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_Insert_update_TaxationMaster]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <16-12-2020>
-- Description:	<USP FOR INSERT Records in vpm_tbl_Taxation_Master>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_Insert_update_TaxationMaster]
	(@TaxId varchar(100),@TaxPercentage decimal(5,2),@Remark varchar(100),
	@Createdby int,@status varchar(10),@QRS int out)
AS
BEGIN
	if(@status='IMaintbl')	--If block start when Status is IMaintbl
	begin
	if Not Exists (select * from vpm_tbl_Taxation_Master where TaxId=@TaxId and TaxPercentage=@TaxPercentage)
	begin
	INSERT INTO vpm_tbl_Taxation_Master (TaxId,TaxPercentage,remark,createdby,createddate) 
	SELECT TaxId,TaxPercentage,remark,createdby,createddate FROM vpm_tbl_Temp_Taxation_Master;
	truncate table vpm_tbl_Temp_Taxation_Master;
	-- insert into vpm_tbl_Taxation_Master(TaxName,TaxPercentage,remark,createdby,createddate,	 modifiedby, modifieddate) values (@TaxName,@TaxPercentage,@remark,@createdby,getdate(),@createdby,getdate())
	 set @QRS=1;
	end
	else
	begin
	set @QRS=2;
	end
	end
	else if(@status='ITemptbl')
	begin --Else block start when Status is ITemptbl 
	if Not Exists (select * from vpm_tbl_Temp_Taxation_Master where TaxId=@TaxId and TaxPercentage=@TaxPercentage)
	begin
	 insert into vpm_tbl_Temp_Taxation_Master(TaxId,TaxPercentage,remark,createdby,createddate) 
	 values (@TaxId,@TaxPercentage,@remark,@createdby,getdate())
	 set @QRS=1;
	end
	else
	begin
	set @QRS=2;
	end
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_insert_update_temp_payment_multiple_scheme]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <18-12-2020>
-- Description:	<usp for inserting records int vpm_tbl_payment_multiple_scheme>
-- =============================================
CREATE PROCEDURE  [dbo].[vpm_sp_insert_update_temp_payment_multiple_scheme] 
(@Id int,@BillDate datetime,@BillNo varchar(50),@SchCode varchar(100),
@GLCode varchar(100),@BillAmount decimal(18, 2),
@SGSTRate decimal(18,2),@CGSTRate decimal(18, 2),@IGSTRate decimal(18, 2),
@TotalBill decimal(18,2),@GLCODE_SGST varchar(50),@GLCODE_CGST varchar(50),
@GLCODE_IGST varchar(50),@QRS int out)
AS
BEGIN
--if(@id=0)
--begin

	insert into vpm_tbl_temp_payment_multiple_scheme
	(BillNo,BillDate,SchCode,GLCode,BillAmount,GLCODE_SGST,SGSTRate,GLCODE_CGST,
	CGSTRate,GLCODE_IGST,IGSTRate,TotalBill,SGSTAmount,CGSTAmount,IGSTAmount)
	values (@BillNo,@BillDate,@SchCode,@GLCode,@BillAmount,@GLCODE_SGST,@SGSTRate,
	@GLCODE_CGST,@CGSTRate,@GLCODE_IGST,@IGSTRate,@TotalBill,
	(@BillAmount*(@SGSTRate/100)),(@BillAmount*(@CGSTRate/100)),(@BillAmount*(@IGSTRate/100)))
	set @QRS=1;
--end

--if (@id>0)
--begin
--	update vpm_tbl_payment_multiple_scheme set 
--	SchCode=@SchCode,GLCode=@GLCode,BillDate=@BillDate,BillNo=@BillNo,BillAmount=@BillAmount,
--	SGSTRate=@SGSTRate,CGSTRate=@CGSTRate,IGSTRate=@IGSTRate,TotalBill=@TotalBill,
--	GLCODE_SGST=@GLCODE_SGST,GLCODE_CGST=@GLCODE_CGST,GLCODE_IGST=@GLCODE_IGST
--	where Id=@Id;

--	--delete from  vpm_tbl_payment_multiple_scheme where Id=@Id;
--	--set @QRS=1;
--End
End
	--SGSTAmount,CGSTAmount,IGSTAmount,IncomeTaxAmount,TDSUnderSGSTAmount,TDSUnderCGSTAmount,TDSUnderIGSTAmount
---select * from vpm_tbl_payment_multiple_scheme
--select * from vpm_tbl_Party_Payment_multiple_scheme
--select * from vpm_tbl_temp_payment_multiple_scheme

--select * from vpm_tbl_Party_Payment;

--select * from vpm_tbl_payment_multiple_scheme p
--inner join vpm_tbl_Party_Payment_multiple_scheme a on a.billno=p.billno

GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_PartyMaster_EditRecord]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kapil Tare>
-- Create date: <10-12-2020>
-- Description:	<USP for to Editing records from tblVenderMaster>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_PartyMaster_EditRecord]
	(@Id int , @PartyName varchar(max),@Location varchar(max),@Address varchar(max),@BankId varchar(50),
	@IFSCCode varchar(20), @AccountNo varchar(20),@GSTNo varchar(20),@Remark varchar(max),
	@CreatedBy int,@IsActive varchar(10), @msg VARCHAR(100) OUT)
AS
BEGIN
	if not exists (select * from  vpm_tbl_Party_Master where ID=@Id)
	Begin
		update vpm_tbl_Party_Master set 
		PartyName=@PartyName,Location=@Location,Address1=@Address,BankId=@BankId,
		IFSCCode=@IFSCCode,AccountNO=@AccountNo,GSTNO=@GSTNo,Remark=@Remark,IsActive=@IsActive
		where id=@Id;
		SET @msg = 'Updated Successfully'  
	End
	else
	begin
		SET @msg = 'Record Not Exists' 
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_Bank_Letter]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <28-02-2021>
-- Description:	<Report Bank Letter>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_report_Bank_Letter]
(@fromDate datetime, @toDate datetime)
AS
BEGIN
select tpp.Id,PartyId,PartyName,BillAmount,NetAmount,PayableAtId,lov.Name as'PayableAt' 
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
inner join vpm_tbl_lov lov on tpp.PayableAtId=lov.Id
where (inwarddate between isnull(@fromDate,inwarddate) and isnull(@ToDate,inwarddate));
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_Chq_Issued]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <28-02-2021>
-- Description:	<Report Chq Issued>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_report_Chq_Issued]
(@fromDate datetime, @toDate datetime)
AS
BEGIN
select Department,tpp.Id,PartyId,PartyName,PayableAtNumber as 'ChequeNumber',PayableAtDate as 'ChequeDate',NetAmount from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
where PayableAtId=7 and (PayableAtDate between isnull(@fromDate,PayableAtDate) and isnull(@ToDate,PayableAtDate));
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_ETDS_Filling]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <28-02-2021>
-- Description:	<Report ETDS Filling>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_report_ETDS_Filling]
(@fromDate datetime, @ToDate datetime)
AS
BEGIN
select Department,tpp.Id,PartyId,PartyName,inwarddate,BillAmount,GLCODE_INCOMETAX,
IncomeTaxRate,
round((BillAmount*(IncomeTaxRate/100)),2) as 'IncomeTax'
,tpp.PartyAddress,tpp.PANNO from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
where (inwarddate between isnull(@fromDate,inwarddate) and isnull(@ToDate,inwarddate));
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_GST_Payment]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <28-02-2021>
-- Description:	<Report GST Payment>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_report_GST_Payment]
(@fromDate datetime, @ToDate datetime)
AS
BEGIN
select tpp.Id,PartyId,GSTRNo,HSNCode,PartyName,BillDate,inwarddate,BillAmount,GLCODE_SGST,
SGSTRate,
round((BillAmount*(SGSTRate/100)),2) as 'SGST',GLCODE_CGST ,
CGSTRate,
round((BillAmount*(CGSTRate/100)),2) as 'CGST',GLCODE_IGST,
IGSTRate,
round((BillAmount*(IGSTRate/100)),2) as 'IGST'
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
where inwarddate between isnull(@fromDate,'') and isnull(@ToDate,getdate()) 
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_sap_voucher]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <28-02-2021>
-- Description:	<Report Sap Voucher>
-- =============================================
CREATE PROCEDURE [dbo].[vpm_sp_report_sap_voucher]
( @PayableAtId int,
@fromDate datetime,
@ToDate datetime)
AS
BEGIN
--Below Query commented on 13-07-2021 by kapil due to new report structure

/* 
select tpp.Id as 'VoucherNo',convert(varchar, getdate(), 111) as 'VoucherDate', SchCode,
convert(varchar, getdate(), 111) as 'PostDate',VoucherTypeId,lov.name as 'Vouchertype',
BillNo,Department,PK, GLCode as 'SAPCODE','001' AS 'Contrash',BillAmount,
'001' as 'BA',convert(varchar, PayableAtDate, 111) as 'ValueDate',  
concat (GSTRNO,' ',HSNCode,' ',lov.name,' ',pm.PartyName) as 'Naration'
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_lov lov on tpp.VoucherTypeId=lov.Id
inner join vpm_tbl_Party_Master pm on tpp.PartyId=pm.Id
where PayableAtId =(case when @PayableAtId=0 then PayableAtId else @PayableAtId end)
and (inwarddate between isnull(@fromDate,inwarddate) and isnull(@ToDate,inwarddate));
*/

--Below Query added by kapil on 13-07-2021 due to new report structure

select 
InwardDate,

Id as 'VoucherNo',
case AmountDesc
when 'BillAmount' then convert(varchar, getdate(), 1)
when 'SGSTAmount' then null
when 'CGSTAmount' then null
when 'IGSTAmount' then null
when 'TDSUnderSGSTAmount' then null
when 'TDSUnderCGSTAmount' then null
when 'TDSUnderIGSTAmount' then null
when 'IncomeTaxAmount' then null
when 'NetAmount' then null
End as VoucherDate,
--case AmountDesc
--when 'BillAmount' then convert(varchar, getdate(), 104)
--when 'SGSTAmount' then null
--when 'CGSTAmount' then null
--when 'IGSTAmount' then null
--when 'TDSUnderSGSTAmount' then null
--when 'TDSUnderCGSTAmount' then null
--when 'TDSUnderIGSTAmount' then null
--when 'IncomeTaxAmount' then null
--when 'NetAmount' then null
--End as Voucher_Date1,
convert(varchar, InwardDate, 104) as 'Voucher_Date1',  
case AmountDesc
when 'BillAmount' then schCode
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As SchCode,
case AmountDesc
when 'BillAmount' then convert(varchar, getdate(), 111)
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End as PostDate,
--case AmountDesc
--when 'BillAmount' then convert(varchar, getdate(), 104)
--when 'SGSTAmount' then ''
--when 'CGSTAmount' then ''
--when 'IGSTAmount' then ''
--when 'TDSUnderSGSTAmount' then ''
--when 'TDSUnderCGSTAmount' then ''
--when 'TDSUnderIGSTAmount' then ''
--when 'IncomeTaxAmount' then ''
--when 'NetAmount' then ''
--End as Post_Date1,
convert(varchar, InwardDate, 104) as 'Post_Date1', 
case AmountDesc
when 'BillAmount' then VoucherType
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As VoucherType,
case AmountDesc
when 'BillAmount' then BillNo
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As BillNo,

case AmountDesc
when 'BillAmount' then Department+' '+PVNO+' ('+ cast(Id as varchar(20))+')'
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'RCMSGSTAmount' then ''
when 'RCMCGSTAmount' then ''
when 'RCMIGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As Department,
case AmountDesc
when 'BillAmount' then '40'
when 'SGSTAmount' then '40'
when 'CGSTAmount' then '40'
when 'IGSTAmount' then '40'
when 'RCMSGSTAmount' then '50'
when 'RCMCGSTAmount' then '50'
when 'RCMIGSTAmount' then '50'
when 'TDSUnderSGSTAmount' then '50'
when 'TDSUnderCGSTAmount' then '50'
when 'TDSUnderIGSTAmount' then '50'
when 'IncomeTaxAmount' then '50'
when 'NetAmount' then '50'
End As PK,

case AmountDesc
when 'BillAmount' then GLCode
when 'SGSTAmount' then GLCode_SGST
when 'CGSTAmount' then GLCode_CGST
when 'IGSTAmount' then GLCode_IGST
when 'RCMSGSTAmount' then '7060082'
when 'RCMCGSTAmount' then '7060083'
when 'RCMIGSTAmount' then '7060084'
when 'RCMIGSTAmount' then '7060056'
when 'TDSUnderSGSTAmount' then GLCode_TDSUnderSGST
when 'TDSUnderCGSTAmount' then GLCode_TDSUnderCGST
when 'TDSUnderIGSTAmount' then GLCode_TDSUnderIGST
when 'IncomeTaxAmount' then GLCode_INCOMETAX
when 'NetAmount' then GLCODE_BANK_NETAMOUNT
End As SAPCode,

case AmountDesc
when 'BillAmount' then ''
when 'SGSTAmount' then SchCode
when 'CGSTAmount' then SchCode
when 'IGSTAmount' then SchCode
when 'RCMSGSTAmount' then '001'
when 'RCMCGSTAmount' then '001'
when 'RCMIGSTAmount' then '001'
when 'TDSUnderSGSTAmount' then '001'
when 'TDSUnderCGSTAmount' then '001'
when 'TDSUnderIGSTAmount' then '001'
when 'IncomeTaxAmount' then '001'
when 'NetAmount' then '001'
End As CONTRASCH,

Amount,
'001' as 'BA',

convert(varchar, createdDate, 111) as 'ValueDate',  
convert(varchar, createdDate, 104) as 'ValueDate1',  
'' as 'FIL1',
concat (GSTRNO,'/',HSNCode,'/',PayableAt,'/',PartyName) as 'Naration',
PayableAtNumber as NEFTNumber,


convert(varchar, PayableAtDate, 111) as 'NEFTDATE'  

from 

(Select 
InwardDate,tpp.Id,department,PartyId,pk,
schCode,BillNo,GLCode,GLCode_SGST,GLCode_CGST,GLCode_IGST,GLCode_INCOMETAX,GLCode_TDSUnderSGST,GLCode_TDSUnderCGST,
GLCode_TDSUnderIGST,GLCode_Bank_NetAmount,PayableAtDate  ,PayableAtNumber
SGSTRate,CGSTRate,IGSTRate,
IncomeTaxRate,
TDSUnderSGSTRate,TDSUnderCGSTRate,TDSUnderIGSTRate,
BillAmount,SGSTAmount,CGSTAmount,IGSTAmount,RCMSGSTAMOUNT,RCMCGSTAMOUNT,RCMIGSTAMOUNT,TDSUnderSGSTAmount,TDSUnderCGSTAmount,TDSUnderIGSTAmount,
IncomeTaxAmount,NetAmount,
 PayableAtNumber, GSTRNO,HSNCode,pm.PartyName as PartyName,lov.name as PayableAt,lov2.name as VoucherType,PVNO
,tpp.CreatedDate as CreatedDate
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_lov lov on tpp.PayableAtId=lov.Id
inner join vpm_tbl_lov lov2 on tpp.VoucherTypeId=lov2.Id
inner join vpm_tbl_Party_Master pm on tpp.PartyId=pm.Id 
where PayableAtId =(case when @PayableAtId=0 then PayableAtId else @PayableAtId end)
and (inwarddate between isnull(@fromDate,inwarddate) and isnull(@ToDate,inwarddate))
) p
UNPIVOT
(
Amount For AmountDesc IN (BillAmount,SGSTAmount,CGSTAmount,IGSTAmount,RCMSGSTAMOUNT,RCMCGSTAMOUNT,RCMIGSTAMOUNT,TDSUnderSGSTAmount,TDSUnderCGSTAmount,TDSUnderIGSTAmount,
IncomeTaxAmount,NetAmount)
) Amounts

END
----,ps.schcode,ps.[SchCode],ps.[GLCode],ps.[BillAmount],ps.[GLCODE_SGST],ps.[SGSTRate],ps.[GLCODE_CGST]
----ps.[CGSTRate],ps.[GLCODE_IGST],ps.[IGSTRate],ps.[TotalBill]
--from  vpm_tbl_Party_Payment tpp
--inner join vpm_tbl_lov lov on tpp.PayableAtId=lov.Id
--inner join vpm_tbl_lov lov2 on tpp.VoucherTypeId=lov2.Id
--inner join vpm_tbl_Party_Master pm on tpp.PartyId=pm.Id
----inner join vpm_tbl_payment_multiple_scheme ps on ps.BillNo =tpp.BillNo
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_sap_voucher_for_multiple_scheme_anshu]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[vpm_sp_report_sap_voucher_for_multiple_scheme_anshu]
( @PayableAtId int,
@fromDate datetime,
@ToDate datetime)
AS
BEGIN
--Below Query commented on 13-07-2021 by kapil due to new report structure

/* 
select tpp.Id as 'VoucherNo',convert(varchar, getdate(), 111) as 'VoucherDate', SchCode,
convert(varchar, getdate(), 111) as 'PostDate',VoucherTypeId,lov.name as 'Vouchertype',
BillNo,Department,PK, GLCode as 'SAPCODE','001' AS 'Contrash',BillAmount,
'001' as 'BA',convert(varchar, PayableAtDate, 111) as 'ValueDate',  
concat (GSTRNO,' ',HSNCode,' ',lov.name,' ',pm.PartyName) as 'Naration'
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_lov lov on tpp.VoucherTypeId=lov.Id
inner join vpm_tbl_Party_Master pm on tpp.PartyId=pm.Id
where PayableAtId =(case when @PayableAtId=0 then PayableAtId else @PayableAtId end)
and (inwarddate between isnull(@fromDate,inwarddate) and isnull(@ToDate,inwarddate));
*/

--Below Query added by kapil on 13-07-2021 due to new report structure

select 
InwardDate,
Id as 'VoucherNo',
case AmountDesc
when 'NetBillAmount' then convert(varchar, getdate(), 1)
when 'SGSTAmount' then null
when 'CGSTAmount' then null
when 'IGSTAmount' then null
when 'TDSUnderSGSTAmount' then null
when 'TDSUnderCGSTAmount' then null
when 'TDSUnderIGSTAmount' then null
when 'IncomeTaxAmount' then null
when 'NetAmount' then null
End as VoucherDate,
case AmountDesc
when 'NetBillAmount' then convert(varchar, getdate(), 104)
when 'SGSTAmount' then null
when 'CGSTAmount' then null
when 'IGSTAmount' then null
when 'TDSUnderSGSTAmount' then null
when 'TDSUnderCGSTAmount' then null
when 'TDSUnderIGSTAmount' then null
when 'IncomeTaxAmount' then null
when 'NetAmount' then null
End as Voucher_Date1,
case AmountDesc
when 'NetBillAmount' then schCode
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As SchCode,
case AmountDesc
when 'NetBillAmount' then convert(varchar, getdate(), 111)
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End as PostDate,
case AmountDesc
when 'NetBillAmount' then convert(varchar, getdate(), 104)
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End as Post_Date1,
case AmountDesc
when 'NetBillAmount' then VoucherType
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As VoucherType,
case AmountDesc
when 'NetBillAmount' then BillNo
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As BillNo,

case AmountDesc
when 'NetBillAmount' then Department+' '+PVNO+' ('+ cast(Id as varchar(20))+')'
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''



when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As Department,
case AmountDesc
when 'NetBillAmount' then '40'
when 'SGSTAmount' then '40'
when 'CGSTAmount' then '40'
when 'IGSTAmount' then '40'



when 'TDSUnderSGSTAmount' then '50'
when 'TDSUnderCGSTAmount' then '50'
when 'TDSUnderIGSTAmount' then '50'
when 'IncomeTaxAmount' then '50'
when 'NetAmount' then '50'
End As PK,

case AmountDesc
when 'NetBillAmount' then GLCode
when 'SGSTAmount' then GLCode_SGST
when 'CGSTAmount' then GLCode_CGST
when 'IGSTAmount' then GLCode_IGST



when 'TDSUnderSGSTAmount' then GLCode_TDSUnderSGST
when 'TDSUnderCGSTAmount' then GLCode_TDSUnderCGST
when 'TDSUnderIGSTAmount' then GLCode_TDSUnderIGST
when 'IncomeTaxAmount' then GLCode_INCOMETAX
when 'NetAmount' then GLCODE_BANK_NETAMOUNT
End As SAPCode,

case AmountDesc
when 'NetBillAmount' then ''
when 'SGSTAmount' then SchCode
when 'CGSTAmount' then SchCode
when 'IGSTAmount' then SchCode



when 'TDSUnderSGSTAmount' then '001'
when 'TDSUnderCGSTAmount' then '001'
when 'TDSUnderIGSTAmount' then '001'
when 'IncomeTaxAmount' then '001'
when 'NetAmount' then '001'
End As CONTRASCH,

Amount,
'001' as 'BA',

convert(varchar, createdDate, 111) as 'ValueDate',  
convert(varchar, createdDate, 104) as 'ValueDate1',  
'' as 'FIL1',
concat (GSTRNO,'/',HSNCode,'/',PayableAt,'/',PartyName) as 'Naration'
from 

(Select 
InwardDate,tpp.Id,department,PartyId,pk,
schCode,tpp.BillNo as BillNo ,GLCode,GLCode_SGST,GLCode_CGST,GLCode_IGST,GLCode_INCOMETAX,GLCode_TDSUnderSGST,GLCode_TDSUnderCGST,
GLCode_TDSUnderIGST,GLCode_Bank_NetAmount,PayableAtDate
SGSTRate,CGSTRate,IGSTRate,
IncomeTaxRate,
TDSUnderSGSTRate,TDSUnderCGSTRate,TDSUnderIGSTRate,
NetBillAmount,pr.SGSTAmount as SGSTAmount,pr.CGSTAmount as CGSTAmount  ,pr.IGSTAmount as IGSTAmount,TDSUnderSGSTAmount,TDSUnderCGSTAmount,TDSUnderIGSTAmount,
IncomeTaxAmount,NetAmount,
PayableAtDate,GSTRNO,HSNCode,pm.PartyName as PartyName,lov.name as PayableAt,lov2.name as VoucherType,PVNO
,tpp.CreatedDate as CreatedDate
from  vpm_tbl_Party_Payment_multiple_scheme tpp
inner join vpm_tbl_payment_multiple_scheme pr on pr.billno = tpp.BillNo
inner join vpm_tbl_lov lov on tpp.PayableAtId=lov.Id
inner join vpm_tbl_lov lov2 on tpp.VoucherTypeId=lov2.Id
inner join vpm_tbl_Party_Master pm on tpp.PartyId=pm.Id 
where PayableAtId =(case when @PayableAtId=0 then PayableAtId else @PayableAtId end)
and (inwarddate between isnull(@fromDate,inwarddate) and isnull(@ToDate,inwarddate))
)
p
UNPIVOT
(
Amount For AmountDesc IN (NetBillAmount,SGSTAmount,CGSTAmount,IGSTAmount,TDSUnderSGSTAmount,TDSUnderCGSTAmount,TDSUnderIGSTAmount,
IncomeTaxAmount,NetAmount)
) Amounts

END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_sap_voucher_testghanshyam]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <28-02-2021>
-- Description:	<Report Sap Voucher>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_report_sap_voucher_testghanshyam]
(@fromDate datetime, @ToDate datetime, @PayableAtId int)
AS
BEGIN
--Below Query commented on 13-07-2021 by kapil due to new report structure

/* 
select tpp.Id as 'VoucherNo',convert(varchar, getdate(), 111) as 'VoucherDate', SchCode,
convert(varchar, getdate(), 111) as 'PostDate',VoucherTypeId,lov.name as 'Vouchertype',
BillNo,Department,PK, GLCode as 'SAPCODE','001' AS 'Contrash',BillAmount,
'001' as 'BA',convert(varchar, PayableAtDate, 111) as 'ValueDate',  
concat (GSTRNO,' ',HSNCode,' ',lov.name,' ',pm.PartyName) as 'Naration'
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_lov lov on tpp.VoucherTypeId=lov.Id
inner join vpm_tbl_Party_Master pm on tpp.PartyId=pm.Id
where PayableAtId =(case when @PayableAtId=0 then PayableAtId else @PayableAtId end)
and (inwarddate between isnull(@fromDate,inwarddate) and isnull(@ToDate,inwarddate));
*/

--Below Query added by kapil on 13-07-2021 due to new report structure

select 
InwardDate,
Id as 'VoucherNo',
case AmountDesc
when 'BillAmount' then convert(varchar, getdate(), 1)
when 'SGSTAmount' then null
when 'CGSTAmount' then null
when 'IGSTAmount' then null
when 'TDSUnderSGSTAmount' then null
when 'TDSUnderCGSTAmount' then null
when 'TDSUnderIGSTAmount' then null
when 'IncomeTaxAmount' then null
when 'NetAmount' then null
End as VoucherDate,
case AmountDesc
when 'BillAmount' then convert(varchar, getdate(), 104)
when 'SGSTAmount' then null
when 'CGSTAmount' then null
when 'IGSTAmount' then null
when 'TDSUnderSGSTAmount' then null
when 'TDSUnderCGSTAmount' then null
when 'TDSUnderIGSTAmount' then null
when 'IncomeTaxAmount' then null
when 'NetAmount' then null
End as Voucher_Date1,
case AmountDesc
when 'BillAmount' then schCode
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As SchCode,
case AmountDesc
when 'BillAmount' then convert(varchar, getdate(), 111)
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End as PostDate,
case AmountDesc
when 'BillAmount' then convert(varchar, getdate(), 104)
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End as Post_Date1,
case AmountDesc
when 'BillAmount' then VoucherType
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As VoucherType,
case AmountDesc
when 'BillAmount' then BillNo
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As BillNo,

case AmountDesc
when 'BillAmount' then Department+' '+PVNO+' ('+ cast(Id as varchar(20))+')'
when 'SGSTAmount' then ''
when 'CGSTAmount' then ''
when 'IGSTAmount' then ''
when 'RCMSGSTAmount' then ''
when 'RCMCGSTAmount' then ''
when 'RCMIGSTAmount' then ''
when 'TDSUnderSGSTAmount' then ''
when 'TDSUnderCGSTAmount' then ''
when 'TDSUnderIGSTAmount' then ''
when 'IncomeTaxAmount' then ''
when 'NetAmount' then ''
End As Department,
case AmountDesc
when 'BillAmount' then '40'
when 'SGSTAmount' then '40'
when 'CGSTAmount' then '40'
when 'IGSTAmount' then '40'
when 'RCMSGSTAmount' then '50'
when 'RCMCGSTAmount' then '50'
when 'RCMIGSTAmount' then '50'
when 'TDSUnderSGSTAmount' then '50'
when 'TDSUnderCGSTAmount' then '50'
when 'TDSUnderIGSTAmount' then '50'
when 'IncomeTaxAmount' then '50'
when 'NetAmount' then '50'
End As PK,

case AmountDesc
when 'BillAmount' then GLCode
when 'SGSTAmount' then GLCode_SGST
when 'CGSTAmount' then GLCode_CGST
when 'IGSTAmount' then GLCode_IGST
when 'RCMSGSTAmount' then '7060082'
when 'RCMCGSTAmount' then '7060083'
when 'RCMIGSTAmount' then '7060084'
when 'RCMIGSTAmount' then '7060056'
when 'TDSUnderSGSTAmount' then GLCode_TDSUnderSGST
when 'TDSUnderCGSTAmount' then GLCode_TDSUnderCGST
when 'TDSUnderIGSTAmount' then GLCode_TDSUnderIGST
when 'IncomeTaxAmount' then GLCode_INCOMETAX
when 'NetAmount' then GLCODE_BANK_NETAMOUNT
End As SAPCode,

case AmountDesc
when 'BillAmount' then ''
when 'SGSTAmount' then SchCode
when 'CGSTAmount' then SchCode
when 'IGSTAmount' then SchCode
when 'RCMSGSTAmount' then '001'
when 'RCMCGSTAmount' then '001'
when 'RCMIGSTAmount' then '001'
when 'TDSUnderSGSTAmount' then '001'
when 'TDSUnderCGSTAmount' then '001'
when 'TDSUnderIGSTAmount' then '001'
when 'IncomeTaxAmount' then '001'
when 'NetAmount' then '001'
End As CONTRASCH,

Amount,
'001' as 'BA',

convert(varchar, createdDate, 111) as 'ValueDate',  
convert(varchar, createdDate, 104) as 'ValueDate1',  
'' as 'FIL1',
concat (GSTRNO,'/',HSNCode,'/',PayableAt,'/',PartyName) as 'Naration'
from 

(Select 
InwardDate
,tpp.Id
,department
,PartyId
,pk,
schCode
,BillNo,GLCode,GLCode_SGST,GLCode_CGST
,GLCode_IGST,GLCode_INCOMETAX,GLCode_TDSUnderSGST
,GLCode_TDSUnderCGST,
GLCode_TDSUnderIGST
,GLCode_Bank_NetAmount,PayableAtDate
SGSTRate,CGSTRate,IGSTRate,
IncomeTaxRate,
TDSUnderSGSTRate,TDSUnderCGSTRate,TDSUnderIGSTRate,
BillAmount,SGSTAmount,CGSTAmount,IGSTAmount,RCMSGSTAMOUNT
,RCMCGSTAMOUNT,RCMIGSTAMOUNT,TDSUnderSGSTAmount
,TDSUnderCGSTAmount,TDSUnderIGSTAmount,
IncomeTaxAmount,NetAmount,
PayableAtDate,GSTRNO,HSNCode,pm.PartyName as PartyName,lov.name as PayableAt,lov2.name as VoucherType,PVNO
,tpp.CreatedDate as CreatedDate
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_lov lov on tpp.PayableAtId=lov.Id
inner join vpm_tbl_lov lov2 on tpp.VoucherTypeId=lov2.Id
inner join vpm_tbl_Party_Master pm on tpp.PartyId=pm.Id 
where PayableAtId =(case when @PayableAtId=0 then PayableAtId else @PayableAtId end)
and (inwarddate between isnull(@fromDate,inwarddate) and isnull(@ToDate,inwarddate))
) p
UNPIVOT
(
Amount For AmountDesc IN (BillAmount,SGSTAmount,CGSTAmount,IGSTAmount,RCMSGSTAMOUNT,RCMCGSTAMOUNT,RCMIGSTAMOUNT,TDSUnderSGSTAmount,TDSUnderCGSTAmount,TDSUnderIGSTAmount,
IncomeTaxAmount,NetAmount)
) Amounts

where Amounts.Amount>0;
END


--select * from vpm_tbl_Party_Payment






GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_TDS_Deposited]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <28-02-2021>
-- Description:	<Report TDS_Deposited>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_report_TDS_Deposited]
(@fromDate datetime, @ToDate datetime)
AS
BEGIN
select tpp.Id,PartyId,PartyName,BillAmount,BillDate,GLCODE_INCOMETAX,
IncomeTaxRate,
ROUND((BillAmount*(IncomeTaxRate/100)), 2) as 'IncomeTax',
0 as 'Surcharge',0 as 'CES', 
round(((BillAmount*(IncomeTaxRate/100))+0+0),2) As 'Total'
from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
where inwarddate between isnull(@fromDate,'') and isnull(@ToDate,getdate()) 
END
GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_report_TDS_Under_GST]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAPIL TARE>
-- Create date: <28-02-2021>
-- Description:	<Report TDS Under GST>
-- =============================================
create PROCEDURE [dbo].[vpm_sp_report_TDS_Under_GST]
(@fromDate datetime, @ToDate datetime)
AS
BEGIN
select tpp.Id,PartyId,PartyName,GSTRNo,BillAmount,BillDate,GLCODE_TDSUnderSGST,
TDSUnderSGSTRate,
round((BillAmount*(TDSUnderSGSTRate/100)),2) as 'TDSUnderSGST',GLCODE_TDSUnderCGST,
TDSUnderCGSTRate,
round((BillAmount*(TDSUnderCGSTRate/100)),2) as 'TDSUnderCGST',GLCODE_TDSUnderIGST,
TDSUnderIGSTRate,
round((BillAmount*(TDSUnderIGSTRate/100)),2) as 'TDSUnderIGST',
HSNCode from  vpm_tbl_Party_Payment tpp
inner join vpm_tbl_Party_Master tpm on tpp.PartyId=tpm.Id
where inwarddate between isnull(@fromDate,'') and isnull(@ToDate,getdate()) 
END
GO
/****** Object:  StoredProcedure [dbo].[VPM_SP_ROLE_MASTER_ACTIVITY]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[VPM_SP_ROLE_MASTER_ACTIVITY]
@Code VARCHAR(50)=NULL,
@Name VARCHAR(300)=NULL,
@IsActive bit,
@ID INT,
@USERID VARCHAR(50)
AS
BEGIN

 IF(@ID=0)
    BEGIN
   
        INSERT INTO vpm_tbl_role_master(Code,Name,IsActive) Values(@Code,@Name,@IsActive)

        select  'Data inserted successfully'
    END
 ELSE
	BEGIN
	      UPDATE vpm_tbl_role_master SET code=@code,Name=@Name,IsActive=@IsActive where ID=@ID
		  select  'Data updated successfully'
	END
 
END

GO
/****** Object:  StoredProcedure [dbo].[vpm_sp_total_BillAmount]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[vpm_sp_total_BillAmount](@GLCode varchar(100) )
    
AS
    /* SET NOCOUNT ON */
    SELECT
        SUM(BillAmount) AS TOTAL
    FROM vpm_tbl_Party_Payment WHERE GLCode = @GLCode        

    RETURN
GO
/****** Object:  StoredProcedure [dbo].[VPM_SP_USER_MASTER_ACTIVITY]    Script Date: 1/9/2023 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[VPM_SP_USER_MASTER_ACTIVITY]
@Code VARCHAR(50)=NULL,
@Name VARCHAR(300)=NULL,
@Email VARCHAR(100)=NULL,
@IsActive bit,
@RoleID int,
@ID INT,
@USERID VARCHAR(50)
AS
BEGIN

 IF(@ID=0)
    BEGIN
    
        INSERT INTO vpm_tbl_user_master(Code,Name,Email,RoleID,IsActive) Values(@Code,@Name,@Email,@RoleID,@IsActive)
        select  'Data inserted successfully'
    END
 ELSE
	BEGIN
	      UPDATE vpm_tbl_user_master SET Code=@Code,Name=@Name,Email=@Email,RoleID=@RoleID,IsActive=@IsActive where ID=@ID
		  select  'Data updated successfully'
	END
 
END


GO
USE [master]
GO
ALTER DATABASE [VPM] SET  READ_WRITE 
GO
