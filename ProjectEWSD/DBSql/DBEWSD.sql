USE [master]
GO
/****** Object:  Database [EWSD]    Script Date: 12/04/2016 2:30:53 CH ******/
CREATE DATABASE [EWSD]
GO

USE [EWSD]
GO
/****** Object:  StoredProcedure [dbo].[checkLoginAll]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[checkLoginAll]
@id nvarchar(30),
@pass nvarchar(30)
AS
	BEGIN
		Select * from Employee WHERE ID = @id AND Pass = @pass
	END


GO
/****** Object:  StoredProcedure [dbo].[deleteEmpByID]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[deleteEmpByID]
@username nvarchar(30)
AS
	BEGIN
		Delete From Employee WHERE ID = @username
	END


GO
/****** Object:  StoredProcedure [dbo].[deleteRP]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteRP]
@number int
AS
	BEGIN
		Delete from Report WHERE NumberID = @number
	END


GO
/****** Object:  StoredProcedure [dbo].[InsertCMR]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertCMR]
@cmrKey nvarchar(10),
@idCheck nvarchar(30),
@status nvarchar(10),
@date date
AS
	BEGIN
		Insert into CMRtable(CMRKey,IdEmpCk,StatusCMR,StartDate) values(@cmrKey,@idCheck,@status,@date)
	END


GO
/****** Object:  StoredProcedure [dbo].[InsertCourse]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[InsertCourse]
@cmrKey nvarchar(10),
@IdCL nvarchar(30),
@scheID nvarchar(30)
AS
	BEGIN
		Insert into CourseCode(CMRKey,IdCL,ScheduleID) values(@cmrKey,@IdCL,@scheID)
	END


GO
/****** Object:  StoredProcedure [dbo].[InsertNewStaff]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[InsertNewStaff]
@user nvarchar(30),
@pass nvarchar(30),
@name nvarchar(30),
@email nvarchar(30),
@age int,
@position nvarchar(10)
AS
	BEGIN
		Insert into Employee(ID,Pass,Fullname,Email,Age,Position) values(@user,@pass,@name,@email,@age,@position);
	END


GO
/****** Object:  StoredProcedure [dbo].[InsertRP]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertRP]
@title nvarchar(30),
@typeRP nvarchar(30),
@content nvarchar(MAX),
@date date,
@status nvarchar(30),
@email nvarchar(30),
@user nvarchar(30)
AS
	BEGIN
		Insert into Report(Title,TypeRP,Content,DateRP,StatusRP,UserEmail,IDWrite) values(@title,@typeRP,@content,@date,@status,@email,@user)
	END


GO
/****** Object:  StoredProcedure [dbo].[InsertSchedule]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertSchedule]
@scheID nvarchar(30),
@factulie nvarchar(10),
@specID nvarchar(10),
@teachID nvarchar(30),
@dateStart date,
@dateEnd date
AS
	BEGIN
		Insert into Schedule(ScheduleID,FacultieID,SpecID,IDTeacher,DateStart,DateEnd) values(@scheID,@factulie,@specID,@teachID,@dateStart,@dateEnd)
	END


GO
/****** Object:  StoredProcedure [dbo].[ShowMesseageCL]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC ShowMesseagePublic
@status nvarchar(30)
AS
	BEGIN
		Select * from Schedule cmrtb  JOIN CourseCode crs 
		ON cmrtb.ScheduleID = crs.ScheduleID
		JOIN CMRtable ON crs.CMRKey = CMRtable.CMRKey 
		WHERE CMRtable.StatusCMR = @status
	END
GO


/****** Object:  StoredProcedure [dbo].[showprofile]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[showprofile]
@username nvarchar(30)
AS
Begin
Select * from Employee WHERE ID = @username
End

GO
/****** Object:  StoredProcedure [dbo].[ShowReportByEmail]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowReportByEmail]
@email nvarchar(30)
AS
	BEGIN
		Select * from Report rp INNER JOIN Employee emp 
		ON rp.IDWrite = emp.ID
		WHERE UserEmail = @email
	END


GO
/****** Object:  StoredProcedure [dbo].[ShowReportByEmailPVCDLT]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowReportByEmailPVCDLT]
@email nvarchar(30),
@type nvarchar(30)
AS
	BEGIN
		Select * from Report rp INNER JOIN Employee emp 
		ON rp.IDWrite = emp.ID
		WHERE UserEmail = @email AND TypeRP = @type
	END


GO
/****** Object:  StoredProcedure [dbo].[ShowReportByID]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowReportByID]
@id nvarchar(30)
AS
	BEGIN
		Select * from Report WHERE IDWrite = @id
	END


GO
/****** Object:  StoredProcedure [dbo].[ShowReportByNumberID]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowReportByNumberID]
@number int
AS
	BEGIN
		Select * from Report WHERE NumberID = @number
	END


GO
/****** Object:  StoredProcedure [dbo].[ShowSubjectCheck]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ShowSubjectCheck]
@user nvarchar(30)
AS
	BEGIN
		Select * from Schedule cmrtb  JOIN CourseCode crs 
		ON cmrtb.ScheduleID = crs.ScheduleID
		JOIN CMRtable ON crs.CMRKey = CMRtable.CMRKey 
		WHERE CMRtable.IdEmpCk = @user
	END


GO
/****** Object:  StoredProcedure [dbo].[ShowSubjectInfo]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowSubjectInfo]
@cmrKey nvarchar(10)
AS
	BEGIN
		Select * from Schedule cmrtb  JOIN CourseCode crs 
		ON cmrtb.ScheduleID = crs.ScheduleID
		JOIN CMRtable ON crs.CMRKey = CMRtable.CMRKey 
		WHERE crs.CMRKey = @cmrKey
	END


GO
/****** Object:  StoredProcedure [dbo].[UpdateCMRtable]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateCMRtable]
@cmrkey nvarchar(10),
@ckCM bit,
@ckDLT bit,
@ckPVC bit,
@idEmpCk nvarchar(30),
@status nvarchar(10),
@date date
AS
	BEGIN
		UPDATE CMRtable
		SET CM = @ckCM , DLT = @ckDLT , PVCs = @ckPVC , IdEmpCk  = @idEmpCk , StatusCMR = @status , StartDate = @date
		WHERE CMRKey = @cmrkey
	ENd


GO
/****** Object:  StoredProcedure [dbo].[UpdateRP]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateRP]
@title nvarchar(30),
@typeRP nvarchar(30),
@content nvarchar(MAX),
@date date,
@status nvarchar(30),
@email nvarchar(30),
@id int
AS
	BEGIN
		UPDATE Report
		SET Title = @title, TypeRP = @typeRP, Content = @content, DateRP = @date, StatusRP = @status, UserEmail = @email
		WHERE NumberID = @id
	END


GO
/****** Object:  Table [dbo].[CMRtable]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMRtable](
	[NumberID] [int] IDENTITY(1,1) NOT NULL,
	[CMRKey] [nvarchar](10) NOT NULL,
	[CM] [bit] NULL,
	[DLT] [bit] NULL,
	[PVCs] [bit] NULL,
	[IdEmpCk] [nvarchar](30) NOT NULL,
	[StatusCMR] [nvarchar](10) NOT NULL,
	[StartDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseCode]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCode](
	[CMRKey] [nvarchar](10) NOT NULL,
	[IdCL] [nvarchar](30) NOT NULL,
	[ScheduleID] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CMRKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [nvarchar](30) NOT NULL,
	[Pass] [nvarchar](max) NOT NULL,
	[Fullname] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Age] [int] NULL,
	[Position] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facultie]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facultie](
	[FacultieID] [nvarchar](10) NOT NULL,
	[FacultieName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FacultieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manager]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [nvarchar](30) NOT NULL,
	[Pass] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[NumberID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[TypeRP] [nvarchar](30) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[DateRP] [date] NULL,
	[StatusRP] [nvarchar](30) NULL,
	[UserEmail] [nvarchar](30) NOT NULL,
	[IDWrite] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [nvarchar](30) NOT NULL,
	[FacultieID] [nvarchar](10) NOT NULL,
	[SpecID] [nvarchar](10) NOT NULL,
	[IDTeacher] [nvarchar](30) NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialize]    Script Date: 12/04/2016 2:30:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialize](
	[SpecID] [nvarchar](10) NOT NULL,
	[SpecName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Employee] ([ID], [Pass], [Fullname], [Email], [Age], [Position]) VALUES (N'usernameCL1', N'e10adc3949ba59abbe56e057f20f88', N'Amani Bosco', N'Clovis@gmail.com', 30, N'CL')
INSERT [dbo].[Employee] ([ID], [Pass], [Fullname], [Email], [Age], [Position]) VALUES (N'usernameCL2', N'e10adc3949ba59abbe56e057f20f88', N'Colten Bergstrom', N'Hertha@gmail.com', 31, N'CL')
INSERT [dbo].[Employee] ([ID], [Pass], [Fullname], [Email], [Age], [Position]) VALUES (N'usernameCM', N'e10adc3949ba59abbe56e057f20f88', N'Dolly Thiel', N'Hertha@gmail.com', 37, N'CM')
INSERT [dbo].[Employee] ([ID], [Pass], [Fullname], [Email], [Age], [Position]) VALUES (N'usernameDLT', N'e10adc3949ba59abbe56e057f20f88', N'Sedrick Swaniawski', N'Allene.Gerlach@gmail.com', 41, N'DLT')
INSERT [dbo].[Employee] ([ID], [Pass], [Fullname], [Email], [Age], [Position]) VALUES (N'usernamePVC', N'e10adc3949ba59abbe56e057f20f88', N'Burdette Watsica', N'Destinee.Windler@gmail.com', 56, N'PVC')
INSERT [dbo].[Employee] ([ID], [Pass], [Fullname], [Email], [Age], [Position]) VALUES (N'usernameTea1', N'e10adc3949ba59abbe56e057f20f88', N'Crawford Stokes', N'Zachary@gmail.com', 27, N'Teacher')
INSERT [dbo].[Employee] ([ID], [Pass], [Fullname], [Email], [Age], [Position]) VALUES (N'usernameTea2', N'e10adc3949ba59abbe56e057f20f88', N'Precious Lueilwitz', N'Addison.Kuhn@gmail.com', 26, N'Teacher')
INSERT [dbo].[Employee] ([ID], [Pass], [Fullname], [Email], [Age], [Position]) VALUES (N'usernameTea3', N'e10adc3949ba59abbe56e057f20f88', N'Raegan Bashirian', N'Greyson@gmail.com', 28, N'Teacher')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'AA008', N'Accounting and Auditing')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'BA007', N'Business Administration')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'BB003', N'Biology - Biotechnology')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'CT005', N'Construct')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'EEA002', N'Electrical Engineering')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'ET004', N'Environment')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'FB009', N'Financial banking')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'IT006', N'Information technology')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'LW001', N'Law')
INSERT [dbo].[Facultie] ([FacultieID], [FacultieName]) VALUES (N'SSH010', N'Social Sciences & Humanities')
INSERT [dbo].[Manager] ([ID], [Pass]) VALUES (N'admin', N'admin123')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'AS004', N'Earth Sciences')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'AT009', N'Math')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'AY003', N'Astronomy')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'ES005', N'Software')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'FE001', N'Finance')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'MG002', N'Marketing')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'MH008', N'Materials science')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'MS007', N'Science Foundation')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'SE010', N'Accountant')
INSERT [dbo].[Specialize] ([SpecID], [SpecName]) VALUES (N'SF006', N'Environmental science')
ALTER TABLE [dbo].[Report] ADD  DEFAULT (getdate()) FOR [DateRP]
GO
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT (getdate()) FOR [DateStart]
GO
ALTER TABLE [dbo].[CMRtable]  WITH CHECK ADD  CONSTRAINT [Fk1_CMRKey] FOREIGN KEY([CMRKey])
REFERENCES [dbo].[CourseCode] ([CMRKey])
GO
ALTER TABLE [dbo].[CMRtable] CHECK CONSTRAINT [Fk1_CMRKey]
GO
ALTER TABLE [dbo].[CMRtable]  WITH CHECK ADD  CONSTRAINT [Fk1_IdEmpCk_CMRKey] FOREIGN KEY([IdEmpCk])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[CMRtable] CHECK CONSTRAINT [Fk1_IdEmpCk_CMRKey]
GO
ALTER TABLE [dbo].[CourseCode]  WITH CHECK ADD  CONSTRAINT [Fk_ScheduleID] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
GO
ALTER TABLE [dbo].[CourseCode] CHECK CONSTRAINT [Fk_ScheduleID]
GO
ALTER TABLE [dbo].[CourseCode]  WITH CHECK ADD  CONSTRAINT [Fk1_ID] FOREIGN KEY([IdCL])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[CourseCode] CHECK CONSTRAINT [Fk1_ID]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [Fk4_ID] FOREIGN KEY([IDWrite])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [Fk4_ID]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [Fk_FacultieID] FOREIGN KEY([FacultieID])
REFERENCES [dbo].[Facultie] ([FacultieID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [Fk_FacultieID]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [Fk_ID] FOREIGN KEY([IDTeacher])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [Fk_ID]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [Fk_SpecID] FOREIGN KEY([SpecID])
REFERENCES [dbo].[Specialize] ([SpecID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [Fk_SpecID]
GO
USE [master]
GO
ALTER DATABASE [EWSD] SET  READ_WRITE 
GO
