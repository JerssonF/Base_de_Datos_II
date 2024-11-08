PGDMP  +                    |            hospital    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16542    hospital    DATABASE     {   CREATE DATABASE hospital WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE hospital;
                postgres    false            �            1259    16567    citas    TABLE       CREATE TABLE public.citas (
    id_cita integer NOT NULL,
    id_paciente integer NOT NULL,
    id_doctor integer NOT NULL,
    fecha_cita date NOT NULL,
    hora_cita time with time zone NOT NULL,
    motivo character varying(250) NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.citas;
       public         heap    postgres    false            �            1259    16566    citas_id_cita_seq    SEQUENCE     �   CREATE SEQUENCE public.citas_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.citas_id_cita_seq;
       public          postgres    false    220                        0    0    citas_id_cita_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.citas_id_cita_seq OWNED BY public.citas.id_cita;
          public          postgres    false    219            �            1259    16551    doctores    TABLE       CREATE TABLE public.doctores (
    id_doctor integer NOT NULL,
    nombre character varying(250) NOT NULL,
    num_carnet double precision NOT NULL,
    especialidad character varying(100) NOT NULL,
    telefono character varying(15) NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.doctores;
       public         heap    postgres    false            �            1259    16550    doctores_id_doctor_seq    SEQUENCE     �   CREATE SEQUENCE public.doctores_id_doctor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.doctores_id_doctor_seq;
       public          postgres    false    216                       0    0    doctores_id_doctor_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.doctores_id_doctor_seq OWNED BY public.doctores.id_doctor;
          public          postgres    false    215            �            1259    16558 	   pacientes    TABLE     8  CREATE TABLE public.pacientes (
    id_paciente integer NOT NULL,
    nombre character varying(250) NOT NULL,
    cedula double precision NOT NULL,
    direccion character varying(250) NOT NULL,
    telefono character varying(15) NOT NULL,
    fecha_nacimiento date NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false            �            1259    16557    pacientes_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pacientes_id_paciente_seq;
       public          postgres    false    218                       0    0    pacientes_id_paciente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pacientes_id_paciente_seq OWNED BY public.pacientes.id_paciente;
          public          postgres    false    217            \           2604    16570    citas id_cita    DEFAULT     n   ALTER TABLE ONLY public.citas ALTER COLUMN id_cita SET DEFAULT nextval('public.citas_id_cita_seq'::regclass);
 <   ALTER TABLE public.citas ALTER COLUMN id_cita DROP DEFAULT;
       public          postgres    false    220    219    220            Z           2604    16554    doctores id_doctor    DEFAULT     x   ALTER TABLE ONLY public.doctores ALTER COLUMN id_doctor SET DEFAULT nextval('public.doctores_id_doctor_seq'::regclass);
 A   ALTER TABLE public.doctores ALTER COLUMN id_doctor DROP DEFAULT;
       public          postgres    false    215    216    216            [           2604    16561    pacientes id_paciente    DEFAULT     ~   ALTER TABLE ONLY public.pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('public.pacientes_id_paciente_seq'::regclass);
 D   ALTER TABLE public.pacientes ALTER COLUMN id_paciente DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    16567    citas 
   TABLE DATA           g   COPY public.citas (id_cita, id_paciente, id_doctor, fecha_cita, hora_cita, motivo, estado) FROM stdin;
    public          postgres    false    220   C       �          0    16551    doctores 
   TABLE DATA           a   COPY public.doctores (id_doctor, nombre, num_carnet, especialidad, telefono, estado) FROM stdin;
    public          postgres    false    216   }        �          0    16558 	   pacientes 
   TABLE DATA           o   COPY public.pacientes (id_paciente, nombre, cedula, direccion, telefono, fecha_nacimiento, estado) FROM stdin;
    public          postgres    false    218   �!                  0    0    citas_id_cita_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.citas_id_cita_seq', 20, true);
          public          postgres    false    219                       0    0    doctores_id_doctor_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.doctores_id_doctor_seq', 20, true);
          public          postgres    false    215                       0    0    pacientes_id_paciente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pacientes_id_paciente_seq', 20, true);
          public          postgres    false    217            b           2606    16572    citas citas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id_cita);
 :   ALTER TABLE ONLY public.citas DROP CONSTRAINT citas_pkey;
       public            postgres    false    220            ^           2606    16556    doctores doctores_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.doctores
    ADD CONSTRAINT doctores_pkey PRIMARY KEY (id_doctor);
 @   ALTER TABLE ONLY public.doctores DROP CONSTRAINT doctores_pkey;
       public            postgres    false    216            `           2606    16565    pacientes pacientes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id_paciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    218            c           2606    16578    citas fk_cita_doctor    FK CONSTRAINT        ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_cita_doctor FOREIGN KEY (id_doctor) REFERENCES public.doctores(id_doctor);
 >   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_cita_doctor;
       public          postgres    false    4702    216    220            d           2606    16573    citas fk_cita_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_cita_paciente FOREIGN KEY (id_paciente) REFERENCES public.pacientes(id_paciente);
 @   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_cita_paciente;
       public          postgres    false    4704    220    218            �   *  x���An�0E��)�W�<���tc�K-����t�u���:4�M�l�Jތ�?��p�Ł�C`��b'�^��UP��6���~R���m0�Up��$���=���y�*cu��QT�)؎�ЗE�r�V{5�w�-��@|rֽY?��G�PSHdj@�}U�:��li��w�5tN���NUx}5��|p����CG8�	���Ii�Ҷw�7v��BKp$ۭ@��]�{j�v�K��EJn���u��\�X�)hKz2�ی��X��0���h�(���`�$�K0O����x��Z�7y0*      �   ?  x���Ar�0E��>A���t��q�ة���H�l������+e5/1�:��mZ艇XR#�Aלּ��4I�e�	k:�0DZx�u�]�X�6��Tf�e�8��h�d��{����ʤ��f�v/��x��������F�OSd��^]x)OOb��/ts���[�Lyv�x�`�����Px�8��9������Z�����t��yH�2��0%�`�d�s�Y�7�!V"ʃ�UIo`��=��u�`Q`�����F�n-�M�@�C�9�Sth�����Z�jƋ=㵢��j�x�k�T����ﯪ�~ N�      �   �  x��ҽn�0��z
�����%���<ȒA9.������Ƨ����nE��^?��s��[u�y.���c�<*�9�l'�cdqP2Xu�u}K��·�2��J�;c���59���32���T�>�M���vo+���Je����y

2<�=�%fr�W�K���z-O�#�_�������q��2�[�e��e�JG�8i�2�u��`�a�{1��V4#ȳ��=�q0ؒ�0�����=$�����{�E�uw:�/���#���EQ"�WuȪn�V��ր���y"%DB�GgÄ���0����q�,Z懴�cw(�4�s��0��'˸���d��My�@?H7�Q���!�'�	���\>i�|�v����I��3��'��0��`{΂_���/,QJ     