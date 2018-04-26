SELECT
	property_id,
	surface
	
FROM
	property
WHERE
	surface=(SELECT MAX(surface) FROM property)
ORDER BY 1 ASC;
