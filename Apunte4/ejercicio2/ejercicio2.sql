SELECT
	property_id,
	surface
FROM
	property
WHERE
	surface=(SELECT MIN(surface) FROM property)
ORDER BY 1 ASC;