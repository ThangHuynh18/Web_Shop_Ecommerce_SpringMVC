USE [WEBBANPHUKIEN]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 01/08/2021 14:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (1, N'Sạc')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (2, N'Loa')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (3, N'Ốp lưng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (4, N'Pin dự phòng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (5, N'Tai nghe')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
/****** Object:  Table [dbo].[KhachHang]    Script Date: 01/08/2021 14:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[PhanQuyen] [nvarchar](10) NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nchar](20) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [PhanQuyen], [Ho], [Ten], [Email], [SDT]) VALUES (1, N'admin', N'admin', N'admin', N'Huynh', N'Thang', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [PhanQuyen], [Ho], [Ten], [Email], [SDT]) VALUES (2, N'user', N'123', N'user', N'Thang', N'Minh', N'huynhminhthang11223354@gmail.com', N'018111999           ')
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [PhanQuyen], [Ho], [Ten], [Email], [SDT]) VALUES (1015, N'user123', N'123', N'user', N'huynh', N'van', N'xyz@gmail.com', N'6546464             ')
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [PhanQuyen], [Ho], [Ten], [Email], [SDT]) VALUES (1016, N'tan', N'123', N'user', N'vo', N'tan', N'abc@gmail.com', N'42341241            ')
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [PhanQuyen], [Ho], [Ten], [Email], [SDT]) VALUES (1017, N'tm', N'123', N'user', N'thang', N'minh', N'minhthang1858@gmail.com', N'745345435435        ')
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [PhanQuyen], [Ho], [Ten], [Email], [SDT]) VALUES (1018, N'th', N'123', N'user', N'thang', N'huynh', N'conga7559@gmail.com', N'2456788             ')
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [PhanQuyen], [Ho], [Ten], [Email], [SDT]) VALUES (1021, N'nv6', N'123', N'user', N'lam', N'thien', N'conga7559@gmail.com', N'4353453             ')
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [PhanQuyen], [Ho], [Ten], [Email], [SDT]) VALUES (1026, N'test', N'123', N'user', N'thang', N'minh', N'huynhminhthang11223354@gmail.com', N'32131432432         ')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
/****** Object:  Table [dbo].[HoaDon]    Script Date: 01/08/2021 14:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [date] NULL,
	[TrangThai] [nvarchar](10) NULL,
	[SoTien] [int] NULL,
	[MaKH] [int] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2023, CAST(0xFA410B00 AS Date), N'2', 1940000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2024, CAST(0xFB410B00 AS Date), N'2', 13610000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2025, CAST(0xFB410B00 AS Date), N'2', 23560000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2026, CAST(0xFD410B00 AS Date), N'2', 7420000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2027, CAST(0xFD410B00 AS Date), N'3', 109420000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2028, CAST(0xFD410B00 AS Date), N'3', 36692998, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2029, CAST(0xFD410B00 AS Date), N'5', 0, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2030, CAST(0xFE410B00 AS Date), N'4', 20018000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2031, CAST(0xFF410B00 AS Date), N'3', 750000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2032, CAST(0xFF410B00 AS Date), N'4', 750000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2034, CAST(0xFF410B00 AS Date), N'4', 14190000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2035, CAST(0xFF410B00 AS Date), N'5', 3350000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2036, CAST(0xFF410B00 AS Date), N'5', 2500000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2037, CAST(0xFF410B00 AS Date), N'4', 4320000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2038, CAST(0xFF410B00 AS Date), N'3', 12000000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2039, CAST(0xFF410B00 AS Date), N'3', 30890000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2040, CAST(0x01420B00 AS Date), N'1', 45230000, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2041, CAST(0x01420B00 AS Date), N'0', 0, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2042, CAST(0x01420B00 AS Date), N'3', 2650000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2043, CAST(0x02420B00 AS Date), N'5', 6938000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2044, CAST(0x02420B00 AS Date), N'3', 15970000, 1021)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2045, CAST(0x03420B00 AS Date), N'5', 4390000, 1026)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2046, CAST(0x03420B00 AS Date), N'3', 1954000, 1026)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2047, CAST(0x03420B00 AS Date), N'3', 1950000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2048, CAST(0x03420B00 AS Date), N'3', 6800000, 1018)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [TrangThai], [SoTien], [MaKH]) VALUES (2049, CAST(0x03420B00 AS Date), N'1', 3590000, 1021)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
/****** Object:  Table [dbo].[Brands]    Script Date: 01/08/2021 14:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[idBrand] [int] NOT NULL,
	[tenBrand] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[idBrand] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Brands] ([idBrand], [tenBrand]) VALUES (1, N'APPLE')
INSERT [dbo].[Brands] ([idBrand], [tenBrand]) VALUES (2, N'SAMSUNG')
INSERT [dbo].[Brands] ([idBrand], [tenBrand]) VALUES (3, N'XIAOMI')
INSERT [dbo].[Brands] ([idBrand], [tenBrand]) VALUES (4, N'SONY')
INSERT [dbo].[Brands] ([idBrand], [tenBrand]) VALUES (5, N'JBL')
INSERT [dbo].[Brands] ([idBrand], [tenBrand]) VALUES (6, N'OTHER')
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/08/2021 14:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[MoTaSP] [nvarchar](1000) NULL,
	[GiaSP] [int] NOT NULL,
	[AnhSP] [nvarchar](200) NULL,
	[NgayTaoSP] [date] NULL,
	[SoLuongSP] [int] NULL,
	[MaLoaiSP] [int] NOT NULL,
	[HangSX] [nvarchar](50) NULL,
	[idBrand] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1, N'Sạc Xiaomi ZMI 2 cổng USB Type-C 30W HA722 + Cáp C to C 1m', N'Sạc Xiaomi ZMI 2 cổng USB Type-C 30W HA722 + Cáp C to C 1m - lựa chọn tuyệt vời cho người sở hữu nhiều thiết bị di động', 750000, N'files/capsac1.jpg', CAST(0x4B3F0B00 AS Date), 2, 1, N'Xiaomi', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (2, N'Sạc AUKEY 18W 1 cổng USB Quick Charge 3.0 PA-T17 kèm cáp USB-C', N'Sạc AUKEY PA - T17 Amp Wall Charger Quick Charge 3.0 có kích thước nhỏ gọn, dễ mang theo, sạc pin nhanh chóng', 1190000, N'files/cs2.jpg', CAST(0xC33F0B00 AS Date), 10, 1, N'Aukey', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (3, N'Sạc nhanh Apple iPhone 20W Type-C PD MHJE3ZA Chính hãng', N'Dung lượng pin cao, sản phẩm còn sở hữu khả năng sạc nhanh', 390000, N'files/cs5.jpg', CAST(0xC33F0B00 AS Date), 10, 1, N'Apple', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (4, N'Sạc Energizer 30W 2 cổng USB-C Power Delivery + USB-A kèm cáp USB-C', N'Dung lượng pin cao, sản phẩm còn sở hữu khả năng sạc nhanh', 1450000, N'files/cs4.jpg', CAST(0xC33F0B00 AS Date), 10, 1, N'Energizer', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (6, N'Sạc nhanh Iphone chuẩn PowerDelivery 1 cổng Apple', N'Dung lượng pin cao, sản phẩm còn sở hữu khả năng sạc nhanh', 1650000, N'files/cs6.jpg', CAST(0xC33F0B00 AS Date), 10, 1, N'Apple', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (7, N'Combo cáp sạc nhanh siêu tốc Iphone Energizer', N'Dung lượng pin cao, sản phẩm còn sở hữu khả năng sạc nhanh', 1750000, N'files/cs7.jpg', CAST(0xC33F0B00 AS Date), 10, 1, N'Energizer', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (8, N'Sạc 3 Cổng 42W Aukey PA-T14 (1 cổng QC3.0 + 2 Cổng AI Power)', N'Dung lượng pin cao, sản phẩm còn sở hữu khả năng sạc nhanh', 1650000, N'files/cs8.jpg', CAST(0xC33F0B00 AS Date), 5, 1, N'Aukey', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (9, N'Cáp sạc Anker Powerline III A8853 USB-C to USB-C 1.8m', N'Dung lượng pin cao, sản phẩm còn sở hữu khả năng sạc nhanh', 1954000, N'files/cs9.jpg', CAST(0xC33F0B00 AS Date), 3, 1, N'Anker', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (10, N'Loa Bluetooth JBL Pulse Tím mộng mơ đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 7660000, N'files/loa.jpg', CAST(0xC33F0B00 AS Date), 8, 2, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (11, N'Loa di động JBL Pulse 26363  đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 6770000, N'files/loa4.jpg', CAST(0xC33F0B00 AS Date), 8, 2, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (12, N'Loa Bluetooth JBL Flip 4588585  đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 4920000, N'files/loa5.jpg', CAST(0xC33F0B00 AS Date), 5, 2, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (13, N'Loa Bluetooth JBL Wind 1654548  đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 4320000, N'files/loa6.jpg', CAST(0x7A400B00 AS Date), 10, 2, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (14, N'Loa Bluetooth JBL Boombox 0215  đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 16270000, N'files/loa8.jpg', CAST(0x7A400B00 AS Date), 5, 2, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (15, N'Loa Bluetooth JBL CLIP 3 056184  đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 22170000, N'files/loa7.jpg', CAST(0x7A400B00 AS Date), 5, 2, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (16, N'Loa Bluetooth JBL GO 2 02048484  đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 2179000, N'files/loa9.jpg', CAST(0x7A400B00 AS Date), 7, 2, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (17, N'Loa Bluetooth X Mini Click 01504  đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 2799000, N'files/loa11.jpg', CAST(0x7A400B00 AS Date), 8, 2, N'CLICK', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (19, N'Loa Bluetooth X-mini Soundbar 23  đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 4890000, N'files/loa12.jpg', CAST(0x7A400B00 AS Date), 8, 2, N'SOUNDBAR', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (20, N'Loa Bluetooth Anker Soundcore A3106 đẹp - độc - lạ', N'Loa bluetooth cho những bữa tiệc ngoài trời', 1890000, N'files/loa10.jpg', CAST(0x7A400B00 AS Date), 5, 2, N'Anker', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (21, N'Loa Bluetooth Sony SRS-XB41 Extra Bass đẹp - độc - lạ chính hãng', N'Loa bluetooth cho những bữa tiệc ngoài trời', 2650000, N'files/loa3.jpg', CAST(0x7A400B00 AS Date), 6, 2, N'Sony', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (22, N'Loa Bluetooth Sony Extra Bass SRS-XB32 đẹp - độc - lạ chính hãng', N'Loa bluetooth cho những bữa tiệc ngoài trời', 4500000, N'files/loa2.jpg', CAST(0x7A400B00 AS Date), 7, 2, N'Sony', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (23, N'Ốp lưng cho UAG Pathfinder cho iPhone SE 2020 / 7 / 8 ', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 4000000, N'files/oplung4.jpg', CAST(0x7A400B00 AS Date), 5, 3, N'UAG', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (24, N'Ốp lưng UAG chống sốc Monarch cho Samsung Galaxy S20 Plus', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 5000000, N'files/oplung5.jpg', CAST(0x7A400B00 AS Date), 4, 3, N'UAG', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (25, N'Ốp lưng chống sốc UAG Pathfinder cho Samsung Galaxy S20 Ultra', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 3350000, N'files/oplung1.jpg', CAST(0x7A400B00 AS Date), 8, 3, N'UAG', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (26, N'Ốp lưng chống sốc UAG cilivian cho Samsung Galaxy S20 Plus', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 2350000, N'files/oplung2.jpg', CAST(0x7A400B00 AS Date), 10, 3, N'UAG', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (29, N'Ốp lưng chống sốc UAG Civilian cho iPhone 11 Pro', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 320000, N'files/oplung3.jpg', CAST(0x7A400B00 AS Date), 5, 3, N'UAG', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (30, N'Ốp lưng chống sốc cho iPhone XR Gear4 D3O Battersea', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 690000, N'files/oplung8.jpg', CAST(0x7A400B00 AS Date), 12, 3, N'Apple', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (31, N'Ốp lưng Apple Silicone chính hãng cho iPhone 12/12 Pro', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 2500000, N'files/oplung6.jpg', CAST(0x7A400B00 AS Date), 10, 3, N'Apple', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (33, N'Ốp lưng Samsung Kvadrat cho Samsung Galaxy Note 20 Ultra', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 2990000, N'files/oplung7.jpg', CAST(0x7A400B00 AS Date), 9, 3, N'Samsung', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (34, N'Ốp lưng chống sốc cho iPhone 12 / 12 Pro Gear4 D3O Battersea', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 2990000, N'files/oplung9.jpg', CAST(0x7A400B00 AS Date), 3, 3, N'Apple', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (35, N'Bao da Samsung Leather cho Samsung Galaxy Z Flip', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 36000000, N'files/oplung10.jpg', CAST(0x7A400B00 AS Date), 3, 3, N'Samsung', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (37, N'Ốp Lưng Cho Xiaomi Redmi Note 7 - Nillkin Super Frosted Shield Đen', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 6500000, N'files/oplung11.jpg', CAST(0x7A400B00 AS Date), 5, 3, N'Xiaomi', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1024, N'Ốp lưng OU trong cho iPhone 6/6S adu vjp', N'Thiết kế hiện đại, khỏe khoắn với đường gân mạnh mẽ, kết hợp nhiều chất liệu', 6900000, N'files/oplung12.jpg', CAST(0x44400B00 AS Date), 10, 3, N'Apple', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1026, N'Pin dự phòng Aukey 10000mAh 15W PB-N73 siêu nhanh', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 18600000, N'files/sdp1.jpg', CAST(0x44400B00 AS Date), 5, 4, N'Aukey', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1027, N'Pin sạc dự phòng Polymer 10.000mAh Xiaomi Mi 18W Fast Charge Power Bank', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 510000, N'files/sdp2.jpg', CAST(0x44400B00 AS Date), 4, 4, N'Xiaomi', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1029, N'Pin dự phòng Iwalk Chic 10000mah QC 3.0 PD tích hợp sạc không dây 10W', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 650000, N'files/sdp3.jpg', CAST(0x44400B00 AS Date), 7, 4, N'Iwalk', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1030, N'Pin dự phòng iWalk 10000mAh QC 3.0 PD 18w UBC10000PS', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 1000000, N'files/sdp4.jpg', CAST(0x44400B00 AS Date), 4, 4, N'Iwalk', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1031, N'Pin sạc dự phòng SamSung EB-P3300X 10.000 MAH sạc nhanh ', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 900000, N'files/sdp5.jpg', CAST(0x44400B00 AS Date), 8, 4, N'Samsung', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1032, N'Pin dự phòng Anker PowerCore 13000 A1215 siêu nhanh', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 1200000, N'files/sdp6.jpg', CAST(0x44400B00 AS Date), 6, 4, N'Anker', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1033, N'Pin Sạc dự phòng Aukey QC 3.0 & PD 18W 10000Mah XD-12', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 1160000, N'files/sdp7.jpg', CAST(0x44400B00 AS Date), 7, 4, N'Aukey', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1034, N'Pin dự phòng Titan P21 20000mAh adu vjp', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 4300000, N'files/sdp8.jpg', CAST(0x44400B00 AS Date), 5, 4, N'Titan', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1035, N'Pin dự phòng GOLF HIVE 10 10000mah adu vjp', N'Phụ kiện pin sạc an toàn, hiệu suất cao', 500000, N'files/sdp9.jpg', CAST(0x44400B00 AS Date), 6, 4, N'Hive', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1036, N'Apple AirPods Pro hàng chính hãng VN/A 4523-PHDN5', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 650000, N'files/airpod.jpg', CAST(0xC33F0B00 AS Date), 9, 5, N'Apple', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1037, N'Tai nghe không dây chống ồn Sony WF-1000XM3', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 469000, N'files/sony.jpg', CAST(0xC33F0B00 AS Date), 12, 5, N'Sony', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1038, N'Tai nghe AKG N200A KIJL 1310 pro - cute - vip', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 890000, N'files/tn3.jpg', CAST(0xC33F0B00 AS Date), 6, 5, N'AKG', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1039, N'Tai nghe không dây Earbuds Soundpeats True Capsule 2', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 890000, N'files/tn4.jpg', CAST(0xC33F0B00 AS Date), 4, 5, N'Soundbeat', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1040, N'Tai nghe gaming có dây JBL Quantum 50', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 1000000, N'files/tn5.jpg', CAST(0xC33F0B00 AS Date), 8, 5, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1041, N'Tai nghe Bluetooth Apple AirPods 2 VN/A', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 1090000, N'files/tn6.jpg', CAST(0xC33F0B00 AS Date), 9, 5, N'Apple', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1042, N'Tai nghe không dây chống ồn Sony WF-1000XM3', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 5900000, N'files/tn7.jpg', CAST(0xC33F0B00 AS Date), 11, 5, N'Sony', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1043, N'Tai nghe Sony MDR-XB55AP pro - cute - vip', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 3100000, N'files/tn8.jpg', CAST(0x7A400B00 AS Date), 6, 5, N'Sony', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1044, N'Tai nghe Sony MDR-EX155AP pro - cute - vip', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 249000, N'files/tn9.jpg', CAST(0x7A400B00 AS Date), 7, 5, N'Sony', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1045, N'Tai nghe Bluetooth JBL T115BT pro - cute - vip', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 899000, N'files/tn10.jpg', CAST(0x7A400B00 AS Date), 8, 5, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1046, N'Tai Nghe Không Dây JBL Tune 120 TWS pro - cute - vip', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 650000, N'files/tn11.jpg', CAST(0x7A400B00 AS Date), 9, 5, N'JBL', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1047, N'Tai nghe Bluetooth kiêm sạc dự phòng Energizer UB2609', N'Thiết kế tối giản, chất lượng âm thanh tuyệt vời', 6880000, N'files/tn12.jpg', CAST(0x7A400B00 AS Date), 6, 5, N'Energizer', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTaSP], [GiaSP], [AnhSP], [NgayTaoSP], [SoLuongSP], [MaLoaiSP], [HangSX], [idBrand]) VALUES (1049, N'Tai nghe HUỲNH MINH THẮNG HỌC GIỎI ĐẸP TRAI SIÊU CẤP VŨ TRỤ', N'hgsfvzdvsdv', 18111999, N'files/44023289_491055948060477_147530314141401088_n.jpg', CAST(0xFD410B00 AS Date), 18, 5, N'Yezzy', NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 01/08/2021 14:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaCTHD] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[MaHD] [int] NULL,
	[SoLuong] [int] NOT NULL,
	[MaKH] [int] NOT NULL,
	[TrangThai] [nvarchar](20) NULL,
	[SoTien] [int] NOT NULL,
	[Ngay] [date] NULL,
 CONSTRAINT [PK_CTHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CTHoaDon] ON
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3045, 1, 2023, 1, 2, N'1', 750000, CAST(0xFA410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3047, 2, 2023, 1, 2, N'1', 1190000, CAST(0xFA410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3048, 2, 2024, 1, 2, N'1', 1190000, CAST(0xFB410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3049, 2, 2024, 1, 2, N'1', 1190000, CAST(0xFB410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3050, 2, 2024, 1, 2, N'1', 1190000, CAST(0xFB410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3051, 2, 2024, 1, 2, N'1', 1190000, CAST(0xFB410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3052, 2, 2024, 1, 2, N'1', 1190000, CAST(0xFB410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3053, 10, 2024, 1, 2, N'1', 7660000, CAST(0xFB410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3065, 15, 2025, 1, 2, N'1', 22170000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3067, 3, 2025, 1, 2, N'1', 1390000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3068, 13, 2026, 1, 2, N'1', 4320000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3069, 1043, 2026, 1, 2, N'1', 3100000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3071, 12, 2027, 1, 2, N'1', 4920000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3072, 1040, 2027, 4, 2, N'1', 4000000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3073, 1026, 2027, 5, 2, N'1', 93000000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3074, 31, 2027, 3, 2, N'1', 7500000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3076, 1049, 2028, 2, 2, N'1', 36223998, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3077, 1037, 2028, 1, 2, N'1', 469000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3078, 1038, 2029, 3, 2, N'1', 2670000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3079, 16, 2029, 1, 2, N'1', 2179000, CAST(0xFD410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3080, 1045, 2030, 2, 1018, N'1', 1798000, CAST(0xFE410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3081, 14, 2030, 1, 1018, N'1', 16270000, CAST(0xFE410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3082, 1036, 2030, 3, 1018, N'1', 1950000, CAST(0xFE410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3086, 1, 2031, 1, 2, N'1', 750000, CAST(0xFF410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3087, 1, 2032, 1, 2, N'1', 750000, CAST(0xFF410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3089, 11, 2034, 2, 1018, N'1', 13540000, CAST(0xFF410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3090, 1036, 2034, 1, 1018, N'1', 650000, CAST(0xFF410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3091, 25, 2035, 1, 1018, N'1', 3350000, CAST(0xFF410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3092, 31, 2036, 1, 2, N'1', 2500000, CAST(0xFF410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3093, 13, 2037, 1, 2, N'1', 4320000, CAST(0xFF410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3094, 23, 2038, 3, 1018, N'1', 12000000, CAST(0xFF410B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3096, 15, 2040, 2, 2, N'1', 44340000, CAST(0x01420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3097, 1039, 2040, 1, 2, N'1', 890000, CAST(0x01420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3099, 1041, 2039, 8, 1018, N'1', 8720000, CAST(0x01420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3100, 15, 2039, 1, 1018, N'1', 22170000, CAST(0x01420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3101, 21, 2042, 1, 1018, N'1', 2650000, CAST(0x01420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3102, 24, 2043, 1, 1018, N'1', 5000000, CAST(0x02420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3103, 1037, 2043, 2, 1018, N'1', 938000, CAST(0x02420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3104, 1030, 2043, 1, 1018, N'1', 1000000, CAST(0x02420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3105, 1046, 2044, 1, 1021, N'1', 650000, CAST(0x02420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3106, 10, 2044, 2, 1021, N'1', 15320000, CAST(0x02420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3107, 6, 2045, 2, 1026, N'1', 3300000, CAST(0x03420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3108, 1041, 2045, 1, 1026, N'1', 1090000, CAST(0x03420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3110, 9, 2046, 1, 1026, N'1', 1954000, CAST(0x03420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3111, 1046, 2047, 1, 1018, N'1', 650000, CAST(0x03420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3112, 1036, 2047, 2, 1018, N'1', 1300000, CAST(0x03420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3113, 1031, 2048, 1, 1018, N'1', 900000, CAST(0x03420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3114, 1042, 2048, 1, 1018, N'1', 5900000, CAST(0x03420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3115, 31, 2049, 1, 1021, N'1', 2500000, CAST(0x03420B00 AS Date))
INSERT [dbo].[CTHoaDon] ([MaCTHD], [MaSP], [MaHD], [SoLuong], [MaKH], [TrangThai], [SoTien], [Ngay]) VALUES (3116, 1041, 2049, 1, 1021, N'1', 1090000, CAST(0x03420B00 AS Date))
SET IDENTITY_INSERT [dbo].[CTHoaDon] OFF
/****** Object:  ForeignKey [FK_CTHoaDon_HoaDon]    Script Date: 01/08/2021 14:41:04 ******/
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_HoaDon]
GO
/****** Object:  ForeignKey [FK_CTHoaDon_KhachHang]    Script Date: 01/08/2021 14:41:04 ******/
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_KhachHang]
GO
/****** Object:  ForeignKey [FK_CTHoaDon_SanPham]    Script Date: 01/08/2021 14:41:04 ******/
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_SanPham]
GO
/****** Object:  ForeignKey [FK_SanPham_Brands]    Script Date: 01/08/2021 14:41:04 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Brands] FOREIGN KEY([idBrand])
REFERENCES [dbo].[Brands] ([idBrand])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Brands]
GO
/****** Object:  ForeignKey [FK_SanPham_LoaiSanPham]    Script Date: 01/08/2021 14:41:04 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
