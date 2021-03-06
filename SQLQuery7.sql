﻿/*
Deployment script for C:\USERS\MEHAL K CHAUDHARI\SOURCE\REPOS\ORANGEBOARD\ORANGEBOARD\APP_DATA\ORANGEBOARD.MDF

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "C:\USERS\MEHAL K CHAUDHARI\SOURCE\REPOS\ORANGEBOARD\ORANGEBOARD\APP_DATA\ORANGEBOARD.MDF"
:setvar DefaultFilePrefix "C_\USERS\MEHAL K CHAUDHARI\SOURCE\REPOS\ORANGEBOARD\ORANGEBOARD\APP_DATA\ORANGEBOARD.MDF_"
:setvar DefaultDataPath "C:\Users\Mehal K Chaudhari\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Mehal K Chaudhari\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO

IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO
/*
The column [dbo].[Assignment].[StudentId] on table [dbo].[Assignment] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[Assignment]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Assignment] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [StudentId]  VARCHAR (50) NOT NULL,
    [CourseId]   VARCHAR (50) NOT NULL,
    [Assignment] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Assignment])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Assignment] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Assignment] ([Id], [CourseId], [Assignment])
        SELECT   [Id],
                 [CourseId],
                 [Assignment]
        FROM     [dbo].[Assignment]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Assignment] OFF;
    END

DROP TABLE [dbo].[Assignment];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Assignment]', N'Assignment';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT N'The transacted portion of the database update succeeded.'
COMMIT TRANSACTION
END
ELSE PRINT N'The transacted portion of the database update failed.'
GO
DROP TABLE #tmpErrors
GO
PRINT N'Update complete.';


GO
