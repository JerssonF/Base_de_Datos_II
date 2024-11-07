--Estudiantes: 
-- Nicolas Tello Mendez.
-- Jersson Fabián Buitrago Murcia.

---Insert Clientes---
insert into public.clientes (nombre, apellido) values
('juan', 'gomez'),
('maría', 'rodriguez'),
('carlos', 'perez'),
('ana', 'castro'),
('luis', 'martínez');


---Select Clientes---
select * from public.clientes;

---Insert Productos---
insert into public.productos (nombre, precio) values
('pan', 1500),
('leche', 4000),
('huevo', 900),
('arroz', 2800),
('aceite', 3200);

---Select Productos---
select * from productos

---Insert Ventas---
insert into public.ventas (id_cliente, id_producto, cantidad, precio_total, fecha_venta) values
(1, 1, 2, 3000,'2024-09-12'),
(3, 2, 1, 4000,'2024-09-11'),
(4, 3, 10, 9000,'2024-09-10'),
(1, 4, 3, 8400,'2024-09-09'),
(3, 5, 2, 6400,'2024-09-08');

---Select Ventas---
select * from ventas;

UPDATE public.ventas
SET fecha_venta = '2021-12-31'
WHERE id_venta = 2;

UPDATE public.ventas
SET fecha_venta = '2021-12-31'
WHERE id_venta = 5;


---1.Funcion para promedio de las ventas clientes---
create function promedio_ventas(p_id_cliente integer)
returns numeric(10,2) as $$
declare
    promedio numeric(10,2);
begin
    select avg(precio_total)
    into promedio
    from public.ventas
    where id_cliente = p_id_cliente;

    return (promedio);
end;
$$ language plpgsql;

---Consulta de promedio por Id_cliente---
select promedio_ventas (1);


---2.Funcion para existencia de un producto---
create or replace function existencia_producto(nombre_producto varchar)
returns varchar as $$
declare
    existe boolean;
begin
    select exists(
        select 1 from public.productos
        where nombre = nombre_producto
    ) into existe;

    return case 
        when existe then 'disponible'
        else 'no disponible'
    end;
end;
$$ language plpgsql;

---Consulta de existencia de un producto---
select existencia_producto ('pan');

--3.Actualizar el precio de un producto
CREATE OR REPLACE FUNCTION actualizar_precio_producto(
    p_id_producto INT,
    p_porcentaje_incremento DECIMAL)
RETURNS VOID AS
$$
BEGIN
-- Actualizar el precio del producto
    UPDATE productos
    SET precio = precio + (precio * (p_porcentaje_incremento / 100))
    WHERE id_producto = p_id_producto;
 
-- Aumentar el precio del producto con ID 3 en un 50%
SELECT actualizar_precio_producto(3, 50);

select * from productos;

--4.Generar reporte de compras entre fechas
CREATE OR REPLACE FUNCTION obtener_ventas_entre_fechas(
    p_fecha_inicio DATE,
    p_fecha_fin DATE)
RETURNS TABLE (
    id_venta INT,
    fecha_venta DATE,
    precio_total DECIMAL,
    id_cliente INT) AS
$$
BEGIN
    -- Retornar todas las ventas entre las fechas proporcionadas
    RETURN QUERY
    SELECT v.id_venta, v.fecha_venta, v.precio_total, v.id_cliente
    FROM ventas v
    WHERE v.fecha_venta BETWEEN p_fecha_inicio AND p_fecha_fin
    ORDER BY v.fecha_venta;
END;
$$
LANGUAGE plpgsql;
-- Obtener todas las ventas realizadas entre el 1 de septiembre de 2024 y el 30 de septiembre de 2024
SELECT * FROM obtener_ventas_entre_fechas('2024-09-01', '2024-09-30');

--5.Eliminar clientes sin compras en los últimos 2 años

CREATE OR REPLACE FUNCTION eliminar_clientes_sin_compras_ultimos_2_anios()
RETURNS VOID AS
$$
BEGIN
    -- Eliminar los clientes que no han hecho compras en los últimos 2 años
    DELETE FROM clientes c
    WHERE NOT EXISTS (
        SELECT 1 
        FROM ventas v
        WHERE v.id_cliente = c.id_cliente
        AND v.fecha_venta >= NOW() - INTERVAL '2 years');

END;
$$
LANGUAGE plpgsql;
-- Llamar a la función para eliminar los clientes sin compras en los últimos 2 años
SELECT eliminar_clientes_sin_compras_ultimos_2_anios();
select * from clientes;




