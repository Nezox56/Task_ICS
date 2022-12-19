CREATE VIEW vw_SKUPrice
AS
	SELECT ID, Code, Name, dbo.udf_GetSKUPrice(ID) as 'udf_GetSKUPrice'
	FROM SKU