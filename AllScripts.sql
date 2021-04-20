USE [Hemanth_All_Test]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 4/20/2021 3:58:36 PM ******/
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
/****** Object:  Table [dbo].[Mapping]    Script Date: 4/20/2021 3:58:36 PM ******/
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
/****** Object:  Table [dbo].[OutputData]    Script Date: 4/20/2021 3:58:36 PM ******/
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
/****** Object:  Table [dbo].[Settings]    Script Date: 4/20/2021 3:58:36 PM ******/
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
INSERT [dbo].[Files] ([FileId], [ReceviedDate], [FileLocation], [IsProcessed], [SettingId]) VALUES (1002, CAST(N'2021-04-14T13:23:09.407' AS DateTime), N'C:\Users\heman\Downloads\Grid Dataallpages.pdf', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
SET IDENTITY_INSERT [dbo].[Mapping] ON 
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (1, N'MTM', N'MTMExposure', N'L2L', 1, 2, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (2, N'BCB', N'NetCollateralSettled', N'L2L', 1, 2, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (3, N'IA', N'NonRegIMExposure*', N'L2L', 1, 2, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (4, N'InvestmentAtFairValue', N'Investment, at fair value (cost', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (5, N'DueFromBroker', N'Due from broker', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (6, N'CashAndCashEquivalents', N'Cash and cash equivalents', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (7, N'TotalAssets', N'Total assets', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (8, N'AccruedExpenses', N'Accrued expenses', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (9, N'TotalLiabilities', N'Total liabilitie', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (10, N'PartnersCapital', N'Partners capital', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (11, N'TotalLiabilitiesAndPartnersCapital', N'Total liabilities and partners capital', N'L2L', 2, 3, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (12, N'NaventGroupLtdCost', N'Navent Group Ltd.', N'L2L', 2, 4, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (13, N'NaventGroupLtdFairValue', N'Navent Group Ltd.', N'L2L', 2, 4, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (14, N'NaventGroupLtdPercentOfPartnersCapital', N'Navent Group Ltd.', N'L2L', 2, 4, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (15, N'NaventGroupLtdPercentOfCompanyOwnership', N'Navent Group Ltd.', N'L2L', 2, 4, 7)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (16, N'TotalInvestmentCost', N'Total investment in security', N'L2L', 2, 4, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (17, N'TotalInvestmentFairValue', N'Total investment in security', N'L2L', 2, 4, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (18, N'TotalInvestmentCostPercentageOfPartnersCapital', N'Total investment in security', N'L2L', 2, 4, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (19, N'Interest', N'Interest', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (20, N'TotalInvestmentIncome', N'Total investment income', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (21, N'ProfessionalFees', N'Professional fees', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (22, N'OtherExpenses', N'Other expenses', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (23, N'TotalExpenses', N'Total expenses', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (24, N'NetInvestmentLoss', N'Net investment loss', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (25, N'PortfolioInvestment', N'Portfolio investment', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (26, N'ForeignCurrency', N'Foreign currency', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (27, N'NetDecreaseInCapital', N'Net decrease in partners capital resulting from operations', N'L2L', 2, 5, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (28, N'BalanceGeneralPartner', N'Balance at beginning of year', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (29, N'BalanceLimitedPartnersPartA', N'Balance at beginning of year', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (30, N'BalanceLimitedPartnersPartB', N'Balance at beginning of year', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (31, N'BalanceLimitedPartnersPartC', N'Balance at beginning of year', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (32, N'BalanceLimitedPartnersPartC-1', N'Balance at beginning of year', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (33, N'BalanceTotal', N'Balance at beginning of year', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (34, N'ProRataAllocationGeneralPartner', N'Pro-rata allocation to all Partners', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (35, N'ProRataAllocationLimitedPartnersPartA', N'Pro-rata allocation to all Partners', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (36, N'ProRataAllocationLimitedPartnersPartB', N'Pro-rata allocation to all Partners', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (37, N'ProRataAllocationLimitedPartnersPartC', N'Pro-rata allocation to all Partners', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (38, N'ProRataAllocationLimitedPartnersPartC-1', N'Pro-rata allocation to all Partners', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (39, N'ProRataAllocationTotal', N'Pro-rata allocation to all Partners', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (40, N'CarriedInterestRBGeneralPartner', N'Carried Interest to the General Partner (on realized basis)', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (41, N'CarriedInterestRBLimitedPartnersPartA', N'Carried Interest to the General Partner (on realized basis)', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (42, N'CarriedInterestRBLimitedPartnersPartB', N'Carried Interest to the General Partner (on realized basis)', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (43, N'CarriedInterestRBLimitedPartnersPartC', N'Carried Interest to the General Partner (on realized basis)', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (44, N'CarriedInterestRBLimitedPartnersPartC-1', N'Carried Interest to the General Partner (on realized basis)', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (45, N'CarriedInterestRBTotal', N'Carried Interest to the General Partner (on realized basis)', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (46, N'EOYBalanceGeneralPartner', N'Balance at end of year', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (47, N'EOYBalanceLimitedPartnersPartA', N'Balance at end of year', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (48, N'EOYBalanceLimitedPartnersPartB', N'Balance at end of year', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (49, N'EOYBalanceLimitedPartnersPartC', N'Balance at end of year', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (50, N'EOYBalanceLimitedPartnersPartC-1', N'Balance at end of year', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (51, N'EOYBalanceTotal', N'Balance at end of year', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (52, N'CarriedInterestGeneralPartner', N'Carried Interest to the General Partner', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (53, N'CarriedInterestLimitedPartnersPartA', N'Carried Interest to the General Partner', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (54, N'CarriedInterestLimitedPartnersPartB', N'Carried Interest to the General Partner', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (55, N'CarriedInterestLimitedPartnersPartC', N'Carried Interest to the General Partner', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (56, N'CarriedInterestLimitedPartnersPartC-1', N'Carried Interest to the General Partner', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (57, N'CarriedInterestTotal', N'Carried Interest to the General Partner', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (58, N'EOYBalanceHypotheticalGeneralPartner', N'Balance at end of year after hypothetical liquidation', N'L2L', 2, 6, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (59, N'EOYBalanceHypotheticalLimitedPartnersPartA', N'Balance at end of year after hypothetical liquidation', N'L2L', 2, 6, 2)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (60, N'EOYBalanceHypotheticalLimitedPartnersPartB', N'Balance at end of year after hypothetical liquidation', N'L2L', 2, 6, 3)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (61, N'EOYBalanceHypotheticalLimitedPartnersPartC', N'Balance at end of year after hypothetical liquidation', N'L2L', 2, 6, 4)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (62, N'EOYBalanceHypotheticalLimitedPartnersPartC-1', N'Balance at end of year after hypothetical liquidation', N'L2L', 2, 6, 5)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (63, N'EOYBalanceHypotheticalTotal', N'Balance at end of year after hypothetical liquidation', N'L2L', 2, 6, 6)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (64, N'NetDecreaseInPartnersCapital', N'Net decrease in partners capital resulting from operations', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (65, N'DecreaseInDue', N'Decrease in due from broker', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (66, N'IncreaseInAccruedExpenses', N'Increase in accrued expenses', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (67, N'NetChangePortfolioInvestment', N'Net change in unrealized depreciation on portfolio investment', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (68, N'NetCashUsed', N'Net cash used in operating activities', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (69, N'ChangeInCashAndCashEquivalents', N'Change in cash and cash equivalents', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (70, N'BOYChangeInCashAndCashEquivalent', N'Beginning of the year', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (71, N'EOYChangeInCashAndCashEquivalent', N'End of the year', N'L2L', 2, 7, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (72, N'CAPITALBALANCEATJANUARY1', N'CAPITAL BALANCE AT JANUARY 1, 2020', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (73, N'ASSIGNMENTOFPARTNERSHIPINTEREST', N'ASSIGNMENT OF PARTNERSHIP INTEREST', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (74, N'CAPITALCONTRIBUTIONS', N'CAPITAL CONTRIBUTIONS', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (75, N'CAPITALDISTRIBUTIONS', N'CAPITAL DISTRIBUTIONS', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (76, N'NetIncomeBCI', N'NET INCOME (LOSS) BEFORE CARRIED INTEREST', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (77, N'CARRIEDINTEREST', N'CARRIED INTEREST', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (78, N'CAPITALBALANCEATDECEMBER31', N'CAPITAL BALANCE AT DECEMBER 31, 2020', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (79, N'CARRIEDINTERESTASSUMINGHYPOTHETICALLIQUIDATION', N'CARRIED INTEREST ASSUMING HYPOTHETICAL LIQUIDATION (1)', N'L2L', 2, 19, 1)
GO
INSERT [dbo].[Mapping] ([MappingId], [MapType], [MapName], [ExecutionType], [SettingId], [PageNumber], [Position]) VALUES (80, N'CapitalBalanceAtDecember31AH', N'CAPITAL BALANCE AT DECEMBER 31, 2020 AFTER HYPOTHETICAL', N'L2L', 2, 19, 1)
GO
SET IDENTITY_INSERT [dbo].[Mapping] OFF
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
/****** Object:  StoredProcedure [dbo].[GetMapForSettingId]    Script Date: 4/20/2021 3:58:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUnprocessedFiles]    Script Date: 4/20/2021 3:58:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertDataIntoOutputTable]    Script Date: 4/20/2021 3:58:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateFileTable]    Script Date: 4/20/2021 3:58:36 PM ******/
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
