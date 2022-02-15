USE [DB]
GO

/****** Object:  Table [dbo].[short_urls]    Script Date: 25/11/2021 09:17:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[short_urls](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[domain_id] [bigint] NULL,
	[author_api_key_id] [bigint] NULL,
	[original_url] [nvarchar](2048) NOT NULL,
	[short_code] [nvarchar](255) NOT NULL,
	[date_created] [datetime2](6) NOT NULL,
	[valid_since] [datetime2](6) NULL,
	[valid_until] [datetime2](6) NULL,
	[max_visits] [int] NULL,
	[import_source] [nvarchar](255) NULL,
	[import_original_short_code] [nvarchar](255) NULL,
	[title] [nvarchar](512) NULL,
	[title_was_auto_resolved] [bit] NOT NULL,
	[crawlable] [bit] NOT NULL,
	[forward_query] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[short_urls] ADD  CONSTRAINT [DF_4A53F934_A27DA1CB]  DEFAULT ('0') FOR [title_was_auto_resolved]
GO

ALTER TABLE [dbo].[short_urls] ADD  CONSTRAINT [DF_4A53F934_36EFE112]  DEFAULT ('0') FOR [crawlable]
GO

ALTER TABLE [dbo].[short_urls] ADD  CONSTRAINT [DF_4A53F934_8CAC5683]  DEFAULT ('1') FOR [forward_query]
GO

ALTER TABLE [dbo].[short_urls]  WITH CHECK ADD  CONSTRAINT [FK_4A53F934115F0EE5] FOREIGN KEY([domain_id])
REFERENCES [dbo].[domains] ([id])
GO

ALTER TABLE [dbo].[short_urls] CHECK CONSTRAINT [FK_4A53F934115F0EE5]
GO

ALTER TABLE [dbo].[short_urls]  WITH CHECK ADD  CONSTRAINT [FK_4A53F934C9EA6E08] FOREIGN KEY([author_api_key_id])
REFERENCES [dbo].[api_keys] ([id])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[short_urls] CHECK CONSTRAINT [FK_4A53F934C9EA6E08]
GO

--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(DC2Type:chronos_datetime)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'short_urls', @level2type=N'COLUMN',@level2name=N'date_created'
--GO

--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(DC2Type:chronos_datetime)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'short_urls', @level2type=N'COLUMN',@level2name=N'valid_since'
--GO

--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(DC2Type:chronos_datetime)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'short_urls', @level2type=N'COLUMN',@level2name=N'valid_until'
--GO


