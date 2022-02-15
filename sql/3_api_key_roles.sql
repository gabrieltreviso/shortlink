USE [DB]
GO

/****** Object:  Table [dbo].[api_key_roles]    Script Date: 25/11/2021 09:15:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[api_key_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[api_key_id] [bigint] NOT NULL,
	[role_name] [nvarchar](255) NOT NULL,
	[meta] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[api_key_roles]  WITH CHECK ADD  CONSTRAINT [FK_29D4F6738BE312B3] FOREIGN KEY([api_key_id])
REFERENCES [dbo].[api_keys] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[api_key_roles] CHECK CONSTRAINT [FK_29D4F6738BE312B3]
GO

--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(DC2Type:json)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'api_key_roles', @level2type=N'COLUMN',@level2name=N'meta'
--GO


