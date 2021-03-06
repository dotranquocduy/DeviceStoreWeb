USE [master]
GO
/****** Object:  Database [BHDT2]    Script Date: 6/17/2021 8:59:55 AM ******/
CREATE DATABASE [BHDT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BHDT2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BHDT2.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BHDT2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BHDT2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BHDT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BHDT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BHDT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BHDT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BHDT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BHDT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BHDT] SET ARITHABORT OFF 
GO
ALTER DATABASE [BHDT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BHDT] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BHDT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BHDT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BHDT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BHDT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BHDT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BHDT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BHDT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BHDT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BHDT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BHDT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BHDT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BHDT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BHDT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BHDT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BHDT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BHDT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BHDT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BHDT] SET  MULTI_USER 
GO
ALTER DATABASE [BHDT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BHDT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BHDT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BHDT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BHDT]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Comments](
	[ComID] [int] IDENTITY(1,1) NOT NULL,
	[CommentMsg] [varchar](max) NULL,
	[CommentedDate] [datetime] NULL,
	[MaSP] [int] NULL,
	[MaTK] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ComID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_DonHang]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DonHang](
	[MaDDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[TenSP] [nvarchar](225) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [CT_don_pk] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[MaLoaiTT] [int] NULL,
	[NgayGiao] [datetime] NULL,
	[MaTK] [int] NULL,
	[TongTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiQuyenTK]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiQuyenTK](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[MaLoaiTK] [int] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [pk_LoaiQuyen_KH] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC,
	[MaLoaiTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[Icon] [nvarchar](max) NULL,
	[BiDanh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiTK]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTK](
	[MaLoaiTK] [int] NOT NULL,
	[TenLoaiTK] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiKH] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](100) NULL,
	[ThongTin] [nvarchar](225) NULL,
	[Logo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](225) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayCapNhap] [datetime] NULL,
	[Mota] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[MaNSX] [int] NULL,
	[MaLoaiSP] [int] NULL,
	[DaXoa] [bit] NULL,
	[HinhAnh1] [nvarchar](max) NULL,
	[HinhAnh2] [nvarchar](max) NULL,
	[HinhAnh3] [nvarchar](max) NULL,
	[HinhAnh4] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
	[Tinhtrang] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[TenTK] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[SDT] [varchar](12) NULL,
	[Gioitinh] [bit] NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ImageUser] [nvarchar](max) NULL,
	[MaLoaiTK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TinhtrangDH]    Script Date: 6/17/2021 8:59:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhtrangDH](
	[MaLoaiTT] [int] IDENTITY(1,1) NOT NULL,
	[TenTT] [nvarchar](100) NULL,
 CONSTRAINT [PK_TinhtrangDH] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (36, 13, N'Smart Tivi 4K UHD Samsung 55 inch UA55TU8100KXXV - Miễn phí lắp đặt', 1, CAST(11900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (37, 6, N'Điện thoại Xiaomi POCO X3 Pro (6GB+128GB) | Hàng chính hãng | Bảo hành 18T', 2, CAST(6000000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (37, 8, N'Đồng hồ nam dây da Casio MTP-V004L-1AUDF chính hãng', 2, CAST(700000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (38, 4, N'Điện thoại OPPO A12 (3GB/32GB) - Hàng chính hãng', 3, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (38, 17, N'Sản phẩm mới', 1, CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (39, 3, N'Apple iPhone 12 Pro Max 128GB', 1, CAST(30000000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (39, 4, N'Điện thoại OPPO A12 (3GB/32GB) - Hàng chính hãng', 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (40, 4, N'Điện thoại OPPO A12 (3GB/32GB) - Hàng chính hãng', 3, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (40, 13, N'Smart Tivi 4K UHD Samsung 55 inch UA55TU8100KXXV - Miễn phí lắp đặt', 1, CAST(11900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (41, 6, N'Điện thoại Xiaomi POCO X3 Pro (6GB+128GB) | Hàng chính hãng | Bảo hành 18T', 1, CAST(6000000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (41, 13, N'Smart Tivi 4K UHD Samsung 55 inch UA55TU8100KXXV - Miễn phí lắp đặt', 1, CAST(11900000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (42, 12, N'Tivi TCL 4K UHD Android 9.0 50 inch 50T65 - Hàng Chính Hãng - Miễn phí lắp đặt', 1, CAST(8200000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (43, 6, N'Điện thoại Xiaomi POCO X3 Pro (6GB+128GB) | Hàng chính hãng | Bảo hành 18T', 4, CAST(6000000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (44, 4, N'Điện thoại OPPO A12 (3GB/32GB) - Hàng chính hãng', 3, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (45, 6, N'Điện thoại Xiaomi POCO X3 Pro (6GB+128GB) | Hàng chính hãng | Bảo hành 18T', 2, CAST(6000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (34, CAST(N'2021-06-07 08:23:40.727' AS DateTime), 2, NULL, 31, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (35, CAST(N'2021-06-08 03:25:58.693' AS DateTime), 1, NULL, 31, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (36, CAST(N'2021-06-08 03:41:51.473' AS DateTime), 1, NULL, 31, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (37, CAST(N'2021-06-08 03:59:04.177' AS DateTime), 1, NULL, 32, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (38, CAST(N'2021-06-08 04:02:58.720' AS DateTime), 2, NULL, 33, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (39, CAST(N'2021-06-08 04:29:55.557' AS DateTime), 1, NULL, 34, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (40, CAST(N'2021-06-08 04:38:38.407' AS DateTime), 1, NULL, 35, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (41, CAST(N'2021-06-08 04:50:51.797' AS DateTime), 2, NULL, 36, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (42, CAST(N'2021-06-08 04:58:21.107' AS DateTime), 2, NULL, 37, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (43, CAST(N'2021-06-08 05:09:48.530' AS DateTime), 2, NULL, 38, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (44, CAST(N'2021-06-08 05:24:29.453' AS DateTime), 2, NULL, 39, NULL)
INSERT [dbo].[DonHang] ([MaDDH], [NgayDat], [MaLoaiTT], [NgayGiao], [MaTK], [TongTien]) VALUES (45, CAST(N'2021-06-09 07:10:31.413' AS DateTime), 1, NULL, 40, NULL)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'DangKy', 1, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'DangKy', 2, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'DangKy', 3, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'DangKy', 4, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'DangKy', 5, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'QLDonHang', 2, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'QLDonHang', 5, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'QLKhachHang', 2, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'QLQuyen', 2, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'QLSanPham', 2, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'QLSanPham', 3, NULL)
INSERT [dbo].[LoaiQuyenTK] ([MaQuyen], [MaLoaiTK], [GhiChu]) VALUES (N'QuanTri', 2, NULL)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (1, N'CPU', NULL, N'123')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (2, N'Đồng Hồ', NULL, N'đồng hồ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (3, N'Điện Thoại', NULL, N'Điện thoại')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (4, N'TV', NULL, N'Ti vi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (5, N'LapTop', NULL, N'Laptop')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
INSERT [dbo].[LoaiTK] ([MaLoaiTK], [TenLoaiTK]) VALUES (1, N'men')
INSERT [dbo].[LoaiTK] ([MaLoaiTK], [TenLoaiTK]) VALUES (2, N'Admin')
INSERT [dbo].[LoaiTK] ([MaLoaiTK], [TenLoaiTK]) VALUES (3, N'Admin QL Sản Phẩm')
INSERT [dbo].[LoaiTK] ([MaLoaiTK], [TenLoaiTK]) VALUES (4, N'Admin QL Quyền')
INSERT [dbo].[LoaiTK] ([MaLoaiTK], [TenLoaiTK]) VALUES (5, N'Admin QL Đơn Hàng')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (1, N'Macbook', N'chưa', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (3, N'Iphone', N'Iphone', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (4, N'Oppo', N'Iphone', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (5, N'RealMe', N'Iphone', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (6, N'Xiaomi', N'Iphone', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (8, N'Huawei', N'Iphone', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (9, N'Dell', N'Iphone', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (10, N'LG', N'Iphone', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (11, N'TCL', N'Iphone', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (12, N'SamSung', N'Iphone', NULL)
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'DangKy', N'DangKy')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QLDonHang', N'Quản Lý Đơn Hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QLKhachHang', N'Quản Lý Khách Hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QLQuyen', N'Quản Lý Quyền')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QLSanPham', N'Quản Lý Sản Phẩm')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanTri', N'Quản Trị')
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (3, N'Apple iPhone 12 Pro Max 128GB', CAST(30000000 AS Decimal(18, 0)), CAST(N'2021-05-26 00:00:00.000' AS DateTime), N'iPhone 12 Pro Max. Màn hình Super Retina XDR 6.7 inch lớn hơn (1). Ceramic Shield với khả năng chịu va đập khi rơi tốt hơn gấp 4 lần (2). Ảnh chụp tuyệt đẹp trong điều kiện ánh sáng yếu với hệ thống camera chuyên nghiệp tuyệt đỉnh trên iPhone và phạm vi thu phóng quang học 5x. Quay phim, biên tập và phát video Dolby Vision đẳng cấp điện ảnh. Chụp ảnh chân dung ở chế độ Ban Đêm và trải nghiệm thực tế ảo tăng cường đẳng cấp mới với LiDAR Scanner. Chip A14 Bionic mạnh mẽ. Cho bất tận những năng lực ấn tượng.
Tính năng nổi bật:
•	Màn hình Super Retina XDR 6.7 inch (1)
•	Ceramic Shield, chất liệu kính bền chắc nhất từng có trên điện thoại thông minh
•	A14 Bionic, chip nhanh nhất từng có trên điện thoại thông minh 
•	Hệ thống camera chuyên nghiệp 12MP với camera Ultra Wide, Wide và Telephoto; phạm vi thu phóng quang học 5x; chế độ Ban Đêm, Deep Fusion, HDR thông minh thế hệ 3, Apple ProRAW (3), và khả năng quay video HDR Dolby Vision 4K
•	LiDAR Scanner cải thiện trải nghiệm thực tế ảo tăng cường và chụp ảnh chân dung ở chế độ Ban Đêm
•	Camera trước TrueDepth 12MP với chế độ Ban Đêm và khả năng quay video HDR Dolby Vision 4K
•	Khả năng chống nước đạt chuẩn IP68 đứng đầu thị trường (4)
•	iOS 14 với các tiện ích được thiết kế lại trên Màn Hình Chính, Thư Viện Ứng Dụng hoàn toàn mới, App Clips cùng nhiều tính năng khác 
Pháp lý 
(1) Màn hình có các góc bo tròn. Khi tính theo hình chữ nhật, kích thước màn hình là 6.68 inch theo đường chéo.  Diện tích hiển thị thực tế nhỏ hơn. 
(2) Xác nhận dựa vào mặt trước có Ceramic Shield của iPhone 12 Pro Max so với iPhone thế hệ trước.  
(3) Apple ProRAW sắp ra mắt. 
(4) iPhone 12 Pro Max có khả năng chống tia nước, chống nước và chống bụi. Sản phẩm đã qua kiểm nghiệm trong điều kiện phòng thí nghiệm có kiểm soát đạt mức IP68 theo tiêu chuẩn IEC 60529 (chống nước ở độ sâu tối đa 6 mét trong vòng tối đa 30 phút). Khả năng chống tia nước, chống nước và chống bụi không phải là các điều kiện vĩnh viễn. Khả năng này có thể giảm do hao mòn thông thường. Không sạc pin khi iPhone đang bị ướt. Vui lòng tham khảo hướng dẫn sử dụng để biết cách lau sạch và làm khô máy. Không bảo hành sản phẩm bị hỏng do thấm chất lỏng. 
 
Bộ sản phẩm bao gồm: 
•	Điện thoại 
•	Dây sạc
•	HDSD Bảo hành điện tử 12 tháng.
Thông tin bảo hành:
Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.
Kích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/
Hướng dẫn kiểm tra địa điểm bảo hành gần nhất:
Bước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN 
Bước 2: Chọn sản phẩm.
Bước 3: Điền Apple ID, nhập mật khẩu.
Sau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.', N'/Images/IMG_37642101623.JPG', 3, 3, 0, N'/Images/IMG_37642101623.JPG', N'/Images/IMG_37652101623.JPG', N'/Images/IMG_37662101623.JPG', N'/Images/IMG_37672101623.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (4, N'Điện thoại OPPO A12 (3GB/32GB) - Hàng chính hãng', CAST(2500000 AS Decimal(18, 0)), CAST(N'2021-05-26 00:00:00.000' AS DateTime), N'Thương hiệu
oppo
Model
OPPO A12
Bộ nhớ trong
32GB
RAM
3GB
Camera sau
Dual 13MP + 2MP
Camera trước
5MP
Pin (mAh)
4325
Màu
Nhiều màu
Bảo hành (tháng)
12 Tháng
Kho hàng
57
Gửi từ
TP. Hồ Chí Minh', N'/Images/IMG_37762103274.JPG', 4, 3, 0, N'/Images/IMG_37742103274.JPG', N'/Images/IMG_37772103274.JPG', N'/Images/IMG_37782103274.JPG', N'/Images/IMG_37792103274.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (5, N'Điện Thoại Realme C11 (2GB/32GB) - Hàng Chính Hãng', CAST(2000000 AS Decimal(18, 0)), CAST(N'2021-05-31 00:00:00.000' AS DateTime), N'Thông số kĩ thuật
Xám Hạt Tiêu - Xanh Bạc Hà
Màn hình rộng
Kích thước màn hình"	6.5"
Công nghệ màn hình: Tấm nền màn hình LCD
Độ phân giải: Độ phân giải màn hình 1600*720, HD+, tỷ lệ hiển thị màn hình lên đến 88%
Màu sắc của màn hình"	16.7 triệu màu
Mặt kính cảm ứng: Loại kính cảm ứng Corning Gorilla Glass 3
Chụp ảnh
Camera sau: Camera chính: 13MP f/2.2 Camera chân dung: 2MP f/2.4"
Quay phim
Độ phân giải video quay phim Quay video 1080@30fps 720@30fps
Chụp ảnh nâng cao
Các tính năng chụp: Panorama, beauty AI 2.0, chân dung, chụp đêm, chuyên gia
Camera trước	5 MP, f/2.4
Đèn Flash
Tính năng chụp ảnh camera trước: 
Các tính năng chụp: Làm đẹp, Bộ lọc màu, HDR, Selfie toàn cảnh, Chân dung, Timelapse, chụp hình bằng cử chỉ
Hệ điều hành: Realme UI 1.0
Loại CPU (Chipset)	Helio G35 Cortex A53 8 nhân 64 bit, xung nhịp lên đến 2.3 GHz
Tốc độ CPU: 8 nhân, 2.3 GHz
Chip đồ hoạ: (GPU)	GE8320
RAM: 2GB
Bộ nhớ trong: 32GB
Thẻ nhớ ngoài	Micro SD
Hỗ trợ thẻ tối đa	256GB
Loại SIM	Dual-SIM (Nano SIM)
Hỗ trợ 4G	
Chuẩn Wifi: 2.4GHz, 802.1.1b/g/n
Jack tai nghe	3.5mm
Cổng kết nối/sạc: Kết nối với máy tính qua cổng USB hoặc sạc cho máy: Micro USB
Hỗ trợ kết nối khác: OTG
Thực thiện cuộc gọi: Quay số thủ công, Trợ lý Google
Thiết kế & Trọng lượng	
Thiết kế
Thiết kế máy: Nguyên khối, Pin rời, Pin liền,..."	Nguyên khối
Chất liệu
Chất liệu được sử dụng để sản xuất vỏ máy (nhựa, nhôm....)"	Nhựa 3D cao cấp
Kích thước
ĐÚNG CHUẨN (Đơn vị, dấu chấm, dấu cách): Dài 151.5 mm - Ngang 74.9 mm - Dày 8.1 mm"	164.4 x 75.9 x 9.1mm
Trọng lượng	Khoảng 196g bao gồm Pin
Pin & Dung lượng	
Loại pin
Tên hãng và tên pin: Li-po
Dung lượng pin	5000mAh
Công nghệ pin
Công nghệ pin đi kèm: Sạc nhanh, QuickCharge, VOOC, Tiết kiệm pin, Siêu tiết kiệm pin,..."	5V2A, 10W, hỗ trợ sạc ngược với cáp OTG
Tiện ích	
Bảo mật nâng cao
Bảo mật mở khoá máy: Khuôn mặt, Face ID, Mống mắt
Mở khoá nhận diện gương mặt trong 0,91s
Tính năng đặc biệt
Các chức năng khác của điện thoại: AOD, Sạc pin nhanh, Nhân bản ứng dụng, Chặn cuộc gọi, Đèn pin, kháng nước kháng bụi, chạm 2 lần mở khóa..."	"4G - LTE 
Bluetooth 5.0 
Công nghệ sạc ngược
Ghi âm môi trường: Có ứng dụng ghi âm mặc định trên máy và có mic chống ồn không? Có
Ghi âm cuộc gọi	Có
Xem phim: Định dạng phim hỗ trợ xem được: mp4, .3gp, .3g2, .3gpp, .3gpp2, .m4v , .mkv
Xem phim: Lên đến 9 giờ liên tục
Nghe nhạc: Định dạng âm thanh hỗ trợ nghe được: MP3, Lossless, WAV,..."	AAC,HE-AAC v1, HE-AAC v2,AMR,AWB,MIDI,MP3,OGG VORBIS
Nghe nhạc: Lên đến 40 giờ liên tục
Danh bạ: Bộ nhớ máy chứa được tối đa bao nhiêu số danh bạ"	Không có dữ liệu
Radio: Có ứng dụng radio FM mặc định trên máy không? Có cần tai nghe để sử dụng Radio không?: Không
Bộ sản phẩm gồm: Sạc ,Sách hướng dẫn ,Hộp, Cáp sạc. 
Thông tin bảo hành
Sản phẩm được bảo hành 12 tháng tại các trung tâm bảo hành Realme
1 đổi 1 trong 30 ngày đầu sử dụng (Lỗi sản xuất).
Giao hàng miễn phí trên toàn quốc.
Hotline:  1800 6067 (miễn phí)', N'/Images/IMG_37682105104.JPG', 5, 3, 0, N'/Images/IMG_37692105104.JPG', N'/Images/IMG_37702105104.JPG', N'/Images/IMG_37722105104.JPG', N'/Images/IMG_37712105104.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (6, N'Điện thoại Xiaomi POCO X3 Pro (6GB+128GB) | Hàng chính hãng | Bảo hành 18T', CAST(6000000 AS Decimal(18, 0)), CAST(N'2021-05-31 00:00:00.000' AS DateTime), N'Thương hiệu
Xiaomi
Model
Xiaomi Poco X3 Pro
Bộ nhớ trong
6GB
Khe cắm sim
Dual
Chống thấm nước
Yes
Camera sau
48MP + 8MP + 2MP + 2MP
Camera trước
20MP
GPS
Yes
microUSB
Type-C
Pin (mAh)
5160
Màu
Nhiều màu
Bảo hành (tháng)
18 Tháng
Kho hàng
1417
Gửi từ
Quận 3, TP. Hồ Chí Minh', N'/Images/IMG_37802106887.JPG', 6, 3, 0, N'/Images/IMG_37812106887.JPG', N'/Images/IMG_37842106887.JPG', N'/Images/IMG_37862106887.JPG', N'/Images/IMG_37852106887.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (8, N'Đồng hồ nam dây da Casio MTP-V004L-1AUDF chính hãng', CAST(700000 AS Decimal(18, 0)), NULL, N'Chất liệu dây
Da
Giới tính
Nam
Chất liệu mặt kính
Mineral
Chất liệu viền ngoài
Mạ hợp kim
Thương hiệu
CASIO
Kho hàng
5
Gửi từ
Quận Bình Thạnh, TP. Hồ Chí Minh', N'/Images/180649606022110857.jpeg', 6, 2, 0, N'/Images/12758729332110857.jpeg', N'/Images/13855749622110857.jpeg', N'/Images/180649606022110857.jpeg', N'/Images/2874960712110857.jpeg', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (9, N'Laptop Dell INS15 3505 R3 -3250U, 8GD4, 256GB, 15.6"FHD, W10SL, PreSup, Đen (Y1N1T1)', CAST(12000000 AS Decimal(18, 0)), NULL, N'Tính năng nổi bật:
Hệ điều hành: Win 10 bản quyền
CPU: AMD Ryzen 3 3250U 2.60 GHzup to 3.50 GHz, 4MB
RAM: 8GB (4GB + 4GB Onboard) DDR4 3200MHz
Ổ đĩa cứng: 256GB SSD PCIe (M.2 2230)
VGA: AMD Radeon Graphics
Màn hình: 15.6” inch diagonal Full HD (1920 x 1080) 60Hz, Wide Viewing Angle, Anti glare
THÔNG SỐ KỸ THUẬT
Hệ điều hành: Win 10 bản quyền
Bộ vi xử lý: AMD Ryzen 3 3250U 2.60 GHzup to 3.50 GHz, 4MB
Bộ nhớ Ram: 8GB (4GB + 4GB Onboard) DDR4 3200MHz
Ổ đĩa cứng: 256GB SSD PCIe (M.2 2230) 
Màn hình: 15.6” inch diagonal Full HD (1920 x 1080) 60Hz, Wide Viewing Angle, Anti glare
Đồ họa: AMD Radeon Graphics
Ổ đĩa quang: No DVD
Camera: HD Web Camera with microphones
Cổng giao tiếp	
1 x USB 2.0 Type A ; 2 x USB 3.1 Gen 1 Type A ; 1 x Headphone/Microphone combo jack, SD card reader (support SD/SDHC/SDXC)
Số cổng lưu trữ tối đa: 1 x SATA3
Cổng xuất hình: 1 x HDMI
Keyboard + Mouse: Full size standard keyboard, spill resistant chiclet keyboard ; Touchpad four finger gestures
Pin (Battery): 3 Cell Int (42Wh)
Phụ kiện kèm theo: Full box
Bluetooth: Bluetooth 4.2
Lan: 10/100 Mbps
Âm thanh	: Realtek High Definition Audio (Speaker : 2 x 2W)
Kích thước: 1.99 x 36.396 x 24.9 cm (H x W x D)
Khối lượng: 1.832 kg
Laptop Dell Inspiron 15 3505 Y1N1T1 (Black) với viền hẹp xung quanh màn hình, trông giống như một chiếc máy tính xách tay hiện đại. Mặc dù có màn hình 15,6 inch nhưng chiếc máy này không quá nặng và lớn để mang theo.
Bàn phím rộng rãi và nhạy mang lại cảm giác di chuyển sâu hơn và tạo cảm giác thoải mái khi gõ. Bàn di chuột có kích thước vừa phải nằm bên dưới bàn phím và rộng đáng kinh ngạc
Cạnh trái là cổng sạc thiết bị, cổng Ethernet, cổng HDMI, hai cổng USB Type-A và giắc cắm tai nghe. Ở phía bên phải, bạn sẽ tìm thấy thẻ SD, cổng USB loại A và khe khóa hình nền.
Laptop Dell Inspiron 15 3505 Y1N1T1 (Black) đủ nhanh cho nhu cầu của hầu hết mọi người, đặc biệt là sinh viên có yêu cầu giới hạn trong việc duyệt web hoặc làm bài tập.
Phụ kiện đi kèm: dây nguồn
**Sản phẩm có thể có túi đựng laptop (tùy đợt nhập hàng)
Thông tin bảo hành:
Bảo hành 12 tháng
Hỗ trợ qua trang web, chat và email của Dell Prosupport: www.Support.Dell.com
Số điện thoại hỗ trợ kỹ thuật Dell miễn phí 24/7: 1800 54 54 55
Địa chỉ TTBH Dell tại:  
- HCM: 23 Nguyễn Thị Huỳnh, P.8, Phú Nhuận - 028 3842 4342
- Hà Nội: 110 Phố Thái Thịnh, P. Trung Liệt, Q. Đống Đa - 024 3537 5858
- Đà Nẵng: 36 Hàm Nghi, P. Thạc Gián, Q.Thanh Khê - 0236 3653848
- Cần Thơ: 211/2 Nguyễn Văn Linh. Q Ninh Kiều - 029 2378 3599
Thời gian làm việc:
- TP. HCM: Thứ Hai đến thứ Sáu (8:00 - 19:00), thứ Bảy (8:00 - 17:30)
- Hà Nội, Đà Nẵng, Cần Thơ: Thứ Hai đến thứ Bảy (8:00 - 17:30)
-----
Địa chỉ bảo hành của NPP DGW: 
- HCM: 
65A Hồ Xuân Hương, Phường 6, Quận 3, Tp.HCM - (028) 73080880 – Ext: 3100
Số 6 Đường Tân Thới Nhất 8, Khu Phố 5, Phường Tân Thới Nhất, Quận 12, TP.HCM - (028) 73080880 – Ext: 3000
- Đà Nẵng: 36 Hà Huy Tập , Phường Xuân Hà, Quận Thanh Khê , TP. Đà Nẵng - (0236) 7300880 – Ext : 3600
- Hà Nội: 146 Thái Hà , phường Trung Liệt, Quận Đống Đa , Hà Nội - (024) 73080880 – Ext: 3300
Thời gian làm việc:
- TP.HCM, Hà Nội và Đà Nẵng: Thứ Hai đến thứ Bảy (8:00 - 17:00)
Lưu ý: cần mang hóa đơn mua hàng khi đến TTBH NPP DGW', N'/Images/IMG_37632111474.JPG', 9, 5, 0, N'/Images/IMG_37612111474.JPG', N'/Images/IMG_37602111474.JPG', N'/Images/IMG_37622111474.JPG', N'/Images/IMG_37592111474.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (10, N'[Voucher ELMALLL100] Máy Tính Xách Tay Huawei Matebook D15 (8GB/256GB) | Màn Hình HUAWEI Fullview', CAST(14500000 AS Decimal(18, 0)), CAST(N'2021-05-31 00:00:00.000' AS DateTime), N'Máy Tính Xách Tay Huawei Matebook D15 (8GB/256GB) | Màn Hình HUAWEI Fullview | HUAWEI Share | Phím Nguồn Kết Hợp Bảo Mật Vân Tay | Camera ẩn | Hàng phân phối chính hãng
Thông số kỹ thuật chi tiết Huawei MateBook D15 R5 3500U 8GB/256GB/Win10 (Boh-WAQ9R)
Bộ xử lý
Công nghệ CPU	AMD Ryzen 5
Loại CPU	3500U
Tốc độ CPU	2.10 GHz
Tốc độ tối đa	3.7 GHz
Bộ nhớ RAM, Ổ cứng
RAM	8 GB
Loại RAM	DDR4 (On board)
Tốc độ Bus RAM	2400 MHz
Hỗ trợ RAM tối đa	Không hỗ trợ nâng cấp
Ổ cứng	SSD 256GB NVMe PCIe
Màn hình
Kích thước màn hình	15.6 inch
Độ phân giải	Full HD (1920 x 1080)
Công nghệ màn hình	Tấm nền IPS
Màn hình cảm ứng	Không
Đồ họa và Âm thanh
Thiết kế card	Card đồ họa tích hợp
Card đồ họa	AMD Radeon Vega 8 Graphics
Công nghệ âm thanh	Dolby Audio
Cổng kết nối & tính năng mở rộng
Cổng giao tiếp	2 x USB 2.0, HDMI, USB 3.0, USB Type-C
Kết nối không dây	Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac
Khe đọc thẻ nhớ	Không
Ổ đĩa quang	Không
Webcam	HD webcam
Tính năng khác	Webcam ẩn, Bảo mật vân tay
Đèn bàn phím	Không
Pin & Adapter
Loại PIN	PIN liền
Model Adapter	HW-200325UPO
Thông tin Pin	Li-Ion 3 cell
Hệ điều hành
Hệ điều hành	Windows 10 Home SL
Kích thước & trọng lượng
Kích thước	Dài 357.8 mm - Rộng 229.9 mm - Dày 16.9 mm
Trọng lượng	1.62 kg
Chất liệu	Vỏ kim loại nguyên khối
Thông tin khác
Thời điểm ra mắt	2020
Thiết kế sang trọng - đẳng cấp 
Huawei MateBook D15 mang đến một thiết kế hoàn mĩ với vỏ kim loại nguyên khối, thân máy mỏng nhẹ tối ưu cho việc di chuyển. Với trọng lượng chỉ 1.62 kg - độ dày 16.9 mm, Huawei MateBook có thể đồng hành cùng bạn bất cứ lúc nào, cũng như bất cứ nơi nào bạn muốn.
Hiệu năng lí tưởng cho công việc văn phòng và giải trí
Huawei MateBook D15 sử dụng con chip AMD Ryzen 5 giúp tăng tốc và tăng cường hiệu suất. 
RAM 8 GB giúp đa nhiệm mượt mà, hạn chế tình trạng giật, lag máy khi mở nhiều tab.
Card đồ họa AMD Radeon Vega 8 Graphics đem đến chất lượng đồ họa tốt hơn, bạn có thể chơi được các tựa game phổ biến hiện nay như LOL, FIFA ở cấu hình trung bình đến cao, Fortnite ở mức cấu hình thấp.
PHỤ KIỆN TRONG HỘP
PC x 1
Bộ đổi nguồn HUAWEI USB-C AC Adapter x 1
Cáp chuyển đổi nguồn (USB-C) x 1
Hướng dẫn bắt đầu nhanh x 1
*Có thể thay đổi trong thị trường khác nhau. Liên hệ với kênh bán hàng địa phương để nhận danh sách chi tiết hơn.
*Đối với điện thoại thông minh, máy tính bảng, laptop, đồng hồ, vòng đeo thông minh, tai nghe freebuds, SoundX: 
Bảo hành 12 tháng 
Đổi máy trong 30 ngày đầu ', N'/Images/12112858.JPG', 8, 5, 0, N'/Images/1.22112858.JPG', N'/Images/1.32112858.JPG', N'/Images/IMG_37512112858.JPG', N'/Images/IMG_37502112858.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (11, N'Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD', CAST(30000000 AS Decimal(18, 0)), CAST(N'2021-05-31 00:00:00.000' AS DateTime), N'Máy tính xách tay mỏng và nhẹ nhất của Apple, nay siêu mạnh mẽ với chip Apple M1. Xử lý công việc giúp bạn với CPU 8 lõi nhanh như chớp. Đưa các ứng dụng và game có đồ họa khủng lên một tầm cao mới với GPU 8 lõi. Đồng thời, tăng tốc các tác vụ máy học với Neural Engine 16 lõi. Tất cả gói gọn trong một thiết kế không quạt, giảm thiểu tiếng ồn, thời lượng pin dài nhất từ trước đến nay lên đến 18 giờ (1) MacBook Air. Vẫn cực kỳ cơ động. Mà mạnh mẽ hơn nhiều.
 
Tính năng nổi bật 
•       Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU 
•       Tăng thời gian sử dụng với thời lượng pin lên đến 18 giờ (1) 
•       CPU 8 lõi cho tốc độ nhanh hơn đến 3.5x, xử lý công việc nhanh chóng hơn bao giờ hết (2)  
•       GPU lên đến 8 lõi với tốc độ xử lý đồ họa nhanh hơn đến 5x cho các ứng dụng và game đồ họa khủng (2)  
•       Neural Engine 16 lõi cho công nghệ máy học hiện đại 
•       Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy  
•       Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc 
•       Thiết kế không quạt giảm tối đa tiếng ồn khi sử dụng  
•       Màn hình Retina 13.3 inch với dải màu rộng P3 cho hình ảnh sống động và chi tiết ấn tượng (3)
•       Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn 
•       Bộ ba micro phối hợp tập trung thu giọng nói của bạn, không thu tạp âm môi trường 
•       Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn 
•       Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện 
•       Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn 
•       macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps 
•       Hiện có màu vàng kim, xám bạc và bạc 
Pháp lý 
Hiện có sẵn các lựa chọn để nâng cấp. 
(1) Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. 
(2) So với thế hệ máy trước. 
(3) Kích thước màn hình tính theo đường chéo. 
Thông tin bảo hành:
Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.
Kích hoạt bảo hành tại: https://checkcoverage.apple.com/vn/en/
Hướng dẫn kiểm tra địa điểm bảo hành gần nhất:
Bước 1: Truy cập vào đường link https://getsupport.apple.com/?caller=grl&locale=en_VN 
Bước 2: Chọn sản phẩm.
Bước 3: Điền Apple ID, nhập mật khẩu.
Sau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.', N'/Images/IMG_37582114305.JPG', 1, 5, 0, N'/Images/IMG_37542114305.JPG', N'/Images/IMG_37532114305.JPG', N'/Images/IMG_37552114305.JPG', N'/Images/IMG_37562114305.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (12, N'Tivi TCL 4K UHD Android 9.0 50 inch 50T65 - Hàng Chính Hãng - Miễn phí lắp đặt', CAST(8200000 AS Decimal(18, 0)), CAST(N'2021-05-22 00:00:00.000' AS DateTime), N' Tivi TCL 4K UHD Android 9.0 50 inch 50T65 - Hàng Chính Hãng - Miễn phí lắp đặt
Mang thế giới giải trí hàng tỷ sắc màu đến với cuộc sống. 
4K HDR tăng khả năng làm phong phú màu sắc, trải rộng từ điểm tối nhất đến điểm sáng nhất tạo chi tiết màu sắc của từng điểm ảnh.
Gam màu rộng được phát triển độc quyền bởi TCL.
Thuật toán TCL độc quyền tối ưu hóa nội dung theo thời gian thực - nâng cấp nội dung FHD và 2K cho độ phân giải 4K. 
Smart TV của bạn được tích hợp sẵn hệ điều hành phổ biến nhất thế giới, mở ra thế giới phim ảnh, âm nhạc, trò chơi và nhiều thứ khác theo yêu cầu của bạn. 
THÔNG SỐ KỸ THUẬT 
Kích thước màn hình: 50 inch 
 m thanh: Dolby MS12D/Y (Dolby Audio)
Tổng công suất loa: 9.5W+9.5W
Hệ điều hành: Android 9.0
Kết nối bàn phím, chuột: Có 
Kết nối không dây: Bluetooth, Wifi
Cổng HDMI: 3 
Wifi: Có 
Hình ảnh: UHD 4K (3840 x 2160)
Tương tác thông minh: Có remote thông minh, tích hợp micro tìm kiếm giọng nói bằng Tiếng Việt
THÔNG TIN BẢO HÀNH
Bảo hành chính hãng 36 tháng
Chi tiết xem tại: https://www.tcl.com/vn/vi/services.html
Hotline:  1800-588-880 (xử lý trong vòng 24 giờ - miễn cước phí)
Công lắp đặt: 
Miễn phí cho nội thành HN (12 quận: Quận Ba Đình, Quận Bắc Từ Liêm, Quận Cầu Giấy, Quận Hà Đông, Quận Hai Bà Trưng, Quận Hoàn Kiếm, Quận Hoàng Mai, Quận Long Biên, Quận Nam Từ Liêm, Quận Tây Hồ, Quận Thanh Xuân, Quận Đống Đa) và nội thành HCM (Trừ Nhà Bè, Bình Chánh, Cần Giờ, Củ Chi).
Chi phí vật tư: Nhân viên sẽ thông báo phí vật tư (ống đồng, dây điện v.v...) khi khảo sát lắp đặt (Bảng kê xem tại ảnh 2). Khách hàng sẽ thanh toán trực tiếp cho nhân viên kỹ thuật sau khi việc lắp đặt hoàn thành - chi phí này sẽ không hoàn lại trong bất cứ trường hợp nào.
Thời gian liên hệ lắp đặt: 24h kể từ khi nhận hàng (Trừ Chủ nhật/ Ngày Lễ).
Quy định đổi trả: Chỉ đổi/trả sản phẩm, từ chối nhận hàng tại thời điểm nhận hàng trong trường hợp sản phẩm giao đến không còn nguyên vẹn, thiếu phụ kiện hoặc nhận được sai hàng. Khi sản phẩm đã được cắm điện sử dụng và/hoặc lắp đặt, và gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo hành theo đúng chính sách của nhà sản xuất
Quý khách hàng có thể trì hoãn việc lắp đặt tối đa là 7 ngày lịch kể từ ngày giao hàng thành công (không tính ngày Lễ). Nếu nhân viên hỗ trợ không thể liên hệ được với Khách hàng quá 3 lần, hoặc Khách hàng trì hoãn việc lắp đặt quá thời hạn trên, Dịch vụ lắp đặt sẽ được hủy bỏ.
Đơn vị vận chuyển giao hàng cho bạn KHÔNG có nghiệp vụ lắp đặt sản phẩm. Đơn vị lắp đặt sẽ liên hệ bạn trong vòng 24h khi bạn nhận hàng!
Khi sản phẩm đã được cắm điện sử dụng và/hoặc lắp đặt, và gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo hành theo đúng chính sách của nhà sản xuất.', N'/Images/IMG_38082116168.JPG', 11, 4, 0, N'/Images/IMG_38122116168.JPG', N'/Images/IMG_3818 00.15.122116168.JPG', N'/Images/IMG_38082116168.JPG', N'/Images/IMG_38082116168.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (13, N'Smart Tivi 4K UHD Samsung 55 inch UA55TU8100KXXV - Miễn phí lắp đặt', CAST(11900000 AS Decimal(18, 0)), CAST(N'2021-06-06 00:00:00.000' AS DateTime), N'1. Thông số kỹ thuật: 
- Hiển thị 
+ Kích thước màn hình: 55 inch
+ Độ phân giải: 4K Ultra HD (3840 x 2160px)
- Video: 
+ Crystal Processor 4K
+ HDR 10+        
+ UHD Dimming
+ Nâng cấp tương phản 
+ Hỗ trợ Chế độ Tự nhiên
- Kết nối:         
+ HDMI: 3 
+ USB: 2 
+ Wireless LAN Tích hợp        
+ Bluetooth 
- Smart Service
+ Smart Tivi
+ Hệ điều hành Tizen™
+ Tương tác giọng nói: VN, IN : Vietnamese
+ Trợ lý ảo: Google Assistant 
+ Trình duyệt web 
- Phụ kiện: 
+ Chân đế 
+ Remote 
+ Dây nguồn 
2. Mô tả chi tiết: 
- Thiết kế không viền 3 cạnh đem đến trải nghiệm xem tuyệt vời 
- Dải màu sắc sống động: Màn hình Dynamic Crystal Display giúp tối ưu màu sắc hiển thị 
- Màu sắc chân thực tuyệt đối: Công nghệ đèn nền Dual LED tự động điều chỉnh tông màu theo nội dung hiển thị
- Chất lượng hình ảnh chân thức với độ phân giải UHD 4K
- Điều khiển tivi thông minh bằng điện thoại qua ứng dụng SmartThings. 
- Dễ dàng điều khiển với trợ lý ảo Google 
- Kết nối cùng AirPlay2 
3. Thông tin bảo hành: 
- Thông tin bảo hành Smart Tivi 4K UHD Samsung 55 inch UA55TU8100KXXV
- Bộ sản phẩm bao gồm:  Tivi, Chân đế, Adapter, Remote
- Bảo hành 24 tháng.
- Trung tâm bảo hành:  https://www.samsung.com/vn/support/service-center/
- Hotline:  1800-588-855
4. Công lắp đặt: 
- Miễn phí cho nội thành HN (12 quận: Quận Ba Đình, Quận Bắc Từ Liêm, Quận Cầu Giấy, Quận Hà Đông, Quận Hai Bà Trưng, Quận Hoàn Kiếm, Quận Hoàng Mai, Quận Long Biên, Quận Nam Từ Liêm, Quận Tây Hồ, Quận Thanh Xuân, Quận Đống Đa) và nội thành HCM (Trừ Nhà Bè, Bình Chánh, Cần Giờ, Củ Chi).
- Chi phí vật tư: Nhân viên sẽ thông báo phí vật tư (ống đồng, dây điện v.v...) khi khảo sát lắp đặt (Bảng kê xem tại ảnh 2). Khách hàng sẽ thanh toán trực tiếp cho nhân viên kỹ thuật sau khi việc lắp đặt hoàn thành - chi phí này sẽ không hoàn lại trong bất cứ trường hợp nào.
- Thời gian liên hệ lắp đặt: 24h kể từ khi nhận hàng (Trừ Chủ nhật/ Ngày Lễ).
- Quy định đổi trả: Chỉ đổi/trả sản phẩm, từ chối nhận hàng tại thời điểm nhận hàng trong trường hợp sản phẩm giao đến không còn nguyên vẹn, thiếu phụ kiện hoặc nhận được sai hàng. Khi sản phẩm đã được cắm điện sử dụng và/hoặc lắp đặt, và gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo hành theo đúng chính sách của nhà sản xuất
- Quý khách hàng có thể trì hoãn việc lắp đặt tối đa là 7 ngày lịch kể từ ngày giao hàng thành công (không tính ngày Lễ). Nếu nhân viên hỗ trợ không thể liên hệ được với Khách hàng quá 3 lần, hoặc Khách hàng trì hoãn việc lắp đặt quá thời hạn trên, Dịch vụ lắp đặt sẽ được hủy bỏ.
- Đơn vị vận chuyển giao hàng cho bạn KHÔNG có nghiệp vụ lắp đặt sản phẩm. Đơn vị lắp đặt sẽ liên hệ bạn trong vòng 24h khi bạn nhận hàng!
- Khi sản phẩm đã được cắm điện sử dụng và/hoặc lắp đặt, và gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo hành theo đúng chính sách của nhà sản xuất
#Samsung    #55TU8300   #SmartTV   #49inch   #4K #SmartTivi #Manhinhcong', N'/Images/IMG_38092117347.JPG', 12, 4, 0, N'/Images/IMG_38102117347.JPG', N'/Images/IMG_38112117347.JPG', N'/Images/IMG_38132117347.JPG', N'/Images/IMG_38142117347.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (14, N'Tivi LG 49 inch 49UK7500PTA - Hàng chính hãng', CAST(17000000 AS Decimal(18, 0)), CAST(N'2021-05-31 00:00:00.000' AS DateTime), N'MÔ TẢ SẢN PHẨM
✅ Thiết kế tinh tế, hoàn hảo
✅ Màu sắc tuyệt đẹp hình ảnh ổn định với mọi gốc nhìn
✅ Chất lượng hình ảnh được nâng lên 4K
✅ Ảnh thật như cuộc sống với 4K Active HDR
✅ DTS Virtual:X mang đến âm thanh nhiều chiều hơn
✅ Giao diện LG WebOS dễ tìm kiếm, nhận dạng
✅ Thao tác tìm kiếm bằng giọng nói tiện lợi
✅ Kết nối đa dạng với nhiều cổng HDMI, USB...
✅ Kích thước có chân: 24.9 x 110 x 71.7 cm - Nặng 14.5 kg
✅ Nơi sản xuất: Indonesia - Bảo hành 24 tháng
LƯU Ý KHI MUA HÀNG: Cảm ơn quý khách đã quan tâm đến sản phẩm bên shop, quý khách vui lòng dành ít thời gian đọc kĩ chính sách bảo hành đổi trả:
Giao hàng và lắp đặt:
✔️ Miễn phí công lắp đặt khu vực Bến Tre.
✔️ Chi phí vật tư: Giá sản phẩm bao gồm công lắp đặt nhưng KHÔNG BAO GỒM vật tư lắp đặt, chi phí phát sinh (nếu có). Nhân viên lắp đặt sẽ thông báo chi phí vật tư phát sinh sau khi khảo sát thật tế. Khách hàng thanh toán phần chi phí vật tư phát sinh khi nhân viên lắp đặt hoàn thành và phần chi phí này sẽ không hoàn lại trong bất cứ trường hợp nào.
✔️ Giao hàng: Đơn vị giao hàng hoàn toàn độc lập và KHÔNG CÓ NGHIỆP VỤ lắp đặt. Đơn vị lắp đặt sẻ liên hệ với bạn trong vòng 24 giờ kể từ khi bạn nhận được hàng.
✔️Sản phẩm được lắp đặt trong 24-48H kể từ ngày khách nhận hàng, quý khách chỉ có thể trì hoãn việc lắp đặt trong 7 ngày kể từ ngày giao (sau 7 ngày quý khách không có yêu cầu lắp đặt, mặc định sản phẩm sẽ bị hủy dịch vụ lắp đặt và quý khách tự lắp đặt tại nhà).
Bảo hành -  đổi trả
✔️Sản phẩm được bảo hành chính hãng theo quy định nhà sản xuất, shop không trực tiếp bảo hành sản phẩm chỉ nhận hỗ trợ liên hệ trung tâm bảo hành ủy quyền của của hãng.
✔️Chỉ áp dụng đổi trả khi shop giao sai mã hàng, sai màu sắc, thiếu phụ kiện hoặc sản phẩm giao tới khách hàng không còn nguyên vẹn.
✔️Giá bao gồm giá sản phẩm không kèm theo khuyến mại, hoặc kết hợp chương trình giảm giá khác của shop tại cửa hàng.
❌ KHÔNG NHẬN ĐỔI TRẢ sau khi sản phẩm đã được cắm điện sử dụng hoặc lắp đặt.
❌ Vì lượng hàng hoá nhiều shop không nhận đổi trả trong trường hợp khách không thích, không ưng màu, chất liệu; quý khách vui lòng đọc kĩ mô tả và xem hình ảnh cụ thể; nếu cần hãy chat với shop để được tư vấn.', N'/Images/IMG_38152119497.JPG', 10, 4, 0, N'/Images/IMG_38162119497.JPG', N'/Images/IMG_38172119497.JPG', N'/Images/IMG_38192119497.JPG', N'/Images/IMG_38202119497.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (15, N'Smart OLED Tivi LG OLED55GX 55 inch 4K - Model 2020 - Miễn phí lắp đặt', CAST(17000000 AS Decimal(18, 0)), CAST(N'2021-05-31 00:00:00.000' AS DateTime), NULL, N'/Images/IMG_37952121399.JPG', 10, 4, 0, N'/Images/IMG_37962121399.JPG', N'/Images/IMG_37972121399.JPG', N'/Images/IMG_37982121399.JPG', N'/Images/IMG_38072121399.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (16, N'Smart OLED Tivi LG OLED55GX 55 inch 4K - Model 2020 - Miễn phí lắp đặt', CAST(50000000 AS Decimal(18, 0)), NULL, N'TV với một bước tiến mới
Biến đổi TV của bạn thành một trung tâm với ThinQ AI thông minh. LG ThinQ cho phép ra lệnh đơn giản và điều khiển hệ sinh thái Home IoT của bạn bằng nhận dạng giọng nói tự nhiên, không cần điều khiển từ xa. Ngoài ra, với Trợ lý Google và Amazon Alexa tích hợp, LG OLED TV giúp cuộc sống thuận tiện hơn rất nhiều.
Thưởng thức hình ảnh và âm thanh chuyên nghiệp
Xem phim theo đúng cách cần xem - thật tuyệt vời. Với Dolby Vision IQ, độ sáng màn hình, màu sắc và độ tương phản được điều chỉnh thông minh cho thể loại nội dung và điều kiện ánh sáng. Dolby Atmos mang đến trải nghiệm âm thanh sống động, giúp thưởng thức tối đa mọi nội dung.
Xem theo cách phim được chiếu trong rạp
Bộ xử lý sẽ tự động điều chỉnh hình ảnh, tắt chế độ làm mịn chuyển động để có hiệu ứng hình ảnh chuyển động đầy đủ. 
Mang đến toàn bộ giải trí cho bạn
Đắm chìm vào nhiều nội dung có sẵn trên ứng dụng Apple TV, Netflix . Từ những bộ phim, chương trình truyền hình và phim tài liệu mới nhất, đến thể thao trực tiếp và nhiều nội dung khác
Trang chủ Apple TV+ và nhiều nội dung khác
Các chương trình và phim gốc từ Apple TV+. Các kênh cao cấp bạn muốn xem và hàng nghìn bộ phim để mua hoặc thuê. Trải nghiệm cá nhân hóa và được quản lý một cách thành thạo, vì vậy bạn sẽ khám phá ra những nội dung mới hay nhất. Và tất cả có trong ứng dụng Apple TV.
Trải nghiệm mọi trò chơi ở tiêu chuẩn cao hơn
Là TV đầu tiên trên thị trường hỗ trợ Tương thích NVIDIA G-SYNC, LG OLED là lựa chọn tối ưu cho thiết lập chơi game của bạn. Tất cả các trò chơi trên PC của bạn sẽ rõ ràng và mượt mà hơn, ít bị giật, trễ và nháy hình.
Chơi game mượt mà hơn để giành chiến thắng
Tốc độ khung hình cao hơn, VRR (Variable Refresh Rate - Tốc độ làm mới biến đổi), ALLM (Auto Low Latency Mode - Chế độ Độ trễ thấp Tự động) và eARC (Enhanced Audio Return Channel - Kênh Phản hồi Âm thanh Nâng cao) tất cả đều đáp ứng thông số kỹ thuật HDMI 2.1. Các tính năng mới nhất này cho phép nội dung chuyển động nhanh ở độ phân giải cao hơn và đồ họa mượt mà, đồng bộ.
Không bị trễ trong cuộc đua
Tấn công giành chiến thắng với LG OLED TV. Với thời gian phản hồi nhanh 1ms, hãy sẵn sàng chơi toàn lực với độ mờ thấp hơn và độ rõ nét cao hơn. Cảm giác hòa mình thực sự trong trò chơi với chuyển động và chơi game tốc độ cao.
Chơi game HDR tràn ngập hơn
HGiG mang đến đồ họa chơi game phù hợp nhất với thông số kỹ thuật TV và mức hiệu suất đã xác định trên TV của bạn. Với LG OLED, chơi từ bộ sưu tập trò chơi lớn với sự tự tin vào TV sẽ hiển thị mọi trò chơi ở chất lượng tốt nhất.
Thông số kỹ thuật
THÔNG SỐ TẤM NỀN
Loại màn hình hiển thị	4K OLED
Kích thước (inch)	55
Độ phân giải	3840 x 2160
Góc xem rộng	Có (Perfect Viewing Angle)
Dải màu rộng	Perfect Color
Tỷ màu sắc	Có
Màu đen tuyệt đối	Có
Dimming	Pixel Dimming
Tăng cường sáng Ultra Luminance: Ultra Luminance Pro
Tần số quét TruMotion: Refresh Rate 100Hz
KẾT NỐI
HDMI: 4 (HDMI 2.1)
USB:  3
LAN	CóCổng kết nối tai nghe	Có
IR Blaster	Có
Wifi	Có (802.11ac)
Bluetooth	Có (V5.0)
KÍCH THƯỚC & TRỌNG LƯỢNG
Kích thước mm (không có chân đế) (R x C x S): 1225 x 706 x 23.1
Kích thước mm (có chân đế) (R x C x S): 1225 x 765 x 271
Trọng lượng kg (không có chân đế): 21.8
Trọng lượng kg (có chân đế): 22.5
Thông tin bảo hành
Hạn sử dụng: 12 tháng
Thông tin chi tiết xem thêm tại: https://www.lg.com/vn/tro-giup/bao-hanh
***Công lắp đặt:
Miễn phí cho nội thành HN (12 quận: Quận Ba Đình, Quận Bắc Từ Liêm, Quận Cầu Giấy, Quận Hà Đông, Quận Hai Bà Trưng, Quận Hoàn Kiếm, Quận Hoàng Mai, Quận Long Biên, Quận Nam Từ Liêm, Quận Tây Hồ, Quận Thanh Xuân, Quận Đống Đa) và nội thành HCM (Trừ Nhà Bè, Bình Chánh, Cần Giờ, Củ Chi).
- Chi phí vật tư: Nhân viên sẽ thông báo phí vật tư (ống đồng, dây điện v.v...) khi khảo sát lắp đặt (Bảng kê xem tại ảnh 2). Khách hàng sẽ thanh toán trực tiếp cho nhân viên kỹ thuật sau khi việc lắp đặt hoàn thành - chi phí này sẽ không hoàn lại trong bất cứ trường hợp nào.
- Thời gian liên hệ lắp đặt: 24h kể từ khi nhận hàng (Trừ Chủ nhật/ Ngày Lễ).
- Quy định đổi trả: Chỉ đổi/trả sản phẩm, từ chối nhận hàng tại thời điểm nhận hàng trong trường hợp sản phẩm giao đến không còn nguyên vẹn, thiếu phụ kiện hoặc nhận được sai hàng. Khi sản phẩm đã được cắm điện sử dụng và/hoặc lắp đặt, và gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo hành theo đúng chính sách của nhà sản xuất
- Quý khách hàng có thể trì hoãn việc lắp đặt tối đa là 7 ngày lịch kể từ ngày giao hàng thành công (không tính ngày Lễ). Nếu nhân viên hỗ trợ không thể liên hệ được với Khách hàng quá 3 lần, hoặc Khách hàng trì hoãn việc lắp đặt quá thời hạn trên, Dịch vụ lắp đặt sẽ được hủy bỏ.
- Đơn vị vận chuyển giao hàng cho bạn KHÔNG có nghiệp vụ lắp đặt sản phẩm. Đơn vị lắp đặt sẽ liên hệ bạn trong vòng 24h khi bạn nhận hàng!
- Khi sản phẩm đã được cắm điện sử dụng và/hoặc lắp đặt, và gặp lỗi kĩ thuật, sản phẩm sẽ được hưởng chế độ bảo hành theo đúng chính sách của nhà sản xuất', N'/Images/IMG_37892122927.JPG', 10, 4, 0, N'/Images/h32122927.JPG', N'/Images/h42122927.JPG', N'/Images/ha22122927.JPG', N'/Images/hinh52122927.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (17, N'Sản phẩm mới', CAST(1500 AS Decimal(18, 0)), CAST(N'2021-06-08 00:00:00.000' AS DateTime), N'Laptop Mới', N'/Images/IMG_37502127219.JPG', 8, 5, 0, N'/Images/1.22127219.JPG', N'/Images/12127219.JPG', N'/Images/IMG_37482127219.JPG', N'/Images/IMG_37512127219.JPG', 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (18, N'San pham Mới 123', CAST(1500000 AS Decimal(18, 0)), CAST(N'2021-06-08 00:00:00.000' AS DateTime), N'abcdcd', N'/Images/IMG_37642105325.JPG', 9, 3, 0, N'/Images/IMG_37652105325.JPG', N'/Images/IMG_37662105325.JPG', N'/Images/IMG_37642105325.JPG', N'/Images/IMG_37672105325.JPG', 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (19, N'Sản phẩm mới tạo', CAST(5000000 AS Decimal(18, 0)), CAST(N'2021-06-08 00:00:00.000' AS DateTime), N'Sản phẩm hơi lỗi :v', N'/Images/IMG_37572141812.JPG', 4, 5, 0, N'/Images/IMG_37532141812.JPG', N'/Images/IMG_37542141812.JPG', N'/Images/IMG_37552141812.JPG', N'/Images/IMG_37562141812.JPG', 20, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (20, N'Sản Phẩm ABC', CAST(65000000 AS Decimal(18, 0)), CAST(N'2021-06-08 00:00:00.000' AS DateTime), N'TV nè', N'/Images/IMG_38172101832.JPG', 10, 4, 0, N'/Images/IMG_38152101832.JPG', N'/Images/IMG_38162101832.JPG', N'/Images/IMG_38202101832.JPG', N'/Images/IMG_38192101832.JPG', 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (21, N'TV mới', CAST(50000000 AS Decimal(18, 0)), CAST(N'2021-06-08 00:00:00.000' AS DateTime), N'TV Mới Nè', N'/Images/IMG_38202113631.JPG', 10, 4, 0, N'/Images/IMG_38162113631.JPG', N'/Images/IMG_38172113631.JPG', N'/Images/IMG_38192113631.JPG', N'/Images/IMG_38202113631.JPG', 20, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (22, N'Sản phẩm Mới nhất 10', CAST(150000 AS Decimal(18, 0)), CAST(N'2021-06-08 00:00:00.000' AS DateTime), N':v sản phẩm mới', N'/Images/2874960712130043.jpeg', 12, 2, 0, N'/Images/12758729332130043.jpeg', N'/Images/13855749622130043.jpeg', N'/Images/180649606022130043.jpeg', N'/Images/2874960712130043.jpeg', 15, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [Mota], [HinhAnh], [MaNSX], [MaLoaiSP], [DaXoa], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuong], [Tinhtrang]) VALUES (23, N'Đồng hồ SamSung', CAST(150000 AS Decimal(18, 0)), CAST(N'2021-06-16 00:00:00.000' AS DateTime), N'adasdasdasd', N'/Images/12758729332159607.jpeg', 12, 2, 1, N'/Images/12758729332159607.jpeg', N'/Images/2874960712159607.jpeg', N'/Images/13855749622159607.jpeg', N'/Images/180649606022159607.jpeg', 123, 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (1, N'member', N'TPHCM', N'member@gmail.com', N'0563062922', NULL, NULL, N'member', NULL, 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (2, N'admin', NULL, N'admin@gmail.com', NULL, NULL, NULL, N'admin', N'~/Images/person.png', 2)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (13, N'adminqlsp', NULL, N'adminqlsp@gmail.com', NULL, NULL, NULL, N'adminqlsp', N'~/Images/person.png', 3)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (23, N'adminqlquyen', NULL, N'adminqlquyen@gmail.com', NULL, NULL, NULL, N'adminqlquyen', NULL, 4)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (24, N'adminqldonhang', NULL, N'adminqldh@gmail.com', NULL, NULL, NULL, N'adminqldh', NULL, 5)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (31, N'Hiếu Vũ Minh', N'TPHCM', N'hieuvm68@gmail.com', N'056306292', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (32, N'Hiếu Vũ Minh', N'THPCH', N'hieuvm69@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (33, N'Hiếu Vũ Minh', N'THPHCM', N'hieuvm70@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (34, N'Hiếu Vũ Minh', N'TPHCM', N'hieuvm71@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (35, N'Hiếu Vũ Minh', N'TPHCM', N'hieuvm72@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (36, N'Hiếu Vũ Minh', N'TPHCM', N'hieuvm73@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (37, N'Hiếu Vũ Minh', N'TPHCM', N'hieuvm74@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (38, N'Hiếu Vũ Minh', N'ABC', N'hieuvm75@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (39, N'Hiếu Vũ Minh', N'TPHCM', N'hieuvm76@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'192607013_148186700665001_8952440903074172974_n.jpg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (40, N'Hiếu Vũ Minh', N'TPHCM', N'hieuvm78@gmail.com', N'0563062922', NULL, N'HVM', N'vuminhhieu2000', N'1275872933.jpeg', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (41, NULL, NULL, N'hieuvm80@gmail.com', NULL, NULL, NULL, N'vuminhhieu2000', NULL, 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [DiaChi], [Email], [SDT], [Gioitinh], [Username], [Password], [ImageUser], [MaLoaiTK]) VALUES (42, NULL, NULL, N'hieuvm8@gmail.com', NULL, NULL, NULL, N'vuminhhieu2000', NULL, 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[TinhtrangDH] ON 

INSERT [dbo].[TinhtrangDH] ([MaLoaiTT], [TenTT]) VALUES (1, N'Đang Chờ Xác Nhân')
INSERT [dbo].[TinhtrangDH] ([MaLoaiTT], [TenTT]) VALUES (2, N'Đã Duyệt')
SET IDENTITY_INSERT [dbo].[TinhtrangDH] OFF
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_KhachHang] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_KhachHang]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_SanPham]
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_DDH] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CT_DonHang] CHECK CONSTRAINT [FK_CTDH_DDH]
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_DDH1] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonHang] ([MaDDH])
GO
ALTER TABLE [dbo].[CT_DonHang] CHECK CONSTRAINT [FK_CTDH_DDH1]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TinhtrangDH] FOREIGN KEY([MaLoaiTT])
REFERENCES [dbo].[TinhtrangDH] ([MaLoaiTT])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TinhtrangDH]
GO
ALTER TABLE [dbo].[LoaiQuyenTK]  WITH CHECK ADD  CONSTRAINT [fk_loaiquyen_KH] FOREIGN KEY([MaLoaiTK])
REFERENCES [dbo].[LoaiTK] ([MaLoaiTK])
GO
ALTER TABLE [dbo].[LoaiQuyenTK] CHECK CONSTRAINT [fk_loaiquyen_KH]
GO
ALTER TABLE [dbo].[LoaiQuyenTK]  WITH CHECK ADD  CONSTRAINT [fk_loaiquyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[LoaiQuyenTK] CHECK CONSTRAINT [fk_loaiquyen_Quyen]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FL_SanPham_LoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FL_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FL_SanPham_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FL_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_LoaiKH] FOREIGN KEY([MaLoaiTK])
REFERENCES [dbo].[LoaiTK] ([MaLoaiTK])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_KhachHang_LoaiKH]
GO
USE [master]
GO
ALTER DATABASE [BHDT2] SET  READ_WRITE 
GO
