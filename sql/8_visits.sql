USE [DB]
GO

/****** Object:  Table [dbo].[visits]    Script Date: 25/11/2021 09:18:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[visits](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[short_url_id] [bigint] NULL,
	[visit_location_id] [bigint] NULL,
	[referer] [nvarchar](1024) NULL,
	[date] [datetime2](6) NOT NULL,
	[remote_addr] [nvarchar](256) NULL,
	[user_agent] [nvarchar](512) NULL,
	[visited_url] [nvarchar](2048) NULL,
	[type] [nvarchar](255) NOT NULL,
	[potential_bot] [bit] NOT NULL,
	[extra_path] [nvarchar](2048) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[visits] ADD  CONSTRAINT [DF_444839EA_C6BC6F14]  DEFAULT ('0') FOR [potential_bot]
GO

ALTER TABLE [dbo].[visits]  WITH CHECK ADD  CONSTRAINT [FK_444839EA8297882E] FOREIGN KEY([visit_location_id])
REFERENCES [dbo].[visit_locations] ([id])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[visits] CHECK CONSTRAINT [FK_444839EA8297882E]
GO

ALTER TABLE [dbo].[visits]  WITH CHECK ADD  CONSTRAINT [FK_444839EAF1252BC8] FOREIGN KEY([short_url_id])
REFERENCES [dbo].[short_urls] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[visits] CHECK CONSTRAINT [FK_444839EAF1252BC8]
GO

--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(DC2Type:chronos_datetime)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'visits', @level2type=N'COLUMN',@level2name=N'date'
--GO


