SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, ROUND(precio*1.05, 2) FROM producto;
SELECT nombre AS `product name`, precio AS `euros`, ROUND(precio*1.05, 2) AS `dollars` FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, SUBSTRING(UPPER(nombre), 1, 2) AS code FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio,0) FROM producto;
SELECT f.codigo FROM fabricante f, producto p WHERE f.codigo = p.codigo_fabricante;
SELECT DISTINCT(f.codigo) FROM fabricante f, producto p WHERE f.codigo = p.codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
