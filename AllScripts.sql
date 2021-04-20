USE [Hemanth_All_Test]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 4/20/2021 1:54:55 PM ******/
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
/****** Object:  Table [dbo].[Mapping]    Script Date: 4/20/2021 1:54:55 PM ******/
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
/****** Object:  Table [dbo].[OutputData]    Script Date: 4/20/2021 1:54:55 PM ******/
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
/****** Object:  Table [dbo].[Settings]    Script Date: 4/20/2021 1:54:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMapForSettingId]    Script Date: 4/20/2021 1:54:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUnprocessedFiles]    Script Date: 4/20/2021 1:54:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertDataIntoOutputTable]    Script Date: 4/20/2021 1:54:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateFileTable]    Script Date: 4/20/2021 1:54:55 PM ******/
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
