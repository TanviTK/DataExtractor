USE [Hemanth_All_Test]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 4/20/2021 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[ReceviedDate] [datetime] NOT NULL,
	[FileLocation] [varchar](255) NOT NULL,
	[IsProcessed] [bit] NOT NULL,
	[SettingId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mapping]    Script Date: 4/20/2021 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mapping](
	[MappingId] [int] IDENTITY(1,1) NOT NULL,
	[MapType] [varchar](255) NOT NULL,
	[MapName] [varchar](255) NOT NULL,
	[ExecutionType] [varchar](20) NOT NULL,
	[SettingId] [int] NOT NULL,
	[PageNumber] [int] NOT NULL,
	[Position] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutputData]    Script Date: 4/20/2021 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutputData](
	[OutputId] [int] IDENTITY(1,1) NOT NULL,
	[DataType] [varchar](20) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[FileId] [int] NOT NULL,
	[PageNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OutputId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 4/20/2021 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[Broker] [varchar](255) NOT NULL,
	[Attachment] [varchar](255) NOT NULL,
	[Subject] [varchar](255) NOT NULL,
	[FileType] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Files] ON 
GO
INSERT [dbo].[Files] ([FileId], [ReceviedDate], [FileLocation], [IsProcessed], [SettingId]) VALUES (1, CAST(N'2021-04-14T13:23:09.407' AS DateTime), N'C:\Users\heman\Downloads\Test.pdf', 1, 1)
GO
INSERT [dbo].[Files] ([FileId], [ReceviedDate], [FileLocation], [IsProcessed], [SettingId]) VALUES (6, CAST(N'2021-04-14T13:23:09.407' AS DateTime), N'C:\Users\heman\Downloads\Test.pdf', 1, 1)
GO
INSERT [dbo].[Files] ([FileId], [ReceviedDate], [FileLocation], [IsProcessed], [SettingId]) VALUES (8, CAST(N'2021-04-14T13:23:09.407' AS DateTime), N'C:\Users\heman\Downloads\Test.pdf', 1, 1)
GO
INSERT [dbo].[Files] ([FileId], [ReceviedDate], [FileLocation], [IsProcessed], [SettingId]) VALUES (1002, CAST(N'2021-04-14T13:23:09.407' AS DateTime), N'C:\Users\heman\Downloads\Grid Data.pdf', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
SET IDENTITY_INSERT [dbo].[Mapping] ON 
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (1, N'MTM', N'MTMExposure', N'L2L', 1, 1, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (2, N'BCB', N'NetCollateralSettled', N'L2L', 1, 1, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (3, N'IA', N'NonRegIMExposure*', N'L2L', 1, 1, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (4, N'InvestmentAtFairValue', N'Investmentatfairvalue', N'L2L', 2, 3, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (5, N'DueFromBroker', N'Duefrombroker', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (6, N'CashAndCashEquivalents', N'Cashandcashequivalents', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (7, N'TotalAssets', N'Totalassets', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (8, N'AccruedExpenses', N'Accruedexpenses', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (9, N'TotalLiabilities', N'Totalliabilities', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (10, N'PartnersCapital', N'Partnerscapital', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (11, N'TotalLiabilitiesAndPartnersCapital', N'Totalliabilitiesandpartnerscapital', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (12, N'NaventGroupLtdCost', N'NaventGroupLtd.', N'L2L', 2, 4, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (13, N'NaventGroupLtdFairValue', N'NaventGroupLtd.', N'L2L', 2, 4, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (14, N'NaventGroupLtdPercentOfPartnersCapital', N'NaventGroupLtd.', N'L2L', 2, 4, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (15, N'NaventGroupLtdPercentOfCompanyOwnership', N'NaventGroupLtd.', N'L2L', 2, 4, 7)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (16, N'TotalInvestmentCost', N'Totalinvestmentinsecurity', N'L2L', 2, 4, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (17, N'TotalInvestmentFairValue', N'Totalinvestmentinsecurity', N'L2L', 2, 4, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (18, N'TotalInvestmentCostPercentageOfPartnersCapital', N'Totalinvestmentinsecurity', N'L2L', 2, 4, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (19, N'Interest', N'Interest', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (20, N'TotalInvestmentIncome', N'Totalinvestmentincome', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (21, N'ProfessionalFees', N'Professionalfees', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (22, N'OtherExpenses', N'Otherexpenses', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (23, N'TotalExpenses', N'Totalexpenses', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (24, N'NetInvestmentLoss', N'Netinvestmentloss', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (25, N'PortfolioInvestment', N'Portfolioinvestment', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (26, N'ForeignCurrency', N'Foreigncurrency', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (27, N'NetDecreaseInCapital', N'Netdecreaseinpartnerscapitalresultingfromoperations', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (28, N'BalanceGeneralPartner', N'Balanceatbeginningofyear', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (29, N'BalanceLimitedPartnersPartA', N'Balanceatbeginningofyear', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (30, N'BalanceLimitedPartnersPartB', N'Balanceatbeginningofyear', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (31, N'BalanceLimitedPartnersPartC', N'Balanceatbeginningofyear', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (32, N'BalanceLimitedPartnersPartC-1', N'Balanceatbeginningofyear', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (33, N'BalanceTotal', N'Balanceatbeginningofyear', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (34, N'ProRataAllocationGeneralPartner', N'Pro-rataallocationtoallPartners', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (35, N'ProRataAllocationLimitedPartnersPartA', N'Pro-rataallocationtoallPartners', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (36, N'ProRataAllocationLimitedPartnersPartB', N'Pro-rataallocationtoallPartners', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (37, N'ProRataAllocationLimitedPartnersPartC', N'Pro-rataallocationtoallPartners', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (38, N'ProRataAllocationLimitedPartnersPartC-1', N'Pro-rataallocationtoallPartners', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (39, N'ProRataAllocationTotal', N'Pro-rataallocationtoallPartners', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (40, N'CarriedInterestRBGeneralPartner', N'(onrealizedbasis)', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (41, N'CarriedInterestRBLimitedPartnersPartA', N'(onrealizedbasis)', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (42, N'CarriedInterestRBLimitedPartnersPartB', N'(onrealizedbasis)', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (43, N'CarriedInterestRBLimitedPartnersPartC', N'(onrealizedbasis)', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (44, N'CarriedInterestRBLimitedPartnersPartC-1', N'(onrealizedbasis)', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (45, N'CarriedInterestRBTotal', N'(onrealizedbasis)', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (46, N'EOYBalanceGeneralPartner', N'Balanceatendofyear', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (47, N'EOYBalanceLimitedPartnersPartA', N'Balanceatendofyear', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (48, N'EOYBalanceLimitedPartnersPartB', N'Balanceatendofyear', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (49, N'EOYBalanceLimitedPartnersPartC', N'Balanceatendofyear', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (50, N'EOYBalanceLimitedPartnersPartC-1', N'Balanceatendofyear', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (51, N'EOYBalanceTotal', N'Balanceatendofyear', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (52, N'CarriedInterestGeneralPartner', N'CarriedInteresttotheGeneralPartner', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (53, N'CarriedInterestLimitedPartnersPartA', N'CarriedInteresttotheGeneralPartner', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (54, N'CarriedInterestLimitedPartnersPartB', N'CarriedInteresttotheGeneralPartner', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (55, N'CarriedInterestLimitedPartnersPartC', N'CarriedInteresttotheGeneralPartner', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (56, N'CarriedInterestLimitedPartnersPartC-1', N'CarriedInteresttotheGeneralPartner', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (57, N'CarriedInterestTotal', N'CarriedInteresttotheGeneralPartner', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (58, N'EOYBalanceHypotheticalGeneralPartner', N'Balanceatendofyearafterhypotheticalliquidation', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (59, N'EOYBalanceHypotheticalLimitedPartnersPartA', N'Balanceatendofyearafterhypotheticalliquidation', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (60, N'EOYBalanceHypotheticalLimitedPartnersPartB', N'Balanceatendofyearafterhypotheticalliquidation', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (61, N'EOYBalanceHypotheticalLimitedPartnersPartC', N'Balanceatendofyearafterhypotheticalliquidation', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (62, N'EOYBalanceHypotheticalLimitedPartnersPartC-1', N'Balanceatendofyearafterhypotheticalliquidation', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (63, N'EOYBalanceHypotheticalTotal', N'Balanceatendofyearafterhypotheticalliquidation', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (64, N'NetDecreaseInPartnersCapital', N'Netdecreaseinpartnerscapitalresultingfromoperations', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (65, N'DecreaseInDue', N'Decreaseinduefrombroker', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (66, N'IncreaseInAccruedExpenses', N'Increaseinaccruedexpenses', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (67, N'NetChangePortfolioInvestment', N'Netchangeinunrealizeddepreciationonportfolioinvestment', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (68, N'NetCashUsed', N'Netcashusedinoperatingactivities', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (69, N'ChangeInCashAndCashEquivalent', N'Changeincashandcashequivalents', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (70, N'CAPITALBALANCEATJANUARY1', N'CAPITALBALANCEATJANUARY12020', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (71, N'ASSIGNMENTOFPARTNERSHIPINTEREST', N'ASSIGNMENTOFPARTNERSHIPINTEREST', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (72, N'CAPITALCONTRIBUTIONS', N'CAPITALCONTRIBUTIONS', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (73, N'CAPITALDISTRIBUTIONS', N'CAPITALDISTRIBUTIONS', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (74, N'NetIncomeBCI', N'BEFORECARRIEDINTEREST', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (75, N'CARRIEDINTEREST', N'CARRIEDINTEREST', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (76, N'CAPITALBALANCEATDECEMBER31', N'CAPITALBALANCEATDECEMBER312020', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (77, N'CARRIEDINTERESTASSUMINGHYPOTHETICALLIQUIDATION', N'CARRIEDINTERESTASSUMINGHYPOTHETICALLIQUIDATION', N'L2L', 2, 19, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (78, N'CapitalBalanceAtDecember31AH', N'CAPITALBALANCEATDECEMBER312020AFTERHYPOTHETICAL', N'L2L', 2, 19, 1)
GO
SET IDENTITY_INSERT [dbo].[Mapping] OFF
GO
SET IDENTITY_INSERT [dbo].[OutputData] ON 
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (1, N'CAPITALBALANCEATJANU', N'13284', 1002, 19)
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (2, N'ASSIGNMENTOFPARTNERS', N'0', 1002, 19)
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (3, N'CAPITALCONTRIBUTIONS', N'0', 1002, 19)
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (4, N'CAPITALDISTRIBUTIONS', N'0', 1002, 19)
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (5, N'NetIncomeBCI', N'-4274', 1002, 19)
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (6, N'CARRIEDINTEREST', N'36', 1002, 19)
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (7, N'CAPITALBALANCEATDECE', N'9046', 1002, 19)
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (8, N'CARRIEDINTERESTASSUM', N'1653', 1002, 19)
GO
INSERT [dbo].[OutputData] ([OutputId], [DataType], [Value], [FileId], [PageNumber]) VALUES (9, N'CapitalBalanceAtDece', N'10699', 1002, 19)
GO
SET IDENTITY_INSERT [dbo].[OutputData] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 
GO
INSERT [dbo].[Settings] ([SettingId], [Broker], [Attachment], [Subject], [FileType]) VALUES (1, N'citi.com
', N'*110141_MarginNotice*
', N'*TIGER GLOBAL INVESTMENTS, L.P. Vs. CBNA*
', N'pdf')
GO
INSERT [dbo].[Settings] ([SettingId], [Broker], [Attachment], [Subject], [FileType]) VALUES (2, N'test', N'Test1', N'test1', N'pdf')
GO
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
ALTER TABLE [dbo].[Files] ADD  DEFAULT ((0)) FOR [IsProcessed]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([SettingId])
REFERENCES [dbo].[Settings] ([SettingId])
GO
ALTER TABLE [dbo].[Mapping]  WITH CHECK ADD FOREIGN KEY([SettingId])
REFERENCES [dbo].[Settings] ([SettingId])
GO
ALTER TABLE [dbo].[OutputData]  WITH CHECK ADD FOREIGN KEY([FileId])
REFERENCES [dbo].[Files] ([FileId])
GO
/****** Object:  StoredProcedure [dbo].[GetMapForSettingId]    Script Date: 4/20/2021 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMapForSettingId] @id int
AS
BEGIN
SELECT * FROM Mapping WHERE SettingId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[GetUnprocessedFiles]    Script Date: 4/20/2021 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUnprocessedFiles]
AS
BEGIN
    SELECT *
    FROM Files
	where IsProcessed = 0
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDataIntoOutputTable]    Script Date: 4/20/2021 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDataIntoOutputTable] (

  @dataType nvarchar(20),
  @outVal nvarchar(100),
  @fileId int,
  @pageNum int
) AS
BEGIN
    INSERT INTO OutputData(DataType, [Value], FileId, [PageNumber])
    VALUES (@dataType, @outVal, @fileId,@pageNum);

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateFileTable]    Script Date: 4/20/2021 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateFileTable] @id int
AS
BEGIN
Update Files 
set IsProcessed = 1
WHERE FileId = @id
END
GO
