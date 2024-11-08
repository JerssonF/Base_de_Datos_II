PGDMP  $    )    
            |         
   actividad2    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24589 
   actividad2    DATABASE     �   CREATE DATABASE actividad2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE actividad2;
                postgres    false            �            1259    24590    citas    TABLE       CREATE TABLE public.citas (
    id_cita integer NOT NULL,
    id_paciente integer NOT NULL,
    id_doctor integer NOT NULL,
    fecha_cita date NOT NULL,
    hora_cita time with time zone NOT NULL,
    motivo character varying(250) NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.citas;
       public         heap    postgres    false            �            1259    24593    citas_id_cita_seq    SEQUENCE     �   CREATE SEQUENCE public.citas_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.citas_id_cita_seq;
       public          postgres    false    215                        0    0    citas_id_cita_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.citas_id_cita_seq OWNED BY public.citas.id_cita;
          public          postgres    false    216            �            1259    24594    doctores    TABLE       CREATE TABLE public.doctores (
    id_doctor integer NOT NULL,
    nombre character varying(250) NOT NULL,
    num_carnet double precision NOT NULL,
    especialidad character varying(100) NOT NULL,
    telefono character varying(15) NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.doctores;
       public         heap    postgres    false            �            1259    24597    doctores_id_doctor_seq    SEQUENCE     �   CREATE SEQUENCE public.doctores_id_doctor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.doctores_id_doctor_seq;
       public          postgres    false    217                       0    0    doctores_id_doctor_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.doctores_id_doctor_seq OWNED BY public.doctores.id_doctor;
          public          postgres    false    218            �            1259    24598 	   pacientes    TABLE     8  CREATE TABLE public.pacientes (
    id_paciente integer NOT NULL,
    nombre character varying(250) NOT NULL,
    cedula double precision NOT NULL,
    direccion character varying(250) NOT NULL,
    telefono character varying(15) NOT NULL,
    fecha_nacimiento date NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false            �            1259    24603    pacientes_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pacientes_id_paciente_seq;
       public          postgres    false    219                       0    0    pacientes_id_paciente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pacientes_id_paciente_seq OWNED BY public.pacientes.id_paciente;
          public          postgres    false    220            Z           2604    24604    citas id_cita    DEFAULT     n   ALTER TABLE ONLY public.citas ALTER COLUMN id_cita SET DEFAULT nextval('public.citas_id_cita_seq'::regclass);
 <   ALTER TABLE public.citas ALTER COLUMN id_cita DROP DEFAULT;
       public          postgres    false    216    215            [           2604    24605    doctores id_doctor    DEFAULT     x   ALTER TABLE ONLY public.doctores ALTER COLUMN id_doctor SET DEFAULT nextval('public.doctores_id_doctor_seq'::regclass);
 A   ALTER TABLE public.doctores ALTER COLUMN id_doctor DROP DEFAULT;
       public          postgres    false    218    217            \           2604    24606    pacientes id_paciente    DEFAULT     ~   ALTER TABLE ONLY public.pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('public.pacientes_id_paciente_seq'::regclass);
 D   ALTER TABLE public.pacientes ALTER COLUMN id_paciente DROP DEFAULT;
       public          postgres    false    220    219            �          0    24590    citas 
   TABLE DATA           g   COPY public.citas (id_cita, id_paciente, id_doctor, fecha_cita, hora_cita, motivo, estado) FROM stdin;
    public          postgres    false    215   6       �          0    24594    doctores 
   TABLE DATA           a   COPY public.doctores (id_doctor, nombre, num_carnet, especialidad, telefono, estado) FROM stdin;
    public          postgres    false    217   �        �          0    24598 	   pacientes 
   TABLE DATA           o   COPY public.pacientes (id_paciente, nombre, cedula, direccion, telefono, fecha_nacimiento, estado) FROM stdin;
    public          postgres    false    219   �!                  0    0    citas_id_cita_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.citas_id_cita_seq', 20, true);
          public          postgres    false    216                       0    0    doctores_id_doctor_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.doctores_id_doctor_seq', 20, true);
          public          postgres    false    218                       0    0    pacientes_id_paciente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pacientes_id_paciente_seq', 20, true);
          public          postgres    false    220            ^           2606    24608    citas citas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id_cita);
 :   ALTER TABLE ONLY public.citas DROP CONSTRAINT citas_pkey;
       public            postgres    false    215            `           2606    24610    doctores doctores_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.doctores
    ADD CONSTRAINT doctores_pkey PRIMARY KEY (id_doctor);
 @   ALTER TABLE ONLY public.doctores DROP CONSTRAINT doctores_pkey;
       public            postgres    false    217            b           2606    24612    pacientes pacientes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id_paciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    219            c           2606    24613    citas fk_cita_doctor    FK CONSTRAINT        ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_cita_doctor FOREIGN KEY (id_doctor) REFERENCES public.doctores(id_doctor);
 >   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_cita_doctor;
       public          postgres    false    217    4704    215            d           2606    24618    citas fk_cita_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_cita_paciente FOREIGN KEY (id_paciente) REFERENCES public.pacientes(id_paciente);
 @   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_cita_paciente;
       public          postgres    false    215    4706    219            �   <  x���KN�0�דSx��<��&=G`c%C��ڭ��>,Y�����V�r$�_F@Р��Yo$��v��I� %�h�9X�)���������6L�@A9�
d�ؕl��z���[O͕2L吳�D�!�+�z
bO��q�\��������[�_,21��:כ�/<�qam[v3�|�3�l�O�|�h���bx"��,��
/ɸâ�j�&������Ξ�)��W���f�?�k�õ�aɑ�,���o�1����^����SrԬ'��&��f�f?�{"�g�.t"�6t��埬6J��O>?fY���K      �   ?  x���Ar� E��)|����t�����T�79}E�ݒ-�����p�)�����6� �)��@��Y#�h��j�n�գ���m\`�9;�F+�u�ym9O�]C﬌��w>��/�HP�v��~��d�&�m'�^ϣ�=�=�?-����y��L��/��[^};_���_7�˹�?w�v�v�LQ�h#Aq��~�ca|��FDi��m��0��4���oƮ�'� K�(g�z�i���5夈��aUe�AgXYֵ���auoXU�����|����̒!e�!������S{l$�ﯦi~x#
�      �   �  x��ҽn�0��z
�7��_�fc��dP��<}F>�����0>�Ǫ���諴���/ņ��!��.�Zi�9�'m���59���U<��L"k�N��Sڴ�lmӕQɽ,u��8O!B��/%[b&g�xu���*����P:bf��f��	��D	dqԟ2�[�e��e�JG�8i�2�u��`�a�L����l0:a�{��<��3D�=(wI-��v7��d�iݝθ�����뢌(�ث:dU7y-�rk@`t��<��"!��3�aBD�u�V^�8U-�]��;z�=LL����&��d7�Q�,�)o���F<��?��7��d2q�{������)�㓶�g��OZ�3?{�n���=ϲ<��>�h�������g�x/7���N����uxy���A?�     