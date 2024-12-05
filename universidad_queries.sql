SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'profesor' AND nif LIKE '%K' AND telefono IS NULL;
SELECT id, nombre, creditos, tipo FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM asignatura a JOIN alumno_se_matricula_asignatura ma ON a.id = ma.id_asignatura JOIN curso_escolar c ON c.id = ma.id_curso_escolar JOIN persona p ON ma.id_alumno = p.id WHERE p.nif = '26902806M';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor pr ON pr.id_departamento = d.id JOIN asignatura a ON a.id_profesor = pr.id_profesor JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura ma ON ma.id_alumno = p.id JOIN curso_escolar c ON c.id = ma.id_curso_escolar WHERE p.tipo = 'alumno' AND c.anyo_inicio = 2018 AND c.anyo_fin = 2019 ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON pr.id_profesor = p.id LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON pr.id_profesor = p.id LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id WHERE pr.id_profesor IS NULL ORDER BY d.nombre ASC;
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON pr.id_profesor = p.id LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT a.nombre AS 'asignaturas sin profesor' FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;
SELECT DISTINCT d.nombre AS departamento FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;

SELECT COUNT(*) AS alumnos FROM persona p WHERE tipo = 'alumno';
SELECT COUNT(*) AS alumnos FROM persona p WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre, COUNT(p.nombre) AS profesores FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(p.nombre) DESC;
SELECT d.nombre AS departamento, COUNT(p.id) AS profesores FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN persona p ON p.id = pr.id_profesor GROUP BY d.nombre ORDER BY profesores DESC;
SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY asignaturas DESC;
SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id, g.nombre HAVING COUNT(a.id) > 40 ORDER BY asignaturas DESC;
SELECT g.nombre, a.tipo, SUM(a.creditos) AS creditos FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY g.nombre ASC, a.tipo ASC;
SELECT c.anyo_inicio AS año_inicio, COUNT(ma.id_alumno) AS alumnos_matriculados FROM curso_escolar c LEFT JOIN alumno_se_matricula_asignatura ma ON ma.id_curso_escolar = c.id GROUP BY c.anyo_inicio ORDER BY c.anyo_inicio DESC;
SELECT p.id, p.apellido1, p.apellido2, p.nombre, COUNT(a.id_profesor) AS asignaturas FROM persona p LEFT JOIN profesor pr ON pr.id_profesor = p.id LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id ORDER BY COUNT(a.id_profesor) DESC;
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON pr.id_profesor = p.id LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL AND pr.id_departamento IS NOT NULL ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
