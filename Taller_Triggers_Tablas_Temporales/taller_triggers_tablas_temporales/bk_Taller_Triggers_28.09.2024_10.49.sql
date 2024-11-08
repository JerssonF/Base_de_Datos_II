PGDMP  ;    1    
            |            taller_triggers    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41040    taller_triggers    DATABASE     �   CREATE DATABASE taller_triggers WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE taller_triggers;
                postgres    false            �            1255    41041    auditoria_sueldos()    FUNCTION     �   CREATE FUNCTION public.auditoria_sueldos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO auditoria_sueldo (id_empleado, sueldo_anterior, sueldo_nuevo)
	VALUES (OLD.id, OLD.sueldo, NEW.sueldo);
RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.auditoria_sueldos();
       public          postgres    false            �            1255    41042    calcular_imc()    FUNCTION     �   CREATE FUNCTION public.calcular_imc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

 BEGIN
 NEW.imc = NEW.peso/(NEW.estatura*NEW.estatura);
 RETURN NEW;
 END;
 
$$;
 %   DROP FUNCTION public.calcular_imc();
       public          postgres    false            �            1255    41068    check_negative_salary()    FUNCTION     e  CREATE FUNCTION public.check_negative_salary() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Verificar si el sueldo es menor que 0
    IF NEW.sueldo < 0 THEN
        RAISE EXCEPTION 'El sueldo no puede ser un valor negativo: %', NEW.sueldo;
    END IF;

    -- Si el sueldo no es negativo, continuar con la operación
    RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.check_negative_salary();
       public          postgres    false            �            1259    41043    auditoria_sueldo    TABLE     �   CREATE TABLE public.auditoria_sueldo (
    id_empleado integer NOT NULL,
    sueldo_anterior numeric(10,2) NOT NULL,
    sueldo_nuevo numeric(10,2) NOT NULL,
    "fecha _cambio" time without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 $   DROP TABLE public.auditoria_sueldo;
       public         heap    postgres    false            �            1259    41047 	   empleados    TABLE     �   CREATE TABLE public.empleados (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    sueldo numeric(10,2) NOT NULL
);
    DROP TABLE public.empleados;
       public         heap    postgres    false            �            1259    41050    empleados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.empleados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.empleados_id_seq;
       public          postgres    false    218                       0    0    empleados_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.empleados_id_seq OWNED BY public.empleados.id;
          public          postgres    false    219            �            1259    41051    imc    TABLE     �   CREATE TABLE public.imc (
    id integer NOT NULL,
    estatura numeric(10,2) NOT NULL,
    peso numeric(10,2) NOT NULL,
    imc numeric(10,2) NOT NULL
);
    DROP TABLE public.imc;
       public         heap    postgres    false            �            1259    41054 
   imc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.imc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.imc_id_seq;
       public          postgres    false    220                       0    0 
   imc_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.imc_id_seq OWNED BY public.imc.id;
          public          postgres    false    221            _           2604    41055    empleados id    DEFAULT     l   ALTER TABLE ONLY public.empleados ALTER COLUMN id SET DEFAULT nextval('public.empleados_id_seq'::regclass);
 ;   ALTER TABLE public.empleados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            `           2604    41056    imc id    DEFAULT     `   ALTER TABLE ONLY public.imc ALTER COLUMN id SET DEFAULT nextval('public.imc_id_seq'::regclass);
 5   ALTER TABLE public.imc ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �          0    41043    auditoria_sueldo 
   TABLE DATA           g   COPY public.auditoria_sueldo (id_empleado, sueldo_anterior, sueldo_nuevo, "fecha _cambio") FROM stdin;
    public          postgres    false    217          �          0    41047 	   empleados 
   TABLE DATA           7   COPY public.empleados (id, nombre, sueldo) FROM stdin;
    public          postgres    false    218   M       �          0    41051    imc 
   TABLE DATA           6   COPY public.imc (id, estatura, peso, imc) FROM stdin;
    public          postgres    false    220   �                  0    0    empleados_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.empleados_id_seq', 8, true);
          public          postgres    false    219                       0    0 
   imc_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.imc_id_seq', 2, true);
          public          postgres    false    221            b           2606    41058    empleados empleados_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_pkey;
       public            postgres    false    218            d           2606    41060    imc imc_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.imc
    ADD CONSTRAINT imc_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.imc DROP CONSTRAINT imc_pkey;
       public            postgres    false    220            f           2620    41061    empleados auditoria_sueldos    TRIGGER     }   CREATE TRIGGER auditoria_sueldos BEFORE UPDATE ON public.empleados FOR EACH ROW EXECUTE FUNCTION public.auditoria_sueldos();
 4   DROP TRIGGER auditoria_sueldos ON public.empleados;
       public          postgres    false    218    222            h           2620    41062    imc calcular_imc    TRIGGER     m   CREATE TRIGGER calcular_imc BEFORE INSERT ON public.imc FOR EACH ROW EXECUTE FUNCTION public.calcular_imc();
 )   DROP TRIGGER calcular_imc ON public.imc;
       public          postgres    false    220    223            g           2620    41069    empleados trigger_check_salary    TRIGGER     �   CREATE TRIGGER trigger_check_salary BEFORE INSERT OR UPDATE ON public.empleados FOR EACH ROW EXECUTE FUNCTION public.check_negative_salary();
 7   DROP TRIGGER trigger_check_salary ON public.empleados;
       public          postgres    false    224    218            e           2606    41063 .   auditoria_sueldo fk_auditoria_sueldo_empleados    FK CONSTRAINT     �   ALTER TABLE ONLY public.auditoria_sueldo
    ADD CONSTRAINT fk_auditoria_sueldo_empleados FOREIGN KEY (id_empleado) REFERENCES public.empleados(id) NOT VALID;
 X   ALTER TABLE ONLY public.auditoria_sueldo DROP CONSTRAINT fk_auditoria_sueldo_empleados;
       public          postgres    false    4706    217    218            �   *   x�3�42 =Nc#8��������\�����ؐ+F��� �&�      �   |   x�E�1�0���9�O�BҨ��E�*��(�����U�������m+ $�n��E���Uۚ�.7X�d�%}6�:&�#W�{֋��4�r��ƥ���;h�M���"�O�Xe!�
1}�cpΝF	/�      �       x�3�4�37�47�30�42ҳ0����� 13�     