-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
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
ALTER TRIGGER TR_Basket_insert_update 
   ON Basket 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	declare @last_id int = (select TOP 1 ID_SKU from Basket order by ID desc)
	declare @penultimate_id int = (select ID_SKU from Basket order by ID desc OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY )

	if @last_id = @penultimate_id
		begin
			UPDATE Basket set DiscountValue = (Value * 5)/100 where ID_SKU = @last_id
		end
	else
		begin
			UPDATE  Basket set DiscountValue = 0 where ID_SKU = @last_id
		end
END
GO
