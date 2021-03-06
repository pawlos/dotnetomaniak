CREATE DATABASE KiGG
GO

USE KiGG
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Password] [nvarchar](64) NULL,
	[Email] [nvarchar](256) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[Role] [int] NOT NULL,
	[LastActivityAt] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_User_Email] ON [dbo].[User] 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_User_LastActivityAt] ON [dbo].[User] 
(
	[LastActivityAt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_User_Role] ON [dbo].[User] 
(
	[Role] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KnownSource]    Script Date: 02/04/2009 02:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KnownSource](
	[Url] [nvarchar](450) NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_KnownSource] PRIMARY KEY CLUSTERED 
(
	[Url] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02/04/2009 02:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[UniqueName] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Category_UniqueName_CreatedAt] ON [dbo].[Category] 
(
	[UniqueName] ASC,
	[CreatedAt] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 02/04/2009 02:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [uniqueidentifier] NOT NULL,
	[UniqueName] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tag_Name] ON [dbo].[Tag] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tag_UniqueName_CreatedAat] ON [dbo].[Tag] 
(
	[UniqueName] ASC,
	[CreatedAt] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Story]    Script Date: 02/04/2009 02:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Story](
	[Id] [uniqueidentifier] NOT NULL,
	[UniqueName] [nvarchar](256) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[HtmlDescription] [nvarchar](max) NOT NULL,
	[TextDescription] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](2048) NOT NULL,
	[UrlHash] [nchar](24) NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IPAddress] [varchar](15) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[LastActivityAt] [datetime] NOT NULL,
	[ApprovedAt] [datetime] NULL,
	[PublishedAt] [datetime] NULL,
	[Rank] [int] NULL,
	[LastProcessedAt] [datetime] NULL,
 CONSTRAINT [PK_Story] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Story_ApprovedAt_PublishedAt_Rank_CreatedAt_LastActivityAt] ON [dbo].[Story] 
(
	[ApprovedAt] DESC,
	[PublishedAt] DESC,
	[Rank] ASC,
	[CreatedAt] DESC,
	[LastActivityAt] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Story_CategoryId] ON [dbo].[Story] 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Story_LastProcessedAt] ON [dbo].[Story] 
(
	[LastProcessedAt] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Story_UniqueName] ON [dbo].[Story] 
(
	[UniqueName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Story_UrlHash] ON [dbo].[Story] 
(
	[UrlHash] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Story_UserId] ON [dbo].[Story] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentSubscribtion]    Script Date: 02/04/2009 02:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentSubscribtion](
	[StoryId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CommentSubscribtion] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserScore]    Script Date: 02/04/2009 02:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserScore](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[ActionType] [int] NOT NULL,
	[Score] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_UserScore] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_UserScore_UserId_Timestamp_Score] ON [dbo].[UserScore] 
(
	[UserId] ASC,
	[Timestamp] DESC,
	[Score] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoryVote]    Script Date: 02/04/2009 02:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoryVote](
	[StoryId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IPAddress] [varchar](15) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_StoryVote] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoryComment]    Script Date: 02/04/2009 02:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoryComment](
	[Id] [uniqueidentifier] NOT NULL,
	[HtmlBody] [nvarchar](max) NOT NULL,
	[TextBody] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[StoryId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IPAddress] [varchar](15) NOT NULL,
	[IsOffended] [bit] NOT NULL,
 CONSTRAINT [PK_StoryComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_StoryComment_StoryId_CreatedAt] ON [dbo].[StoryComment] 
(
	[StoryId] ASC,
	[CreatedAt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StoryComment_UserId] ON [dbo].[StoryComment] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTag]    Script Date: 02/04/2009 02:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTag](
	[UserId] [uniqueidentifier] NOT NULL,
	[TagId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserTag] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoryMarkAsSpam]    Script Date: 02/04/2009 02:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoryMarkAsSpam](
	[StoryId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IPAddress] [varchar](15) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_StoryMarkAsSpam] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoryTag]    Script Date: 02/04/2009 02:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoryTag](
	[StoryId] [uniqueidentifier] NOT NULL,
	[TagId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_StoryTag] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoryView]    Script Date: 02/04/2009 02:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoryView](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoryId] [uniqueidentifier] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[IPAddress] [varchar](15) NOT NULL,
 CONSTRAINT [PK_View] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [IX_StoryView_StoryId_Timestamp_IpAddress] ON [dbo].[StoryView] 
(
	[StoryId] ASC,
	[Timestamp] DESC,
	[IPAddress] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_CommentSubscribtion_Story]    Script Date: 02/04/2009 02:27:29 ******/
ALTER TABLE [dbo].[CommentSubscribtion]  WITH CHECK ADD  CONSTRAINT [FK_CommentSubscribtion_Story] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Story] ([Id])
GO
ALTER TABLE [dbo].[CommentSubscribtion] CHECK CONSTRAINT [FK_CommentSubscribtion_Story]
GO
/****** Object:  ForeignKey [FK_CommentSubscribtion_User]    Script Date: 02/04/2009 02:27:29 ******/
ALTER TABLE [dbo].[CommentSubscribtion]  WITH CHECK ADD  CONSTRAINT [FK_CommentSubscribtion_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[CommentSubscribtion] CHECK CONSTRAINT [FK_CommentSubscribtion_User]
GO
/****** Object:  ForeignKey [FK_Story_Category]    Script Date: 02/04/2009 02:27:36 ******/
ALTER TABLE [dbo].[Story]  WITH CHECK ADD  CONSTRAINT [FK_Story_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Story] CHECK CONSTRAINT [FK_Story_Category]
GO
/****** Object:  ForeignKey [FK_Story_User]    Script Date: 02/04/2009 02:27:36 ******/
ALTER TABLE [dbo].[Story]  WITH CHECK ADD  CONSTRAINT [FK_Story_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Story] CHECK CONSTRAINT [FK_Story_User]
GO
/****** Object:  ForeignKey [FK_StoryComment_Story]    Script Date: 02/04/2009 02:27:39 ******/
ALTER TABLE [dbo].[StoryComment]  WITH CHECK ADD  CONSTRAINT [FK_StoryComment_Story] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Story] ([Id])
GO
ALTER TABLE [dbo].[StoryComment] CHECK CONSTRAINT [FK_StoryComment_Story]
GO
/****** Object:  ForeignKey [FK_StoryComment_User]    Script Date: 02/04/2009 02:27:40 ******/
ALTER TABLE [dbo].[StoryComment]  WITH CHECK ADD  CONSTRAINT [FK_StoryComment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StoryComment] CHECK CONSTRAINT [FK_StoryComment_User]
GO
/****** Object:  ForeignKey [FK_StoryMarkAsSpam_Story]    Script Date: 02/04/2009 02:27:41 ******/
ALTER TABLE [dbo].[StoryMarkAsSpam]  WITH CHECK ADD  CONSTRAINT [FK_StoryMarkAsSpam_Story] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Story] ([Id])
GO
ALTER TABLE [dbo].[StoryMarkAsSpam] CHECK CONSTRAINT [FK_StoryMarkAsSpam_Story]
GO
/****** Object:  ForeignKey [FK_StoryMarkAsSpam_User]    Script Date: 02/04/2009 02:27:41 ******/
ALTER TABLE [dbo].[StoryMarkAsSpam]  WITH CHECK ADD  CONSTRAINT [FK_StoryMarkAsSpam_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StoryMarkAsSpam] CHECK CONSTRAINT [FK_StoryMarkAsSpam_User]
GO
/****** Object:  ForeignKey [FK_StoryTag_Story]    Script Date: 02/04/2009 02:27:42 ******/
ALTER TABLE [dbo].[StoryTag]  WITH CHECK ADD  CONSTRAINT [FK_StoryTag_Story] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Story] ([Id])
GO
ALTER TABLE [dbo].[StoryTag] CHECK CONSTRAINT [FK_StoryTag_Story]
GO
/****** Object:  ForeignKey [FK_StoryTag_Tag]    Script Date: 02/04/2009 02:27:42 ******/
ALTER TABLE [dbo].[StoryTag]  WITH CHECK ADD  CONSTRAINT [FK_StoryTag_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[StoryTag] CHECK CONSTRAINT [FK_StoryTag_Tag]
GO
/****** Object:  ForeignKey [FK_StoryView_Story]    Script Date: 02/04/2009 02:27:44 ******/
ALTER TABLE [dbo].[StoryView]  WITH CHECK ADD  CONSTRAINT [FK_StoryView_Story] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Story] ([Id])
GO
ALTER TABLE [dbo].[StoryView] CHECK CONSTRAINT [FK_StoryView_Story]
GO
/****** Object:  ForeignKey [FK_StoryVote_Story]    Script Date: 02/04/2009 02:27:46 ******/
ALTER TABLE [dbo].[StoryVote]  WITH CHECK ADD  CONSTRAINT [FK_StoryVote_Story] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Story] ([Id])
GO
ALTER TABLE [dbo].[StoryVote] CHECK CONSTRAINT [FK_StoryVote_Story]
GO
/****** Object:  ForeignKey [FK_StoryVote_User]    Script Date: 02/04/2009 02:27:46 ******/
ALTER TABLE [dbo].[StoryVote]  WITH CHECK ADD  CONSTRAINT [FK_StoryVote_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StoryVote] CHECK CONSTRAINT [FK_StoryVote_User]
GO
/****** Object:  ForeignKey [FK_UserScore_User]    Script Date: 02/04/2009 02:27:53 ******/
ALTER TABLE [dbo].[UserScore]  WITH CHECK ADD  CONSTRAINT [FK_UserScore_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserScore] CHECK CONSTRAINT [FK_UserScore_User]
GO
/****** Object:  ForeignKey [FK_UserTag_Tag]    Script Date: 02/04/2009 02:27:54 ******/
ALTER TABLE [dbo].[UserTag]  WITH CHECK ADD  CONSTRAINT [FK_UserTag_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[UserTag] CHECK CONSTRAINT [FK_UserTag_Tag]
GO
/****** Object:  ForeignKey [FK_UserTag_User]    Script Date: 02/04/2009 02:27:55 ******/
ALTER TABLE [dbo].[UserTag]  WITH CHECK ADD  CONSTRAINT [FK_UserTag_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserTag] CHECK CONSTRAINT [FK_UserTag_User]
GO
