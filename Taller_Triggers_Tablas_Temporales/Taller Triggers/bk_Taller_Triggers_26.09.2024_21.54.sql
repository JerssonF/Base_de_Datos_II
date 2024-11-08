PGDMP  1    7                |            triggers    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16879    triggers    DATABASE     {   CREATE DATABASE triggers WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE triggers;
                postgres    false            �            1255    16906    auditoria_sueldos()    FUNCTION     �   CREATE FUNCTION public.auditoria_sueldos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO auditoria_sueldo (id_empleado, sueldo_anterior, sueldo_nuevo)
	VALUES (OLD.id, OLD.sueldo, NEW.sueldo);
RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.auditoria_sueldos();
       public          postgres    false            �            1255    16887    calcular_imc()    FUNCTION     �   CREATE FUNCTION public.calcular_imc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

 BEGIN
 NEW.imc = NEW.peso/(NEW.estatura*NEW.estatura);
 RETURN NEW;
 END;
 
$$;
 %   DROP FUNCTION public.calcular_imc();
       public          postgres    false            �            1259    16897    auditoria_sueldo    TABLE     �   CREATE TABLE public.auditoria_sueldo (
    id_empleado integer NOT NULL,
    sueldo_anterior numeric(10,2) NOT NULL,
    sueldo_nuevo numeric(10,2) NOT NULL,
    "fecha _cambio" time without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 $   DROP TABLE public.auditoria_sueldo;
       public         heap    postgres    false            �            1259    16891 	   empleados    TABLE     �   CREATE TABLE public.empleados (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    sueldo numeric(10,2) NOT NULL
);
    DROP TABLE public.empleados;
       public         heap    postgres    false            �            1259    16890    empleados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.empleados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.empleados_id_seq;
       public          postgres    false    218            �           0    0    empleados_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.empleados_id_seq OWNED BY public.empleados.id;
          public          postgres    false    217            �            1259    16881    imc    TABLE     �   CREATE TABLE public.imc (
    id integer NOT NULL,
    estatura numeric(10,2) NOT NULL,
    peso numeric(10,2) NOT NULL,
    imc numeric(10,2) NOT NULL
);
    DROP TABLE public.imc;
       public         heap    postgres    false            �            1259    16880 
   imc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.imc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.imc_id_seq;
       public          postgres    false    216                        0    0 
   imc_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.imc_id_seq OWNED BY public.imc.id;
          public          postgres    false    215            \           2604    16894    empleados id    DEFAULT     l   ALTER TABLE ONLY public.empleados ALTER COLUMN id SET DEFAULT nextval('public.empleados_id_seq'::regclass);
 ;   ALTER TABLE public.empleados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            [           2604    16884    imc id    DEFAULT     `   ALTER TABLE ONLY public.imc ALTER COLUMN id SET DEFAULT nextval('public.imc_id_seq'::regclass);
 5   ALTER TABLE public.imc ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16897    auditoria_sueldo 
   TABLE DATA           g   COPY public.auditoria_sueldo (id_empleado, sueldo_anterior, sueldo_nuevo, "fecha _cambio") FROM stdin;
    public          postgres    false    219   n       �          0    16891 	   empleados 
   TABLE DATA           7   COPY public.empleados (id, nombre, sueldo) FROM stdin;
    public          postgres    false    218   �       �          0    16881    imc 
   TABLE DATA           6   COPY public.imc (id, estatura, peso, imc) FROM stdin;
    public          postgres    false    216                     0    0    empleados_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.empleados_id_seq', 5, true);
          public          postgres    false    217                       0    0 
   imc_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.imc_id_seq', 2, true);
          public          postgres    false    215            a           2606    16896    empleados empleados_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_pkey;
       public            postgres    false    218            _           2606    16886    imc imc_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.imc
    ADD CONSTRAINT imc_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.imc DROP CONSTRAINT imc_pkey;
       public            postgres    false    216            d           2620    16908    empleados auditoria_sueldos    TRIGGER     }   CREATE TRIGGER auditoria_sueldos BEFORE UPDATE ON public.empleados FOR EACH ROW EXECUTE FUNCTION public.auditoria_sueldos();
 4   DROP TRIGGER auditoria_sueldos ON public.empleados;
       public          postgres    false    218    221            c           2620    16889    imc calcular_imc    TRIGGER     m   CREATE TRIGGER calcular_imc BEFORE INSERT ON public.imc FOR EACH ROW EXECUTE FUNCTION public.calcular_imc();
 )   DROP TRIGGER calcular_imc ON public.imc;
       public          postgres    false    220    216            b           2606    16900 .   auditoria_sueldo fk_auditoria_sueldo_empleados    FK CONSTRAINT     �   ALTER TABLE ONLY public.auditoria_sueldo
    ADD CONSTRAINT fk_auditoria_sueldo_empleados FOREIGN KEY (id_empleado) REFERENCES public.empleados(id) NOT VALID;
 X   ALTER TABLE ONLY public.auditoria_sueldo DROP CONSTRAINT fk_auditoria_sueldo_empleados;
       public          postgres    false    218    4705    219            �   *   x�3�42 =Nc#8��������\�����ؐ+F��� �&�      �   c   x�E�1� ��xŽ� H�cl.�m|����;��@Lx��^�V�H����JHC�]��"Ox���{�e�����mq{ndԠ	���+���V)�� ��#	      �       x�3�4�37�47�30�42ҳ0����� 13�     