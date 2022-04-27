use actividades;

# ej 1.1
SELECT NOMBRE
FROM articulos;

# ej1.2
SELECT NOMBRE, PRECIO
FROM articulos;

#ej1.3
SELECT NOMBRE
FROM articulos
WHERE PRECIO <= 200;

#ej1.4
SELECT *
FROM articulos
WHERE precio BETWEEN 60 and 120;

#ej1.5
SELECT NOMBRE, PRECIO * 166 AS PRECIO_EN_PESETAS
FROM articulos;

#ej1.6
SELECT AVG(PRECIO)
FROM articulos;

#ej1.7
SELECT AVG(PRECIO)
FROM articulos
WHERE CODIGO = 2;

#ej1.8
SELECT COUNT(CODIGO)
FROM articulos
WHERE PRECIO >=180;

#ej1.9
SELECT NOMBRE, PRECIO
FROM articulos
WHERE PRECIO >=180
ORDER BY PRECIO DESC, NOMBRE ASC;

#ej1.10
SELECT *
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo;

#ej1.11
SELECT articulos.NOMBRE, articulos.PRECIO, fabricantes.NOMBRE
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo;

#ej1.12
SELECT articulos.CODIGO, AVG(articulos.PRECIO)
FROM articulos 
INNER JOIN fabricantes
ON articulos.CODIGO = fabricantes.CODIGO
GROUP BY fabricantes.CODIGO;

#ej1.13
SELECT fabricantes.NOMBRE, AVG(articulos.PRECIO)
FROM articulos 
INNER JOIN fabricantes
ON articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY fabricantes.NOMBRE;

#ej1.14
SELECT fabricantes.NOMBRE, AVG(articulos.PRECIO)
FROM fabricantes
INNER JOIN articulos
ON articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY fabricantes.NOMBRE
HAVING AVG(articulos.PRECIO) >= 150;

#ej1.15
SELECT NOMBRE, PRECIO
FROM articulos
WHERE PRECIO = (SELECT MIN(PRECIO) FROM articulos);

#ej1.16
SELECT F.NOMBRE AS FABRICANTE, A.NOMBRE ARTICULO, A.PRECIO
FROM articulos A
INNER JOIN fabricantes F
ON A.FABRICANTE = F.CODIGO
WHERE A.PRECIO IN (SELECT MAX(A.PRECIO) FROM articulos A JOIN fabricantes F ON A.FABRICANTE = F.CODIGO GROUP BY F.NOMBRE)

#ej1.17
INSERT INTO articulos (CODIGO, NOMBRE, PRECIO, FABRICANTE)
VALUES (11, 'ALTAVOCES', 70, 2);

#ej1.18
UPDATE articulos
SET NOMBRE = 'IMPRESORA LASER'
WHERE CODIGO = 8;

#ej1.19
#SET SQL_SAFE_UPDATES = 0;
UPDATE articulos
SET PRECIO = PRECIO * 0.9
WHERE 1 = 1 ;

#ej1.20
UPDATE articulos
SET PRECIO = PRECIO - 10
WHERE PRECIO >= 120;