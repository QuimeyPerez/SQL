SELECT
	b.seller_name,
	b.seller_surname,
	b.seller_dni,
	max(price)
FROM
	seller b
	NATURAL INNER JOIN property a
GROUP BY 1,2,3
ORDER BY 4 DESC
LIMIT 1;