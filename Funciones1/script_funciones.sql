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
insert into public.ventas (id_cliente, id_producto, cantidad, precio_total) values
(1, 1, 2, 3000),
(3, 2, 1, 4000),
(4, 3, 10, 9000),
(1, 4, 3, 8400),
(3, 5, 2, 6400);

---Select Ventas---
select * from ventas;


---Funcion para promedio de las ventas clientes---
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


---Funcion para existencia de un producto---
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
