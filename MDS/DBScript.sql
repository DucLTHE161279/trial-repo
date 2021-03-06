USE [SE1611]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/21/2022 3:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[did] [int] NOT NULL,
	[dname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/21/2022 3:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[sname] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
	[did] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Department] ([did], [dname]) VALUES (1, N'Software Engineering')
INSERT [dbo].[Department] ([did], [dname]) VALUES (2, N'Computer Science')
INSERT [dbo].[Department] ([did], [dname]) VALUES (3, N'Information Assurance')
INSERT [dbo].[Student] ([sid], [sname], [gender], [dob], [did]) VALUES (1, N'mr A', 1, CAST(N'2000-01-15' AS Date), 1)
INSERT [dbo].[Student] ([sid], [sname], [gender], [dob], [did]) VALUES (2, N'mr B', 1, CAST(N'2000-01-15' AS Date), 1)
INSERT [dbo].[Student] ([sid], [sname], [gender], [dob], [did]) VALUES (3, N'ms CCCC', 0, CAST(N'2000-03-21' AS Date), 2)
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
