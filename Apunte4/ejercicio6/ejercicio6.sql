SELECT
	property_id,
	price
FROM
	property a
	NATURAL INNER JOIN seller b
WHERE
	seller_name='Pedro' AND
	seller_surname='Iriarte'
ORDER BY price DESC;