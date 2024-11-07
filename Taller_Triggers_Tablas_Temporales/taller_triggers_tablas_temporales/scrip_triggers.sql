--Estudiantes:
--nicolás tello méndez
--jersson fabián buitrago murcia


Ejercicio 1: Trigger inserción de IMC

CREATE OR REPLACE FUNCTION calcular_imc()
RETURNS TRIGGER AS $calcular_imc$
 BEGIN
 NEW.imc = NEW.peso/(NEW.estatura*NEW.estatura);
 RETURN NEW;
 END;
$calcular_imc$ LANGUAGE plpgsql;

CREATE TRIGGER calcular_imc
BEFORE INSERT ON imc FOR EACH ROW
EXECUTE PROCEDURE calcular_imc();


Ejercicio 2: Trigger de auditoría para cambios en sueldos

INSERT INTO empleados (nombre, sueldo) VALUES
('juan perez', 2000000),
('ana gomez', 2500000),
('carlos lopez', 2200000),
('maria fernandez', 2800000),
('luis martinez', 3000000),
('nicolas tello', 1000),
('jose llanos', 3500);


CREATE OR REPLACE FUNCTION auditoria_sueldos()
RETURNS TRIGGER AS $auditoria_sueldos$
BEGIN
	INSERT INTO auditoria_sueldo (id_empleado, sueldo_anteriror, sueldo_nuevo)
	VALUES (OLD.id, OLD.sueldo, NEW.sueldo);
RETURN NEW;
END;
$auditoria_sueldos$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER auditoria_sueldos
BEFORE UPDATE ON auditoria_sueldo FOR EACH ROW
EXECUTE PROCEDURE auditoria_sueldos();

UPDATE empleados
SET sueldo = 3200000
WHERE nombre = 'juan perez';

SELECT * FROM auditoria_sueldo;

--Ejercicio 3: Trigger Trigger para evitar sueldos negativos.
CREATE OR REPLACE FUNCTION check_negative_salary()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar si el sueldo es menor que 0
    IF NEW.sueldo < 0 THEN
        RAISE EXCEPTION 'El sueldo no puede ser un valor negativo: %', NEW.sueldo;
    END IF;

    -- Si el sueldo no es negativo, continuar con la operación
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_salary
BEFORE INSERT OR UPDATE ON empleados
FOR EACH ROW
EXECUTE FUNCTION check_negative_salary();

INSERT INTO empleados (nombre, sueldo) VALUES ('Juan Pérez', -500);

--Ejercicio 4: Tabla temporal para almacenar resultados de una
consulta
-- Crear la tabla temporal para almacenar los resultados

CREATE TEMPORARY TABLE temp_empleados_sueldo_alto AS
SELECT *
FROM empleados
WHERE sueldo > 3000;

-- Consultar la tabla temporal
SELECT * FROM temp_empleados_sueldo_alto;

--Ejercicio 5: Tabla temporal para análisis de cambios salariales.

-- Crear la tabla temporal para almacenar los cambios salariales
	
CREATE TEMPORARY TABLE temp_cambios_salariales (
    id_empleado INT,
    nombre VARCHAR(100),
    cambios_sueldo INT);

-- Insertar datos en la tabla temporal

INSERT INTO temp_cambios_salariales (id_empleado, nombre, cambios_sueldo)
SELECT e.id, e.nombre, COUNT(a.id_empleado) AS cambios_sueldo
FROM empleados e
LEFT JOIN auditoria_sueldo a ON e.id = a.id_empleado
GROUP BY e.id, e.nombre;

--Consultamos el contenido de la tabla temporal creada
SELECT * FROM temp_cambios_salariales;
