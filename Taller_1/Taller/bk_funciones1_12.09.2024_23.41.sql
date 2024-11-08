PGDMP  #    )                |            taller_funciones    16.4    16.4                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32960    taller_funciones    DATABASE     �   CREATE DATABASE taller_funciones WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
     DROP DATABASE taller_funciones;
                postgres    false            �            1255    32994 ,   actualizar_precio_producto(integer, numeric)    FUNCTION     �  CREATE FUNCTION public.actualizar_precio_producto(p_id_producto integer, p_porcentaje_incremento numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Actualizar el precio del producto
    UPDATE productos
    SET precio = precio + (precio * (p_porcentaje_incremento / 100))
    WHERE id_producto = p_id_producto;
    
    -- Opcional: Generar un mensaje de confirmación
    RAISE NOTICE 'Precio del producto con ID % ha sido actualizado en un %', p_id_producto, p_porcentaje_incremento;
END;
$$;
 i   DROP FUNCTION public.actualizar_precio_producto(p_id_producto integer, p_porcentaje_incremento numeric);
       public          postgres    false            �            1255    33014 /   eliminar_clientes_sin_compras_ultimos_2_anios()    FUNCTION     �  CREATE FUNCTION public.eliminar_clientes_sin_compras_ultimos_2_anios() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Eliminar los clientes que no han hecho compras en los últimos 2 años
    DELETE FROM clientes c
    WHERE NOT EXISTS (
        SELECT 1 
        FROM ventas v
        WHERE v.id_cliente = c.id_cliente
        AND v.fecha_venta >= NOW() - INTERVAL '2 years');
   
END;
$$;
 F   DROP FUNCTION public.eliminar_clientes_sin_compras_ultimos_2_anios();
       public          postgres    false            �            1255    32961 &   existencia_producto(character varying)    FUNCTION     �  CREATE FUNCTION public.existencia_producto(nombre_producto character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
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
$$;
 M   DROP FUNCTION public.existencia_producto(nombre_producto character varying);
       public          postgres    false            �            1255    33013 '   obtener_ventas_entre_fechas(date, date)    FUNCTION     �  CREATE FUNCTION public.obtener_ventas_entre_fechas(p_fecha_inicio date, p_fecha_fin date) RETURNS TABLE(id_venta integer, fecha_venta date, precio_total numeric, id_cliente integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Retornar todas las ventas entre las fechas proporcionadas
    RETURN QUERY
    SELECT v.id_venta, v.fecha_venta, v.precio_total, v.id_cliente
    FROM ventas v
    WHERE v.fecha_venta BETWEEN p_fecha_inicio AND p_fecha_fin
    ORDER BY v.fecha_venta;
END;
$$;
 Y   DROP FUNCTION public.obtener_ventas_entre_fechas(p_fecha_inicio date, p_fecha_fin date);
       public          postgres    false            �            1255    32962    promedio_ventas(integer)    FUNCTION     "  CREATE FUNCTION public.promedio_ventas(p_id_cliente integer) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
declare
    promedio float;
begin
    select avg (precio_total)
    into promedio
    from public.ventas
    where id_cliente = p_id_cliente;

    return promedio;
end;
$$;
 <   DROP FUNCTION public.promedio_ventas(p_id_cliente integer);
       public          postgres    false            �            1259    32963    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    32966    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public          postgres    false    215                       0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public          postgres    false    216            �            1259    32967 	   productos    TABLE     �   CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character(50) NOT NULL,
    precio numeric(10,2) NOT NULL
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    32970    productos_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.productos_id_producto_seq;
       public          postgres    false    217                       0    0    productos_id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;
          public          postgres    false    218            �            1259    32996    ventas    TABLE     �   CREATE TABLE public.ventas (
    id_venta integer NOT NULL,
    id_cliente integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    precio_total numeric(10,2) NOT NULL,
    fecha_venta date NOT NULL
);
    DROP TABLE public.ventas;
       public         heap    postgres    false            �            1259    32995    ventas_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE public.ventas_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ventas_id_venta_seq;
       public          postgres    false    220                       0    0    ventas_id_venta_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ventas_id_venta_seq OWNED BY public.ventas.id_venta;
          public          postgres    false    219            _           2604    32975    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    216    215            `           2604    32976    productos id_producto    DEFAULT     ~   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    218    217            a           2604    32999    ventas id_venta    DEFAULT     r   ALTER TABLE ONLY public.ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.ventas_id_venta_seq'::regclass);
 >   ALTER TABLE public.ventas ALTER COLUMN id_venta DROP DEFAULT;
       public          postgres    false    219    220    220            �          0    32963    clientes 
   TABLE DATA           @   COPY public.clientes (id_cliente, nombre, apellido) FROM stdin;
    public          postgres    false    215   �*       �          0    32967 	   productos 
   TABLE DATA           @   COPY public.productos (id_producto, nombre, precio) FROM stdin;
    public          postgres    false    217   +       �          0    32996    ventas 
   TABLE DATA           h   COPY public.ventas (id_venta, id_cliente, id_producto, cantidad, precio_total, fecha_venta) FROM stdin;
    public          postgres    false    220   �+                  0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 5, true);
          public          postgres    false    216            	           0    0    productos_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_id_producto_seq', 5, true);
          public          postgres    false    218            
           0    0    ventas_id_venta_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ventas_id_venta_seq', 5, true);
          public          postgres    false    219            c           2606    32979    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215            e           2606    32981    productos productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    217            g           2606    33001    ventas ventas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id_venta);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    220            h           2606    33002    ventas fk_venta_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 A   ALTER TABLE ONLY public.ventas DROP CONSTRAINT fk_venta_cliente;
       public          postgres    false    220    215    4707            i           2606    33007    ventas fk_venta_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) NOT VALID;
 B   ALTER TABLE ONLY public.ventas DROP CONSTRAINT fk_venta_producto;
       public          postgres    false    220    4709    217            �   3   x�3��*M��L��M��2�LN,��/�,H-rM8��B�%E�\1z\\\ U�      �   [   x�3�L,*ʯR pY�p�r&&�f�������ِ� 1�${A����L��8sR�3H�X��� b�1gFijY>i��M��c���� ]�/*      �   N   x�]̻�0�v9��8�w��s�\E��x�@"�(ICB(ʴ̝�jta�&֞���'-ήg^'�t��;t�t>��$J1     