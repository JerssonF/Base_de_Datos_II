PGDMP  -                     |            taller    16.4    16.4 +               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32782    taller    DATABASE     |   CREATE DATABASE taller WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE taller;
                postgres    false            �            1259    32783    cursos    TABLE     �   CREATE TABLE public.cursos (
    id_curso integer NOT NULL,
    nombre_curso character varying(100) NOT NULL,
    acronimo_curso character varying(10) NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.cursos;
       public         heap    postgres    false            �            1259    32786    cursos_id_curso_seq    SEQUENCE     �   CREATE SEQUENCE public.cursos_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cursos_id_curso_seq;
       public          postgres    false    215                       0    0    cursos_id_curso_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cursos_id_curso_seq OWNED BY public.cursos.id_curso;
          public          postgres    false    216            �            1259    32787    cursos_semestres    TABLE     �   CREATE TABLE public.cursos_semestres (
    id_curso_semestre integer NOT NULL,
    id_curso integer NOT NULL,
    id_semestre integer NOT NULL,
    grupo integer NOT NULL,
    profesor character varying(100) NOT NULL,
    estado character(1) NOT NULL
);
 $   DROP TABLE public.cursos_semestres;
       public         heap    postgres    false            �            1259    32790 $   cursos_semetres_id_curso_semetre_seq    SEQUENCE     �   CREATE SEQUENCE public.cursos_semetres_id_curso_semetre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.cursos_semetres_id_curso_semetre_seq;
       public          postgres    false    217                       0    0 $   cursos_semetres_id_curso_semetre_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.cursos_semetres_id_curso_semetre_seq OWNED BY public.cursos_semestres.id_curso_semestre;
          public          postgres    false    218            �            1259    32791    datos_calificacion    TABLE     �  CREATE TABLE public.datos_calificacion (
    id_dato_calificacion integer NOT NULL,
    id_curso_semestre integer NOT NULL,
    prediccion_semana integer NOT NULL,
    id_estudiante integer NOT NULL,
    lab1 numeric(2,1) NOT NULL,
    plazo_entrega_lab1 numeric(4,2) NOT NULL,
    numero_intento_lab1 integer NOT NULL,
    resultado_lab1 integer NOT NULL,
    lab2 numeric(2,1) NOT NULL,
    prediccion integer NOT NULL
);
 &   DROP TABLE public.datos_calificacion;
       public         heap    postgres    false            �            1259    32794 +   datos_calificacion_id_dato_calificacion_seq    SEQUENCE     �   CREATE SEQUENCE public.datos_calificacion_id_dato_calificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.datos_calificacion_id_dato_calificacion_seq;
       public          postgres    false    219                       0    0 +   datos_calificacion_id_dato_calificacion_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.datos_calificacion_id_dato_calificacion_seq OWNED BY public.datos_calificacion.id_dato_calificacion;
          public          postgres    false    220            �            1259    32795    estudiantes    TABLE       CREATE TABLE public.estudiantes (
    id_estudiante integer NOT NULL,
    nombre character varying(250) NOT NULL,
    correo character varying(100) NOT NULL,
    usuario character varying(100) NOT NULL,
    clave character varying(100) NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.estudiantes;
       public         heap    postgres    false            �            1259    32800    estudiantes_id_estudiante_seq    SEQUENCE     �   CREATE SEQUENCE public.estudiantes_id_estudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.estudiantes_id_estudiante_seq;
       public          postgres    false    221                       0    0    estudiantes_id_estudiante_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNED BY public.estudiantes.id_estudiante;
          public          postgres    false    222            �            1259    32801 	   semestres    TABLE     �   CREATE TABLE public.semestres (
    id_semestre integer NOT NULL,
    semestre character varying(10) NOT NULL,
    estado character(1) NOT NULL
);
    DROP TABLE public.semestres;
       public         heap    postgres    false            �            1259    32804    semestres_id_semestre_seq    SEQUENCE     �   CREATE SEQUENCE public.semestres_id_semestre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.semestres_id_semestre_seq;
       public          postgres    false    223                       0    0    semestres_id_semestre_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.semestres_id_semestre_seq OWNED BY public.semestres.id_semestre;
          public          postgres    false    224            d           2604    32805    cursos id_curso    DEFAULT     r   ALTER TABLE ONLY public.cursos ALTER COLUMN id_curso SET DEFAULT nextval('public.cursos_id_curso_seq'::regclass);
 >   ALTER TABLE public.cursos ALTER COLUMN id_curso DROP DEFAULT;
       public          postgres    false    216    215            e           2604    32806 "   cursos_semestres id_curso_semestre    DEFAULT     �   ALTER TABLE ONLY public.cursos_semestres ALTER COLUMN id_curso_semestre SET DEFAULT nextval('public.cursos_semetres_id_curso_semetre_seq'::regclass);
 Q   ALTER TABLE public.cursos_semestres ALTER COLUMN id_curso_semestre DROP DEFAULT;
       public          postgres    false    218    217            f           2604    32807 '   datos_calificacion id_dato_calificacion    DEFAULT     �   ALTER TABLE ONLY public.datos_calificacion ALTER COLUMN id_dato_calificacion SET DEFAULT nextval('public.datos_calificacion_id_dato_calificacion_seq'::regclass);
 V   ALTER TABLE public.datos_calificacion ALTER COLUMN id_dato_calificacion DROP DEFAULT;
       public          postgres    false    220    219            g           2604    32808    estudiantes id_estudiante    DEFAULT     �   ALTER TABLE ONLY public.estudiantes ALTER COLUMN id_estudiante SET DEFAULT nextval('public.estudiantes_id_estudiante_seq'::regclass);
 H   ALTER TABLE public.estudiantes ALTER COLUMN id_estudiante DROP DEFAULT;
       public          postgres    false    222    221            h           2604    32809    semestres id_semestre    DEFAULT     ~   ALTER TABLE ONLY public.semestres ALTER COLUMN id_semestre SET DEFAULT nextval('public.semestres_id_semestre_seq'::regclass);
 D   ALTER TABLE public.semestres ALTER COLUMN id_semestre DROP DEFAULT;
       public          postgres    false    224    223                      0    32783    cursos 
   TABLE DATA           P   COPY public.cursos (id_curso, nombre_curso, acronimo_curso, estado) FROM stdin;
    public          postgres    false    215   �6                 0    32787    cursos_semestres 
   TABLE DATA           m   COPY public.cursos_semestres (id_curso_semestre, id_curso, id_semestre, grupo, profesor, estado) FROM stdin;
    public          postgres    false    217   �7       
          0    32791    datos_calificacion 
   TABLE DATA           �   COPY public.datos_calificacion (id_dato_calificacion, id_curso_semestre, prediccion_semana, id_estudiante, lab1, plazo_entrega_lab1, numero_intento_lab1, resultado_lab1, lab2, prediccion) FROM stdin;
    public          postgres    false    219   �8                 0    32795    estudiantes 
   TABLE DATA           \   COPY public.estudiantes (id_estudiante, nombre, correo, usuario, clave, estado) FROM stdin;
    public          postgres    false    221   N9                 0    32801 	   semestres 
   TABLE DATA           B   COPY public.semestres (id_semestre, semestre, estado) FROM stdin;
    public          postgres    false    223   �:                  0    0    cursos_id_curso_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.cursos_id_curso_seq', 15, true);
          public          postgres    false    216                       0    0 $   cursos_semetres_id_curso_semetre_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.cursos_semetres_id_curso_semetre_seq', 15, true);
          public          postgres    false    218                       0    0 +   datos_calificacion_id_dato_calificacion_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.datos_calificacion_id_dato_calificacion_seq', 15, true);
          public          postgres    false    220                       0    0    estudiantes_id_estudiante_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.estudiantes_id_estudiante_seq', 15, true);
          public          postgres    false    222                       0    0    semestres_id_semestre_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.semestres_id_semestre_seq', 15, true);
          public          postgres    false    224            j           2606    32811    cursos cursos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_curso);
 <   ALTER TABLE ONLY public.cursos DROP CONSTRAINT cursos_pkey;
       public            postgres    false    215            l           2606    32813 &   cursos_semestres cursos_semestres_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.cursos_semestres
    ADD CONSTRAINT cursos_semestres_pkey PRIMARY KEY (id_curso_semestre);
 P   ALTER TABLE ONLY public.cursos_semestres DROP CONSTRAINT cursos_semestres_pkey;
       public            postgres    false    217            n           2606    32815 *   datos_calificacion datos_calificacion_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.datos_calificacion
    ADD CONSTRAINT datos_calificacion_pkey PRIMARY KEY (id_dato_calificacion);
 T   ALTER TABLE ONLY public.datos_calificacion DROP CONSTRAINT datos_calificacion_pkey;
       public            postgres    false    219            p           2606    32817    estudiantes estudiantes_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id_estudiante);
 F   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pkey;
       public            postgres    false    221            r           2606    32819    semestres semestres_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.semestres
    ADD CONSTRAINT semestres_pkey PRIMARY KEY (id_semestre);
 B   ALTER TABLE ONLY public.semestres DROP CONSTRAINT semestres_pkey;
       public            postgres    false    223            s           2606    32820 (   cursos_semestres fk_curso_semestre_curso    FK CONSTRAINT     �   ALTER TABLE ONLY public.cursos_semestres
    ADD CONSTRAINT fk_curso_semestre_curso FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso) NOT VALID;
 R   ALTER TABLE ONLY public.cursos_semestres DROP CONSTRAINT fk_curso_semestre_curso;
       public          postgres    false    217    4714    215            t           2606    32825 +   cursos_semestres fk_curso_semestre_semestre    FK CONSTRAINT     �   ALTER TABLE ONLY public.cursos_semestres
    ADD CONSTRAINT fk_curso_semestre_semestre FOREIGN KEY (id_semestre) REFERENCES public.semestres(id_semestre);
 U   ALTER TABLE ONLY public.cursos_semestres DROP CONSTRAINT fk_curso_semestre_semestre;
       public          postgres    false    223    217    4722            u           2606    32830 6   datos_calificacion fk_dato_calificacion_curso_semestre    FK CONSTRAINT     �   ALTER TABLE ONLY public.datos_calificacion
    ADD CONSTRAINT fk_dato_calificacion_curso_semestre FOREIGN KEY (id_curso_semestre) REFERENCES public.cursos_semestres(id_curso_semestre);
 `   ALTER TABLE ONLY public.datos_calificacion DROP CONSTRAINT fk_dato_calificacion_curso_semestre;
       public          postgres    false    219    4716    217            v           2606    32835 2   datos_calificacion fk_dato_calificacion_estudiante    FK CONSTRAINT     �   ALTER TABLE ONLY public.datos_calificacion
    ADD CONSTRAINT fk_dato_calificacion_estudiante FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(id_estudiante);
 \   ALTER TABLE ONLY public.datos_calificacion DROP CONSTRAINT fk_dato_calificacion_estudiante;
       public          postgres    false    221    219    4720               �   x���n�0���A5?-=(RPP±��v�����&��5�=|#�̎�LK�cG�{�De�Y�qm�E�Ƅs�*�d!�R<��'�|��E�9M�fr�~��;�Aq
�L�ڛ�7b�JB����Wû�Z8�n�%	�M_�-^$�s��A´f��1��=�wd��[�_�s�!�p�����e�
?c�?��I+         �   x�%P1��0��W��9I�v���E��B�crҡ�?�䅤(���4�zJ���G7 ��J���&���n��nPK�ª�
���z�2ob���� ��fZĢp�(1307�n�%G)|d�P��`��J~���Z}�tG����ճeo�:[L�������l��s���)�Û���$��k����:!��.��JT��z��K�&���B�d�E�,��}֡�6���.W�·��K�u��^�      
   �   x�E�ˑ�0D�%@Ȟ\6�8���0e�n������v�e�*��mYz[�c��X�[ ;��o���zEl$�?|�[M,����M@U$Qb�L��?%�X��LS���﬌Υ%��Z�M*�#�u�"�p:pj�ܷF�o��p�8�GѪ�,�� �P��M&J�%%K8����Uk����p�W�1�         �  x�U�Kr�0D��)t����.Y�ٌA�J$DI�J����vJ^�����I�l��8��8��B�M��;��3��ec]��^��x^-OA-&���]�Y�Ɉ�r�k�h`o��9�fWU���t6+�����7��h��+u�y2��{�J�LCWvmά<G|���&�>�ƭ���'J��	�j�8X0�����,ɺ0��HEK���
s���f���+�dG#��8�CD�I,d���dm�HO)|YVS�y�]�ysOH����~�bu11���!�~�$�^��ɕ��F�p�1�i���Q��#���#7��~w�#��� JW/���ڮ�Z5-����GB�H��	i޺^6�< '�Jˋ��+ݼ<��_��|������         W   x�%��� C�3م
(p���������H,��3�3���uq9�K?A�M^WPE��ۀ�w���9j�{�[���y��uU�     