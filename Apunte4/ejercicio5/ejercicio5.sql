SELECT
	SUM(price)::numeric
FROM
	property
WHERE
	operation='Venta'
	AND selling_timestamp IS NULL;