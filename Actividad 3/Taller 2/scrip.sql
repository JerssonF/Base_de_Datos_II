---INTEGRANTES---
--Nicolas Tello Méndez--
--Jersson Fabián Buitrago Murcia--

---INSERT CURSOS---
insert into cursos (nombre_curso, acronimo_curso, estado) values
('matematicas', 'MAT', 'A'),
('fisica', 'FIS', 'A'),
('calculo', 'CAL', 'A'),
('estadistica', 'EST', 'I'),
('quimica', 'QUI', 'A'),
('redes', 'RED', 'I'),
('programacion', 'PRO', 'A'),
('algebra', 'ALG', 'A'),
('logica', 'LOG', 'A'),
('sistemas', 'SIS', 'A'),
('circuitos', 'CIR', 'A'),
('bases', 'BD', 'A'),
('seguridad', 'SEG', 'A'),
('graficos', 'GRF', 'I'),
('modelos', 'MOD', 'A');

---SELECT CURSOS---
select * from cursos;

---INSERT SEMESTRES--
insert into semestres (semestre, estado) values
('2017-2', 'A'),
('2018-1', 'A'),
('2018-2', 'I'),
('2019-1', 'A'),
('2019-2', 'I'),
('2020-1', 'A'),
('2020-2', 'A'),
('2021-1', 'A'),
('2021-2', 'A'),
('2022-1', 'I'),
('2022-2', 'A'),
('2023-1', 'A'),
('2023-2', 'A'),
('2024-1', 'A'),
('2024-2', 'I');

---SELECT SEMESTRES---
select * from semestres;

---INSERT CURSOS_SEMESTRES---
insert into cursos_semestres (id_curso, id_semestre, grupo, profesor, estado) values
(1, 2, 3, 'juan lopez', 'I'),
(2, 4, 4, 'jose llanos', 'A'),
(3, 6, 5, 'luis ramirez', 'A'),
(4, 8, 2, 'ana mejia', 'A'),
(5, 10, 6, 'pedro martinez', 'A'),
(6, 12, 7, 'carla salazar', 'A'),
(7, 14, 1, 'nicolas torres', 'A'),
(8, 1, 8, 'sofia ruiz', 'A'),
(9, 3, 4, 'david rodriguez', 'I'),
(10, 5, 5, 'paola morales', 'A'),
(11, 7, 9, 'andres cardenas', 'A'),
(12, 9, 3, 'valentina castro', 'A'),
(13, 11, 7, 'diego correa', 'I'),
(14, 13, 10, 'luisa fernandez', 'A'),
(15, 15, 6, 'julian jimenez', 'A');

---SELECT CURSOS_SEMESTRES---
select * from cursos_semestres

---INSERT ESTUDIANTES---
insert into estudiantes (nombre, correo, usuario, clave, estado) values
('nicolas tello', 'nictello1@gmail.com', 'nictello', 'kapua142', 'A'),
('santiago perez', 'sanperez2@gmail.com', 'sanperez', 'alpha987', 'A'),
('camila rojas', 'camirojas3@gmail.com', 'camirojas', 'beta654', 'A'),
('juan diaz', 'juandiaz4@gmail.com', 'juandiaz', 'gamma321', 'A'),
('valentina martinez', 'valmart5@gmail.com', 'valmart', 'delta543', 'A'),
('sebastian garcia', 'sebg6@gmail.com', 'sebg', 'epsilon210', 'I'),
('laura sanchez', 'lausanc7@gmail.com', 'lausanc', 'zeta432', 'A'),
('daniel morales', 'danmor8@gmail.com', 'danmor', 'eta678', 'A'),
('sofia gomez', 'sofigomez9@gmail.com', 'sofigomez', 'theta987', 'A'),
('carlos vargas', 'carvar10@gmail.com', 'carvar', 'iota123', 'A'),
('daniela herrera', 'danher11@gmail.com', 'danher', 'kappa345', 'A'),
('andres rodriguez', 'androd12@gmail.com', 'androd', 'lambda567', 'I'),
('david romero', 'davrom13@gmail.com', 'davrom', 'mu789', 'A'),
('paula castro', 'paulcast14@gmail.com', 'paulcast', 'nu890', 'I'),
('julian suarez', 'julsuarez15@gmail.com', 'julsuarez', 'xi901', 'A');

---SELECT ESTUDIANTES---
select * from estudiantes;

---INSERT DATOS_CALIFICACION---
insert into datos_calificacion (id_curso_semestre, prediccion_semana, id_estudiante, lab1, plazo_entrega_lab1, numero_intento_lab1, resultado_lab1, lab2, prediccion) values
(1, 5, 2, 4.2, 12.02, 2, 1, 4.0, 1),
(2, 8, 3, 3.8, 23.06, 1, 2, 3.5, 0),
(3, 7, 4, 4.5, 01.05, 0, 3, 4.4, 2),
(4, 4, 5, 2.9, 30.12, 3, 0, 3.1, 1),
(5, 6, 6, 4.1, 25.01, 1, 2, 4.3, 2),
(6, 2, 7, 3.0, 22.11, 4, 1, 2.4, 1),
(7, 9, 8, 5.0, 14.12, 0, 3, 4.7, 0),
(8, 3, 9, 3.4, 26.08, 2, 2, 3.2, 2),
(9, 10, 10, 4.0, 10.02, 1, 1, 4.1, 1),
(10, 1, 11, 2.3, 05.01, 0, 0, 2.9, 0),
(11, 4, 12, 4.6, 26.04, 1, 3, 4.5, 2),
(12, 5, 13, 3.7, 22.06, 2, 1, 3.6, 1),
(13, 7, 14, 4.3, 13.05, 0, 3, 4.2, 1),
(14, 6, 15, 1.8, 31.12, 3, 2, 4.6, 2),
(15, 9, 1, 3.5, 17.08, 1, 2, 1.9, 1);

---SELECT DATOS_CALIFICACION---
select * from datos_calificacion;


---PROCEDIMIENTO DE 15 CONSULTAS---

--1) Buscar cursos asignados en el semestre 2020-1
select c.nombre_curso as curso, cs.grupo
from cursos as c 
inner join cursos_semestres as cs on c.id_curso = cs.id_curso 
inner join semestres as s on cs.id_semestre = s.id_semestre

where s.semestre = '2020-1';

--2) Buscar estudiantes con calificación mayor a 4.0 en el lab1
select e.nombre as estudiante, dc.lab1
from estudiantes as e
inner join datos_calificacion as dc on e.id_estudiante = dc.id_estudiante

where dc.lab1 > 4.0;

--3) Buscar estudiantes que cursaron una materia que comience con 's' en semestres activos
select e.nombre as estudiante, c.nombre_curso
from estudiantes as e 
inner join datos_calificacion as dc on e.id_estudiante = dc.id_estudiante 
inner join cursos_semestres as cs on dc.id_curso_semestre = cs.id_curso_semestre 
inner join cursos as c on cs.id_curso = c.id_curso 
inner join semestres as s on cs.id_semestre = s.id_semestre

where c.nombre_curso like 's%' and s.estado = 'A';

--4) Buscar semestres en los que el profesor con apellido 'castro' dictó clases
select  cs.profesor, s.semestre
from cursos_semestres cs 
inner join semestres as s on cs.id_semestre = s.id_semestre

where cs.profesor like '%valentina%';

--5) Buscar cursos en semestres donde se obtuvo un lab1 menor de 3.0 y ordenar
select c.nombre_curso, s.semestre, dc.lab1 as nota
from cursos as c 
inner join cursos_semestres as cs on c.id_curso = cs.id_curso 
inner join semestres as s on cs.id_semestre = s.id_semestre 
inner join datos_calificacion as dc on cs.id_curso_semestre = dc.id_curso_semestre

where dc.lab1 < 3.0;

--6) Buscar estudiantes con calificaciones entre 3 y 4 en lab1
select e.nombre as estudiante, dc.lab1
from estudiantes as e 
inner join datos_calificacion as dc on e.id_estudiante = dc.id_estudiante

where dc.lab1 between 3 and 4;

--7) Buscar estudiantes con plazo_entrega_lab1 antes del 15 de junio
select e.nombre as estudiante, dc.plazo_entrega_lab1
from estudiantes as e 
inner join datos_calificacion as dc on e.id_estudiante = dc.id_estudiante

where dc.plazo_entrega_lab1 < '15.06';

--8) Encontrar cursos tomados por estudiantes específicos:
SELECT e.nombre AS estudiante, c.nombre_curso AS curso
FROM estudiantes as e
INNER JOIN cursos_semestres as cs ON e.id_estudiante = e.id_estudiante
INNER JOIN cursos as c ON cs.id_curso = c.id_curso
WHERE e.id_estudiante IN (1, 2, 3);

--9)Encontrar estudiantes que no han tomado ningún curso en un semestre específico:
SELECT e.nombre AS estudiante, COUNT(cs.id_curso) AS cursos_tomados
FROM estudiantes as e
INNER JOIN cursos_semestres as cs ON e.id_estudiante = e.id_estudiante
GROUP BY e.nombre;

--10) Listar estudiantes que han tomado cursos en todos los semestres:
SELECT e.nombre AS estudiante
FROM estudiantes as e
INNER JOIN cursos_semestres as cs ON e.id_estudiante = e.id_estudiante
GROUP BY e.nombre
HAVING COUNT(DISTINCT cs.id_semestre) = (SELECT COUNT(*) FROM semestres);

--11) SELECT c.id_curso, c.nombre_curso, c.acronimo_curso
FROM cursos as c
WHERE c.estado = 'A';

--12) Contar cuántos cursos hay en cada estado:
SELECT c.estado, COUNT(c.id_curso) as cantidad_cursos
FROM cursos as c
GROUP BY c.estado;

--13)Seleccionar cursos cuyo nombre tiene entre 10 y 20 caracteres:
SELECT c.id_curso, c.nombre_curso, c.acronimo_curso
FROM cursos c
WHERE LENGTH(c.nombre_curso) BETWEEN 10 AND 20;

--14)Seleccionar todos los cursos con su grupo y estado en un semestre específico:
SELECT c.nombre_curso, cs.grupo, cs.estado
FROM cursos_semestres cs
INNER JOIN cursos c ON cs.id_curso = c.id_curso
WHERE cs.id_semestre = 3;

--15) Listar todos los cursos activos junto con los grupos y profesores asociados:
SELECT c.nombre_curso, cs.grupo, cs.profesor
FROM cursos c
INNER JOIN cursos_semestres cs ON c.id_curso = cs.id_curso
WHERE c.estado = 'A' AND cs.estado = 'A';

--Actualice 5 registros de las tablas, tenga en cuenta las llaves primarias.

--1) Actualizar un registro en la tabla cursos:
UPDATE cursos
SET nombre_curso = 'filosofia', acronimo_curso = 'FI', estado = 'A'
WHERE id_curso = 5;

--2)Actualizar un registro en la tabla datos_calificacion:
UPDATE datos_calificacion
SET lab1 = 6, plazo_entrega_lab1 = '15.25', numero_intento_lab1 = 2, prediccion = '3'
WHERE id_dato_calificacion = 7;

--3) Actualizar un registro en la tabla estudiantes:
UPDATE estudiantes
SET nombre = 'jersson fabian buitrago', correo = 'jersson.buitrago@example.com',usuario = 'jebuitrago', clave = 'jer224', estado = 'I'
WHERE id_estudiante = 10;

--4)Actualizar un registro en la tabla semestres:
UPDATE semestres
SET semestre = '2024-2', estado = 'A'
WHERE id_semestre = 4;

--5)Actualizar un registro en la tabla datos_calificacion:
UPDATE datos_calificacion
SET lab1 = 9.6, plazo_entrega_lab1 = '25.65', numero_intento_lab1 = 3, prediccion = '6'
WHERE id_dato_calificacion = 14;


--Borre 3 registros de las tablas, tenga en cuenta la integridad referencias de
--la base de dato

--1)Eliminar las referencias en datos_calificacion
DELETE FROM datos_calificacion
WHERE id_estudiante = 11; 

--2)Eliminar el registro en estudiantes
DELETE FROM estudiantes
WHERE id_estudiante = 10;

--3)Eliminar las referencias en datos_calificacion
DELETE FROM datos_calificacion
WHERE id_curso_semestre = 2;

--4)Eliminar el registro en cursos_semestres
DELETE FROM cursos_semestres
WHERE id_curso_semestre = 2;

--5)Eliminar el registro en semestres
DELETE FROM semestres
WHERE id_semestre = 4;
