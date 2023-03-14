USE [master]
GO
/****** Object:  Database [Proba]    Script Date: 15-Mar-23 00:18:39 ******/
CREATE DATABASE [Proba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Proba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Proba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Proba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proba] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proba] SET  MULTI_USER 
GO
ALTER DATABASE [Proba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Proba] SET QUERY_STORE = OFF
GO
USE [Proba]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 15-Mar-23 00:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[studentID] [int] NOT NULL,
	[student_name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[dateOfBirth] [date] NULL,
	[yearOfStudies] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrows]    Script Date: 15-Mar-23 00:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrows](
	[borrowID] [int] NOT NULL,
	[studentID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[date_taken] [date] NOT NULL,
	[date_returned] [date] NULL,
 CONSTRAINT [PK_Borrows] PRIMARY KEY CLUSTERED 
(
	[borrowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 15-Mar-23 00:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[bookID] [int] NOT NULL,
	[book_name] [nvarchar](50) NOT NULL,
	[pageCount] [int] NULL,
	[datePublished] [date] NULL,
	[genre] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 15-Mar-23 00:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT dbo.Students.studentID, dbo.Students.student_name, dbo.Students.surname, dbo.Students.dateOfBirth, dbo.Students.yearOfStudies, dbo.Borrows.borrowID, dbo.Borrows.studentID AS Expr1, dbo.Borrows.bookID, 
                  dbo.Borrows.dateTaken, dbo.Borrows.dateReturned, dbo.Books.bookID AS Expr2, dbo.Books.book_name, dbo.Books.pageCount, dbo.Books.datePublished, dbo.Books.genre
FROM     dbo.Students INNER JOIN
                  dbo.Borrows ON dbo.Students.studentID = dbo.Borrows.studentID INNER JOIN
                  dbo.Books ON dbo.Borrows.bookID = dbo.Books.bookID
GO
INSERT [dbo].[Books] ([bookID], [book_name], [pageCount], [datePublished], [genre]) VALUES (1245, N'the_fellowship_of_the_rings', 479, CAST(N'1954-07-29' AS Date), N'fantasy')
INSERT [dbo].[Books] ([bookID], [book_name], [pageCount], [datePublished], [genre]) VALUES (1225, N'to_kill_a_mockingbird', 384, CAST(N'1988-10-11' AS Date), N'novel')
INSERT [dbo].[Books] ([bookID], [book_name], [pageCount], [datePublished], [genre]) VALUES (1664, N'don_quixote', 1072, CAST(N'1605-01-16' AS Date), N'fantasy')
INSERT [dbo].[Books] ([bookID], [book_name], [pageCount], [datePublished], [genre]) VALUES (1389, N'dune', 412, CAST(N'1965-08-03' AS Date), N'sci-fi')
INSERT [dbo].[Books] ([bookID], [book_name], [pageCount], [datePublished], [genre]) VALUES (1110, N'pride_and_prejudice', 480, CAST(N'2003-12-31' AS Date), N'romance')
GO
INSERT [dbo].[Borrows] ([borrowID], [studentID], [bookID], [date_taken], [date_returned]) VALUES (2000, 102, 1245, CAST(N'2020-04-05' AS Date), CAST(N'2020-07-06' AS Date))
INSERT [dbo].[Borrows] ([borrowID], [studentID], [bookID], [date_taken], [date_returned]) VALUES (2001, 104, 1664, CAST(N'2021-11-07' AS Date), CAST(N'2021-12-07' AS Date))
INSERT [dbo].[Borrows] ([borrowID], [studentID], [bookID], [date_taken], [date_returned]) VALUES (2002, 103, 1389, CAST(N'2022-02-02' AS Date), CAST(N'2022-03-02' AS Date))
INSERT [dbo].[Borrows] ([borrowID], [studentID], [bookID], [date_taken], [date_returned]) VALUES (2003, 101, 1110, CAST(N'2011-11-11' AS Date), CAST(N'2012-12-12' AS Date))
INSERT [dbo].[Borrows] ([borrowID], [studentID], [bookID], [date_taken], [date_returned]) VALUES (2004, 107, 1225, CAST(N'2007-08-09' AS Date), CAST(N'2008-10-09' AS Date))
GO
INSERT [dbo].[Students] ([studentID], [student_name], [surname], [dateOfBirth], [yearOfStudies]) VALUES (101, N'Andrej', N'Apchevski', CAST(N'2001-07-01' AS Date), 3)
INSERT [dbo].[Students] ([studentID], [student_name], [surname], [dateOfBirth], [yearOfStudies]) VALUES (102, N'Petre', N'Petrovski', CAST(N'2000-05-03' AS Date), 4)
INSERT [dbo].[Students] ([studentID], [student_name], [surname], [dateOfBirth], [yearOfStudies]) VALUES (103, N'Angela', N'Angelevska', CAST(N'2003-11-04' AS Date), 1)
INSERT [dbo].[Students] ([studentID], [student_name], [surname], [dateOfBirth], [yearOfStudies]) VALUES (104, N'Simona', N'Simonovska', CAST(N'2002-12-09' AS Date), 2)
INSERT [dbo].[Students] ([studentID], [student_name], [surname], [dateOfBirth], [yearOfStudies]) VALUES (105, N'Nikola', N'Nikolovski', CAST(N'2001-02-07' AS Date), 3)
INSERT [dbo].[Students] ([studentID], [student_name], [surname], [dateOfBirth], [yearOfStudies]) VALUES (106, N'Laze', N'Lazevski', CAST(N'2000-06-06' AS Date), 4)
INSERT [dbo].[Students] ([studentID], [student_name], [surname], [dateOfBirth], [yearOfStudies]) VALUES (107, N'Jovan', N'Jovanovski', CAST(N'2002-04-08' AS Date), 2)
INSERT [dbo].[Students] ([studentID], [student_name], [surname], [dateOfBirth], [yearOfStudies]) VALUES (108, N'Hristina', N'Hristovska', CAST(N'2003-09-05' AS Date), 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Books"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Borrows"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [Proba] SET  READ_WRITE 
GO
