GO
/****** Object:  UserDefinedFunction udf_GetSKUPrice    Script Date: 18.12.2022 21:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, , Рассчитывает стоимость передаваемого продукта из таблицы Basket>
-- =============================================
CREATE FUNCTION udf_GetSKUPrice
(
	@ID_SKU int
)
RETURNS decimal(18, 2)
AS
BEGIN
	DECLARE @result decimal(18, 2)

	SELECT @result = Value/Quantity 
	FROM [dbo].[Basket]
	WHERE ID_SKU = @ID_SKU

	RETURN @result

END