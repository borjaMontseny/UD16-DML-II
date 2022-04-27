#ej2.1
SELECT APELLIDOS
FROM empleados;

#ej2.2
SELECT DISTINCT APELLIDOS
FROM empleados;

#ej2.3
SELECT *
FROM empleados
WHERE APELLIDOS = 'Smith';

#ej2.4
SELECT *
FROM empleados
WHERE APELLIDOS IN ('Smith', 'Rogers');

#ej2.5
SELECT *
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.CODIGO = 14;

#ej2.6
SELECT *
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.CODIGO IN (37, 77);

#ej2.7
SELECT *
FROM empleados
WHERE APELLIDOS LIKE 'P%';

#ej2.8
SELECT SUM(PRESUPUESTO) AS PRESUPUESTO_TOTAL
FROM departamentos;

#ej2.9
SELECT departamentos.NOMBRE, COUNT(empleados.DNI)
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
GROUP BY departamentos.NOMBRE;

#ej2.10
SELECT *
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo;

#ej2.11
SELECT empleados.NOMBRE, empleados.APELLIDOS, departamentos.NOMBRE, departamentos.PRESUPUESTO
FROM empleados
INNER JOIN departamentos
ON empleados.DEPARTAMENTO = departamentos.CODIGO;

#ej2.12
SELECT empleados.NOMBRE, empleados.APELLIDOS
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.PRESUPUESTO > 60000;

#ej2.13
SELECT *
FROM departamentos
WHERE PRESUPUESTO > (SELECT AVG(PRESUPUESTO) FROM departamentos);

#ej2.14
SELECT departamentos.NOMBRE
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
GROUP BY NOMBRE HAVING COUNT(empleados.DNI) > 2;

#ej2.15
INSERT INTO departamentos (CODIGO, NOMBRE, PRESUPUESTO)
VALUES (11, 'Calidad', 40000);

INSERT INTO empleados (DNI, NOMBRE, APELLIDOS, DEPARTAMENTO)
VALUES (89267109, 'Esther', 'Vázquez', 11);

#ej2.16
UPDATE departamentos
SET PRESUPUESTO = PRESUPUESTO * 0.9
WHERE 1 = 1;

#ej2.17
UPDATE empleados
SET departamento = 14
WHERE departamento = 77;

#ej2.18
DELETE FROM empleados
WHERE departamento = 14;

#ej2.19
DELETE FROM empleados
WHERE departamento = (
SELECT departamentos.CODIGO
FROM departamentos
WHERE departamentos.PRESUPUESTO > 60000);

#ej2.20
DELETE FROM empleados
WHERE 1 = 1;