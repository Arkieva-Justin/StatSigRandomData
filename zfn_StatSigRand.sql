USE [Arkieva_Demo_Template]
GO
/****** Object:  UserDefinedFunction [dbo].[zfn_StatSigRand]    Script Date: 7/19/2023 11:44:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[zfn_StatSigRand] (
		@avg	REAL
	,	@std	REAL
)
/*
**	V001.001	JPE		2023-07-19		Created this function
**
**
**
*/
RETURNS REAL AS
BEGIN
	DECLARE @r				REAL
	SELECT	@r = ROUND([RandomValue],5)		--This circumvents the prohibition of RAND() within a User-Defined Function
	FROM	zvw_RandomNumber				--This circumvents the prohibition of RAND() within a User-Defined Function
	
	DECLARE @return_value	REAL;
	SELECT	@return_value = @avg + (@std * max(COALESCE([StDev],-3.99)))
	FROM	ztb_ztable_lookup
	WHERE	@r >= [ZValue]
 
    RETURN @return_value
END;

