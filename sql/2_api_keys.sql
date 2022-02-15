USE [DB]
GO

/****** Object:  Table [dbo].[api_keys]    Script Date: 25/11/2021 09:16:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[api_keys](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[key] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[expiration_date] [datetime2](6) NULL,
	[enabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(DC2Type:chronos_datetime)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'api_keys', @level2type=N'COLUMN',@level2name=N'expiration_date'
--GO


