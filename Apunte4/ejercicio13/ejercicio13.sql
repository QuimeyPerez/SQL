SELECT
	b.region_name,
	a.property_type_name,
	max(price)
FROM
	property c
	NATURAL INNER JOIN property_type a
	NATURAL INNER JOIN region b
WHERE
	region_name='Lleida'
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 1;