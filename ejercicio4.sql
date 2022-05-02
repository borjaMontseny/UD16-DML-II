use actividades;

#ej4.1
SELECT NOMBRE
FROM actividades.peliculas;

#ej4.2
SELECT DISTINCT CALIFICACIONEDAD
FROM actividades.peliculas;

#ej4.3
SELECT NOMBRE
FROM actividades.peliculas
WHERE CALIFICACIONEDAD IS NULL;

#ej4.4
SELECT NOMBRE
FROM actividades.salas
WHERE PELICULA IS NULL;

#ej4.5
SELECT *
FROM actividades.salas
INNER JOIN actividades.peliculas
ON salas.pelicula = peliculas.CODIGO;

#ej4.6
SELECT *
FROM actividades.peliculas
INNER JOIN actividades.salas
ON salas.pelicula = peliculas.CODIGO;

#ej4.7
SELECT peliculas.NOMBRE
FROM actividades.peliculas
LEFT JOIN actividades.salas
ON salas.pelicula = peliculas.CODIGO
WHERE salas.pelicula IS NULL;

#ej4.8
INSERT INTO peliculas(CODIGO, NOMBRE, CALIFICACIONEDAD)
VALUES (10, 'Uno, Dos, Tres', 7);

#ej4.9
SET SQL_SAFE_UPDATES = 0;

UPDATE peliculas
SET CALIFICACIONEDAD = 13
WHERE CALIFICACIONEDAD IS NULL;

#ej4.10
DELETE FROM salas
WHERE PELICULA = (SELECT CODIGO FROM peliculas WHERE CALIFICACIONEDAD IS NULL);