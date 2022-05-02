use actividades;

#ej3.1
SELECT * FROM actividades.almacenes;

#ej3.2
SELECT *
FROM actividades.cajas
WHERE VALOR >= 150;

#ej3.3
SELECT CONTENIDO
FROM actividades.cajas
GROUP BY CONTENIDO;

#ej3.4
SELECT AVG(VALOR) AS VALOR_MEDIO
FROM actividades.cajas;

#ej3.5
SELECT ALMACEN, AVG(VALOR)
FROM actividades.cajas
GROUP BY ALMACEN;

#ej3.6
SELECT ALMACEN
FROM actividades.cajas
GROUP BY ALMACEN
HAVING AVG(VALOR) > 150;

SELECT ALMACEN, avg(VALOR) 
FROM actividades.cajas
GROUP BY ALMACEN

#ej3.7
SELECT cajas.NUMREFERENCIA, almacenes.LUGAR
FROM actividades.almacenes
INNER JOIN actividades.cajas
ON almacenes.CODIGO = cajas.ALMACEN;

#ej3.8
SELECT ALMACEN, COUNT(NUMREFERENCIA)
FROM actividades.cajas
GROUP BY ALMACEN;

#ej3.9
SELECT almacenes.CODIGO, almacenes.CAPACIDAD
FROM actividades.almacenes
INNER JOIN actividades.cajas
ON almacenes.CODIGO = cajas.ALMACEN
GROUP BY almacenes.codigo
HAVING COUNT(cajas.NUMREFERENCIA) > almacenes.CAPACIDAD;

#ej3.10
SELECT cajas.NUMREFERENCIA
FROM actividades.almacenes
INNER JOIN actividades.cajas
ON almacenes.CODIGO = cajas.ALMACEN
WHERE almacenes.LUGAR = 'Bilbao';

#ej3.11
INSERT INTO almacenes(CODIGO, LUGAR, CAPACIDAD)
VALUES (6, 'Barcelona', 3)

#ej3.12
INSERT INTO cajas(NUMREFERENCIA, CONTENIDO, VALOR, ALMACEN)
VALUES ('H5RT', 'Papel', 200, 2);

#ej3.13
SET SQL_SAFE_UPDATES = 0;

UPDATE cajas
SET VALOR = VALOR * 0.85
WHERE 1=1;

#ej3.14
UPDATE cajas
SET VALOR = VALOR * 0.80
WHERE VALOR > (SELECT * FROM (SELECT AVG(VALOR) FROM cajas) AS T);

#ej3.15
DELETE FROM cajas
WHERE VALOR < 100;

#ej3.16
DELETE FROM cajas
WHERE NUMREFERENCIA = (
SELECT NUMREFERENCIA FROM (SELECT almacenes.CODIGO, almacenes.CAPACIDAD, cajas.NUMREFERENCIA
FROM actividades.almacenes
INNER JOIN actividades.cajas
ON almacenes.CODIGO = cajas.ALMACEN
GROUP BY almacenes.codigo, cajas.NUMREFERENCIA
HAVING COUNT(cajas.NUMREFERENCIA) > almacenes.CAPACIDAD) AS T);