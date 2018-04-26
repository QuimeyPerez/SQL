DROP VIEW vw_property;
CREATE VIEW vw_property AS
	SELECT
		a.property_id "ID PROPIEDAD",
		a.price "PRECIO",
		concat(b.seller_surname,' ',b.seller_name) "VENDEDOR",
		c.region_name "REGION"
	FROM
		property a
		NATURAL INNER JOIN seller b
		NATURAL INNER JOIN region c
	ORDER BY 2 ASC;
	SELECT * FROM vw_property;