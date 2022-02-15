USE [DB]
GO

/****** Object:  Table [dbo].[short_urls_in_tags]    Script Date: 25/11/2021 09:17:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[short_urls_in_tags](
	[short_url_id] [bigint] NOT NULL,
	[tag_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[short_url_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[short_urls_in_tags]  WITH CHECK ADD  CONSTRAINT [FK_59775203BAD26311] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tags] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[short_urls_in_tags] CHECK CONSTRAINT [FK_59775203BAD26311]
GO

ALTER TABLE [dbo].[short_urls_in_tags]  WITH CHECK ADD  CONSTRAINT [FK_59775203F1252BC8] FOREIGN KEY([short_url_id])
REFERENCES [dbo].[short_urls] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[short_urls_in_tags] CHECK CONSTRAINT [FK_59775203F1252BC8]
GO


