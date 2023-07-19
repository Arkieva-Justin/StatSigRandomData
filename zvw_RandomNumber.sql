USE [Arkieva_Demo_Template]
GO

/****** Object:  View [dbo].[zvw_RandomNumber]    Script Date: 7/19/2023 12:29:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[zvw_RandomNumber] AS
SELECT RAND() as [RandomValue] --This circumvents the prohibition of RAND() within a User-Defined Function
GO


