USE MyGuitarShop;

SELECT *
	FROM Categories;

	SELECT *
		FROM Products;

-- #4 Display ProductName, ListPrice, DiscountPercent, 
-- DiscountAmount (calc), DiscountPrice (calc)
-- SORT: DicountPrice (desc)

SELECT ProductName, ListPrice, DiscountPercent,
	(ListPrice * DiscountPercent/100) as DiscountAmount,
	(ListPrice - (ListPrice * DiscountPercent/100)) as DicountPrice
	FROM Products
	ORDER BY DicountPrice DESC;