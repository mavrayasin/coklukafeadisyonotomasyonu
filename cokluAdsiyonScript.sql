USE [CokluAdisyonDb]
GO
/****** Object:  Table [dbo].[Hesap]    Script Date: 23.05.2021 23:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hesap](
	[HesapID] [int] IDENTITY(1,1) NOT NULL,
	[Siparis_ID] [int] NOT NULL,
	[OdemeTuru] [int] NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Tutar] [float] NULL,
 CONSTRAINT [PK_Hesap] PRIMARY KEY CLUSTERED 
(
	[HesapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kafeler]    Script Date: 23.05.2021 23:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kafeler](
	[KafeID] [int] IDENTITY(1,1) NOT NULL,
	[KafeAdi] [varchar](50) NULL,
 CONSTRAINT [PK_Kafeler] PRIMARY KEY CLUSTERED 
(
	[KafeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 23.05.2021 23:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[Kafe_ID] [int] NOT NULL,
	[KullaniciAdi] [nchar](50) NULL,
	[Sifre] [nchar](50) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masalar]    Script Date: 23.05.2021 23:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masalar](
	[MasaID] [int] IDENTITY(1,1) NOT NULL,
	[Kafe_ID] [int] NOT NULL,
	[MasaNo] [int] NULL,
	[Aciklama] [varchar](50) NULL,
 CONSTRAINT [PK_Masalar] PRIMARY KEY CLUSTERED 
(
	[MasaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 23.05.2021 23:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[Masa_ID] [int] NOT NULL,
	[HesapOdendi] [int] NOT NULL,
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 23.05.2021 23:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetay](
	[SiparisDetayID] [int] IDENTITY(1,1) NOT NULL,
	[Siparis_ID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Adet] [int] NOT NULL,
 CONSTRAINT [PK_SiparisDetay] PRIMARY KEY CLUSTERED 
(
	[SiparisDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 23.05.2021 23:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunGrup_ID] [int] NOT NULL,
	[Kafe_ID] [int] NOT NULL,
	[UrunAdi] [varchar](100) NULL,
	[UrunFiyati] [float] NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunGruplari]    Script Date: 23.05.2021 23:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunGruplari](
	[UrunGrupID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](100) NULL,
	[Resim] [image] NULL,
 CONSTRAINT [PK_UrunGruplaro] PRIMARY KEY CLUSTERED 
(
	[UrunGrupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Siparis] ADD  CONSTRAINT [DF_Siparis_HesapOdendi]  DEFAULT ((0)) FOR [HesapOdendi]
GO
ALTER TABLE [dbo].[Hesap]  WITH CHECK ADD  CONSTRAINT [FK_Hesap_Siparis] FOREIGN KEY([Siparis_ID])
REFERENCES [dbo].[Siparis] ([SiparisID])
GO
ALTER TABLE [dbo].[Hesap] CHECK CONSTRAINT [FK_Hesap_Siparis]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Kafeler] FOREIGN KEY([Kafe_ID])
REFERENCES [dbo].[Kafeler] ([KafeID])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Kafeler]
GO
ALTER TABLE [dbo].[Masalar]  WITH CHECK ADD  CONSTRAINT [FK_Masalar_Kafeler] FOREIGN KEY([Kafe_ID])
REFERENCES [dbo].[Kafeler] ([KafeID])
GO
ALTER TABLE [dbo].[Masalar] CHECK CONSTRAINT [FK_Masalar_Kafeler]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Masalar] FOREIGN KEY([Masa_ID])
REFERENCES [dbo].[Masalar] ([MasaID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Masalar]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Siparis] FOREIGN KEY([Siparis_ID])
REFERENCES [dbo].[Siparis] ([SiparisID])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Siparis]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Urun] FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urun] ([UrunID])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Urun]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Kafeler] FOREIGN KEY([Kafe_ID])
REFERENCES [dbo].[Kafeler] ([KafeID])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Kafeler]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_UrunGruplari] FOREIGN KEY([UrunGrup_ID])
REFERENCES [dbo].[UrunGruplari] ([UrunGrupID])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_UrunGruplari]
GO
