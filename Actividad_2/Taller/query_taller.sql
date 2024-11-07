--integrantes:--
--nicolas tello méndez.--
--jersson fabián buitrago murcia.


---INSERT DOCTORES---
insert into doctores (nombre, num_carnet, especialidad, telefono, estado) values
('juan martinez', 9823456, 'cardiologia', '3187482317', 'a'),
('maria gomez', 7456392, 'pediatria', '3208765432', 'a'),
('carlos rodriguez', 6587234, 'neurologia', '3219876543', 'a'),
('ana torres', 9345678, 'dermatologia', '3223456789', 'a'),
('luis ramirez', 8765432, 'ortopedia', '3101234567', 'a'),
('sofia fernandez', 1923847, 'ginecologia', '3112345678', 'a'),
('jose garcia', 5678912, 'oftalmologia', '3123456789', 'a'),
('laura morales', 3498716, 'psiquiatria', '3134567890', 'i'),
('andres lopez', 4781923, 'urologia', '3145678901', 'i'),
('carolina diaz', 2847365, 'endocrinologia', '3156789012', 'a');

---SELECT DOCTORES---
select * from doctores;

---INSERT PACIENTES---
insert into pacientes (nombre, cedula, direccion, telefono, fecha_nacimiento, estado) values
('jose ortiz', 1084866242, 'calle 45 # 67-89', '3187482317', '1985-03-15', 'a'),
('paola martinez', 1012345678, 'carrera 15 # 23-45', '3208765432', '1990-07-22', 'a'),
('eduardo castro', 1023456789, 'avenida 7 # 34-56', '3219876543', '1982-11-30', 'a'),
('valeria romero', 1034567890, 'calle 10 # 45-67', '3223456789', '1995-05-18', 'a'),
('felipe espinosa', 1045678901, 'carrera 9 # 78-90', '3101234567', '1978-01-25', 'a'),
('camila arias', 1056789012, 'avenida 3 # 12-34', '3112345678', '1992-10-09', 'a'),
('nicolas granados', 1067890123, 'calle 15 # 89-01', '3123456789', '1988-06-14', 'i'),
('isabela prado', 1078901234, 'carrera 12 # 56-78', '3134567890', '1991-12-01', 'i'),
('sebastian alvarez', 1089012345, 'calle 5 # 67-89', '3145678901', '1986-04-21', 'a'),
('sandra aguilar', 1090123456, 'avenida 4 # 23-45', '3156789012', '1994-08-17', 'a');

---SELECT PACIENTES---
select * from pacientes;

---INSERT CITAS---
insert into public.citas (id_paciente, id_doctor, fecha_cita, hora_cita, motivo, estado) values
(1, 4, '2024-09-01', '08:30:00+00', 'tratamiento dermatológico', 'a'),
(2, 6, '2024-09-02', '09:00:00+00', 'consulta ginecológica', 'a'),
(3, 1, '2024-09-03', '10:00:00+00', 'chequeo general', 'a'),
(4, 2, '2024-09-04', '11:00:00+00', 'consulta pediátrica', 'a'),
(5, 3, '2024-09-05', '14:00:00+00', 'evaluación neurológica', 'a'),
(6, 5, '2024-09-06', '15:30:00+00', 'revisión ortopédica', 'a'),
(7, 10, '2024-09-07', '16:00:00+00', 'revisión endocrinológica', 'a'),
(8, 7, '2024-09-08', '09:15:00+00', 'chequeo oftalmológico', 'a'),
(9, 8, '2024-09-09', '10:45:00+00', 'evaluación psiquiátrica', 'i'),
(10, 9, '2024-09-10', '11:30:00+00', 'consulta urológica', 'i');

---CONSULTAS---

--1) Buscar el número total de citas por especialidad junto al nombre del doctor
select doctores.nombre as doctor,doctores.especialidad as especialidad, count(citas.id_paciente) as total_citas
from citas
inner join doctores on citas.id_doctor = doctores.id_doctor

group by (doctores.especialidad, doctores.nombre);


--2) Buscar las citas programadas entre dos fechas específicas, y el nombre del paciente, el id del dctor y la hora de la cita
select pacientes.nombre as paciente, citas.id_doctor, citas.fecha_cita, citas.hora_cita
from citas
inner join pacientes on citas.id_paciente = pacientes.id_paciente

where citas.fecha_cita between '2024-09-01' and '2024-09-10'
order by pacientes.id_paciente;

--3) Buscar los pacientes cuyo nombre contiene la letra 'a' y que hayan tenido citas con doctores de 'cardiologia' o 'pediatria'
select pacientes.nombre as nombre_paciente, pacientes.cedula as cedula_paciente, doctores.especialidad
from pacientes
inner join citas on pacientes.id_paciente = citas.id_paciente
inner join doctores on citas.id_doctor = doctores.id_doctor

where pacientes.nombre like '%a%' and doctores.especialidad in ('cardiologia', 'pediatria');

--4) Buscar el nombre y especialidas de los doctores que tengas citas inactivas, tambien el nombre del paciente y su motivo
select doctores.nombre as Doctor, doctores.especialidad, pacientes.nombre as paciente, citas.estado, citas.motivo
from citas
inner join doctores on citas.id_doctor = doctores.id_doctor
inner join pacientes on citas.id_paciente = pacientes.id_paciente

where citas.estado like 'i%';

--5) Buscar las direcciones que comiencen por 'ave', el nombre y la cedula de los pacientes, y el doctor con quien le toca la consulta junto al motivo de su cita
select pac.nombre, pac.cedula, doc.nombre as doctor, pac.direccion,cit.motivo
from pacientes as pac
inner join citas as cit on pac.id_paciente = cit.id_paciente
inner join doctores as doc on cit.id_doctor = doc.id_doctor

where pac.direccion like 'ave%';

--6) Buscar el nombre y especialidas de los doctores que tengas citas activas, tambien el nombre del paciente y su motivo y fecha de nacimiento del paciente.
select doctores.nombre as Doctor, doctores.especialidad, pacientes.nombre as paciente, citas.estado, citas.motivo, fecha_nacimiento
from citas
inner join doctores on citas.id_doctor = doctores.id_doctor
inner join pacientes on citas.id_paciente = pacientes.id_paciente

where citas.estado like 'a%';

--7) Buscar citas de un paciente específico (por nombre).
select citas.id_cita as cita_id,pacientes.nombre as paciente_nombre,doctores.nombre as doctor_nombre,citas.fecha_cita as fecha_cita
from citas
inner join pacientes on citas.id_paciente = pacientes.id_paciente
inner join doctores ON citas.id_doctor = doctores.id_doctor
where pacientes.nombre = 'jose ortiz';

--8) Contar el número de citas por cada doctor.
select doctores.nombre as doctor,count(citas.id_cita) as numero_de_citas
from doctores
inner join citas on doctores.id_doctor = citas.id_doctor
group by doctores.nombre;

--9) Buscar citas atendidas por un doctor específico que ocurrieron entre dos fechas.
select citas.id_cita as citas, pacientes.nombre as paciente,doctores.nombre as doctor,citas.fecha_cita as fecha
from citas
inner join pacientes on citas.id_paciente = pacientes.id_paciente
inner join doctores on citas.id_doctor = doctores.id_doctor
where doctores.nombre = 'juan martinez'
and citas.fecha_cita between '2024-09-01' and '2024-10-31';

--10) Contar el número de citas para cada especialidad de doctor.
select d.especialidad AS especialidad_doctor,count(c.id_cita) as numero_de_citas
from doctores d
inner join citas c on d.id_doctor = c.id_doctor
group by d.especialidad
order by numero_de_citas desc;

-- Actualice 5 registros de las tablas, tenga en cuenta las llaves primarias.
update pacientes
set nombre = 'jose llanos'
where id_paciente= 1;

update doctores
set especialidad = 'otorrinolaringologia'
where id_doctor= 6;

update citas
set motivo = 'Le dolian los oidos'
where id_cita= 6;

update citas
set motivo = 'Le dolian los oidos'
where id_cita= 6;

update citas
set fecha_cita = '2024-08-24'
where id_cita= 18;

update pacientes
set estado = 'i'
where id_paciente= 11;

--Borre 3 registros de las tablas, tenga en cuenta la integridad referencias de la base de datos.
delete from citas where id_cita = 10;
delete from doctores where id_doctor = 5;
delete from pacientes where id_paciente = 19;


