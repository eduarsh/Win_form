USE [ProjectOne]
GO
/****** Object:  StoredProcedure [dbo].[spu_areaCheck]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	check if area exist
-- =============================================
CREATE PROCEDURE  [dbo].[spu_areaCheck]
	-- Add the parameters for the stored procedure here
	@ar nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	SELECT areas FROM Areas WHERE areas = @ar AND mode = 1
END

GO
/****** Object:  StoredProcedure [dbo].[spu_areaInsert]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	insert new area
-- =============================================
CREATE PROCEDURE [dbo].[spu_areaInsert]
	-- Add the parameters for the stored procedure here
	@area nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	insert into Areas(areas)
	values(@area) 
END

GO
/****** Object:  StoredProcedure [dbo].[spu_courseCheck]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	check if course exists in DB
-- =============================================
CREATE PROCEDURE [dbo].[spu_courseCheck] 
	-- Add the parameters for the stored procedure here
	@cn nvarchar(50),
	@ar nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Courses WHERE courseName = @cn AND area = @ar AND mode = 1
END

GO
/****** Object:  StoredProcedure [dbo].[spu_coursesActivity]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard
-- Create date: 27/12/14
-- Description:	filling DropList from DB
-- =============================================
CREATE PROCEDURE [dbo].[spu_coursesActivity]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PKid, areas FROM Areas WHERE mode = 1
	SELECT PKid, lastName+' '+firstName AS name FROM  UsersDetails WHERE mode = 1

END

GO
/****** Object:  StoredProcedure [dbo].[spu_getAreas]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	Return all areas from DB
-- =============================================
CREATE PROCEDURE [dbo].[spu_getAreas]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PKid, areas FROM Areas WHERE mode = 1
END

GO
/****** Object:  StoredProcedure [dbo].[spu_getCourseDitail]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman	
-- Create date: 26/12/14
-- Description:	Return syllabuss and course price of corect course from DB 
-- =============================================
CREATE PROCEDURE [dbo].[spu_getCourseDitail]
	-- Add the parameters for the stored procedure here
	@pk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	SELECT [syllabus] ,[coursePrice] FROM Courses WHERE PKid = @pk
END

GO
/****** Object:  StoredProcedure [dbo].[spu_getCourses]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	Return PKid and Course Name to fill 
-- =============================================
CREATE PROCEDURE [dbo].[spu_getCourses]
	-- Add the parameters for the stored procedure here
	@ar nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PKid , courseName FROM Courses WHERE area = @ar AND mode = 1
END

GO
/****** Object:  StoredProcedure [dbo].[spu_getDitailse]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	Return ditails of User
-- =============================================
CREATE PROCEDURE [dbo].[spu_getDitailse] 
	-- Add the parameters for the stored procedure here
	@pk int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

   SELECT
		[PKid]
		,[firstName]
		 ,[lastName]
		 ,[idNum]
		 ,[email]
		 ,[userName]
		 ,[userCode]
		 ,[pass]
		 ,[area]
		 ,[permition]
		 
	FROM UsersDetails
	WHERE PKid = @pk
	


END

GO
/****** Object:  StoredProcedure [dbo].[spu_getPermition]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	Return permition of User
-- =============================================
CREATE PROCEDURE [dbo].[spu_getPermition]
	-- Add the parameters for the stored procedure here
	@un nvarchar(50),
	@uc nvarchar(50),
	@password nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [permition] FROM UsersDetails
	WHERE userName = @un AND userCode = @uc AND pass = @password 

END

GO
/****** Object:  StoredProcedure [dbo].[spu_getUser]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard
-- Create date: 27/12/14
-- Description:	Return PKid And Firs name and Last name of User
-- =============================================
CREATE PROCEDURE [dbo].[spu_getUser]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PKid, lastName+' '+firstName AS name FROM  UsersDetails WHERE mode = 1
END

GO
/****** Object:  StoredProcedure [dbo].[spu_getUserCheck]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard
-- Create date: 24/12/14
-- Description:	checking if user exists in DB
-- =============================================
CREATE PROCEDURE [dbo].[spu_getUserCheck]
	-- Add the parameters for the stored procedure here
	@un nvarchar(50),
	@pas nvarchar(50)
	--@result int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM UsersDetails WHERE userName = @un
	UNION
	SELECT * FROM UsersDetails WHERE idNum = @pas
END

GO
/****** Object:  StoredProcedure [dbo].[spu_getUserDitailse]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 15/12/14
-- Description:	spu will return Course area , number of courses and total price of all courses of sellected user.
-- =============================================
CREATE PROCEDURE [dbo].[spu_getUserDitailse]
	-- Add the parameters for the stored procedure here
	@pk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	SELECT ud.[area],COUNT(uc.[userID]) AS CountCourses 
		FROM UsersDetails ud , User_Courses uc WHERE ud.PKid = @pk AND uc.userID = (SELECT idNum FROM UsersDetails WHERE PKid = @pk)
		GROUP BY ud.area
END	
BEGIN	
	SELECT SUM([coursePrice]) AS TotalPrice FROM Courses WHERE PKid IN (SELECT courseID FROM User_Courses WHERE userID = (SELECT idNum FROM UsersDetails WHERE PKid = @pk))
END
BEGIN
	SELECT [area] FROM UsersDetails WHERE PKid = @pk 
END
BEGIN
	SELECT PKid  ,courseName FROM Courses WHERE area IN( SELECT area FROM UsersDetails WHERE PKid = @pk)
END
	

GO
/****** Object:  StoredProcedure [dbo].[spu_login]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: <27/12/14
-- Description:	Check if User exists in AdminUser DB 
-- =============================================
CREATE PROCEDURE [dbo].[spu_login]
	-- Add the parameters for the stored procedure here
	@username nvarchar(50),
	@usercode nvarchar(50),
	@userpass nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT *
	FROM AdminUsers 
	WHERE userCode = @usercode AND userName = @username AND pass = @userpass
END

GO
/****** Object:  StoredProcedure [dbo].[spu_loginTo]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard SHuhman
-- Create date: 27/12/14
-- Description:	Check if User exists in User DB
-- =============================================
CREATE PROCEDURE [dbo].[spu_loginTo]
	-- Add the parameters for the stored procedure here
	@username nvarchar(50),
	@usercode nvarchar(50),
	@userpass nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT
		[permition]

		FROM UsersDetails
		WHERE userCode = @usercode AND userName = @username AND pass = @userpass

END


GO
/****** Object:  StoredProcedure [dbo].[spu_newCourse]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 25/12/14
-- Description:	insert new course to DB
-- =============================================
CREATE PROCEDURE [dbo].[spu_newCourse] 
	-- Add the parameters for the stored procedure here
	@cn nvarchar(50),
	@cp float,
	@ar nvarchar(50),
	@syl nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements

    -- Insert statements for procedure here
	insert into Courses(courseName,coursePrice,area,syllabus)
	values(@cn,@cp,@ar,@syl)
END

GO
/****** Object:  StoredProcedure [dbo].[spu_newUser]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 08/12/2014
-- Description:	insert to User data base new student or worker.
-- =============================================
CREATE PROCEDURE [dbo].[spu_newUser]
	-- Add the parameters for the stored procedure here
	@fn nvarchar(50),
	@ln nvarchar(50),
	@id char(9),
	@areas nvarchar(50),
	@email nvarchar(50),
	@un nvarchar(50),
	@uc nvarchar(50),
	@pass nvarchar(50),
	@perm int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	insert into UsersDetails(firstName,lastName,idNum,email,userName,userCode,pass,area,permition)
	values(@fn,@ln,@id,@email,@un,@uc,@pass,@areas,@perm)

	BEGIN
	IF (SELECT COUNT(*) FROM AdminUsers)>0
		DELETE FROM AdminUsers
	END
END

GO
/****** Object:  StoredProcedure [dbo].[spu_setUpdateUser]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	Update parametrs of exists User
-- =============================================
CREATE PROCEDURE [dbo].[spu_setUpdateUser]
	-- Add the parameters for the stored procedure here
	@fn nvarchar(50),
	@ln nvarchar(50),
	@id nvarchar(50),
	@mail nvarchar(50),
	@password nvarchar(50),
	@perm int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	UPDATE UsersDetails
		SET firstName = @fn ,lastName = @ln , email = @mail , pass = @password , permition = @perm
		WHERE idNum = @id
		 
END

GO
/****** Object:  StoredProcedure [dbo].[spu_setUserCourses]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 26/12/14
-- Description:	Insert to DB User_Courses
-- =============================================
CREATE PROCEDURE [dbo].[spu_setUserCourses]
	-- Add the parameters for the stored procedure here
	@uID char(9),
	@pk int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT userID FROM User_Courses WHERE userID =@uID and courseID = @pk )
		BEGIN 
				insert into User_Courses(userID , courseID)
				values(@uID,@pk)
				
			END

END

GO
/****** Object:  StoredProcedure [dbo].[spu_userCodeUpdate]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman	
-- Create date: 15/12/14
-- Description:	spu will update sStudent user code
-- =============================================
CREATE PROCEDURE [dbo].[spu_userCodeUpdate]
	-- Add the parameters for the stored procedure here
	@un nvarchar(50),
	@newUc nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	UPDATE UsersDetails
	SET userCode = @newUc
	WHERE userName = @un
END

GO
/****** Object:  StoredProcedure [dbo].[spu_userDit]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	Return user ditails
-- =============================================
CREATE PROCEDURE [dbo].[spu_userDit]
	-- Add the parameters for the stored procedure here
	@un nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		[firstName]
		 ,[lastName]
		 ,[idNum]
		 ,[email]
		 ,[userName]
		 ,[userCode]
		 ,[area]
		 ,[PKid]
		 
	FROM UsersDetails
	WHERE userName = @un
END

GO
/****** Object:  StoredProcedure [dbo].[spu_userNameUpdate]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 27/12/14
-- Description:	Upadate User Name parameter
-- =============================================
CREATE PROCEDURE [dbo].[spu_userNameUpdate]
	-- Add the parameters for the stored procedure here
	@un nvarchar(50),
	@newun nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT userName FROM UsersDetails WHERE userName = @newun)
		BEGIN
			UPDATE UsersDetails
			SET userName = @newun
			WHERE userName = @un
		END
END

GO
/****** Object:  StoredProcedure [dbo].[spu_userPassUpdate]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman	
-- Create date: 15/12/14	
-- Description:	spu will change Student ures password
-- =============================================
CREATE PROCEDURE [dbo].[spu_userPassUpdate] 
	-- Add the parameters for the stored procedure here
	@un nvarchar(50),
	@oldpass nvarchar(50),
	@newpass nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	UPDATE UsersDetails
	SET pass = @newpass
	WHERE userName = @un AND pass = @oldpass
END

GO
/****** Object:  StoredProcedure [dbo].[spu_userSelectCourse]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eduard Shuhman
-- Create date: 26/12/14
-- Description:	Return Course Name , Syllabus , Course Price from Courses DB
-- =============================================
CREATE PROCEDURE [dbo].[spu_userSelectCourse] 
	-- Add the parameters for the stored procedure here
	@courseA nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	SELECT 
	[courseName]
	,[syllabus]
	,[coursePrice]

	FROM Courses 
	WHERE area = @courseA AND mode = 1

END

GO
/****** Object:  Table [dbo].[AdminUsers]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUsers](
	[PKid] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userCode] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AdminUsers] PRIMARY KEY CLUSTERED 
(
	[PKid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Areas]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[PKid] [int] IDENTITY(1,1) NOT NULL,
	[areas] [nvarchar](50) NOT NULL,
	[mode] [bit] NOT NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[PKid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[PKid] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [nvarchar](50) NOT NULL,
	[coursePrice] [int] NOT NULL,
	[area] [nvarchar](50) NOT NULL,
	[syllabus] [nvarchar](50) NOT NULL,
	[mode] [bit] NOT NULL,
	[createDay] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[PKid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Courses]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Courses](
	[userID] [char](9) NOT NULL,
	[courseID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersDetails]    Script Date: 27/12/2014 21:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersDetails](
	[PKid] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[idNum] [char](9) NOT NULL,
	[email] [nvarchar](50) NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userCode] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
	[area] [nvarchar](50) NOT NULL,
	[permition] [int] NOT NULL,
	[mode] [bit] NOT NULL,
	[createDay] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_UsersDetails] PRIMARY KEY CLUSTERED 
(
	[PKid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AdminUsers] ON 

INSERT [dbo].[AdminUsers] ([PKid], [userName], [userCode], [pass]) VALUES (9, N'eduard', N'ed1111', N'cNbrrrlN6PD8/oLsFx9AYswpYH8=')
SET IDENTITY_INSERT [dbo].[AdminUsers] OFF
ALTER TABLE [dbo].[Areas] ADD  CONSTRAINT [DF_Areas_mode]  DEFAULT ((1)) FOR [mode]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_mode]  DEFAULT ((1)) FOR [mode]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_createDay]  DEFAULT (getdate()) FOR [createDay]
GO
ALTER TABLE [dbo].[UsersDetails] ADD  CONSTRAINT [DF_UsersDetails_mode]  DEFAULT ((1)) FOR [mode]
GO
ALTER TABLE [dbo].[UsersDetails] ADD  CONSTRAINT [DF_UsersDetails_createDay]  DEFAULT (getdate()) FOR [createDay]
GO
