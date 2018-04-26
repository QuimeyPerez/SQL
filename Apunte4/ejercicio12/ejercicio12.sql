SELECT
	b.seller_name,
	b.seller_surname,
	c.region_name,
	count(operation)
FROM
	property a
	NATURAL INNER JOIN seller b
	NATURAL INNER JOIN region c
WHERE
	a.selling_timestamp IS NOT NULL
	and a.operation='Venta'
	AND c.region_name='Barcelona'
GROUP BY 1,2,3
ORDER BY 4 DESC
LIMIT 1;