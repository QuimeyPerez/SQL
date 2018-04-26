DROP VIEW vw_region_report;
CREATE VIEW vw_region_report AS
	SELECT
		concat(b.seller_surname,' ',b.seller_name) "Vendedor",
		c.region_name "Region",
		count(a.property_id)"Cantidad de Propiedades",
		round(avg(a.price::numeric)) "Precio Promedio"
	FROM
		property a
		NATURAL INNER JOIN seller b
		NATURAL INNER JOIN region c
	GROUP BY 1,2;
	SELECT * FROM vw_region_report;
		