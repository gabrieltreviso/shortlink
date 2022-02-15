USE [DB]
GO

/****** Object:  Table [dbo].[visit_locations]    Script Date: 25/11/2021 09:18:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[visit_locations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[country_code] [nvarchar](255) NULL,
	[country_name] [nvarchar](255) NULL,
	[region_name] [nvarchar](255) NULL,
	[city_name] [nvarchar](255) NULL,
	[timezone] [nvarchar](255) NULL,
	[lat] [float] NOT NULL,
	[lon] [float] NOT NULL,
	[is_empty] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[visit_locations] ADD  CONSTRAINT [DF_943099A3_243BDEB4]  DEFAULT ('0') FOR [is_empty]
GO


