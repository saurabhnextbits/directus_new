PGDMP     7                
    z            directus    15.0    15.0 �    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    16384    directus    DATABASE     s   CREATE DATABASE directus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE directus;
                postgres    false            8           0    0    directus    DATABASE PROPERTIES     S   ALTER DATABASE directus SET search_path TO '$user', 'public', 'topology', 'tiger';
                     postgres    false                        2615    19226    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
                postgres    false                        2615    19482 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
                postgres    false            
            2615    19052    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
                postgres    false            9           0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                   postgres    false    10                        3079    19215    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false            :           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    4                        3079    18006    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            ;           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2                        3079    19227    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                   false    4    2    11            <           0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                        false    5                        3079    19053    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                   false    2    10            =           0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                        false    3                       1259    20084    nextbits_timesheet    TABLE     �  CREATE TABLE public.nextbits_timesheet (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    department character varying(255),
    notes character varying(255),
    project character varying(255),
    "timestamp" real,
    "time" real,
    date timestamp without time zone
);
 &   DROP TABLE public.nextbits_timesheet;
       public         heap    postgres    false                       1259    20090    Timesheet_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Timesheet_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Timesheet_id_seq";
       public          postgres    false    283            >           0    0    Timesheet_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public."Timesheet_id_seq" OWNED BY public.nextbits_timesheet.id;
          public          postgres    false    284                       1259    20091    nextbits_department    TABLE     K  CREATE TABLE public.nextbits_department (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255)
);
 '   DROP TABLE public.nextbits_department;
       public         heap    postgres    false                       1259    20097    department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.department_id_seq;
       public          postgres    false    285            ?           0    0    department_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.department_id_seq OWNED BY public.nextbits_department.id;
          public          postgres    false    286                       1259    20098    directus_activity    TABLE     �  CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);
 %   DROP TABLE public.directus_activity;
       public         heap    postgres    false                        1259    20104    directus_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_activity_id_seq;
       public          postgres    false    287            @           0    0    directus_activity_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;
          public          postgres    false    288            !           1259    20105    directus_collections    TABLE       CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL
);
 (   DROP TABLE public.directus_collections;
       public         heap    postgres    false            "           1259    20115    directus_dashboards    TABLE     I  CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);
 '   DROP TABLE public.directus_dashboards;
       public         heap    postgres    false            #           1259    20122    directus_fields    TABLE     �  CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);
 #   DROP TABLE public.directus_fields;
       public         heap    postgres    false            $           1259    20131    directus_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.directus_fields_id_seq;
       public          postgres    false    291            A           0    0    directus_fields_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;
          public          postgres    false    292            %           1259    20132    directus_files    TABLE     �  CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);
 "   DROP TABLE public.directus_files;
       public         heap    postgres    false            &           1259    20139    directus_flows    TABLE       CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 "   DROP TABLE public.directus_flows;
       public         heap    postgres    false            '           1259    20147    directus_folders    TABLE     z   CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);
 $   DROP TABLE public.directus_folders;
       public         heap    postgres    false            (           1259    20150    directus_migrations    TABLE     �   CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.directus_migrations;
       public         heap    postgres    false            )           1259    20156    directus_notifications    TABLE     �  CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);
 *   DROP TABLE public.directus_notifications;
       public         heap    postgres    false            *           1259    20163    directus_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.directus_notifications_id_seq;
       public          postgres    false    297            B           0    0    directus_notifications_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;
          public          postgres    false    298            +           1259    20164    directus_operations    TABLE     �  CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 '   DROP TABLE public.directus_operations;
       public         heap    postgres    false            ,           1259    20170    directus_panels    TABLE     /  CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 #   DROP TABLE public.directus_panels;
       public         heap    postgres    false            -           1259    20178    directus_permissions    TABLE     �   CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);
 (   DROP TABLE public.directus_permissions;
       public         heap    postgres    false            .           1259    20183    directus_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.directus_permissions_id_seq;
       public          postgres    false    301            C           0    0    directus_permissions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;
          public          postgres    false    302            /           1259    20184    directus_presets    TABLE     �  CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark_outline'::character varying NOT NULL,
    color character varying(255)
);
 $   DROP TABLE public.directus_presets;
       public         heap    postgres    false            0           1259    20191    directus_presets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.directus_presets_id_seq;
       public          postgres    false    303            D           0    0    directus_presets_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;
          public          postgres    false    304            1           1259    20192    directus_relations    TABLE     �  CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);
 &   DROP TABLE public.directus_relations;
       public         heap    postgres    false            2           1259    20198    directus_relations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_relations_id_seq;
       public          postgres    false    305            E           0    0    directus_relations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;
          public          postgres    false    306            3           1259    20199    directus_revisions    TABLE     �   CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);
 &   DROP TABLE public.directus_revisions;
       public         heap    postgres    false            4           1259    20204    directus_revisions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_revisions_id_seq;
       public          postgres    false    307            F           0    0    directus_revisions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;
          public          postgres    false    308            5           1259    20205    directus_roles    TABLE     }  CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);
 "   DROP TABLE public.directus_roles;
       public         heap    postgres    false            6           1259    20214    directus_sessions    TABLE       CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);
 %   DROP TABLE public.directus_sessions;
       public         heap    postgres    false            7           1259    20219    directus_settings    TABLE     �  CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(50) DEFAULT NULL::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    translation_strings json,
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json
);
 %   DROP TABLE public.directus_settings;
       public         heap    postgres    false            8           1259    20229    directus_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_settings_id_seq;
       public          postgres    false    311            G           0    0    directus_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;
          public          postgres    false    312            9           1259    20230    directus_shares    TABLE     �  CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64),
    item character varying(255),
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);
 #   DROP TABLE public.directus_shares;
       public         heap    postgres    false            :           1259    20237    directus_users    TABLE     �  CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true
);
 "   DROP TABLE public.directus_users;
       public         heap    postgres    false            ;           1259    20247    directus_webhooks    TABLE     �  CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);
 %   DROP TABLE public.directus_webhooks;
       public         heap    postgres    false            <           1259    20255    directus_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_webhooks_id_seq;
       public          postgres    false    315            H           0    0    directus_webhooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;
          public          postgres    false    316            =           1259    20256    nextbits_project    TABLE     i  CREATE TABLE public.nextbits_project (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    code character varying(255),
    name character varying(255)
);
 $   DROP TABLE public.nextbits_project;
       public         heap    postgres    false            >           1259    20262    project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.project_id_seq;
       public          postgres    false    317            I           0    0    project_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.project_id_seq OWNED BY public.nextbits_project.id;
          public          postgres    false    318            �           2604    20263    directus_activity id    DEFAULT     |   ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
 C   ALTER TABLE public.directus_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    288    287            �           2604    20264    directus_fields id    DEFAULT     x   ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
 A   ALTER TABLE public.directus_fields ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    292    291            �           2604    20265    directus_notifications id    DEFAULT     �   ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
 H   ALTER TABLE public.directus_notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    298    297            �           2604    20266    directus_permissions id    DEFAULT     �   ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
 F   ALTER TABLE public.directus_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    302    301            �           2604    20267    directus_presets id    DEFAULT     z   ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
 B   ALTER TABLE public.directus_presets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    304    303            �           2604    20268    directus_relations id    DEFAULT     ~   ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
 D   ALTER TABLE public.directus_relations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    306    305            �           2604    20269    directus_revisions id    DEFAULT     ~   ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
 D   ALTER TABLE public.directus_revisions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    308    307            �           2604    20270    directus_settings id    DEFAULT     |   ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
 C   ALTER TABLE public.directus_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    312    311                       2604    20271    directus_webhooks id    DEFAULT     |   ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);
 C   ALTER TABLE public.directus_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    316    315            �           2604    20272    nextbits_department id    DEFAULT     w   ALTER TABLE ONLY public.nextbits_department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);
 E   ALTER TABLE public.nextbits_department ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    286    285                       2604    20273    nextbits_project id    DEFAULT     q   ALTER TABLE ONLY public.nextbits_project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);
 B   ALTER TABLE public.nextbits_project ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    318    317            �           2604    20274    nextbits_timesheet id    DEFAULT     w   ALTER TABLE ONLY public.nextbits_timesheet ALTER COLUMN id SET DEFAULT nextval('public."Timesheet_id_seq"'::regclass);
 D   ALTER TABLE public.nextbits_timesheet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    284    283                      0    20098    directus_activity 
   TABLE DATA                 public          postgres    false    287   D�                 0    20105    directus_collections 
   TABLE DATA                 public          postgres    false    289   �                0    20115    directus_dashboards 
   TABLE DATA                 public          postgres    false    290                   0    20122    directus_fields 
   TABLE DATA                 public          postgres    false    291   �                0    20132    directus_files 
   TABLE DATA                 public          postgres    false    293   �                0    20139    directus_flows 
   TABLE DATA                 public          postgres    false    294   �                0    20147    directus_folders 
   TABLE DATA                 public          postgres    false    295   �                0    20150    directus_migrations 
   TABLE DATA                 public          postgres    false    296                   0    20156    directus_notifications 
   TABLE DATA                 public          postgres    false    297   �                0    20164    directus_operations 
   TABLE DATA                 public          postgres    false    299   �                0    20170    directus_panels 
   TABLE DATA                 public          postgres    false    300   �                 0    20178    directus_permissions 
   TABLE DATA                 public          postgres    false    301   ]      "          0    20184    directus_presets 
   TABLE DATA                 public          postgres    false    303          $          0    20192    directus_relations 
   TABLE DATA                 public          postgres    false    305   S!      &          0    20199    directus_revisions 
   TABLE DATA                 public          postgres    false    307   G"      (          0    20205    directus_roles 
   TABLE DATA                 public          postgres    false    309   N?      )          0    20214    directus_sessions 
   TABLE DATA                 public          postgres    false    310   `@      *          0    20219    directus_settings 
   TABLE DATA                 public          postgres    false    311   B      ,          0    20230    directus_shares 
   TABLE DATA                 public          postgres    false    313   �C      -          0    20237    directus_users 
   TABLE DATA                 public          postgres    false    314   �C      .          0    20247    directus_webhooks 
   TABLE DATA                 public          postgres    false    315   F                0    20091    nextbits_department 
   TABLE DATA                 public          postgres    false    285   ,F      0          0    20256    nextbits_project 
   TABLE DATA                 public          postgres    false    317   !G                0    20084    nextbits_timesheet 
   TABLE DATA                 public          postgres    false    283   H      �          0    18319    spatial_ref_sys 
   TABLE DATA                 public          postgres    false    222   $K      �          0    19233    geocode_settings 
   TABLE DATA                 tiger          postgres    false    233   >K      �          0    19565    pagc_gaz 
   TABLE DATA                 tiger          postgres    false    278   XK      �          0    19575    pagc_lex 
   TABLE DATA                 tiger          postgres    false    280   rK      �          0    19585 
   pagc_rules 
   TABLE DATA                 tiger          postgres    false    282   �K      �          0    19055    topology 
   TABLE DATA                 topology          postgres    false    227   �K      �          0    19067    layer 
   TABLE DATA                 topology          postgres    false    228   �K      J           0    0    Timesheet_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Timesheet_id_seq"', 14, true);
          public          postgres    false    284            K           0    0    department_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.department_id_seq', 2, true);
          public          postgres    false    286            L           0    0    directus_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_activity_id_seq', 232, true);
          public          postgres    false    288            M           0    0    directus_fields_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_fields_id_seq', 88, true);
          public          postgres    false    292            N           0    0    directus_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);
          public          postgres    false    298            O           0    0    directus_permissions_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.directus_permissions_id_seq', 31, true);
          public          postgres    false    302            P           0    0    directus_presets_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_presets_id_seq', 4, true);
          public          postgres    false    304            Q           0    0    directus_relations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_relations_id_seq', 6, true);
          public          postgres    false    306            R           0    0    directus_revisions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.directus_revisions_id_seq', 220, true);
          public          postgres    false    308            S           0    0    directus_settings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);
          public          postgres    false    312            T           0    0    directus_webhooks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);
          public          postgres    false    316            U           0    0    project_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.project_id_seq', 2, true);
          public          postgres    false    318                       2606    20276 !   nextbits_timesheet Timesheet_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT "Timesheet_pkey" PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.nextbits_timesheet DROP CONSTRAINT "Timesheet_pkey";
       public            postgres    false    283                       2606    20278 #   nextbits_department department_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.nextbits_department DROP CONSTRAINT department_pkey;
       public            postgres    false    285                        2606    20280 (   directus_activity directus_activity_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_activity DROP CONSTRAINT directus_activity_pkey;
       public            postgres    false    287            "           2606    20282 .   directus_collections directus_collections_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
 X   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_pkey;
       public            postgres    false    289            $           2606    20284 ,   directus_dashboards directus_dashboards_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_pkey;
       public            postgres    false    290            &           2606    20286 $   directus_fields directus_fields_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_fields DROP CONSTRAINT directus_fields_pkey;
       public            postgres    false    291            (           2606    20288 "   directus_files directus_files_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_pkey;
       public            postgres    false    293            *           2606    20290 .   directus_flows directus_flows_operation_unique 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
 X   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_operation_unique;
       public            postgres    false    294            ,           2606    20292 "   directus_flows directus_flows_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_pkey;
       public            postgres    false    294            .           2606    20294 &   directus_folders directus_folders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_pkey;
       public            postgres    false    295            0           2606    20296 ,   directus_migrations directus_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
 V   ALTER TABLE ONLY public.directus_migrations DROP CONSTRAINT directus_migrations_pkey;
       public            postgres    false    296            2           2606    20298 2   directus_notifications directus_notifications_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_pkey;
       public            postgres    false    297            4           2606    20300 ,   directus_operations directus_operations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_pkey;
       public            postgres    false    299            6           2606    20302 5   directus_operations directus_operations_reject_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);
 _   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_unique;
       public            postgres    false    299            8           2606    20304 6   directus_operations directus_operations_resolve_unique 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_unique;
       public            postgres    false    299            :           2606    20306 $   directus_panels directus_panels_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_pkey;
       public            postgres    false    300            <           2606    20308 .   directus_permissions directus_permissions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_pkey;
       public            postgres    false    301            >           2606    20310 &   directus_presets directus_presets_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_pkey;
       public            postgres    false    303            @           2606    20312 *   directus_relations directus_relations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_relations DROP CONSTRAINT directus_relations_pkey;
       public            postgres    false    305            B           2606    20314 *   directus_revisions directus_revisions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_pkey;
       public            postgres    false    307            D           2606    20316 "   directus_roles directus_roles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_pkey;
       public            postgres    false    309            F           2606    20318 (   directus_sessions directus_sessions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
 R   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_pkey;
       public            postgres    false    310            H           2606    20320 (   directus_settings directus_settings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_pkey;
       public            postgres    false    311            J           2606    20322 $   directus_shares directus_shares_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_pkey;
       public            postgres    false    313            L           2606    20324 *   directus_users directus_users_email_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_email_unique;
       public            postgres    false    314            N           2606    20326 8   directus_users directus_users_external_identifier_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
 b   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_external_identifier_unique;
       public            postgres    false    314            P           2606    20328 "   directus_users directus_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_pkey;
       public            postgres    false    314            R           2606    20330 *   directus_users directus_users_token_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_token_unique;
       public            postgres    false    314            T           2606    20332 (   directus_webhooks directus_webhooks_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_pkey;
       public            postgres    false    315            V           2606    20334    nextbits_project project_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.nextbits_project DROP CONSTRAINT project_pkey;
       public            postgres    false    317            Y           2606    20335 3   nextbits_department department_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 ]   ALTER TABLE ONLY public.nextbits_department DROP CONSTRAINT department_user_created_foreign;
       public          postgres    false    314    4688    285            Z           2606    20340 3   nextbits_department department_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 ]   ALTER TABLE ONLY public.nextbits_department DROP CONSTRAINT department_user_updated_foreign;
       public          postgres    false    285    4688    314            [           2606    20345 7   directus_collections directus_collections_group_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);
 a   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_group_foreign;
       public          postgres    false    289    4642    289            \           2606    20350 <   directus_dashboards directus_dashboards_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_user_created_foreign;
       public          postgres    false    4688    290    314            ]           2606    20355 ,   directus_files directus_files_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_folder_foreign;
       public          postgres    false    293    4654    295            ^           2606    20360 1   directus_files directus_files_modified_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_modified_by_foreign;
       public          postgres    false    4688    314    293            _           2606    20365 1   directus_files directus_files_uploaded_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_uploaded_by_foreign;
       public          postgres    false    4688    293    314            `           2606    20370 2   directus_flows directus_flows_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_user_created_foreign;
       public          postgres    false    4688    294    314            a           2606    20375 0   directus_folders directus_folders_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);
 Z   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_parent_foreign;
       public          postgres    false    295    4654    295            b           2606    20380 ?   directus_notifications directus_notifications_recipient_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_recipient_foreign;
       public          postgres    false    4688    297    314            c           2606    20385 <   directus_notifications directus_notifications_sender_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);
 f   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_sender_foreign;
       public          postgres    false    314    297    4688            d           2606    20390 4   directus_operations directus_operations_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_flow_foreign;
       public          postgres    false    294    299    4652            e           2606    20395 6   directus_operations directus_operations_reject_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_foreign;
       public          postgres    false    4660    299    299            f           2606    20400 7   directus_operations directus_operations_resolve_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);
 a   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_foreign;
       public          postgres    false    299    299    4660            g           2606    20405 <   directus_operations directus_operations_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_user_created_foreign;
       public          postgres    false    4688    314    299            h           2606    20410 1   directus_panels directus_panels_dashboard_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_dashboard_foreign;
       public          postgres    false    300    4644    290            i           2606    20415 4   directus_panels directus_panels_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_user_created_foreign;
       public          postgres    false    314    300    4688            j           2606    20420 6   directus_permissions directus_permissions_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_role_foreign;
       public          postgres    false    301    4676    309            k           2606    20425 .   directus_presets directus_presets_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_role_foreign;
       public          postgres    false    303    4676    309            l           2606    20430 .   directus_presets directus_presets_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_user_foreign;
       public          postgres    false    303    4688    314            m           2606    20435 6   directus_revisions directus_revisions_activity_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_activity_foreign;
       public          postgres    false    4640    307    287            n           2606    20440 4   directus_revisions directus_revisions_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);
 ^   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_parent_foreign;
       public          postgres    false    307    4674    307            o           2606    20445 1   directus_sessions directus_sessions_share_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_share_foreign;
       public          postgres    false    310    4682    313            p           2606    20450 0   directus_sessions directus_sessions_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_user_foreign;
       public          postgres    false    4688    310    314            q           2606    20455 8   directus_settings directus_settings_project_logo_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);
 b   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_project_logo_foreign;
       public          postgres    false    4648    311    293            r           2606    20460 =   directus_settings directus_settings_public_background_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_background_foreign;
       public          postgres    false    311    293    4648            s           2606    20465 =   directus_settings directus_settings_public_foreground_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_foreground_foreign;
       public          postgres    false    311    4648    293            t           2606    20470 B   directus_settings directus_settings_storage_default_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_storage_default_folder_foreign;
       public          postgres    false    4654    295    311            u           2606    20475 2   directus_shares directus_shares_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_collection_foreign;
       public          postgres    false    4642    289    313            v           2606    20480 ,   directus_shares directus_shares_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_role_foreign;
       public          postgres    false    309    313    4676            w           2606    20485 4   directus_shares directus_shares_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_user_created_foreign;
       public          postgres    false    314    313    4688            x           2606    20490 *   directus_users directus_users_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_role_foreign;
       public          postgres    false    314    309    4676            y           2606    20495 -   nextbits_project project_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 W   ALTER TABLE ONLY public.nextbits_project DROP CONSTRAINT project_user_created_foreign;
       public          postgres    false    317    4688    314            z           2606    20500 -   nextbits_project project_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 W   ALTER TABLE ONLY public.nextbits_project DROP CONSTRAINT project_user_updated_foreign;
       public          postgres    false    317    4688    314            W           2606    20505 1   nextbits_timesheet timesheet_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT timesheet_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.nextbits_timesheet DROP CONSTRAINT timesheet_user_created_foreign;
       public          postgres    false    314    283    4688            X           2606    20510 1   nextbits_timesheet timesheet_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT timesheet_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.nextbits_timesheet DROP CONSTRAINT timesheet_user_updated_foreign;
       public          postgres    false    314    283    4688               �  x��[�[����+���F�М��v�A$q��i]�b%Zk�+�i}�#��U�@b�!H�d�5�=x8��p����_�����7��6��8[��f���ۏ?N���?W�O^�7�����������������ޕ/Vw7����ӟ�ۛ�|�^�߰�������6���V^M�����v�n&/֛�ы�?�Rv3Xv˩��Ų���).�Hy6��C�؁� M�z��	������P����_|���j�����N^�������a����w|1)�b�k�W�/���������wѸ0y��_�}���d��e��e���y5��������M�?�N�N�������?���#y�?כ�-؋���]���z3���o�}�޿x��g_��ia�����vh��{ �2H��0l��?��@ǀ×�d�z��a�P��`�0P�#%�0�
�	�A.R#���«`��Xd�0tĶ�H~KE0����⢩�������0lu�4�'4I��BI:hp(�O=�	����:h�y�59g�4�����侷��T�]��tdH���G���t�H���qH�:@G��ͼ�e����W��<	���I^:R%Ю�^rd�#Y��~~��`:�%���Y\���)�v)đA2V��V~��GV��ʑ��w8��L�Ynw1�M��A�`â�w�D'8�E�Pt��{��7���	r(�G\�@�P����udL�C��8$�QG��q(����:tdL���qx�CG��q(���v]ǡ�{I��8s»����K`8d��ЉQ�.�#��XB�ܣ36Jym׃���#KR�BeC$X˝����Y��w�6�w`$���bI��ޖ�\Li���#s�2ǚȽ�&�)A��@��v璜��iIC�. ��f�'tDN��%���Z1{���!��H� e�>=H��C�_�I���Zpg�����;�`p3��<��S-���Q\vg9��yX��(~����w������1M�d5��O��+��!Q��7�)y�ϐ�(�Sc��	�g�W��r95��O�8)�sHt��}���"�ҷwes�(�H����3$:J羱t~�D^�����o��S$Y�^���ľ ��J���L�^�ț�s�D��{&�Lć�J&x&��L��*�3�a���A�2�a���A���s&:>�)|�L:�AL��9&:$>�I���:�HtH|��x�Ӥ��,��!=�.���g��ײ�T|�IzfE�i��g�(>)���z�x'���9�4�[P<�4ޣ�Y��+9��4��GAϙ�����O?2ۃ3�{�`���+�T�]�=^�|�H<��g�x?Q��ʖbH|3��û��(�#D��w�&_�D�C ���u� c�Y'�y�(}�ha���u��3.�_':������N^�>�݉��|��E�������.�`��f!B6�0��8�k;^�:$��@jj/��z��{V��'Ǹu�Z�k]7e�1�7A�U�94{���&��Ь�Cu���|�;�����Toz+�!�S�+�����?�W���A1��,��y8��b=ᠣ$���'�,��#\L��6���T�-�<M}��:�!w���q�M�-u�]R��Wfi���P�W��~�#0kaag6tC�Ѱ�n��ԡ��8��r�c����`r���/����0떖fE6㴛�!wv�<灂ӱ;���X�3�Iٝ�X�,���,W��2���&���
��������D�d��rCnk)��p=D#f2�}�ѽ�ۺ���lH�%��:v ��M��O�N:����i`�#�&���C����6�mo�x1�Ba� lc`�8�7w(�����ȣ
>���t������w \��3�7A�da�<�m���=�c{RژT.����D6V�$�[���� H)�)�����K�Ĝ^UX2y@Pyb��)Lz�m;c��=%��I�1�>_�,�|�SGӥ��!��g���BX.� k�܏���}4	���.E�JX�7���<��%�.p����Ƌ��Qc�m�� (3�Ec�"^@�`��,)�v�C�}��S�?J�- �K�y�K&F)+�R�cH@���z7<&�؇ʝ����{o{KƋ�-���h/~�<ȗg�G
�D{�������2A(�
l���w&��;%;�[vဵ���DJ��-{�ޠ�A7��&�u,W�o�(3�U"�l��8;�q�$�!G��rw�z��E� ������Nٰ=��l�W]����8O�&D�Iɝ_7��z%�z$㣔ޞK�sR���c~�
J��Y�$�嚍}¡�b�rU�hV��6�E�\m�1�蚕}��0�9�FI2�5�w ��S��"J���C�	��Zd�DI2�q{�Pk�R����q{Q��"�����n� ���U��k��WbT��xC�5kT�PKX���d�w)u����Fc����&��%�H����	b��E���Q��(��h� \��WJ�]�)R��@$#�>��H���ȡ�%)ѮFQ�Fc�ԠII���=�ړ�ѫs���WS��?�p%z�RR'*A4���3������~M:��������^�(��F���~]�K
ʜǣį}�_�n��h\����׾ٯ�W���(����o����l�.�<�f�ށ��Y'�Q���͂]A�8<A��7�7߁���q2�%-ξ��<�[�)+s�PR0����w �G4Q�I	��a���轘�����
����IL��u�puʽCId�D�ˮ���_]8�83)/��_�n������qs�9=M�*I���N��$�D�(�H�uo:�w�������"#lPR3	����$��������PR4	��-��n���5q�o��F,N����6�R��U���m��˽�^�eQ\�}$3���[�Ŭ�`4���:�`6��O�RI�kB�x�'�:��^v$z�]1<��ߝOxF���`�౿�����mН��u��-<�h���Hm{j@C<h'f�N?%����y����i�e���G4�I�3��CI�Ylk%8� +���K<�t�Ŷ��#2���Ox(i>�m��GѤ,y}(	}S���J�+���V�L<��b����CIGZj����#
j��CI�@bQ�\�91\.��J
ω��s�aF1��/�P����s�w��̦��C��'?�W��_y%~��bʧ��qRm��/9���ӕ�M����&�I^+Jr'���+�l H����Nr�Y�7��H��8�Gi9A�9$��ڻ��Sz�l�Cϩγ5$/�=��?�ng��Ï��nz���D	%i��
�(8	�$}3����N�z%I��!��(�ֆK<�$}3��W� I~_)I�f��z�M�׳z��$}3����qQ�	%I��!��,����/Z��:��]�I���>���dhM3��9KT&��!�,�ƒ������o~.�+A��X��K��t�Ѳ�	����9����2��D&&q��:|�)��ք$x}D~��Q/�<���.'<��	 G<�zK�����s!��HX*%�0Q:�C,��H"K4\�h�
�G%v,�p��;�C�� K4\O��|�'*�d���x�ڊky<��N�i�'k���.�HJ�ad���C����:.���v��ѢMT�'A�դ�1�-˻�m�ы���d�������z#��x��uhY:Uv�$���{���N.�L�u܀�ӉQG�S���\(�J�`y]�z9�`�J�`y]�X�j�l�R�ru�J.$&%���
�:팲dUWR�E�R�B�`LJJ!�T
�hl��II)�K!��g���(II|������9�I��'%�)�^�y@q��J�]���z��6�')���>��D�]��t$%��AJ��$��`��g��3�           x��Q�j�0��+L/i��vڡ�@�`mw5��6�ml��?��6ʎc�^$�=�Y�5�f��M�}!����b�9)���Kb9R����RXL��I1�%OȀ�B��O��K������x�G ;�:�C����\$��$�:o�ώu��|��l����͡�t��Ҟ.�R,��8��	V���ݭ7bY;x�9)AG�q-E�k��q�)�5}e8f�5Qk��R�����c��m�Ŗ�[9���?�q�4 ��+U����         �   x�E�ͪ�0F�}��U�#i�6�wu.�R���$��[�I��7��j��>ff����������Ct4���������p������=q�[=�+E�F���ůQ�����ow�a�a[ju�\x�B5
����;���;&e^@~p��}�'��]�"�8ǒ!g���Mݮ��Z1�ZD$���kjQ&Q��ИF��aJ6����ɲ�	��I          �  x��]o�6���+�@@.lş�U�d@� �t7�`�s�%������(۱%Qt�Nl�ͅ`R�D=���{|����7�?8���9i6�X�!d�2�)�Q(�3zN�D��eI�9�z�)�<�Œ�)	��$i�DxN�D�/���NI�đ:5caH��D¥�<�P�<Gr��lǉ�����.�7ST�wy����,H�B�����xN� ���������G��9�LU�(����Bu��tw���L�ţ�}>nO�(�m;%�����_Nn"�~��D�����;�B��a��M�n0KX@�{��ҕ��t/���r�J�(t=W=3��z_��mCN���nS.�!<��E�v���_��+��Hl:%f�ӕ�N����M���i�iN1Չw���T�������Z)gs¿���ժ7�}��n������{�c:�Dx����-����r�_.4Q~�ԴŇ��嬻U֙�|�I>�[�re�j��d35H:W/%s�Y.ɂH�?���l>�	�V+g��2.�8&s�.FdWrW��:=�fF�)li�e�jKՐm��[��T�}�P�L�i���L���`�c�үu�,KV(��^�-�V����*e8�]��4�Дp9��1k,ЎQ��t�o/��nM@�<�[��[�)�|�~(M� �(�nu�F4�Ꞇ�(ģ�1f������5��6bRoךC͚�J����q��hM�]�d�L�X�tt�䣾yY��ϋ�/EF  mq�(s�z�z���ݥ[qHGk�{e�Ѝoה��)!_�M5���&M9�q/�����.�$�V�7�G�A���q�e�̒�#[�VFo�.y�v��F��a>i�Hc:�7����+�'�n���� �Qw��+� oy���` �Ƒ�kG�^dy�����-"j��� � �Qxy/X7Ǻ׮��nD �ik�Rۅ ����e9L����e)F����� �<o�5ei���D�+ʘ~�&�ظ{�D>0#G0�����Z�>2CG���Ϧ������󕑏�E��WF>�[�q ~)���-R������xc	o�y���wK��X��&?4����6�ѡ1����߆l� o�|�@����"�Mȡ�l!/)S���]#q�${�{f�PJ����̡�l��C-�f?<<�j��~tx܃�=�ö�=�խ���#m�t�����+RP��7W��bn��Hm���@�/␶���UE��qӷ��u������C:         
   x���             
   x���             
   x���             �  x���Mo�8���D/i�i@R�HvO�l��b�{\0�p#K�>�M��$ے���er��&��yg8�_�O��frK�c�ǉ/ܴ���~V���YI>.]Q�_G$�swD>T~����>��'Wc��SN�����޻y�t�,OS8�K.���YF�r�e�	�8���g�	_"�E��K��?(=������Ưe���ޥ�QA��0*0�N��#�J��u�;ץwiF�e��Ȩlx�$�̖S��?��j!&Z�ųg����=>��y��"�ׅRA�S�D)�}�6"㼨�D����FÊ�^ī|��=�������x��J\9��d�~VA.�����+b�>�|&��r�ҦA$	�����ھ8HZ�J�ˑ�:M�c��8/N�Ž4Rw2��uV�G���5�d̰t�8�{�.�Ov����Р$�WP�G{���L���at�SVEn��k���S�#���� �Ϫ0���I�dfC�n�/dR���A.Ego^�� �#/�`���c5`}e��=�gb�#�Ŵ/�s��,ͳ�)gO~dRL)���;)X�������x�P)�*\m)z���*�c�Q*Ƌ����{�u
^*O�m~L�1��k�n.��|-�z��0�Qa��]�Q�iɾ�Ȓ��,z56<,[�P$bU��9a4����U�,�;_�N��f}qu��U��Ni"I�B$Z������jZI=��D�Dxf�J�����]�/������𜯡*<���U�̃lS���]7��Γ:�y�U�"��w��ۡj��}!��	�XN\���m1���՞$cJDxW�p��X:��3�č�1��N�H��z�L��8���l�9�*�c���	)�>��a���
W���)Zt��l��9�� JL9^�et�(��o�&���!�Vπ��E���k��C�
2�_\����/P�u:(���M�M7� H�#)1���5��+_V>z���S ��G:�&��Owm-�1�>�'>0q�g[�6:�I��C<�0I��Y02���/��* ��)V�8�VWnUE�nͷcKh2bh�����S��-^�݉͒=d1�h/g@�z�2)lVvk�f^�k����j�Vm;o�O�ז�-a(O�2%�Ě8�~F谾��';��\��g������{cd��/"�&��"�
��&�RD���b$(K wИ�l���:�Sx� xo�.���`�"a��K˱I\+J�gYoUwHJ���o����"_@#�ڱ�\����H�Ժ�e������<�7v�І�]"R1�+�4fb�����zYhR}�t��0��8�f�9ՔG��`���k{D�
i��f!�ޏ�� �'�1��a��
�kX��~n�f��$�=ƙ��Vpp�?���         
   x���             
   x���             r  x�MP�j�0}߯~qB� �Z��<�����d��E�F��k]r!��;.l)3g�90�����ӑ<�?ɒ��7�R��E�0Er�%FǱ�: ��(q��)��%q���lf�PO���G���O��OJޝI#%#��1Q�U���! ��#�KwM~��_��U9XQ���Ԗ3ݨ�m��`��i�))){i���[&�&U���v`B@���o����s ��`�,>$$/��%�������p/m�ߐ[,ů2���bW�G�T����B�|��brH������dPY1Roz�����H=��:'_�^�\Vq&*»�;��tm���U�e�꾲��Z1ɍe������Je*ޔ׷����Y�          �  x��͎�0��<EUb�2U]U$�HtSU�߀+��3�@�{� � ��qq�nL�8���{���t�rf�գ����B�*�~bG��<��%��rBΘ��O#�~KS��%�tA��OF��������ɹ��<��q'�Ɲ~�t��0���x8"�8Dm=�uEe �3� � ;���X�����}��5k��[�Kc�z��҄X�����0������`�8�r�����a}4{�6�g���&p	��Y�6�c=2[��%���^�yF� ��d�Yጀ��ffQ�@��gFY�f�ь�H	�7N��Fٌ�H*mߍF!���]J�����;q�}Y/����_k.�pQ!�� ��G�Ô�K��A����+�40
��g�3VX�[�M�7����*¾]�T��E�lVQ�[,��\�w�m�f�{c�,�S�ePiB�2�N�H�p�n�.F������5�MY�8d�?�V(��������N~���˕ᕠ���{���7�5B�
h�W�)�@</��Ҭ"��$X��ꦬ����G�����WZ�S%����@]5(��C��ko;���
kV$�P(̱���g���W��Ж�B��+��=*�U>'ChV�*	�B�r�/yɫ$���-���M�#�U	�*�-��J���*wޖ�V��0JG      "   $  x���o�0���/\Ф,"Dŝv�@BX2qWR�1;emYb���j��LOd�m��ח���O��d�zI!J�gh����dݩ���P+��@.Į�rG��J��	�s#g�!���bK�ӽ����>:���&ړX�|�L�m���r��%��S5SY�1�>ś�FS�&�	8~��ܫ܊��L��g���
�AXz��ӫSV�.���4�8�}��:��ffd�<kǏV�k����R�kl�7B��>�����oh/���.�?A�HP���
�����xoe��e}y��      $   �   x��=�0����l�P?'�B��յ�抑kR��ߛ�H�vs�.�{��po�w��$Y�'�� /��+(�Յ��K�Ʉ���T�E)u�+�8��R��s/�Qށu���͊�E-��~b��o����6=�d2�I�����n�TQ*���߇y�]���t��E�UF� �M�^M�a�����7U�1�i�Ӳ��ا/O+wY��ͱ�LC��=�~Ӥ x ��kE      &      x��]k��6���_axL����^�/L�� A��Tv�	��l�eU�l��i4�ｲd=IK.���h�S.Q�=���/�?���:?���kg�NÑ��`�ެ���p�g��7���x�u�1\�uF���_�:�:x�u|o���)����l�m�����~�|�z���}��U�^������C����}���i�8����_��ϋ�;�?����?���`5	�5|̼�4�O��M�֓��gk�I��7�`����8���g��i�������?�@Zl��N磗]�?��pS����?���~��@�Qfd�8�~v�MB�fI_CP�r썂��5�<>�~N��^����iw���?��~9!������o����	�q3�B��|��;��M��(���5<��zuDA?z��~1l�������s۟��x��$��{��# \�U�����|��?͠��S4Нz�`�J?z̈���?}��~�N4u�l���2xZ�73T��~����Co���������_,�Wo���Z�_��y�������D��t��������ȫ���;R��s�]"�a64�'DcK檉>��$�/�{��1_G`dU�$�r��(������Z����k�W>���gk|���#�h�}��l^�3/���u�|����q�яSo��83v�kr�d��x�q7��>�"�5z����gW��,� �HT��B��)4)��7T,� ��db[�0�f��E!�pé��U9B7��Gh*B���V$'$0ϭ&�]9��Up�ݜM�-
!=�L��#m�dױa��`l{?���F�fV�e���"�kDe�MW�^��W�U�zc�zl;rc~7Hf��Je��V��>J� &ƫ�r�(Z _�~��1˿�6���"���$��7��1!K_H� �$�KƎ'�l���V�BJ� )&�l0~<���3<pL����D�b� S�����cO��wRbx1�o����&��ŷS�2���{T�U�U/�;��$z�(gE��$�¬c�S�y���6�=.��x}�x�{/��{Ȥ˘�k`˼�(��㺄{��ޕg~���VE���>.�?1�ҳE*J]�,���SI���7��;K݌��qI�뗞7�;K]�,�~�\䶐K�v&I�
��Y�(�n�F9?~�Rn�Քz\&��=2s���)�;��z�(�C��$���1q5Ғ���%@�K�T�z�q��BoRnJ��I����j/-`#%�%B���aHB��:8~����trSrxgHB��:,~AA��t��P����PSܯ3	��}N��Ԛ �ɶa�/�U���2u���\�^O�$�h�buI)6�컽�����BP��b��nb���Xx*��b&&�U�c����Bhc��f+��2��*۴^r懅/��}�E�K$��m�(~���V�S��,w�B�r�0��|W��h>�U٠�?�F.��m�v��a-)ņ�ϐ�q�N�,_V��) ���	�먙�����"oJZj�;�-܊n�o�D��)U�5��9 �@֫VWv��Ef]C8�1d���3ܾ��qߵ�軎=l��L�І�z�.�9�3�Ϝf�;�MM��_�^޿j���U����9,z�jr����/��5�B/%�c2���?̞�Y,�DN������`���|�V������~k�4�� ��2�p�r}��/ji�r6\�u��W��R�v�CMP�@�=�:��8��&X���W��07��E��>�eY����zي�<��]��z��N�$?�;�xq���\�;�N�^+؅t�R�x�\�$]Χ�vk��c(���r��cs�
{��е��#k��5����s���翆�Go4'c��x���(V��֔@H"Y��p�JBW���ʘp��#��7�Iّ��;������CP�oUTZ{���hCX
��F���~B}����� M[���E���h��mG�����i��mW�S��&ù��O�����R7�SW��j�
�B�ʣ-A'&S��n�	��B�J݀^L�Ѝ��e�������B7U���Yo���=�:C�J��>L��Ir�T]Hh��T�/�t�^}ꕅ��J��*��)�2$�K
Y(�
1U�=S��󩿽n�t0�.P�Tb�||�v�˘���:@�P��r��˯@�<F�J��J,�ϔ~&�I�MM�[)� �-�ϔ^|rU׉&)���T��R��L鸗��Qq���c�ox�������<<��u߲h�[%z�m�������Z}�/��t>��{�p=z~�-è�MgO�)�'�_���U +��U*\��4
Z�S�(�D��f��'-=��bI}�Y�	W�(�V�P��g��1\�YM�}�	�}�o���j�4'|���pN�<�Sq�C�I������S�`��A\*J����R)x����C*C"[���5��Uw�~R*�k�"K\Y*'��N�'�'��A��*F��1���S�ej����e
ث7�x�<R Gda�#�;|�|ً7o������Ͻ�$ X��XrdJT�AO���˟�av�ܗ��s���@M�*R��0�t�mf���1{By�"(�VEԒ�>�M�*�<8�]�nJ D[K���e��&��B��.����5��[�n�X�z�W8%tt���(��i"��m
� ��M��~�dD/3�r������M"�2������%Ǿ[ɱ���2o����1)'39ǟ�d^�����t˨R"@�2�綣�أo�D��S�	@���[�ܚ��&;��d�IJ� el�v0�|�8[[C0}9%� ����������G�V�k�'���4@[o3X;��2Nԁ�c��RY�('q��L1�����͑�C��C6����\Kwmk��.-%��6Ko8�we%��ok>�
Lp(l�z�]˴��z���GG\}��ݟÂ���1B��j��r�g$G��L��$�S)2�:�9�9��u[?6��.���;/u�Q(�<��i���ك��>`��]�_�� �츔�ǣH���Ll[r�,d�#9/ԬJ���c�ˉw�;�k�̪*���N�m�<�j�`5(� <�D�� �n�b������>06����,��� �����V�!���7Y;�s	���%�3�Φ�m�z�-����0,�u��F��d诞_:���h�?�:��p��z��_���/+�"�I{���Y�+Id!�ƒ�7�' �N1���U�;�?�����y^M��g�w�R�f��q)]�T5L��]T����w>���_�_���9���ݥT1�N.ԛO������s1�µܾ+ƣ>���c�8���Z%�|۴�F�}��m�K���̿�������#���{Cי�u� ��"�E��]�������x��Ņ����s{������;���6p-�&@!�4_E�?����?G?��nL��W�t��ww��e���0I�z5#���,7�Ǻ�������}}Ȃ���2��3=�>Xa�ꮀ�3%�v��OY�'��/�.����Y��]z3����m����6����.{/����y�{ "�x~��>�)�ܤ��c�sx������^A5�y��Goz�i�`SrEB0

�!���%���!{�[ji�W�U��\� !: B[���tg�y����k��q%[v���6:�50�Rl6�����e��^�d��Yt�̜���2L�&�O\�:�?Y=�/�O��e>��R*�wKA3]WM� �6��fk3[J��b�]M#`�Ѣ-��f�|K�y�r|b�V��m��IɁ��d��G�Q�:<�,���30sn/��܁`�m��m/����mcA�>��\���T[�9(�i�n�7OE��ّP�Jr&��59�fB�%�Q������h1y�)�³�tv{K	7�����
�2�S��F�I��4D�������0�����;��Va�����tۼ��k�A�u�".�L/E�2|�9!�T�+ �  :���p�n������'�\��U�a%��6 &�(2O�Ǽr�1d^)�%R打1�sFo�y��	.�¼�!�X�4�g|�6��ȺR	��Vsak�p�X=Z 5旓��Ӷ��d3�l�}��4�h̍@�A�0Uyc��Y��7]��cX���_�`�4g�D���}�����7��$gz�B.ɹێ�N%�U�J�C�<t%Μy������l�Pm�V��v��JR�1���ۋ֘�f��9Ek�\`UԿuș�qBV�^�������]P�!�6R$&o��)H��Ę"+�"��X`.,M��c]t>�t�d`�9q72+�\���`nZ��[�s��feƳE�%H��������؃it�sF��i/��x�0fJ�?�I�U�g���~F��KݖR�×�|jV�u��%E�L���j� L.�9�=�-r�g<_'�~�m���Ar&+�����vf����e7W��L} LͰΰܳr�3G>��wmcD�K� ��+��@�-.��d��������:��� :/ѯ�t�MC��q�uB�Ie1�d(e�"�'��y)�~��$��c�8�ٙƓΆ�)N���h;/Eۯ=�a�M����B�R����T9��CDNK��Rު�������I����*�߼�����:�|��@�p�����O��k�5�U{ �5ޤ>q�@�I<׮��;���2.;��Z�o��W3��v��@�eJ:��
nض^�u�͹�ж.���]x�ڧ�o�3��<�=���G�f�ձ���#�"�
��q枹E��p4�f�}�]�HE�.��}��Ȳ����8v����@:�1��sk2	��~�c���hn=���[I��D /%�SE1�*�Q�fp��O�iARZ`��(%�2��ۧ	��]�Vp�op�uy�`q��ƞ�EE�X�4H\����,���I&��~y�?v��&a�*4n���7{ۚ�ag^��f�(�䳶�����h�(E�::oa*̰���}��$�]���SE`��JL]��F��Zm;S�u�j����SiG��$g/f��R��ʋֶ��Tm��<y�Z��NM[8�$9M1o���W^����ȥ��F��ڵ��TAQ�6\�ŀ3n0�3�R�'�BS����)f���瞧�润����OQt"g>ň���
5���I��ɞ{>�ƔA:�1)j������W��p���$܍���V
�,�	~Cv֣{�"���T#r/��������j�n�E^�N�<���C�I���:�1��Y�e�K���w�wIn�h>r�b�N��َ	��~�n�?n3�Q'�Av{'rnbBN�֩�	憮q�8w�#�Q'��ނR��m��y�8q[�A�0w4����:���2���6�4l��(��FΗ[W�r9L�mDZ �r�R.�+���6�9M/�9jt��V<gn���@?n.r�bZG���E���@W\��$�h���:%�g*M���UJ>�0O"Jgt��02,�tե�K�]�ٜ[r�Y�q$���1��U�� m��|(a�AȌE��@	�q�o��c�	��X�dLW�����f�)>�1� T��-y�m��Y�)��RxBL�\��=��Q�P$����n˔��GNYL9���r@�a���a�Z)EJ!2�
�,��3�D�@��s����s���<��"��|��L@"'&&�[K:l17LͲ�Z�$q�����j��	H��D�����}�� �ߩk���~W��,��r6b:ȼ�tbΣk����x��O.�S�\��\�'�F����2K G�XD(�{��*�R��23ڞ<|�<O^���Yh��\g�IR�b.�,�"�j�9V�k�C�*bT��y>�#U F���yzn�N���D4Kq7.�v[q3.���l�2��i���-e'�@�և���N	�L��ך�k[�C�(9�$	d�,��IW�b�ԈTn��&�۩+BJ��R盐Nw���r���1$��ֽ��|W�������̈��.����۬��I��uC:'`��*e_�����`���}m�Ld"I\�ʙ�N��4�\���s��V)w������O���D��Ƴ�Zm����!�.1j�w��n�m�3�圀���J�;��=M��i��f��i�'�s���0ek��c���xr2�_Z��#�!ƒ��fʙ_�71�w��c��{<��T�z���|�]ץ�z�����V�k�j-G,�%y16d�%�Q߷�a_Ű���o:l虦����2kL=D���?z��N�=3OB�m�s��6�j1�>?��OdZ}��>oo�\*�Fp2�]�g�^����X~��6�+�)g����%�r�0�hI=�Y֯	O��`��6%2����rf'���%�ը�y��jK�<L*'F�m["�hr�Q2�4:1)ۈ��	�e��fa6)�j*w���8��6������&���H4l�ev���{]Ԗ6߂Rb,cd��@�.���(�K/'�J]�h)�w�0%l�&8Үd�߱
�I{I�R����RfT��s5�ra�xnQ��';ϓ������ERmbL��
�e�����c*�$Z�T�d+{�Tf���d=�:M���{��Z�H�FՕ�rf՞ �
��vCR�їue6b�ހ=bȼ���HeG�ؕ�}��X���Q��X��J|CKo,�^o�asR,Лp%ބUߩ�XՎ���)�@ӛ�?ê�!k(�p,N��ʍ�����D{��b���kG*����:VQlީK,@��هHE5PT�1dU�J]�o	I[�J,Pb�dU���c)[�Jn���R�2�~mH������>���-KP��іQ�=J�,I}��F[R���d������^�-)
�u]C�V�}��)M�Ⱥ�Lb��Jӷ,�b4���7�F�r�i�$[�m��[!�~�NՈTn4�*A��*S_~H-��r��UǙ�б�6|�$~�6�R�y�$F��4h���#�M<&1vl�q�(�_���h�1��c+�ۃR��Z�"���9���=��YkR$��c2CGi�t�V�֤H���eƎ��=�`�f�)�@��s���(���
jҖ49���4~�$��=�6#�A.	y9J�J�Z�}I�G��K�B��]�.%jД���Jt[���z�H%G�K,D���S��K�"��EN���)��8�hs.����A�Cb'	u�����4z�8����3�4����Pe0y��LQ�䑸Jd*�>N�_�����˱�=�~R*8� ��rgn�b\��+M�&��U�m�3_���r�vy9�:/_���ӻ*>	��쫯�$Eo      (     x�ŏ�j�0E��
-
N@*��e9]e����$�=F0����צmH����Νa枺=W�R��72/�G�lу�K���C ;���j J�L#%��8G��;e�@	�n���%�8�Gj�]ۓ�Ss��d�*�e^�2!�wL�C�4�ZH�/)%�i;�!z'�7��즟����C��o�MC�S}XcG����kR�p)28h^2#dɸ�5Ӽp��,��J#��Ts?}l:,3����w���N���wM�/      )   �  x�Ց_o�@���7}Q��3��ԥ[�`����AG���Pm?�⦟��l��=������h��	�Q����W4W
ڒ\t|�	��F��I-�C�I� �5��K@	��.;�ZH��YK$`-=�z��2��0Z[��V�w�mC��h�ib+���7/�$����Ǧ������|���Ҕ%j��h{\�e�9���RvLU��*��;F�ݧ"U�1���r5�EH�,���������%d������ mi]�+�(�;���>����a�4ْ}@���,E3a<%�R���	�"���aqlمL�O�� Xge�үH_��>2<
Ѹ�I��:2.\�p<��G���y�Ϲ}���i�=�$����n�����r�/o�ر�8�H��o}-���$���p��U�����4����p�%      *   g  x��SMK$1�ϯ}i���^֓��a�ً,!���d'�
�
*��w�u>d@�K�z�ޫ��bys��nw*�.�݇�+�zRg�k���$;�1�%��1�أ޹�5���Pg��J�bn+oFuH�2Ð�v`�DOX��(����������M$���D. ���*��8�#������b� �w�`�Yrv�l� ��5�4�aB�J�<N�V;Z�q���:��W�uh�R�ȧs��z��Y����_���Z-V��W�����1~)j�5����ټO��&x�8@  ��"ʥ����abH�����d�:D���B����n:y�N������������;��j6���-�      ,   
   x���          -   b  x��]o�0���+r�D��`'&�������+%lko������vX��KZ�N���v7�9��y_=��̇w�7�I�ze�3-:�6R��.++���u�{J�9�J��طPn��|�d�~.L]��9]����TZaty8c+�{l�3M�|U�U]�ֲ��[Z)�t�g�-��)�.�����̄�����}i��Ne�S>:ir�-�4wZ��Un�Lkу�e^4W�N���l�ν�v�cr��b!�
�(���DI�i�`����Y��y,�	5�e�a|��k}��}�jt:��6�-fVE贵 ��0����_P+Q�pu�P|�l��^����5��Ru��#L���cyu�֏{�i���p?K��D��7���wk��C�~Ʉ�;��c1�{T0�����1{��z �b�/� A"�~H�v	O!lzu��J���5Y*�2��Ag*y��h�����(��1�@9�� AJ"�Lt�LZ��ұ��[�T�"�7���q:�'�������}���Z���F��	L&Çd"��{�p�bq+6���t6N�>�e�FH�S ���r���DL8%q���������~�q���=A���I��ͣ�/�ЕP      .   
   x���             �   x��PAj�0��{sB-#ɪc��B}0��� GkWШF��ϯ����R�i���Yf�nW?�����0���9��Co�?j��g�VFg��
����B�Gw<9T��#|��6O��veV�q�������g�^���iݡm��,z6�A��"K.��6n�Ԍ�q;�s�(a��-�[�s��J�^��z3Zc�t}�4����qj��x����.�;J��R��XD�4�$\[��      0   �   x��P=o�0��os����vN�����5l�6 l���Tڨk�,w:��=�%�n�$ۿA��u^���w��k>l�aV
��w7���;۝������O�^ߚ;�W���.����q�6;�!2�vgk���*ֲ��U��LqS1���8�l��A�N��B0�c��
��/B�������-��3��k�<5�o5�H_!C>���tB���ŭ{|x�c         �  x�ݘMo�@����\HT������J�!R�FM�k��k�uq6i~�|(@�$
�dað���,׷�W?����4_��y�K���y]=���U�s5�ȓ1��I�������hY��S�p����N����r��\{��|��g���s� �|��]�����l~�	��o�D���<^ݣ:F��:aa�h�non�).B�-M�t�M H�F1�P�N�P���#F(	h���Kž2�D��ё4X�m��ʧe^N� ��(I-Mt�P���_1x�b��T�/���<X"��ct���z`�XO�}���q(J"�0��$W�4/�[lH��&�/PR�8M|����E�xX��U��Hw �-DJu�����?d�����XÏ:He�K��Z��Q�h��O��7ncR�0ע�m�N ��2�z8۪�#��y��+2/�3/	Ց͋Qlڋc�^
pJ_t��WT�tP�~�#���T�KJ@���G�$O��#8�{��
��v�"7��T57y��c
{´Vj��� �εɸW�2�2C>��Y�+4c��
���ܦO��D��>��D�b�>l ��b>!D��4��"b���4�����4-��}BbwlG?)��H�����-��jӊ�nv9h�eo��@�P�qH屣�Xi�Vt`�Xd`ןww���mOf{~ЃFE�7�]�������P�$k߳uJvPu_2?��[_t�:M�P�o�8�p�0}��r	�ջ��[Cߎ�a��gg� ��0~      �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���         