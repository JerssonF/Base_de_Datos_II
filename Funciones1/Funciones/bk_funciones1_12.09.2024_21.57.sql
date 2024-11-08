PGDMP  9    9                |         
   funciones1    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16775 
   funciones1    DATABASE     }   CREATE DATABASE funciones1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE funciones1;
                postgres    false            �            1255    16850 &   existencia_producto(character varying)    FUNCTION     �  CREATE FUNCTION public.existencia_producto(nombre_producto character varying) RETURNS character varying
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
       public          postgres    false            �            1255    16854    promedio_ventas(integer)    FUNCTION     "  CREATE FUNCTION public.promedio_ventas(p_id_cliente integer) RETURNS double precision
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
       public          postgres    false            �            1259    16808    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16807    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public          postgres    false    220                       0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public          postgres    false    219            �            1259    16784 	   productos    TABLE     �   CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character(50) NOT NULL,
    precio numeric(10,2) NOT NULL
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    16783    productos_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.productos_id_producto_seq;
       public          postgres    false    216                       0    0    productos_id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;
          public          postgres    false    215            �            1259    16791    ventas    TABLE     �   CREATE TABLE public.ventas (
    id_venta integer NOT NULL,
    id_cliente integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    precio_total numeric(10,2) NOT NULL
);
    DROP TABLE public.ventas;
       public         heap    postgres    false            �            1259    16790    ventas_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE public.ventas_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ventas_id_venta_seq;
       public          postgres    false    218                       0    0    ventas_id_venta_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ventas_id_venta_seq OWNED BY public.ventas.id_venta;
          public          postgres    false    217            ^           2604    16811    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    219    220    220            \           2604    16787    productos id_producto    DEFAULT     ~   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    215    216    216            ]           2604    16794    ventas id_venta    DEFAULT     r   ALTER TABLE ONLY public.ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.ventas_id_venta_seq'::regclass);
 >   ALTER TABLE public.ventas ALTER COLUMN id_venta DROP DEFAULT;
       public          postgres    false    218    217    218            �          0    16808    clientes 
   TABLE DATA           @   COPY public.clientes (id_cliente, nombre, apellido) FROM stdin;
    public          postgres    false    220   $"       �          0    16784 	   productos 
   TABLE DATA           @   COPY public.productos (id_producto, nombre, precio) FROM stdin;
    public          postgres    false    216   �"       �          0    16791    ventas 
   TABLE DATA           [   COPY public.ventas (id_venta, id_cliente, id_producto, cantidad, precio_total) FROM stdin;
    public          postgres    false    218   �"                  0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 5, true);
          public          postgres    false    219                       0    0    productos_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_id_producto_seq', 5, true);
          public          postgres    false    215                       0    0    ventas_id_venta_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ventas_id_venta_seq', 5, true);
          public          postgres    false    217            d           2606    16813    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    220            `           2606    16789    productos productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    216            b           2606    16796    ventas ventas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id_venta);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    218            e           2606    16814    ventas fk_venta_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 A   ALTER TABLE ONLY public.ventas DROP CONSTRAINT fk_venta_cliente;
       public          postgres    false    218    4708    220            f           2606    16802    ventas fk_venta_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);
 B   ALTER TABLE ONLY public.ventas DROP CONSTRAINT fk_venta_producto;
       public          postgres    false    218    216    4704            �   S   x��K� ׯ�1�w7��j
l���b���df܍3�$�҂�::C�����'k��ǩ��l�T�[(�SG�V���>���      �   S   x�3�,H�S p��pq�&g����� �٘3�4�,�4͖�&��EE�U��5��h6�LLN�,!�ٜ�F�1z\\\ ��.�      �   <   x�-��  �tC�5����!Ɔw�+�d#MM�⁐qb��7J�����,>��.�^     