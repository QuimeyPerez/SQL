
INSERT INTO b.products VALUES('polenta','maiz con especias','23');

DELETE FROM b.products WHERE price = '23';

UPDATE b.products SET name = 'tomate' WHERE price = '23';

SELECT * FROM b.products;