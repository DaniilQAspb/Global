PGDMP              	        }            CarDealership    17.2    17.2     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            +           1262    16391    CarDealership    DATABASE     �   CREATE DATABASE "CarDealership" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "CarDealership";
                     postgres    false            �            1259    16393    cars    TABLE     �  CREATE TABLE public.cars (
    car_id integer NOT NULL,
    brand character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    year integer,
    price numeric(12,2) NOT NULL,
    mileage integer,
    fueltype character varying(20),
    transmission character varying(20),
    description text,
    sold_by_employee_id integer,
    CONSTRAINT cars_year_check CHECK ((year >= 1886))
);
    DROP TABLE public.cars;
       public         heap r       postgres    false            �            1259    16392    cars_carid_seq    SEQUENCE     �   CREATE SEQUENCE public.cars_carid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cars_carid_seq;
       public               postgres    false    218            ,           0    0    cars_carid_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.cars_carid_seq OWNED BY public.cars.car_id;
          public               postgres    false    217            �            1259    16581    users    TABLE       CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    role_name character varying(50) DEFAULT 'seller'::character varying
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16580    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public               postgres    false    220            -           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public               postgres    false    219            �           2604    16396    cars car_id    DEFAULT     i   ALTER TABLE ONLY public.cars ALTER COLUMN car_id SET DEFAULT nextval('public.cars_carid_seq'::regclass);
 :   ALTER TABLE public.cars ALTER COLUMN car_id DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    16584    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public               postgres    false    220    219    220            �           2606    16401    cars cars_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (car_id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public                 postgres    false    218            �           2606    16588    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    220            �           2606    16586    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    220           