PGDMP     %    "            
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
                        false    3                       1259    19652    nextbits_timesheet    TABLE     �  CREATE TABLE public.nextbits_timesheet (
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
    "time" real,
    date timestamp without time zone
);
 &   DROP TABLE public.nextbits_timesheet;
       public         heap    postgres    false                       1259    19658    Timesheet_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Timesheet_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Timesheet_id_seq";
       public          postgres    false    283            >           0    0    Timesheet_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public."Timesheet_id_seq" OWNED BY public.nextbits_timesheet.id;
          public          postgres    false    284                       1259    19659    nextbits_department    TABLE     K  CREATE TABLE public.nextbits_department (
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
       public         heap    postgres    false                       1259    19665    department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.department_id_seq;
       public          postgres    false    285            ?           0    0    department_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.department_id_seq OWNED BY public.nextbits_department.id;
          public          postgres    false    286                       1259    19666    directus_activity    TABLE     �  CREATE TABLE public.directus_activity (
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
       public         heap    postgres    false                        1259    19672    directus_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_activity_id_seq;
       public          postgres    false    287            @           0    0    directus_activity_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;
          public          postgres    false    288            !           1259    19673    directus_collections    TABLE       CREATE TABLE public.directus_collections (
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
       public         heap    postgres    false            "           1259    19683    directus_dashboards    TABLE     I  CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);
 '   DROP TABLE public.directus_dashboards;
       public         heap    postgres    false            #           1259    19690    directus_fields    TABLE     �  CREATE TABLE public.directus_fields (
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
       public         heap    postgres    false            $           1259    19699    directus_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.directus_fields_id_seq;
       public          postgres    false    291            A           0    0    directus_fields_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;
          public          postgres    false    292            %           1259    19700    directus_files    TABLE     �  CREATE TABLE public.directus_files (
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
       public         heap    postgres    false            &           1259    19707    directus_flows    TABLE       CREATE TABLE public.directus_flows (
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
       public         heap    postgres    false            '           1259    19715    directus_folders    TABLE     z   CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);
 $   DROP TABLE public.directus_folders;
       public         heap    postgres    false            (           1259    19718    directus_migrations    TABLE     �   CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.directus_migrations;
       public         heap    postgres    false            )           1259    19724    directus_notifications    TABLE     �  CREATE TABLE public.directus_notifications (
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
       public         heap    postgres    false            *           1259    19731    directus_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.directus_notifications_id_seq;
       public          postgres    false    297            B           0    0    directus_notifications_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;
          public          postgres    false    298            +           1259    19732    directus_operations    TABLE     �  CREATE TABLE public.directus_operations (
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
       public         heap    postgres    false            ,           1259    19738    directus_panels    TABLE     /  CREATE TABLE public.directus_panels (
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
       public         heap    postgres    false            -           1259    19746    directus_permissions    TABLE     �   CREATE TABLE public.directus_permissions (
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
       public         heap    postgres    false            .           1259    19751    directus_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.directus_permissions_id_seq;
       public          postgres    false    301            C           0    0    directus_permissions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;
          public          postgres    false    302            /           1259    19752    directus_presets    TABLE     �  CREATE TABLE public.directus_presets (
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
       public         heap    postgres    false            0           1259    19759    directus_presets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.directus_presets_id_seq;
       public          postgres    false    303            D           0    0    directus_presets_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;
          public          postgres    false    304            1           1259    19760    directus_relations    TABLE     �  CREATE TABLE public.directus_relations (
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
       public         heap    postgres    false            2           1259    19766    directus_relations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_relations_id_seq;
       public          postgres    false    305            E           0    0    directus_relations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;
          public          postgres    false    306            3           1259    19767    directus_revisions    TABLE     �   CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);
 &   DROP TABLE public.directus_revisions;
       public         heap    postgres    false            4           1259    19772    directus_revisions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_revisions_id_seq;
       public          postgres    false    307            F           0    0    directus_revisions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;
          public          postgres    false    308            5           1259    19773    directus_roles    TABLE     }  CREATE TABLE public.directus_roles (
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
       public         heap    postgres    false            6           1259    19782    directus_sessions    TABLE       CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);
 %   DROP TABLE public.directus_sessions;
       public         heap    postgres    false            7           1259    19787    directus_settings    TABLE     �  CREATE TABLE public.directus_settings (
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
       public         heap    postgres    false            8           1259    19797    directus_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_settings_id_seq;
       public          postgres    false    311            G           0    0    directus_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;
          public          postgres    false    312            9           1259    19798    directus_shares    TABLE     �  CREATE TABLE public.directus_shares (
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
       public         heap    postgres    false            :           1259    19805    directus_users    TABLE     �  CREATE TABLE public.directus_users (
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
       public         heap    postgres    false            ;           1259    19815    directus_webhooks    TABLE     �  CREATE TABLE public.directus_webhooks (
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
       public         heap    postgres    false            <           1259    19823    directus_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_webhooks_id_seq;
       public          postgres    false    315            H           0    0    directus_webhooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;
          public          postgres    false    316            =           1259    19824    nextbits_project    TABLE     i  CREATE TABLE public.nextbits_project (
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
       public         heap    postgres    false            >           1259    19830    project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.project_id_seq;
       public          postgres    false    317            I           0    0    project_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.project_id_seq OWNED BY public.nextbits_project.id;
          public          postgres    false    318            �           2604    19831    directus_activity id    DEFAULT     |   ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
 C   ALTER TABLE public.directus_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    288    287            �           2604    19832    directus_fields id    DEFAULT     x   ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
 A   ALTER TABLE public.directus_fields ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    292    291            �           2604    19833    directus_notifications id    DEFAULT     �   ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
 H   ALTER TABLE public.directus_notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    298    297            �           2604    19834    directus_permissions id    DEFAULT     �   ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
 F   ALTER TABLE public.directus_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    302    301            �           2604    19835    directus_presets id    DEFAULT     z   ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
 B   ALTER TABLE public.directus_presets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    304    303            �           2604    19836    directus_relations id    DEFAULT     ~   ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
 D   ALTER TABLE public.directus_relations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    306    305            �           2604    19837    directus_revisions id    DEFAULT     ~   ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
 D   ALTER TABLE public.directus_revisions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    308    307            �           2604    19838    directus_settings id    DEFAULT     |   ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
 C   ALTER TABLE public.directus_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    312    311                       2604    19839    directus_webhooks id    DEFAULT     |   ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);
 C   ALTER TABLE public.directus_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    316    315            �           2604    19840    nextbits_department id    DEFAULT     w   ALTER TABLE ONLY public.nextbits_department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);
 E   ALTER TABLE public.nextbits_department ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    286    285                       2604    19841    nextbits_project id    DEFAULT     q   ALTER TABLE ONLY public.nextbits_project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);
 B   ALTER TABLE public.nextbits_project ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    318    317            �           2604    19842    nextbits_timesheet id    DEFAULT     w   ALTER TABLE ONLY public.nextbits_timesheet ALTER COLUMN id SET DEFAULT nextval('public."Timesheet_id_seq"'::regclass);
 D   ALTER TABLE public.nextbits_timesheet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    284    283                      0    19666    directus_activity 
   TABLE DATA                 public          postgres    false    287   .�                 0    19673    directus_collections 
   TABLE DATA                 public          postgres    false    289   �                0    19683    directus_dashboards 
   TABLE DATA                 public          postgres    false    290   
                0    19690    directus_fields 
   TABLE DATA                 public          postgres    false    291   �                0    19700    directus_files 
   TABLE DATA                 public          postgres    false    293   �                0    19707    directus_flows 
   TABLE DATA                 public          postgres    false    294   �                0    19715    directus_folders 
   TABLE DATA                 public          postgres    false    295   �                0    19718    directus_migrations 
   TABLE DATA                 public          postgres    false    296                   0    19724    directus_notifications 
   TABLE DATA                 public          postgres    false    297   �                0    19732    directus_operations 
   TABLE DATA                 public          postgres    false    299   �                0    19738    directus_panels 
   TABLE DATA                 public          postgres    false    300   �                 0    19746    directus_permissions 
   TABLE DATA                 public          postgres    false    301   _      "          0    19752    directus_presets 
   TABLE DATA                 public          postgres    false    303   �!      $          0    19760    directus_relations 
   TABLE DATA                 public          postgres    false    305   �"      &          0    19767    directus_revisions 
   TABLE DATA                 public          postgres    false    307   �#      (          0    19773    directus_roles 
   TABLE DATA                 public          postgres    false    309   �B      )          0    19782    directus_sessions 
   TABLE DATA                 public          postgres    false    310   D      *          0    19787    directus_settings 
   TABLE DATA                 public          postgres    false    311   �E      ,          0    19798    directus_shares 
   TABLE DATA                 public          postgres    false    313   oG      -          0    19805    directus_users 
   TABLE DATA                 public          postgres    false    314   �G      .          0    19815    directus_webhooks 
   TABLE DATA                 public          postgres    false    315   �I                0    19659    nextbits_department 
   TABLE DATA                 public          postgres    false    285   J      0          0    19824    nextbits_project 
   TABLE DATA                 public          postgres    false    317   K                0    19652    nextbits_timesheet 
   TABLE DATA                 public          postgres    false    283   �K      �          0    18319    spatial_ref_sys 
   TABLE DATA                 public          postgres    false    222   �N      �          0    19233    geocode_settings 
   TABLE DATA                 tiger          postgres    false    233   O      �          0    19565    pagc_gaz 
   TABLE DATA                 tiger          postgres    false    278   .O      �          0    19575    pagc_lex 
   TABLE DATA                 tiger          postgres    false    280   HO      �          0    19585 
   pagc_rules 
   TABLE DATA                 tiger          postgres    false    282   bO      �          0    19055    topology 
   TABLE DATA                 topology          postgres    false    227   |O      �          0    19067    layer 
   TABLE DATA                 topology          postgres    false    228   �O      J           0    0    Timesheet_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Timesheet_id_seq"', 16, true);
          public          postgres    false    284            K           0    0    department_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.department_id_seq', 2, true);
          public          postgres    false    286            L           0    0    directus_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_activity_id_seq', 251, true);
          public          postgres    false    288            M           0    0    directus_fields_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_fields_id_seq', 88, true);
          public          postgres    false    292            N           0    0    directus_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);
          public          postgres    false    298            O           0    0    directus_permissions_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.directus_permissions_id_seq', 38, true);
          public          postgres    false    302            P           0    0    directus_presets_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_presets_id_seq', 5, true);
          public          postgres    false    304            Q           0    0    directus_relations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_relations_id_seq', 6, true);
          public          postgres    false    306            R           0    0    directus_revisions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.directus_revisions_id_seq', 238, true);
          public          postgres    false    308            S           0    0    directus_settings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);
          public          postgres    false    312            T           0    0    directus_webhooks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);
          public          postgres    false    316            U           0    0    project_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.project_id_seq', 2, true);
          public          postgres    false    318                       2606    19844 !   nextbits_timesheet Timesheet_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT "Timesheet_pkey" PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.nextbits_timesheet DROP CONSTRAINT "Timesheet_pkey";
       public            postgres    false    283                       2606    19846 #   nextbits_department department_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.nextbits_department DROP CONSTRAINT department_pkey;
       public            postgres    false    285                        2606    19848 (   directus_activity directus_activity_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_activity DROP CONSTRAINT directus_activity_pkey;
       public            postgres    false    287            "           2606    19850 .   directus_collections directus_collections_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
 X   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_pkey;
       public            postgres    false    289            $           2606    19852 ,   directus_dashboards directus_dashboards_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_pkey;
       public            postgres    false    290            &           2606    19854 $   directus_fields directus_fields_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_fields DROP CONSTRAINT directus_fields_pkey;
       public            postgres    false    291            (           2606    19856 "   directus_files directus_files_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_pkey;
       public            postgres    false    293            *           2606    19858 .   directus_flows directus_flows_operation_unique 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
 X   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_operation_unique;
       public            postgres    false    294            ,           2606    19860 "   directus_flows directus_flows_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_pkey;
       public            postgres    false    294            .           2606    19862 &   directus_folders directus_folders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_pkey;
       public            postgres    false    295            0           2606    19864 ,   directus_migrations directus_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
 V   ALTER TABLE ONLY public.directus_migrations DROP CONSTRAINT directus_migrations_pkey;
       public            postgres    false    296            2           2606    19866 2   directus_notifications directus_notifications_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_pkey;
       public            postgres    false    297            4           2606    19868 ,   directus_operations directus_operations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_pkey;
       public            postgres    false    299            6           2606    19870 5   directus_operations directus_operations_reject_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);
 _   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_unique;
       public            postgres    false    299            8           2606    19872 6   directus_operations directus_operations_resolve_unique 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_unique;
       public            postgres    false    299            :           2606    19874 $   directus_panels directus_panels_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_pkey;
       public            postgres    false    300            <           2606    19876 .   directus_permissions directus_permissions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_pkey;
       public            postgres    false    301            >           2606    19878 &   directus_presets directus_presets_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_pkey;
       public            postgres    false    303            @           2606    19880 *   directus_relations directus_relations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_relations DROP CONSTRAINT directus_relations_pkey;
       public            postgres    false    305            B           2606    19882 *   directus_revisions directus_revisions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_pkey;
       public            postgres    false    307            D           2606    19884 "   directus_roles directus_roles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_pkey;
       public            postgres    false    309            F           2606    19886 (   directus_sessions directus_sessions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
 R   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_pkey;
       public            postgres    false    310            H           2606    19888 (   directus_settings directus_settings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_pkey;
       public            postgres    false    311            J           2606    19890 $   directus_shares directus_shares_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_pkey;
       public            postgres    false    313            L           2606    19892 *   directus_users directus_users_email_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_email_unique;
       public            postgres    false    314            N           2606    19894 8   directus_users directus_users_external_identifier_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
 b   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_external_identifier_unique;
       public            postgres    false    314            P           2606    19896 "   directus_users directus_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_pkey;
       public            postgres    false    314            R           2606    19898 *   directus_users directus_users_token_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_token_unique;
       public            postgres    false    314            T           2606    19900 (   directus_webhooks directus_webhooks_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_pkey;
       public            postgres    false    315            V           2606    19902    nextbits_project project_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.nextbits_project DROP CONSTRAINT project_pkey;
       public            postgres    false    317            Y           2606    19903 3   nextbits_department department_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 ]   ALTER TABLE ONLY public.nextbits_department DROP CONSTRAINT department_user_created_foreign;
       public          postgres    false    314    4688    285            Z           2606    19908 3   nextbits_department department_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 ]   ALTER TABLE ONLY public.nextbits_department DROP CONSTRAINT department_user_updated_foreign;
       public          postgres    false    285    4688    314            [           2606    19913 7   directus_collections directus_collections_group_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);
 a   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_group_foreign;
       public          postgres    false    289    4642    289            \           2606    19918 <   directus_dashboards directus_dashboards_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_user_created_foreign;
       public          postgres    false    4688    290    314            ]           2606    19923 ,   directus_files directus_files_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_folder_foreign;
       public          postgres    false    293    4654    295            ^           2606    19928 1   directus_files directus_files_modified_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_modified_by_foreign;
       public          postgres    false    4688    314    293            _           2606    19933 1   directus_files directus_files_uploaded_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_uploaded_by_foreign;
       public          postgres    false    4688    293    314            `           2606    19938 2   directus_flows directus_flows_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_user_created_foreign;
       public          postgres    false    4688    294    314            a           2606    19943 0   directus_folders directus_folders_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);
 Z   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_parent_foreign;
       public          postgres    false    295    4654    295            b           2606    19948 ?   directus_notifications directus_notifications_recipient_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_recipient_foreign;
       public          postgres    false    4688    297    314            c           2606    19953 <   directus_notifications directus_notifications_sender_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);
 f   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_sender_foreign;
       public          postgres    false    314    297    4688            d           2606    19958 4   directus_operations directus_operations_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_flow_foreign;
       public          postgres    false    294    299    4652            e           2606    19963 6   directus_operations directus_operations_reject_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_foreign;
       public          postgres    false    4660    299    299            f           2606    19968 7   directus_operations directus_operations_resolve_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);
 a   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_foreign;
       public          postgres    false    299    299    4660            g           2606    19973 <   directus_operations directus_operations_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_user_created_foreign;
       public          postgres    false    4688    314    299            h           2606    19978 1   directus_panels directus_panels_dashboard_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_dashboard_foreign;
       public          postgres    false    300    4644    290            i           2606    19983 4   directus_panels directus_panels_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_user_created_foreign;
       public          postgres    false    314    300    4688            j           2606    19988 6   directus_permissions directus_permissions_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_role_foreign;
       public          postgres    false    301    4676    309            k           2606    19993 .   directus_presets directus_presets_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_role_foreign;
       public          postgres    false    303    4676    309            l           2606    19998 .   directus_presets directus_presets_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_user_foreign;
       public          postgres    false    303    4688    314            m           2606    20003 6   directus_revisions directus_revisions_activity_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_activity_foreign;
       public          postgres    false    4640    307    287            n           2606    20008 4   directus_revisions directus_revisions_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);
 ^   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_parent_foreign;
       public          postgres    false    307    4674    307            o           2606    20013 1   directus_sessions directus_sessions_share_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_share_foreign;
       public          postgres    false    310    4682    313            p           2606    20018 0   directus_sessions directus_sessions_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_user_foreign;
       public          postgres    false    4688    310    314            q           2606    20023 8   directus_settings directus_settings_project_logo_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);
 b   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_project_logo_foreign;
       public          postgres    false    4648    311    293            r           2606    20028 =   directus_settings directus_settings_public_background_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_background_foreign;
       public          postgres    false    311    293    4648            s           2606    20033 =   directus_settings directus_settings_public_foreground_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_foreground_foreign;
       public          postgres    false    311    4648    293            t           2606    20038 B   directus_settings directus_settings_storage_default_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_storage_default_folder_foreign;
       public          postgres    false    4654    295    311            u           2606    20043 2   directus_shares directus_shares_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_collection_foreign;
       public          postgres    false    4642    289    313            v           2606    20048 ,   directus_shares directus_shares_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_role_foreign;
       public          postgres    false    309    313    4676            w           2606    20053 4   directus_shares directus_shares_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_user_created_foreign;
       public          postgres    false    314    313    4688            x           2606    20058 *   directus_users directus_users_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_role_foreign;
       public          postgres    false    314    309    4676            y           2606    20063 -   nextbits_project project_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 W   ALTER TABLE ONLY public.nextbits_project DROP CONSTRAINT project_user_created_foreign;
       public          postgres    false    317    4688    314            z           2606    20068 -   nextbits_project project_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 W   ALTER TABLE ONLY public.nextbits_project DROP CONSTRAINT project_user_updated_foreign;
       public          postgres    false    317    4688    314            W           2606    20073 1   nextbits_timesheet timesheet_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT timesheet_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.nextbits_timesheet DROP CONSTRAINT timesheet_user_created_foreign;
       public          postgres    false    314    283    4688            X           2606    20078 1   nextbits_timesheet timesheet_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT timesheet_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.nextbits_timesheet DROP CONSTRAINT timesheet_user_updated_foreign;
       public          postgres    false    314    283    4688                  x��mo����W�bխwfg�.��"h�$.�8�ǀ/ǘ�d	ݦ���=Rԑ���;@g� �2l݃��gfv��7������߼������z�4�����~x�i��n����{�r���կn�_�>��0�^�������]�bsw5���4�yx���-o����o�l�������K����7�_����?|���%\�^\ߖ�^��q��[��[�]�Ȯ�]H]Nq=D�+��~Z�li��MH�O��_��-�@����l��篽���?nޯn��0{�v�;���}1�-Ыٗww�Ï�����wѸ0{��_�~����z��0�˰��������oo���o2�!v��|=���K�#O�>��������m��^��n��ׯ�o���w��>Y�_��⳯�ﴰ�����|;4��=�q��z�����Gb��c��˿`2�[=��p�R��`�0P�#%�0�
�	�A.R#���«`��Xd�0tĶ�H~KE0����⢩�1"y[�ٻa��@hbOh�44O%����>�&��K#��b������ �G�����S	v/Б!�v+qx2��rБ#�v//8p�!y� Yh7�#�bJ^:�$�.�$yu�H�@��pxɑ��d	���G��q�H�`��pdq�	R��R��#�d:�ۭ���	��P��#���pxq�����j���o����E�sﲉNpԋ:2&ȡ� ���E�o.�P�=�,��:2&ȡ�;d;!�Ș ���qH�'�����P�='yu�Ș8E���(�����P�=���:2&�C��8���q�w����/u��u�zB'Fɻ��T�c	ys���(�����.pY�z*"�Z�t$]͒|�[���#���WK�$��l�bJ��W��̡�k"�Κ$���q88�ڝKr�Ӓ��]@9�<GtDN��%���Z1{���!��H� e����¡ѯ�V�c-�������awx#����eH�Z�E����(.rL+�˰�A�Q�����w������1M�d5�ȧH��O�(��p�D޹�$:J�Ԙ7|DB�ـ�U��\N���)'%{����o��)/}{�Q6���>Eĵ\� �Q:����)y��$:����H���DG�3�}A }�(�����2�7�甉�L�^����L�L_���U<e���=����e���=�����էLt(|�S��t&:>�9<����sLtH|��xyguN����'�(�I�9&:,>�Y<ʛCzZ]�a���1H�e)9��,��̊�����Q|RXɑ��g�Nޑ�S&:4>0i��&�x&:4>2i�G�t�Wr�=2i����2ѡ񱱟~d�g������	��W&����{����x։�&�~��	���-Ő�fz%�wc�Q�G&�&&��.%L8<�2�� �����A�ĳN���Q�:����!g\�Nt��ǃ�����o}(�'��2��n헩���]^��[,B�l�a��p��v��uH^ށ��^Ə������GǸu�Z�k]7e�1�7A�U�94{���&��Ь�Cu�����Gl�h�k���V�C������?�W���A1�쎖���p�<��x1���8�(	������8)���W�w����n���Vi��CZ吻L�e�8,��փ�:�.�M�+�4n�d(�+O���#0kae6tC�Ѱ�n��ԡ�����z�c����09���XXgyXtkK�"�q��Ӑ;��a��@��؝r[r`,�Ι��N�fV���,W��2/��&�����������Dw2	\G�!���q��3��H�tto�.�=�13GI#��΁�=y������IGR4�5�q��D1�w(����f��8��-/fY(,�m� �@��c'��%��Q�yT�G��ض���˵~��&�N���V��� �C=�'��I��h��?��Ɗ9��r��< 0 )%2������pɐ�ӫ
K�`#*A��<�I�mg�� ��d�8�xʡ/���C�\���|m�yȡ���*��+%�+�#0�zM)��sѮ���M�*�Bd~DI�>�C��b.q��B�1�
�Čm����>� "+KJ�]�q��T�Rk���w�蒉Qʊ8<��������8)��r�h�}���ޒ�kK:��ڋ�#��Y��Bo �^�. �'g�LJ��5{�	"�N�N��]8`m)�$���v�A�7(fЍF���	vD��)�b��6[v=�Nu\0�l�����]A���qQ$-��f��S6l��d1��EW���.>��	rRr�M���^����(���\�DǜT�����߭��ev�(�a�fc߁ph���\� �����Mo�1W�hL&�fe߁�'�d�Q�Ltͅ��:�Tf���l��Pv�q��:Q�Lt�^8������Fcw�^A�G�E�%9,�!ℵ�0�9~|�"�k�ե�ސq��U=���5=�ĴŝK��:���w<Bo��2�D�(R��?��`��,�FQ�Fc�Eż�4�"5�#W�畒e�h��h�Ɉ��O�(R��?r�hIJ��Q���A�(5hRR�Fc���j�j������(� \�^��ԉJ�~��L� ��'�&W�o����z�nst_�_�f����%�e��Q�׾ٯw7PY4.JyCi�k����+��d�uJ��7���N6I��i�|�`�@P٬��(V�`�f�� p� �������@���8�{��g��r�-甌��G()�����;�#�(�դD�0k}y�^L��E�~�XK�$���q�:�ށ�$2i��eW]�ӯ�.h����Ⴏ��@WM����ָ9�ٜ�ӾJ����?�ց��I��M������:�Zd�Jj&������zWsc�1	%E���b���:HY���m��|omo��,e�\4�h��vi����^��O�`>�]v��Z�����E�,����]+��cM(<��	Ġᨗ�^cD�����G`���;.���9��P�z��C����Ӄ�m'��4ăƁqb�A���S"K�m��2Q�<mR�L10�&:)}f�x(i7�m�d]�v�������Q�ăL���	%�g��s��G4)K^JB��v������J桤-g��+���Pґ�ڮ`���㡤E ��z�s՜�.gxx%������0��c��x(�����λsbfӞ�����׫�����?O��i<p�T���KNr�ou�z��c��Ip�׊��I�p��#�c-%���v`�Í��'��>��(-'(3���X{���cJG @�v�9���<[C��ݓ�����v��>�������H�P��J�p����^I�7sH{��줯W����^y��bnm8�CI�7sH{��������o�(�W�Dy=�O<���o�u��Z� .��P����^y�ɢy�H���(��8��d:,�q�'�@k��i�Y�29,�g�`6��-��������D,��51���KG�-���8�^ވ�	���)&21�{�Mx��E���[���u�	G���p�Lx(�@�x���y)���B.U��TJ\`�t0�XXבD�h�0*Ѱ��J�X���#�w>~�C�� K4\O��|�'*�d���x�ڊky��Pb'ȴǓ5^�ggx$%�0�T�ǡ�^�U�x�h;E�h�&�Փ �j��ǁ��݅�����UR&�.%kŲ����HGb.�:�CGgZ�N��,I1���㡣�-SgD7 �tb��8��jA0�J���X^W�^��(XE���X^W�G2V�F%���\�v���I���,�B�N;�,YՕv��B��(X��R2�B<��`RR
��RH���� y:JR_a{|5�p�x��IIiʵ��FP\�w�CI�����X��F�$%�:�g��(�k���X9HI�<�DI��]S�qD���Hs�h@^����G�b)`T�Y'n׿�o6�E�e����PȈ[C�H�أk��	���u�e�oI�O�D����)%^�/��D(��8:y|�Bi��	�:>Pި �   �S(Jb/j�Y7�Rb�$/C�J��O�x����$F-�?�Ro���k����x��d�(�Rq��P�ɻ^Q+����-EIDL�J��D�IE�P"�أ3�N�h�Y|>���K�:j��r+p��U�s-��ʗo��O��lP�.�%ۉov��ħ�:��d��A�{v��>�/z��/           x��Q�j�0��+L/i��vڡ�@�`mw5��6�ml��?��6ʎc�^$�=�Y�5�f��M�}!����b�9)���Kb9R����RXL��I1�%OȀ�B��O��K������x�G ;�:�C����\$��$�:o�ώu��|��l����͡�t��Ҟ.�R,��8��	V���ݭ7bY;x�9)AG�q-E�k��q�)�5}e8f�5Qk��R�����c��m�Ŗ�[9���?�q�4 ��+U����         �   x�E�ͪ�0F�}��U�#i�6�wu.�R���$��[�I��7��j��>ff����������Ct4���������p������=q�[=�+E�F���ůQ�����ow�a�a[ju�\x�B5
����;���;&e^@~p��}�'��]�"�8ǒ!g���Mݮ��Z1�ZD$���kjQ&Q��ИF��aJ6����ɲ�	��I          �  x��]o�6���+�@@.lş�U�d@� �t7�`�s�%������(۱%Qt�Nl�ͅ`R�D=���{|����7�?8���9i6�X�!d�2�)�Q(�3zN�D��eI�9�z�)�<�Œ�)	��$i�DxN�D�/���NI�đ:5caH��D¥�<�P�<Gr��lǉ�����.�7ST�wy����,H�B�����xN� ���������G��9�LU�(����Bu��tw���L�ţ�}>nO�(�m;%�����_Nn"�~��D�����;�B��a��M�n0KX@�{��ҕ��t/���r�J�(t=W=3��z_��mCN���nS.�!<��E�v���_��+��Hl:%f�ӕ�N����M���i�iN1Չw���T�������Z)gs¿���ժ7�}��n������{�c:�Dx����-����r�_.4Q~�ԴŇ��嬻U֙�|�I>�[�re�j��d35H:W/%s�Y.ɂH�?���l>�	�V+g��2.�8&s�.FdWrW��:=�fF�)li�e�jKՐm��[��T�}�P�L�i���L���`�c�үu�,KV(��^�-�V����*e8�]��4�Дp9��1k,ЎQ��t�o/��nM@�<�[��[�)�|�~(M� �(�nu�F4�Ꞇ�(ģ�1f������5��6bRoךC͚�J����q��hM�]�d�L�X�tt�䣾yY��ϋ�/EF  mq�(s�z�z���ݥ[qHGk�{e�Ѝoה��)!_�M5���&M9�q/�����.�$�V�7�G�A���q�e�̒�#[�VFo�.y�v��F��a>i�Hc:�7����+�'�n���� �Qw��+� oy���` �Ƒ�kG�^dy�����-"j��� � �Qxy/X7Ǻ׮��nD �ik�Rۅ ����e9L����e)F����� �<o�5ei���D�+ʘ~�&�ظ{�D>0#G0�����Z�>2CG���Ϧ������󕑏�E��WF>�[�q ~)���-R������xc	o�y���wK��X��&?4����6�ѡ1����߆l� o�|�@����"�Mȡ�l!/)S���]#q�${�{f�PJ����̡�l��C-�f?<<�j��~tx܃�=�ö�=�խ���#m�t������R"m17�'dX�b~ �0[�M_�!�k���K��:�ON�/�Ŵ         
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
   x���             r  x�MP�j�0}߯~qB� �Z��<�����d��E�F��k]r!��;.l)3g�90�����ӑ<�?ɒ��7�R��E�0Er�%FǱ�: ��(q��)��%q���lf�PO���G���O��OJޝI#%#��1Q�U���! ��#�KwM~��_��U9XQ���Ԗ3ݨ�m��`��i�))){i���[&�&U���v`B@���o����s ��`�,>$$/��%�������p/m�ߐ[,ů2���bW�G�T����B�|��brH������dPY1Roz�����H=��:'_�^�\Vq&*»�;��tm���U�e�꾲��Z1ɍe������Je*ޔ׷����Y�            x��]o�0���+�h�d�Q(v5M\TBT���i��� �L��N;���		m��)��M�����y�?'S�n<���4d4�@��H�2H@�����һ�y�3@^���e���gi(�1�oo����9F����h6|�.[�k��-h��~3������M�;�y����[��G�yC���hN��J$ +�Ξ��8��F�c�}����]]\ו�4q��]�*M��o�S�� 7�nl��ːcA/�nu8W�W��b���n��m�s��Z���Zj-+)�ܭ����d�Y��C8# \/3;)М�3+)�9\hV&RB�M�e�Z٬T$���F+	�c�֢O�?x����w_f��p<f��_���S!U� �wg��K��A�G��+�40	��W�#VX�Ƌ/ �%��9$�-M����d3pz�\[y�\bq��\��o�~6�Kfr?�%�J�1�D
��w�r��"w[�7d��!�1���6Q3��]��nv��v
���Q�+A�
�)f'�5B�
h�g�)�@<��%�>��D��,�
b�j[/�z�/�����t���Ӧtr	���Iޡ��j_w$%֬Hr�P���nHPv�=�`s�<-y*$����٣bY�c2�z71ȃ�����&���A��T5����M�� ��E��L�� �#�tho�xg�TH�ΣݶM�r�v}�m"�{0u&+Ҥǝ�{K{���N�1�*�����Ux��g5ȥ��uh"맓wN�������Yך���������x�;�Q      "   1  x���o�0���/\Ф,"Lŝv�@BX2uWR�1;emYf���j�,��Hvؼ���|�~|�%���
�d�M�q��Lb�[�6jVȄ�VTn	حBi��#�\pn�L�R�op��>���E��<��ʼ��ؤ��(?('P2n�X~�f29���x�X�`L Y�1�f��y�[R?t�QQ��d��lZ�4o4q:��U�
��i����.py:�qS�2g5���+�3Ă��
l����!go������W����p�� ��$�/�܍�zl�x3^[ٛcxߓa��:cZ���ϖ��{�      $   �   x��=�0����l�P?'�B��յ�抑kR��ߛ�H�vs�.�{��po�w��$Y�'�� /��+(�Յ��K�Ʉ���T�E)u�+�8��R��s/�Qށu���͊�E-��~b��o����6=�d2�I�����n�TQ*���߇y�]���t��E�UF� �M�^M�a�����7U�1�i�Ӳ��ا/O+wY��ͱ�LC��=�~Ӥ x ��kE      &      x��]i��8��>���40�[)��~��t�� ��Eu�.0�BB��3���G���7B�u���V�,�:���x�H�E����㧇��y�Gg�Φ#͟���f�~\_���b���y��:�h3�2�|�uF���_�:�M�����ƃ�3�g魂���������~���g���^�O�����f:Z�	>d�������΂ǡ��~�n�-�� ����N}�i3}֓ ������t���=I��b����~~�V��O��������z�4��o�/F�N -6�ug��ˮ���;��p����?��;�@�Qfd�x���0�L}?�'}���Vco�x-���U�����[�L�
���L��<������	!�D5�<�����L����z�X����[w4YLG@�pD���C�maGA�7�"�g!�v��+o��<���[�&�/���>��_({�_-��������r��3o���G�Q֓�׿�XlM"�w�
�V����ǟ�?�����>�����/W�Wo���Z�_��y������?��5��Wo5��������;R��s�C"�a64�'D#"s�D�_
v�-V��c㘯#�	0��a�\�e0�z����`-܄|Q���+_�����>���}����6���p�Mg���t��<ν� �q��~g�.v�bM�c��To6��c��T�FoTrB���j�E�{�
�Wh�7�&6�a��`�Ll���� 6]�(�� n8���*G�v�_�MEh47݊�����+t�
N;����E!�p��Y~��C��:#6�c� �m�ǒ����H�΋�L܂5X�`�����:ث�����Po�U�mGn����_�,yڪ����G	��x5T�E��7��=&`��R��1YDS?����v�>&d�)���$x���/6�Q�J_H� �$�Ə'�r�x���W����ZL�`�`�!4~~�I�NJ� /&�͙8~ޤ���vJC&qb�y��ߣ��C����r'ѝD#�3"�DW�u�|J=����Q�F���%��o��m��z�t��|l��|%��w\�p�ڻ��Oy�ܪ�#��%�'�\z�HE����#X{*	�1��r@{g������>.�ar���F{g�˕��#�����`i��$�T��3��������(���B�m��A@�K¤ܸGf�"3��rgНA`�|s!��;�8F �FZ�Q�qI���*_�<SP�M�M�=��!	�RY��l�d�dA(w3Ih�Wǯ7����nCnJ��IȓW��/(H���.TJv�qCj��u&A���ϩ?�Z�5�6������r"Z���k��)�Y�.)ņށ}������Q�j7YD��&�܏���ҹ*fb2Y�?����-�66+o��I)�:��M�%����eyݡϼL~	�d�{�O_���{�_���A�Q������*�x�ǃ"������p��Q[���kI)6,}�쀏wb��}`���u�H9'O^Gͼ����yS�Rc��H,h�V�p�}�$<M�bP��V���^����g.23��q�!�Ǟ�������E�u�q`�g��6t�ct��y��}�<0s�܁nj�f�����U����J�7t�a��U�Sg7���vϨ� ,z)������q�4��
L�ٯ((�~V�;�w��`=}°������\��U�8��E-U��k����
V��n�) ����C'�3��=l�������S�F��H�ާ�,K7���O/[1��|�}q��́�w{��N�Ӹ㏇�g��N�u����r�]HW)U�G��L��bD[�-C��G�����P�㾰�����Y��dl�.g�o�V��:�?z�8;��[.w�����
@� �2X�N��$t�*���	�%��&5dG����-	�!'��CP�oUTZ{���hCX
��F���~B}����� M[���"xB}��J��6��Јh|KpR���J��6��Ј���֓��[�']HH{A�Ћ�+tc5G�vI!��і��)�b7Ǆzq!��n@/&W��i�
�2C�J݀^LC���Pr��7�j|O�ΐ��R'�S(t�+U����)��K+�z�W_�ze!��R@!�ʯgJǾ	��B�J��BL�{����b�G׭�.F�J��JL����N~�0Q(U�0UN>Sz�����Ⱥ@�P��������D>�����}+� ��r�ҋO��:�$E���� UX*��)���!,x�>��g���o�>�����o _�=�V�U���&�^�鬷��믋�ߛ-Fa�bo3�̂��G�iXwً�_@����{
z�I �7c�q�
�i�
W':%���*D��1�0Q}�Y���IK�XGR�jVy�Uń�*��Շ����Y�hWFc�x�~t�5���Ks§��#�	��b*�qH7����JB ,U4�+�Ae@�]\�P*�6SVy(�AeHd+v�B���ݲ�N�OJ�r-Ud�+#Ke�$��)����T0(�RŨ�:F5[|��LmVӧ�`���ͷ�,��Z����n��ś�zI�cz���sJ ,UT,92���㉋�'H���s�z��+���~n��T��VEʒF>�N����z:fO(oU٪�Zr����^e��㰫�M	$�h�ba	��l��$[[����a�׵>�W��]��lv{�SB�G/�*��2(�&R8ئp
R�p��T��C$� z����w��6�t˘R <�*���rl%�RKʼ�L �VƤ��l�6�y�74v�#�-�J9�` ��8�ێ�c��%e�N	& i+�o�skZ�t�d��&q(i������v��lm���P��*~�;��b������2 O(%i�0�*�f�v��e��9����@QN.�֙ $b4����#�/���w�l�-������(�.-%���+o8�we%��m�>Lp(DO=�eZ�>���h�#�>�����a�����zQ��N��3�#b�q&E�T��S�ʜE�����b	U�❗��(�S�ʹ�����AwB0]����TBv\J��Q�̊�c&w��?�-9yA�͑�jV��e�U�����Ļ��5efUVU���6z�r5`��f�q��g�A�q1MMw���r�_nj�aef���yvq������������
��^g�ɶ�A=�
�Loo��:N[#�y2���/��y4����i8zY?��/��痵ä=I��,�X��$�rc��� y�����*˝�z�����<�'��3�;\�u��׸�.S��L�.�ZP��;_^`v�/�/j������R�a'�M�'A���wF�g��}�Zn��Q��`�1c�v\�V>�(�u��y�.��ai���c��3���|�3��b�:���n� Q_��{�+������x����qx>bFG�o�-�����~aׂ��(d���@�������oᏹ+��Ÿ�U@;D�:��;{Y=�dL��^�k�2����.�}1����n_�`亁��x��Dϱ�4LuW@ʙS;է,b��O������T�,�뮼9^������G�t�R�fp�}��u�<�= �^<��W���VnR��1�9���Hb�DWP-�ެ��[M��,L�)�"!��PR�����-�4�+۪]G�c� ��ȵ;�5��EwE^�")��|\ɖ�$�+��Nu�CE���&���n����2�6�k*3������	��'�n꟬����׎?�~�e>��R*�wKA3]WM� c�Jҍ�5��-%�t1�&��	0�hі�K|3c���<~9�?1A�~�6DԤ�@J[2S�Ψ��;K���� ̜�˶3w �f��9e�K���y�XP��*׽�<U�8e2�ԍ��(�9;��QI��󶡢&'�L�d=1�s��-&!%\x���no)���04��^�VFrj��H6����=�21��)'������/���EXo�p$-At5�6/hA�Za��m�C]���/�K�L �hN�:�� %  @���d.*ܴ�#$w4�r��4��oUiX�!���&���1/A��y�W
q��y�d�3���[d��h���0�Aq�>�1��Y�� 9�8��T�t��U�\ؚ!�V�H������-89�$[~��.�>s#�y��&LU�X�{�k�M�{���5��W7�"�Y2Ѡ4Fno续����2ə��Kr�#�S�qU���P ]�3g�g-g��$<�#TQت]���_I�9��~{�S����=�hM������9�0N�Jq��1���05���1��F����3���Sd�]��k ̅�	��c����G��N�L� g �Ff����s �MK�t��b�ܬ�x�Ⱦ	r�a🕂��{0�#�v�(�@?�� P��L��g5)���c��h���_��b����������_�w�{I��@7�mp�Z����}�fOoG�\��׉�j=r�b���
=�&㶝��|�:F|�͕{�SS3�3,���̑m�]���#���
As6�f�K�;م*��*h�!9m1��KA��7� s��,q��tRYL-J�����v^
�_{<	0�X4�tv���f�971��K��k�6��sS��G��m��6UNf���C����n� �~��`��/�㤊��7/E��t>�N016�-\+mCoc>��@�`��`��G�7�O�.��Cϵ�m�z� ����v���1w��+���Ws���������_�y�qs�"��K��i��������:�w(=��G��Yuu����HE�H�B�l\��gn| ͱ�eBu��)R��˸}�-�l�}=;���h?G=��uL���ƚL�:�_�X=�-�[�}|D�VR�0�K�@�TQ��b���$���EcZ����h3J��̽��i�3��tW����\s]�0X\'��'wQ$&h��;,ˬ�y��c}\��ݶ��G�
�[;�0��޶f�FؙW婙;�!��m���)0�(J�ƫ��[�
3�p{�a�6:/	i8Gt�T�S׆��k�V�& aj�n_M�Z�¼b*mሑ<�����Q�p_y�Z�9L���Γ��i�Tд��I����F)�k�9]��n��]+�Km�EMQH0�S��9��p.(~�)4Ŋ���b6J;���i�ank�ټ<�uA'r�S��y��P�
=�\���CoL����ƇO��z5�~��7S��<	w�����B:`�ߐ�������/���0�qCy�$������g�����#�$��ss��NpL0g�f��u��]��$چ������u�c�9�߰���Lz�Ir��^ĉ�����u�c���k�=�'��t��l����@i#r^bN��y�;���g�ïN:�|�L �&��9[�?�8����6�\��C���ܢ�˹�
�k�~NӋa�Z]1�ϙ[��5�ŏۆ������uw����0���3I�7Z/l�N���Jv�m��#̓���71�K3]Eu)�Rh�y6疜y�t	��k�s�'�m��%L6����s(���m�`z�0�`�Z�����jv\|ҌB8��3F��S�%O��9+1�`�Z�O��	�k<��|3
���t�R�m����)�)��R�9�\3lQk"�H)��Z�z��rf�h(rrb�����C�9g�����)r
!�gI�$rbb�����C��aj�m�"&�3X�����V��L@�&&�D̼����~�����]�Ƴ�&d�و� ���A�9��sc�Q>�N�s�wsI�h!rVb�,e��b��^�dKa����h{����<y��g��Gs�q'I�����p��r�X9�)���Qq �W��t�T�7K���:ᒯ�,�ܸ��m�͸pk�]˜ާ�_t�����ڭ+��P�(j��5;׶:�+�pQrtIȮY����n�P���8w;L"�SW������7!��0ye�t}�cH���{?i���Q��A��G����]y�'쯷�,����tN��Uʾ^��#܁�4Q3��̙�D<��l�3a���i޹��'�<&u�R��GmU�.���<?��k��Z���CR]b�2�6�}ݼ�4g��90���wV={����2,^7��jg��O���5R�a��*%�o5��d :���1zG�C�%[�3̔3�0ob�=�&�!��-�"x��oPQg���)X�w]������J:[񮩫������ؐ���G}���}1þ��þ鰡g����GgȬU0�o��⭦�p�a�y�E����L�˙��!x�B���-6}��3�T0�.�dλz�^���f�� �m�W�S�&�IK
��Ra���z
V�8bZ�zdz��&�)����x�Օ3�8��-�-��F���dW[��aR91�l�9E�Ï�y�щI�F��O-�%�0�I	WS�K�H��1�HưYw�On�4���lG�a�.���6�벶���c#s$Z�u9G�DXz91V��EK��]�)a�5��v%���U�L�KR�b4�eE�2�:f����+�3B!�˞|�<O���
�[I��1U�+��y���p�Y?��WL�OUN���HeƸ�kH֓��4�z�׻�ՈTn�P]�/gV�	P���xj7$�}YWf#V��#���ٌTv��]��g�����5lN�����7�������6'��	W�MXU��U�j؜4��+�3�*��b�������a��1�*N�G�0f~ �v��Gg�ֱ�b�N%Xb*��>D*���J�!�*�P�r}KHڂTb�K� �*���HيTr%�@���a���hC*uxܬ����foY��vO���(؈���Q�eI�[<5ڒ�^�&3w�f�D����mIQ��:�� ���@Ni��g�V��eI����ǾQ5"�M;&�"o+��
��u�F�r�Q�T	�]�U���Cj�O���:�$�����$��!��;&1rl�A�0�_���h�1��c+��F��z�H%G3�I[i���o֚	4���ȱ��A� �Z�"���:J������&EM>.3v���A5kM�Z|�K�Gi�pTP���(�ȹ��[%I��l@ڌTv4�$��(�*!j���5$��B.���v����ASR�J�+�il%J���"�-D.���bXLq�
@/9Z�\b9����4N���a̹�rA�u�$ԁF07$V��0�yH��4�F[�`Ҁ���B���uP63E��G�J(����2y~v���/�:��<�I�`�;��
[����nO9[Tw���ܙ<?w�_�'�A,�;mo(���np��2�y������3���ܪ[��̗�Ɵ�+��{��|�FZ/�_��*�%�)�Н3r&�2X�N��$�m�4[-f�i�b�1nd9n_��a(�q_�C�v|掬q�WǬ�_��d������ N���������y{?�^��=R�T��8P��r6�;f�H���a�'��R֓����Tޱ�E�@��J�f�H�Do[�/!C�S��bH��ڕ�Ⱦ�7�/���`S�/�A����ۧO?������}�\�kd-W�:ج���O$Z=�T�4¸��hd�td��>J3_C
0��^�p�Z-���������J�LE%�e��k�X�|)�����X�[�1W7VO)i#S�PQ�i��:��PM��^��eL�ɌT�őpu��b�	�CB��Q�))�0V%������(�.�'T
��B���i)$Ar9�4��Mĩ�^r�^�{�|}l>3pI��2~xͮ�I5�<f@���/���رPƎ�~���EJ%��^����A����A?Q�}#%��M]N2��
�T�����R����԰�/�:���j���$7UO      (     x�ŏ�j�0E��
-
N@*��e9]e����$�=F0����צmH����Νa枺=W�R��72/�G�lу�K���C ;���j J�L#%��8G��;e�@	�n���%�8�Gj�]ۓ�Ss��d�*�e^�2!�wL�C�4�ZH�/)%�i;�!z'�7��즟����C��o�MC�S}XcG����kR�p)28h^2#dɸ�5Ӽp��,��J#��Ts?}l:,3����w���N���wM�/      )   �  x��Mo�@����\l��w�Z ';qF��"���&�٥����U��s�T���̼�ޑ�.fQnϡ�>J�+ki.:��sVW����J�ێ��Vzjz��5\g�lC+!�f-��nنU#XN�d��ဤv��w?fu��<
W3M��+�h��MZ�������.~l��5�����J6�`�閭}ർ�4[�Q��mS�e�"kJt��ȼ�T��2�2"���!�����DA}�k�V���PSV��C�w�L�N�>�IӔ4�cC#�f��{�_���)<�|_��~�֟t�_�+�"[g-�m�#���-���3�u��ۚ�B�1�ݸ����y���{|/��nٽ�8���y�xKާܟ���)��<JDm������Nv�/�P���+�i����<��y�l���r�/�.�$��k<��+����eqn��{SwZ]L�A%?�×pX���5�P,�ู�	-�\+      *   g  x��SMK$1�ϯ}i���^֓��a�ً,!���d'�
�
*��w�u>d@�K�z�ޫ��bys��nw*�.�݇�+�zRg�k���$;�1�%��1�أ޹�5���Pg��J�bn+oFuH�2Ð�v`�DOX��(����������M$���D. ���*��8�#������b� �w�`�Yrv�l� ��5�4�aB�J�<N�V;Z�q���:��W�uh�R�ȧs��z��Y����_���Z-V��W�����1~)j�5����ټO��&x�8@  ��"ʥ����abH�����d�:D���B����n:y�N������������;��j6���-�      ,   
   x���          -   ^  x��R[o�0}�����8N̄�^�������}A�c�GH����l���M{݋��|���3���Ro|�~��ϵ�d�H�*���4�;֙�)m�[l#}/g�B�a:��-��{i깼���=�]^Od�
���[Z�c;�ip�eŖ��[��)��R�|�:V��{�lP\��Ł�	!�=$ۧ�[S�t&kL��)X����i��"��j�դ��Eٴ�7�'ާ��|0��X+��`c@9�s#J ��h�^{�*���	G�ֱ&�ϵ%�$"��eC��鵘Y�E��֮�hk����������V'�Yz����xt~_����p��a��`���!���?\��D܊u��N���W\s��'���v-D�~Ʉ�;��G	�!��P�U�Ǳ8�4N2DQ/� A$
{A��Q'ħ6P�'�t�T�L*V������ɻ��o�x3�	9R@���#�)@I�Mb%cL3I��Y��E�k�~3f����v�o���s8"]1_�kt��Iy�l�m�L�v�����񑼺T�ǽ�6L�t����|,��՚,�ID�0�
$,� �� ��Df�kk" ��p�^u�����iWR�7�wt����I      .   
   x���             �   x��PAj�0��{sB-#ɪc��B}0��� GkWШF��ϯ����R�i���Yf�nW?�����0���9��Co�?j��g�VFg��
����B�Gw<9T��#|��6O��veV�q�������g�^���iݡm��,z6�A��"K.��6n�Ԍ�q;�s�(a��-�[�s��J�^��z3Zc�t}�4����qj��x����.�;J��R��XD�4�$\[��      0   �   x��P=o�0��os����vN�����5l�6 l���Tڨk�,w:��=�%�n�$ۿA��u^���w��k>l�aV
��w7���;۝������O�^ߚ;�W���.����q�6;�!2�vgk���*ֲ��U��LqS1���8�l��A�N��B0�c��
��/B�������-��3��k�<5�o5�H_!C>���tB���ŭ{|x�c         �  x�՘]o�0���+���j��ggW�֋JUW��Ng������*P�T%�N�`���=>\��_�|@׷?�|i~	���M��3[��6�HǨn&Ͳ��ˢ�em���N�R8������t�����'�ff+�Q�4�/�&0>o��|�K������]�1��sIGct�xs���474�	ׁ i萉@G*�J蔒�=b�����F�ʘ����BF���BDiLT,5V�5�w[Ӫ��� �f(��莡 �m~!bpE̉ń�1��zv���`=��4Rb��I0(�Ìn�\UӢ�v���r�֮Di�,u5jG&)k����e���5(����?߁��~P"I�3�d�hC���PQ��dOb҂���&�i� q�J��ƙ	 qun2gS{�D�S�3	NFNf�(�~#�Ъ�AY�J���A���2F�%!lq(~*u%�[�7#��>�(&��O�& `����wY�i�>�����"�	�FE�'����&�6���n5C.��Y���Z��H�����XD��Ӗ��1�X�k�»+6Jz�����i���Գ���Ӭ�;��
z�%���:&��.��
Iw�ɡ	){+j����nA�ġ�>�����Cw[x�Z@��P��wMǞ:�|�̸�B6<]���Q]|p���Aθ�_`v�N'Α�D>熜�6�a���ؖi�E�dpb�-�cؑy4 ���ߤ~L�ܡ�9�J��݆������_/�v9      �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���         