SELECT
	c.region_name,
	count(operation)
FROM
	property a
	NATURAL INNER JOIN seller b 
	NATURAL INNER JOIN region c
WHERE
	b.seller_name='Luisa' AND
	b.seller_surname='Estevez'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;