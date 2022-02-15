USE [DB]
GO

/****** Object:  Table [dbo].[domains]    Script Date: 25/11/2021 09:16:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[domains](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[authority] [nvarchar](255) NOT NULL,
	[base_url_redirect] [nvarchar](255) NULL,
	[regular_not_found_redirect] [nvarchar](255) NULL,
	[invalid_short_url_redirect] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


