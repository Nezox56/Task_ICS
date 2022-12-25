-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
AS
BEGIN TRY
	SET XACT_ABORT, NOCOUNT ON;

	if(SELECT COUNT(1) FROM Family where FamilySurName = @FamilySurName) = 0
		THROW 51000, 'Такой семьи нет!', 1;
	ELSE
		DECLARE @result int

		SELECT @result = BudgetValue - SUM(Value)
		FROM Family, Basket
		WHERE FamilySurName = @FamilySurName
		GROUP BY BudgetValue

		UPDATE  Family set BudgetValue = @result
END TRY
BEGIN CATCH
	PRINT 'Error: ' + ERROR_MESSAGE()
END CATCH
GO
