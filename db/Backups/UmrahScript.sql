USE [empty]
GO
/****** Object:  Table [dbo].[AlharmainUser]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlharmainUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[mobileNo] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[contect] [nvarchar](max) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[province] [nvarchar](50) NOT NULL,
	[adults] [int] NOT NULL,
	[children] [int] NOT NULL,
	[infants] [int] NOT NULL,
 CONSTRAINT [PK_AlharmainUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AirLine]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirLine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AirLine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ziarat]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ziarat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ziarat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisaPackages]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisaPackages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[visaTitle] [nvarchar](50) NOT NULL,
	[amount] [float] NOT NULL,
	[issueDate] [date] NOT NULL,
	[expireDate] [date] NOT NULL,
 CONSTRAINT [PK_VisaPackages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransPort]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransPort](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransPort] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlharmainUserPackage]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlharmainUserPackage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[packageID] [int] NOT NULL,
	[isCustomPackage] [bit] NOT NULL,
 CONSTRAINT [PK_AlharmainUserPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[departureDate] [date] NOT NULL,
	[returnDate] [date] NOT NULL,
	[fromCity] [nvarchar](50) NOT NULL,
	[destinationCity] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[flightType] [int] NOT NULL,
	[airLineID] [int] NOT NULL,
 CONSTRAINT [PK_Flights] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hotelName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[rating] [int] NOT NULL,
	[distance] [float] NOT NULL,
	[mediaID] [int] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[startDate] [date] NOT NULL,
	[duration] [int] NOT NULL,
	[mediaID] [int] NOT NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageDetail]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[packageID] [int] NOT NULL,
	[hotelIDMakkah] [int] NOT NULL,
	[nightsInMakkah] [int] NOT NULL,
	[hotelIDMadina] [int] NOT NULL,
	[nightsInMadina] [int] NOT NULL,
	[returnFlight] [bit] NOT NULL,
	[departureFlightID] [int] NULL,
	[returnFlightID] [int] NULL,
	[isTransportAvailable] [bit] NOT NULL,
	[transportID] [int] NULL,
	[isZiaratAvailable] [bit] NOT NULL,
	[ziaratID] [int] NULL,
	[isVisaAvailable] [bit] NOT NULL,
	[visaID] [int] NULL,
	[totalAmount] [int] NOT NULL,
	[additionalExpense] [int] NOT NULL,
	[additionalDetail] [nvarchar](max) NULL,
	[isAirLineAvailable] [bit] NOT NULL,
 CONSTRAINT [PK_PackageDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mediaID] [int] NOT NULL,
	[hotelID] [int] NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelFacility]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelFacility](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[availability] [bit] NOT NULL,
	[mediaID] [int] NOT NULL,
	[hotelID] [int] NOT NULL,
 CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accommodation]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accommodation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[availability] [bit] NOT NULL,
	[hotelID] [int] NOT NULL,
 CONSTRAINT [PK_Accommodation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountPackage]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountPackage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[availableFrom] [date] NOT NULL,
	[availableTill] [date] NOT NULL,
	[packageID] [int] NOT NULL,
	[discountPercent] [float] NOT NULL,
 CONSTRAINT [PK_DiscountPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomPackage]    Script Date: 12/27/2016 10:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomPackage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[month] [int] NOT NULL,
	[hotelMakkahID] [int] NOT NULL,
	[nightsMakkah] [int] NOT NULL,
	[hotelMadinaID] [int] NOT NULL,
	[nightsMadina] [int] NOT NULL,
	[isRoundTrip] [bit] NOT NULL,
	[returnAirLineID] [int] NOT NULL,
	[departureAirLineID] [int] NOT NULL,
	[roomMakkahID] [int] NOT NULL,
	[roomMadinaID] [int] NOT NULL,
	[depFlightID] [int] NOT NULL,
	[retFlightID] [int] NOT NULL,
 CONSTRAINT [PK_CustomPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Accommodation_availability]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[Accommodation] ADD  CONSTRAINT [DF_Accommodation_availability]  DEFAULT ((0)) FOR [availability]
GO
/****** Object:  Default [DF_CustomPackage_returnAirLineID]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage] ADD  CONSTRAINT [DF_CustomPackage_returnAirLineID]  DEFAULT ((1)) FOR [returnAirLineID]
GO
/****** Object:  Default [DF_Hotel_rating]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_rating]  DEFAULT ((0)) FOR [rating]
GO
/****** Object:  Default [DF_Hotel_distance]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_distance]  DEFAULT ((0)) FOR [distance]
GO
/****** Object:  Default [DF_PackageDetail_nightsInMakkah]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_nightsInMakkah]  DEFAULT ((0)) FOR [nightsInMakkah]
GO
/****** Object:  Default [DF_PackageDetail_nightsInMadina]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_nightsInMadina]  DEFAULT ((0)) FOR [nightsInMadina]
GO
/****** Object:  Default [DF_Table_1_isTransport]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_Table_1_isTransport]  DEFAULT ((0)) FOR [isTransportAvailable]
GO
/****** Object:  Default [DF_PackageDetail_additionalExpense]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_additionalExpense]  DEFAULT ((0)) FOR [additionalExpense]
GO
/****** Object:  Default [DF_PackageDetail_isAirLineAvailable]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_isAirLineAvailable]  DEFAULT ((0)) FOR [isAirLineAvailable]
GO
/****** Object:  ForeignKey [FK_Accommodation_Hotel]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_Accommodation_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Accommodation] CHECK CONSTRAINT [FK_Accommodation_Hotel]
GO
/****** Object:  ForeignKey [FK_AlharmainUserPackage_AlharmainUser]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_AlharmainUser] FOREIGN KEY([userID])
REFERENCES [dbo].[AlharmainUser] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_AlharmainUser]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Accommodation]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Accommodation] FOREIGN KEY([roomMakkahID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Accommodation]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Accommodation1]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Accommodation1] FOREIGN KEY([roomMadinaID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Accommodation1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_AirLine]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_AirLine] FOREIGN KEY([returnAirLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_AirLine]
GO
/****** Object:  ForeignKey [FK_CustomPackage_AirLine1]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_AirLine1] FOREIGN KEY([departureAirLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_AirLine1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Flight]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Flight] FOREIGN KEY([depFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Flight]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Flight1]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Flight1] FOREIGN KEY([retFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Flight1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Hotel]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Hotel] FOREIGN KEY([hotelMakkahID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Hotel]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Hotel1]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Hotel1] FOREIGN KEY([hotelMadinaID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Hotel1]
GO
/****** Object:  ForeignKey [FK_DiscountPackage_Package]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[DiscountPackage]  WITH CHECK ADD  CONSTRAINT [FK_DiscountPackage_Package] FOREIGN KEY([packageID])
REFERENCES [dbo].[Package] ([id])
GO
ALTER TABLE [dbo].[DiscountPackage] CHECK CONSTRAINT [FK_DiscountPackage_Package]
GO
/****** Object:  ForeignKey [FK_Flight_AirLine]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_AirLine] FOREIGN KEY([airLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_AirLine]
GO
/****** Object:  ForeignKey [FK_Hotel_MediaItems]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_MediaItems]
GO
/****** Object:  ForeignKey [FK_HotelFacility_Hotel]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_Hotel]
GO
/****** Object:  ForeignKey [FK_HotelFacility_MediaItems]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_MediaItems]
GO
/****** Object:  ForeignKey [FK_HotelImage_Hotel]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
/****** Object:  ForeignKey [FK_HotelImage_MediaItems]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_MediaItems]
GO
/****** Object:  ForeignKey [FK_Package_MediaItems]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_MediaItems]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Flight]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Flight] FOREIGN KEY([returnFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Flight]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Flight1]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Flight1] FOREIGN KEY([departureFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Flight1]
GO
/****** Object:  ForeignKey [FK_PackageDetail_HotelMadina]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_HotelMadina] FOREIGN KEY([hotelIDMadina])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_HotelMadina]
GO
/****** Object:  ForeignKey [FK_PackageDetail_HotelMakkah]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_HotelMakkah] FOREIGN KEY([hotelIDMakkah])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_HotelMakkah]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Package]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Package] FOREIGN KEY([packageID])
REFERENCES [dbo].[Package] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Package]
GO
/****** Object:  ForeignKey [FK_PackageDetail_TransPort]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_TransPort] FOREIGN KEY([transportID])
REFERENCES [dbo].[TransPort] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_TransPort]
GO
/****** Object:  ForeignKey [FK_PackageDetail_VisaPackages]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_VisaPackages] FOREIGN KEY([visaID])
REFERENCES [dbo].[VisaPackages] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_VisaPackages]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Ziarat]    Script Date: 12/27/2016 10:32:35 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Ziarat] FOREIGN KEY([ziaratID])
REFERENCES [dbo].[Ziarat] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Ziarat]
GO
