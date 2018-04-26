SELECT
	b.seller_surname,
	b.seller_name,
	b.seller_dni,
	count(1) "Propiedades Vendidas"
FROM
	seller b
	NATURAL INNER JOIN property a
WHERE
	a.selling_timestamp IS NOT NULL
GROUP BY 1,2,3
ORDER BY 4 ASC
LIMIT 1;