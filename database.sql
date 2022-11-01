--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-01 19:33:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 11 (class 2615 OID 19226)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- TOC entry 12 (class 2615 OID 19482)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- TOC entry 10 (class 2615 OID 19052)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 10
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 4 (class 3079 OID 19215)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 2 (class 3079 OID 18006)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 5 (class 3079 OID 19227)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 3 (class 3079 OID 19053)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 283 (class 1259 OID 19652)
-- Name: nextbits_timesheet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nextbits_timesheet (
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


ALTER TABLE public.nextbits_timesheet OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 19658)
-- Name: Timesheet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Timesheet_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Timesheet_id_seq" OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 284
-- Name: Timesheet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Timesheet_id_seq" OWNED BY public.nextbits_timesheet.id;


--
-- TOC entry 285 (class 1259 OID 19659)
-- Name: nextbits_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nextbits_department (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255)
);


ALTER TABLE public.nextbits_department OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 19665)
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 286
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_id_seq OWNED BY public.nextbits_department.id;


--
-- TOC entry 287 (class 1259 OID 19666)
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
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


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 19672)
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 288
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- TOC entry 289 (class 1259 OID 19673)
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
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


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 19683)
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 19690)
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
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


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 19699)
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 292
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- TOC entry 293 (class 1259 OID 19700)
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
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


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 19707)
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_flows (
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


ALTER TABLE public.directus_flows OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 19715)
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 19718)
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 19724)
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_notifications (
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


ALTER TABLE public.directus_notifications OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 19731)
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO postgres;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 298
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- TOC entry 299 (class 1259 OID 19732)
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_operations (
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


ALTER TABLE public.directus_operations OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 19738)
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_panels (
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


ALTER TABLE public.directus_panels OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 19746)
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 19751)
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 302
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- TOC entry 303 (class 1259 OID 19752)
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
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


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 19759)
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 304
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- TOC entry 305 (class 1259 OID 19760)
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
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


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 19766)
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 306
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- TOC entry 307 (class 1259 OID 19767)
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 19772)
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 308
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- TOC entry 309 (class 1259 OID 19773)
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 19782)
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 19787)
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
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


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 19797)
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 312
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- TOC entry 313 (class 1259 OID 19798)
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_shares (
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


ALTER TABLE public.directus_shares OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 19805)
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
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


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 19815)
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
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


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 19823)
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 316
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- TOC entry 317 (class 1259 OID 19824)
-- Name: nextbits_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nextbits_project (
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


ALTER TABLE public.nextbits_project OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 19830)
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 318
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.nextbits_project.id;


--
-- TOC entry 4559 (class 2604 OID 19831)
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- TOC entry 4568 (class 2604 OID 19832)
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- TOC entry 4579 (class 2604 OID 19833)
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- TOC entry 4586 (class 2604 OID 19834)
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- TOC entry 4587 (class 2604 OID 19835)
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- TOC entry 4590 (class 2604 OID 19836)
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- TOC entry 4592 (class 2604 OID 19837)
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- TOC entry 4597 (class 2604 OID 19838)
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- TOC entry 4610 (class 2604 OID 19839)
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- TOC entry 4557 (class 2604 OID 19840)
-- Name: nextbits_department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);


--
-- TOC entry 4614 (class 2604 OID 19841)
-- Name: nextbits_project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- TOC entry 4555 (class 2604 OID 19842)
-- Name: nextbits_timesheet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_timesheet ALTER COLUMN id SET DEFAULT nextval('public."Timesheet_id_seq"'::regclass);


--
-- TOC entry 4882 (class 0 OID 19666)
-- Dependencies: 287
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (1, 'login', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:44:27.685+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_users', '34893b1f-fa39-40df-9624-987fe749d106', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (2, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:45:11.391+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_settings', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (3, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:54:51.945+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (4, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:54:51.965+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (5, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:54:51.988+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (6, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:54:52.026+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (7, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:54:52.06+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (8, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:54:52.096+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '6', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (9, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:54:52.126+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '7', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (10, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:54:52.155+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'Timesheet', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (11, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:57:42.324+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '8', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (12, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:58:21.623+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '9', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (13, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 14:58:50.999+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '10', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (14, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:00:28.063+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '11', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (15, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:00:54.358+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '12', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (16, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:02:54.323+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '13', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (17, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:06:00.828+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '14', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (18, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:06:00.843+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '15', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (19, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:06:00.859+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '16', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (20, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:06:00.877+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '17', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (21, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:06:00.895+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '18', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (22, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:06:00.915+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '19', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (23, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:06:00.938+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '20', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (24, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:06:00.956+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'department', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (25, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:09:39.733+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '21', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (26, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:11:55.378+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '22', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (27, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:11:55.394+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '23', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (28, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:11:55.409+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '24', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (29, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:11:55.423+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '25', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (30, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:11:55.439+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '26', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (31, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:11:55.452+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '27', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (32, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:11:55.465+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '28', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (33, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:11:55.482+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'project', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (34, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:12:27.779+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '29', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (38, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:19:23.075+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'project', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (35, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:14:49.448+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '30', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (36, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:15:31.48+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '29', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (37, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:19:05.477+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'project', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (39, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:19:30.815+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'project', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (40, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:20:21.495+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'department', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (41, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:20:42.43+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'department', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (42, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:21:42.008+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'department', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (43, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:25:23.567+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (44, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:39.9+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_roles', '961e3b49-c689-4f5b-b47f-47b978d19c6f', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (45, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:39.961+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (46, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:39.978+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (47, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:39.996+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (48, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.018+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (49, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.037+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (50, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.051+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '6', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (51, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.064+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '7', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (52, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.082+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '8', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (53, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.097+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '9', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (54, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.112+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '10', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (55, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.126+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '11', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (56, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.137+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '12', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (57, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.152+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '13', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (58, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.17+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '14', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (59, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.185+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '15', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (60, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.202+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '16', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (61, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.213+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '17', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (62, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.23+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '18', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (63, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.243+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '19', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (64, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.255+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '20', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (65, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.268+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '21', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (66, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.286+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '22', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (67, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.297+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '23', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (68, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:40.309+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '24', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (69, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:50.629+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '25', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (70, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:52.592+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '26', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (71, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:07:56.779+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '27', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (72, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:10:13.987+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '27', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (73, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:10:18.593+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '28', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (74, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:10:59.666+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '28', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (75, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:11:07.461+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '29', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (76, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:11:22.783+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '29', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (77, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:11:27.378+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '30', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (78, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:11:37.573+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '30', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (79, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:11:53.398+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '31', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (80, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:13:21.313+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_users', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (81, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 06:13:21.326+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_roles', '961e3b49-c689-4f5b-b47f-47b978d19c6f', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (82, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 07:25:55.104+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (83, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 11:11:25.645+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (84, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 11:11:36.994+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (85, 'login', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-20 07:00:55.681+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_users', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (86, 'create', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-20 07:13:23.264+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (87, 'create', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-20 07:13:53.512+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (88, 'create', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-20 07:22:58.34+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_dashboards', 'b4d8c8a5-24fe-4969-94fc-22eba13fe077', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (89, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-20 08:11:34.469+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', '001d0b06-e662-4ed4-ad94-25aed7c7eff4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (90, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-20 08:11:34.495+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', '6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (91, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-20 08:18:33.932+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', '6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (92, 'delete', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-20 08:19:36.086+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', '6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (93, 'delete', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-20 08:19:36.092+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', '001d0b06-e662-4ed4-ad94-25aed7c7eff4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (94, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:02:54.321+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '31', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (95, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:03:17.82+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (96, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:04:29.451+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (97, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:17:45.707+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '32', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (98, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:19:41.775+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (99, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:20:01.507+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (100, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:23:03.348+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '33', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (101, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:23:33.922+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (102, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:39:55.296+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '34', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (103, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:40:10.303+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (104, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:40:19.079+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (105, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:40:28.114+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (106, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:40:38.429+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (107, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:40:47.352+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (108, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:42:48.88+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (109, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:53:57.819+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '35', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (110, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:54:14.367+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (111, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:56:35.515+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (112, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:56:46.409+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (113, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:56:56.611+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (114, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:57:06.482+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (115, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 09:11:38.771+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '36', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (116, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 09:14:28.38+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (117, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 09:50:04.548+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '37', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (118, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 09:50:45.363+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (119, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 09:51:43.763+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (120, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 09:51:53.65+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (121, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 09:52:01.106+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (122, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 09:52:25.278+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (123, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:06:53.738+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '6', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (124, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:14:40.422+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '6', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (125, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:18:49.372+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (126, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:20:26.906+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (127, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:22:28.439+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (128, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:23:24.574+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '38', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (129, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:38:01.952+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '7', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (130, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:38:32.996+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '7', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (131, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:40:37.697+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (132, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:40:45.712+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (133, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:40:53.315+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (134, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:41:01.98+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (135, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:41:10.701+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (136, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:41:17.058+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '6', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (137, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:42:35.675+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (138, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:44:17.361+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (139, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 09:35:26.882+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '39', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (140, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 09:36:09.912+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (141, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 09:36:16.639+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (142, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 09:36:23.382+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (143, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 09:36:30.294+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (144, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 09:36:38.93+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (145, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 09:36:47.341+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '6', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (146, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 09:36:57.912+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '7', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (147, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 10:43:09.087+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (148, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 10:43:36.605+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (149, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:06:46.987+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '40', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (150, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:07:59.719+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '1', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (151, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:10:42.214+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '2', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (152, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:11:02.377+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '3', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (153, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:11:21.923+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '4', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (154, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:11:35.681+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (155, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:11:49.785+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '6', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (156, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:12:06.495+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '7', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (157, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:17:12.323+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '8', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (158, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:23:48.081+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '9', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (159, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:24:22.795+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '9', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (160, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:26:27.501+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (161, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:27:16.498+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (162, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:49:31.484+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '9', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (163, 'login', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:14:26.584+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_users', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (164, 'create', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:20:12.601+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '10', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (165, 'update', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:22:56.926+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (166, 'create', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:29:08.885+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '11', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (167, 'create', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:32:41.969+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Timesheet', '12', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (168, 'update', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:33:26.905+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (169, 'update', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-27 15:00:07.199+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (170, 'create', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-28 08:21:33.024+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', '1b15640c-d7db-4b4b-a05b-581ba555a0fc', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (171, 'delete', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-28 13:24:19.199+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_panels', '1b15640c-d7db-4b4b-a05b-581ba555a0fc', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (172, 'login', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-28 13:24:46.126+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_users', '34893b1f-fa39-40df-9624-987fe749d106', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (173, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:05.01+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'timesheet', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (174, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:31.378+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '41', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (175, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:34.748+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '42', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (176, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:37.737+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '43', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (177, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:40.352+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '44', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (178, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:44.659+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '45', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (179, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:47.892+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '46', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (180, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:51.012+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '47', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (181, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:53.903+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '48', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (182, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:18:57.323+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '49', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (183, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:19:01.314+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '50', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (184, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:19:06.293+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '51', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (185, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:19:10.396+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '52', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (186, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:19:14.652+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '53', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (187, 'delete', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:20:45.937+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'Timesheet', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (188, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:28:33.132+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '54', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (189, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:28:39.164+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '55', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (190, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:36:35.842+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'timesheet', '5', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (191, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:37:08.581+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'timesheet', '13', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (192, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:41:42.496+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'nextbits_department', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (193, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:41:47.079+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '56', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (194, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:41:50.012+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '57', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (195, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:41:52.715+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '58', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (196, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:41:55.149+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '59', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (197, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:41:57.724+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '60', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (198, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:00.216+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '61', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (199, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:02.916+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '62', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (200, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:06.136+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '63', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (201, 'delete', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:20.995+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'department', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (202, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:29.046+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'nextbits_project', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (204, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:33.754+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '65', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (206, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:38.998+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '67', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (208, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:44.786+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '69', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (210, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:50.688+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '71', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (211, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:53.584+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '72', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (212, 'delete', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:04.451+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'project', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (213, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:11.71+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'nextbits_timesheet', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (214, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:13.709+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '73', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (216, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:18.299+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '75', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (218, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:24.192+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '77', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (220, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:31.307+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '79', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (223, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:40.541+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '82', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (225, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:48.577+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '84', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (227, 'delete', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:44:06.682+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_collections', 'timesheet', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (203, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:30.755+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '64', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (205, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:36.419+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '66', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (207, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:41.994+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '68', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (209, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:42:47.83+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '70', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (215, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:16.156+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '74', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (217, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:21.221+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '76', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (219, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:28.041+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '78', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (221, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:34.288+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '80', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (222, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:37.497+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '81', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (224, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:44.455+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '83', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (226, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 06:43:52.089+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '85', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (228, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 07:33:13.693+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '86', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (229, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 07:33:33.544+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '87', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (230, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 07:33:41.122+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_fields', '88', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (231, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 07:37:20.987+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'nextbits_timesheet', '14', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (232, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-31 07:37:44.966+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'nextbits_timesheet', '12', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (233, 'login', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:42:42.171+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_users', '34893b1f-fa39-40df-9624-987fe749d106', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (234, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:44:42.034+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '32', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (235, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:44:44.1+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '33', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (236, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:44:51.404+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '34', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (237, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:44:57.808+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '35', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (238, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:45:24.336+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '35', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (239, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:45:33.123+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '36', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (240, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:45:42.855+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '36', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (241, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:45:50.336+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '37', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (242, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:45:57.738+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '37', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (243, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:46:02.518+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '38', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (244, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:46:11.26+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '38', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (245, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:46:28.336+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '35', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (246, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:46:57.309+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '35', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (247, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:47:23.77+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '36', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (248, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 09:47:32.333+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'directus_permissions', '37', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (249, 'update', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 13:46:34.701+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'nextbits_timesheet', '12', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (250, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 13:46:59.236+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'nextbits_timesheet', '15', NULL, 'http://localhost:8055');
INSERT INTO public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) VALUES (251, 'create', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-01 13:58:03.523+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'nextbits_timesheet', '16', NULL, 'http://localhost:8055');


--
-- TOC entry 4884 (class 0 OID 19673)
-- Dependencies: 289
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) VALUES ('nextbits_department', NULL, NULL, NULL, false, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open');
INSERT INTO public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) VALUES ('nextbits_project', NULL, NULL, NULL, false, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open');
INSERT INTO public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) VALUES ('nextbits_timesheet', NULL, NULL, NULL, false, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open');


--
-- TOC entry 4885 (class 0 OID 19683)
-- Dependencies: 290
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_dashboards (id, name, icon, note, date_created, user_created, color) VALUES ('b4d8c8a5-24fe-4969-94fc-22eba13fe077', 'Report', 'dashboard', NULL, '2022-10-20 07:22:58.333+00', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', NULL);


--
-- TOC entry 4886 (class 0 OID 19690)
-- Dependencies: 291
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (1, 'Timesheet', 'id', NULL, 'input', NULL, NULL, NULL, true, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (2, 'Timesheet', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (3, 'Timesheet', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (4, 'Timesheet', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (5, 'Timesheet', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (6, 'Timesheet', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (7, 'Timesheet', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (9, 'Timesheet', 'department', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (11, 'Timesheet', 'notes', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (12, 'Timesheet', 'project', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (13, 'Timesheet', 'dateTime', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (14, 'department', 'id', NULL, 'input', NULL, NULL, NULL, true, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (15, 'department', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (16, 'department', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (17, 'department', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (18, 'department', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (19, 'department', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (20, 'department', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (21, 'department', 'dname', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, true, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (22, 'project', 'id', NULL, 'input', NULL, NULL, NULL, true, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (23, 'project', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}', false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (24, 'project', 'sort', NULL, 'input', NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (25, 'project', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (26, 'project', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (27, 'project', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (28, 'project', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (30, 'project', 'pname', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, true, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (29, 'project', 'pcode', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, true, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (39, 'Timesheet', 'hours', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (40, 'Timesheet', 'date', NULL, 'datetime', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (41, 'timesheet', 'id', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (42, 'timesheet', 'status', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (43, 'timesheet', 'sort', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (44, 'timesheet', 'user_created', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (45, 'timesheet', 'date_created', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (46, 'timesheet', 'user_updated', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (47, 'timesheet', 'date_updated', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (48, 'timesheet', 'department', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (49, 'timesheet', 'notes', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (50, 'timesheet', 'project', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (51, 'timesheet', 'dateTime', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (52, 'timesheet', 'hours', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (53, 'timesheet', 'date', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (54, 'timesheet', 'timestamp', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (55, 'timesheet', 'time', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (56, 'nextbits_department', 'id', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (57, 'nextbits_department', 'status', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (58, 'nextbits_department', 'sort', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (59, 'nextbits_department', 'user_created', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (60, 'nextbits_department', 'date_created', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (61, 'nextbits_department', 'user_updated', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (62, 'nextbits_department', 'date_updated', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (63, 'nextbits_department', 'dname', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (64, 'nextbits_project', 'id', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (65, 'nextbits_project', 'status', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (66, 'nextbits_project', 'sort', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (67, 'nextbits_project', 'user_created', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (68, 'nextbits_project', 'date_created', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (69, 'nextbits_project', 'user_updated', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (70, 'nextbits_project', 'date_updated', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (71, 'nextbits_project', 'pcode', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (72, 'nextbits_project', 'pname', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (73, 'nextbits_timesheet', 'id', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (74, 'nextbits_timesheet', 'status', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (75, 'nextbits_timesheet', 'sort', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (76, 'nextbits_timesheet', 'user_created', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (77, 'nextbits_timesheet', 'date_created', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (78, 'nextbits_timesheet', 'user_updated', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (79, 'nextbits_timesheet', 'date_updated', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (80, 'nextbits_timesheet', 'department', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (81, 'nextbits_timesheet', 'notes', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (82, 'nextbits_timesheet', 'project', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (84, 'nextbits_timesheet', 'time', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (85, 'nextbits_timesheet', 'date', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (86, 'nextbits_department', 'name', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (87, 'nextbits_project', 'code', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);
INSERT INTO public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) VALUES (88, 'nextbits_project', 'name', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);


--
-- TOC entry 4888 (class 0 OID 19700)
-- Dependencies: 293
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4889 (class 0 OID 19707)
-- Dependencies: 294
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4890 (class 0 OID 19715)
-- Dependencies: 295
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4891 (class 0 OID 19718)
-- Dependencies: 296
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20201028A', 'Remove Collection Foreign Keys', '2022-10-18 14:37:51.625186+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20201029A', 'Remove System Relations', '2022-10-18 14:37:51.639104+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20201029B', 'Remove System Collections', '2022-10-18 14:37:51.647849+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20201029C', 'Remove System Fields', '2022-10-18 14:37:51.665626+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20201105A', 'Add Cascade System Relations', '2022-10-18 14:37:51.708447+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20201105B', 'Change Webhook URL Type', '2022-10-18 14:37:51.718605+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210225A', 'Add Relations Sort Field', '2022-10-18 14:37:51.729068+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210304A', 'Remove Locked Fields', '2022-10-18 14:37:51.736992+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210312A', 'Webhooks Collections Text', '2022-10-18 14:37:51.747667+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210331A', 'Add Refresh Interval', '2022-10-18 14:37:51.755625+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210415A', 'Make Filesize Nullable', '2022-10-18 14:37:51.766417+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210416A', 'Add Collections Accountability', '2022-10-18 14:37:51.775616+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210422A', 'Remove Files Interface', '2022-10-18 14:37:51.783713+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210506A', 'Rename Interfaces', '2022-10-18 14:37:51.814699+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210510A', 'Restructure Relations', '2022-10-18 14:37:51.842782+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210518A', 'Add Foreign Key Constraints', '2022-10-18 14:37:51.894598+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210519A', 'Add System Fk Triggers', '2022-10-18 14:37:51.925402+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210521A', 'Add Collections Icon Color', '2022-10-18 14:37:51.931244+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210525A', 'Add Insights', '2022-10-18 14:37:51.962832+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210608A', 'Add Deep Clone Config', '2022-10-18 14:37:51.971771+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210626A', 'Change Filesize Bigint', '2022-10-18 14:37:51.990548+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210716A', 'Add Conditions to Fields', '2022-10-18 14:37:51.997761+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210721A', 'Add Default Folder', '2022-10-18 14:37:52.007463+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210802A', 'Replace Groups', '2022-10-18 14:37:52.018263+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210803A', 'Add Required to Fields', '2022-10-18 14:37:52.025489+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210805A', 'Update Groups', '2022-10-18 14:37:52.034448+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210805B', 'Change Image Metadata Structure', '2022-10-18 14:37:52.044985+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210811A', 'Add Geometry Config', '2022-10-18 14:37:52.050175+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210831A', 'Remove Limit Column', '2022-10-18 14:37:52.059936+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210903A', 'Add Auth Provider', '2022-10-18 14:37:52.081937+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210907A', 'Webhooks Collections Not Null', '2022-10-18 14:37:52.09263+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210910A', 'Move Module Setup', '2022-10-18 14:37:52.099978+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210920A', 'Webhooks URL Not Null', '2022-10-18 14:37:52.109496+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210924A', 'Add Collection Organization', '2022-10-18 14:37:52.117435+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210927A', 'Replace Fields Group', '2022-10-18 14:37:52.129866+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210927B', 'Replace M2M Interface', '2022-10-18 14:37:52.137327+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20210929A', 'Rename Login Action', '2022-10-18 14:37:52.145505+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211007A', 'Update Presets', '2022-10-18 14:37:52.15477+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211009A', 'Add Auth Data', '2022-10-18 14:37:52.160248+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211016A', 'Add Webhook Headers', '2022-10-18 14:37:52.167176+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211103A', 'Set Unique to User Token', '2022-10-18 14:37:52.174528+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211103B', 'Update Special Geometry', '2022-10-18 14:37:52.183556+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211104A', 'Remove Collections Listing', '2022-10-18 14:37:52.188727+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211118A', 'Add Notifications', '2022-10-18 14:37:52.20996+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211211A', 'Add Shares', '2022-10-18 14:37:52.235205+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20211230A', 'Add Project Descriptor', '2022-10-18 14:37:52.242607+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220303A', 'Remove Default Project Color', '2022-10-18 14:37:52.253125+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220308A', 'Add Bookmark Icon and Color', '2022-10-18 14:37:52.260086+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220314A', 'Add Translation Strings', '2022-10-18 14:37:52.266716+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220322A', 'Rename Field Typecast Flags', '2022-10-18 14:37:52.275759+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220323A', 'Add Field Validation', '2022-10-18 14:37:52.282456+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220325A', 'Fix Typecast Flags', '2022-10-18 14:37:52.290867+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220325B', 'Add Default Language', '2022-10-18 14:37:52.302666+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220402A', 'Remove Default Value Panel Icon', '2022-10-18 14:37:52.312635+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220429A', 'Add Flows', '2022-10-18 14:37:52.349996+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220429B', 'Add Color to Insights Icon', '2022-10-18 14:37:52.355482+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220429C', 'Drop Non Null From IP of Activity', '2022-10-18 14:37:52.367369+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220429D', 'Drop Non Null From Sender of Notifications', '2022-10-18 14:37:52.37676+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220614A', 'Rename Hook Trigger to Event', '2022-10-18 14:37:52.392948+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220801A', 'Update Notifications Timestamp Column', '2022-10-18 14:37:52.404594+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220802A', 'Add Custom Aspect Ratios', '2022-10-18 14:37:52.413033+00');
INSERT INTO public.directus_migrations (version, name, "timestamp") VALUES ('20220826A', 'Add Origin to Accountability', '2022-10-18 14:37:52.421987+00');


--
-- TOC entry 4892 (class 0 OID 19724)
-- Dependencies: 297
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4894 (class 0 OID 19732)
-- Dependencies: 299
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4895 (class 0 OID 19738)
-- Dependencies: 300
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) VALUES ('cf23e02e-cd58-4af0-a696-592aed8366fd', 'b4d8c8a5-24fe-4969-94fc-22eba13fe077', 'Hour based Report', NULL, NULL, true, NULL, 'time-series', 1, 1, 45, 14, '{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"}', '2022-10-21 08:42:48.871+00', '34893b1f-fa39-40df-9624-987fe749d106');


--
-- TOC entry 4896 (class 0 OID 19746)
-- Dependencies: 301
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (1, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_files', 'create', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (2, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_files', 'read', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (3, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_files', 'update', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (4, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_files', 'delete', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (5, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_dashboards', 'create', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (6, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_dashboards', 'read', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (7, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_dashboards', 'update', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (8, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_dashboards', 'delete', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (9, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_panels', 'create', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (10, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_panels', 'read', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (11, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_panels', 'update', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (12, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_panels', 'delete', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (13, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_folders', 'create', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (14, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_folders', 'read', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (15, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_folders', 'update', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (16, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_folders', 'delete', '{}', NULL, NULL, NULL);
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (17, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_users', 'read', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (18, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_users', 'update', '{"id":{"_eq":"$CURRENT_USER"}}', NULL, NULL, 'first_name,last_name,email,password,location,title,description,avatar,language,theme,tfa_secret');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (19, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_roles', 'read', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (20, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_shares', 'read', '{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (21, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_shares', 'create', '{}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (22, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_shares', 'update', '{"user_created":{"_eq":"$CURRENT_USER"}}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (23, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_shares', 'delete', '{"user_created":{"_eq":"$CURRENT_USER"}}', NULL, NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (24, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'directus_flows', 'read', '{"trigger":{"_eq":"manual"}}', NULL, NULL, 'id,name,icon,color,options,trigger');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (25, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'department', 'read', '{}', '{}', NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (26, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'project', 'read', '{}', '{}', NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (27, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'Timesheet', 'read', '{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}', NULL, NULL, 'id,status,sort,user_updated,date_created,user_created,date_updated,date,hours,notes,project,department,dateTime');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (28, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'Timesheet', 'update', '{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}', NULL, NULL, 'id,status,sort,user_updated,date_created,user_created,date_updated,date,hours,notes,project,department,dateTime');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (29, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'Timesheet', 'delete', '{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}', NULL, NULL, NULL);
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (30, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'Timesheet', 'share', '{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}', NULL, NULL, NULL);
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (31, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'Timesheet', 'create', '{}', '{}', NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (32, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'nextbits_department', 'read', '{}', '{}', NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (33, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'nextbits_project', 'read', '{}', '{}', NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (34, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'nextbits_timesheet', 'create', '{}', '{}', NULL, '*');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (38, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'nextbits_timesheet', 'share', '{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}', NULL, NULL, NULL);
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (35, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'nextbits_timesheet', 'read', '{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}', NULL, NULL, 'id,status,sort,user_updated,date_created,user_created,date_updated,department,project,timestamp,time,date,notes');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (36, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'nextbits_timesheet', 'update', '{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}', NULL, NULL, 'id,status,sort,user_updated,date_created,user_created,date_updated,department,project,timestamp,time,notes,date');
INSERT INTO public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) VALUES (37, '961e3b49-c689-4f5b-b47f-47b978d19c6f', 'nextbits_timesheet', 'delete', '{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}', NULL, NULL, NULL);


--
-- TOC entry 4898 (class 0 OID 19752)
-- Dependencies: 303
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) VALUES (2, NULL, '34893b1f-fa39-40df-9624-987fe749d106', NULL, 'Timesheet', NULL, 'tabular', NULL, NULL, NULL, NULL, 'bookmark_outline', NULL);
INSERT INTO public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) VALUES (4, NULL, '34893b1f-fa39-40df-9624-987fe749d106', NULL, 'department', NULL, NULL, '{"tabular":{"page":1}}', NULL, NULL, NULL, 'bookmark_outline', NULL);
INSERT INTO public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) VALUES (3, NULL, '34893b1f-fa39-40df-9624-987fe749d106', NULL, 'timesheet', NULL, NULL, '{"tabular":{"page":1}}', NULL, NULL, NULL, 'bookmark_outline', NULL);
INSERT INTO public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) VALUES (1, NULL, '34893b1f-fa39-40df-9624-987fe749d106', NULL, 'project', NULL, 'tabular', '{"tabular":{"page":1}}', NULL, NULL, NULL, 'bookmark_outline', NULL);
INSERT INTO public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) VALUES (5, NULL, '34893b1f-fa39-40df-9624-987fe749d106', NULL, 'nextbits_department', NULL, NULL, '{"tabular":{"page":1}}', NULL, NULL, NULL, 'bookmark_outline', NULL);


--
-- TOC entry 4900 (class 0 OID 19760)
-- Dependencies: 305
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) VALUES (1, 'Timesheet', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');
INSERT INTO public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) VALUES (2, 'Timesheet', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');
INSERT INTO public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) VALUES (3, 'department', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');
INSERT INTO public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) VALUES (4, 'department', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');
INSERT INTO public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) VALUES (5, 'project', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');
INSERT INTO public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) VALUES (6, 'project', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');


--
-- TOC entry 4902 (class 0 OID 19767)
-- Dependencies: 307
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (1, 2, 'directus_settings', '1', '{"module_bar":[{"type":"module","id":"timesheet","enabled":true},{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}]}', '{"module_bar":[{"type":"module","id":"timesheet","enabled":true},{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}]}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (2, 3, 'directus_fields', '1', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Timesheet"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (3, 4, 'directus_fields', '2', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"Timesheet"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"Timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (4, 5, 'directus_fields', '3', '{"interface":"input","hidden":true,"field":"sort","collection":"Timesheet"}', '{"interface":"input","hidden":true,"field":"sort","collection":"Timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (5, 6, 'directus_fields', '4', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Timesheet"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (6, 7, 'directus_fields', '5', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Timesheet"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (7, 8, 'directus_fields', '6', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Timesheet"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (8, 9, 'directus_fields', '7', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Timesheet"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (9, 10, 'directus_collections', 'Timesheet', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Timesheet"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (10, 11, 'directus_fields', '8', '{"interface":"input","special":null,"collection":"Timesheet","field":"date"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"date"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (11, 12, 'directus_fields', '9', '{"interface":"input","special":null,"collection":"Timesheet","field":"department"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (12, 13, 'directus_fields', '10', '{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (13, 14, 'directus_fields', '11', '{"interface":"input","special":null,"collection":"Timesheet","field":"notes"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"notes"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (14, 15, 'directus_fields', '12', '{"interface":"input","special":null,"collection":"Timesheet","field":"project"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (15, 16, 'directus_fields', '13', '{"interface":"input","special":null,"collection":"Timesheet","field":"dateTime"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"dateTime"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (16, 17, 'directus_fields', '14', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"department"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (17, 18, 'directus_fields', '15', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"department"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (18, 19, 'directus_fields', '16', '{"interface":"input","hidden":true,"field":"sort","collection":"department"}', '{"interface":"input","hidden":true,"field":"sort","collection":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (24, 25, 'directus_fields', '21', '{"interface":"input","special":null,"required":true,"collection":"department","field":"dname"}', '{"interface":"input","special":null,"required":true,"collection":"department","field":"dname"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (19, 20, 'directus_fields', '17', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"department"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (20, 21, 'directus_fields', '18', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"department"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (21, 22, 'directus_fields', '19', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"department"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (22, 23, 'directus_fields', '20', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"department"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (23, 24, 'directus_collections', 'department', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"department"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (25, 26, 'directus_fields', '22', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"project"}', '{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (26, 27, 'directus_fields', '23', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"project"}', '{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (27, 28, 'directus_fields', '24', '{"interface":"input","hidden":true,"field":"sort","collection":"project"}', '{"interface":"input","hidden":true,"field":"sort","collection":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (28, 29, 'directus_fields', '25', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"project"}', '{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (29, 30, 'directus_fields', '26', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"project"}', '{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (30, 31, 'directus_fields', '27', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"project"}', '{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (31, 32, 'directus_fields', '28', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"project"}', '{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (32, 33, 'directus_collections', 'project', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"project"}', '{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (34, 35, 'directus_fields', '30', '{"interface":"input","special":null,"required":true,"collection":"project","field":"pname"}', '{"interface":"input","special":null,"required":true,"collection":"project","field":"pname"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (35, 36, 'directus_fields', '29', '{"id":29,"collection":"project","field":"pcode","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', '{"collection":"project","field":"pcode","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (36, 37, 'project', '1', '{"status":"published","pcode":"P1","pname":"Project1"}', '{"status":"published","pcode":"P1","pname":"Project1"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (33, 34, 'directus_fields', '29', '{"interface":"input","special":null,"collection":"project","field":"pcode"}', '{"interface":"input","special":null,"collection":"project","field":"pcode"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (37, 38, 'project', '2', '{"status":"published","pcode":"P2","pname":"Project 2"}', '{"status":"published","pcode":"P2","pname":"Project 2"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (174, 182, 'directus_fields', '49', '{"collection":"timesheet","field":"notes"}', '{"collection":"timesheet","field":"notes"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (38, 39, 'project', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:19:05.471Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-18T15:19:30.811Z","pcode":"P1","pname":"Project 1"}', '{"pname":"Project 1","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-18T15:19:30.811Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (39, 40, 'department', '1', '{"dname":"Engineering"}', '{"dname":"Engineering"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (40, 41, 'department', '2', '{"dname":"Designing","status":"published"}', '{"dname":"Designing","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (41, 42, 'department', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:20:21.489Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-18T15:21:42.002Z","dname":"Engineering"}', '{"status":"published","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-18T15:21:42.002Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (42, 43, 'Timesheet', '1', '{"date":"Tuesday, Oct 18, 2022","dateTime":1666031400000,"department":"Designing","hours":"05:00","notes":"dgf dfbdfb","project":"P2 - Project 2","status":"published"}', '{"date":"Tuesday, Oct 18, 2022","dateTime":1666031400000,"department":"Designing","hours":"05:00","notes":"dgf dfbdfb","project":"P2 - Project 2","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (43, 44, 'directus_roles', '961e3b49-c689-4f5b-b47f-47b978d19c6f', '{"name":"Employee","admin_access":false,"app_access":true}', '{"name":"Employee","admin_access":false,"app_access":true}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (44, 45, 'directus_permissions', '1', '{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (45, 46, 'directus_permissions', '2', '{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (46, 47, 'directus_permissions', '3', '{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (47, 48, 'directus_permissions', '4', '{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (48, 49, 'directus_permissions', '5', '{"collection":"directus_dashboards","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_dashboards","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (49, 50, 'directus_permissions', '6', '{"collection":"directus_dashboards","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_dashboards","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (50, 51, 'directus_permissions', '7', '{"collection":"directus_dashboards","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_dashboards","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (51, 52, 'directus_permissions', '8', '{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (52, 53, 'directus_permissions', '9', '{"collection":"directus_panels","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_panels","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (53, 54, 'directus_permissions', '10', '{"collection":"directus_panels","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_panels","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (54, 55, 'directus_permissions', '11', '{"collection":"directus_panels","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_panels","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (55, 56, 'directus_permissions', '12', '{"collection":"directus_panels","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_panels","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (56, 57, 'directus_permissions', '13', '{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (57, 58, 'directus_permissions', '14', '{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (58, 59, 'directus_permissions', '15', '{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (59, 60, 'directus_permissions', '16', '{"collection":"directus_folders","action":"delete","permissions":{},"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_folders","action":"delete","permissions":{},"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (60, 61, 'directus_permissions', '17', '{"collection":"directus_users","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_users","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (61, 62, 'directus_permissions', '18', '{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme,tfa_secret","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme,tfa_secret","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (62, 63, 'directus_permissions', '19', '{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (176, 184, 'directus_fields', '51', '{"collection":"timesheet","field":"dateTime"}', '{"collection":"timesheet","field":"dateTime"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (63, 64, 'directus_permissions', '20', '{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (64, 65, 'directus_permissions', '21', '{"collection":"directus_shares","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_shares","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (65, 66, 'directus_permissions', '22', '{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (66, 67, 'directus_permissions', '23', '{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (67, 68, 'directus_permissions', '24', '{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":"id,name,icon,color,options,trigger","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":"id,name,icon,color,options,trigger","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (68, 69, 'directus_permissions', '25', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"department","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"department","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (69, 70, 'directus_permissions', '26', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"project","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"project","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (70, 71, 'directus_permissions', '27', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"read"}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"read"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (71, 72, 'directus_permissions', '27', '{"id":27,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","date","hours","notes","project","department","dateTime"]}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","date","hours","notes","project","department","dateTime"]}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (72, 73, 'directus_permissions', '28', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"update"}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"update"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (73, 74, 'directus_permissions', '28', '{"id":28,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"update","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","date","hours","notes","project","department","dateTime"]}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"update","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","date","hours","notes","project","department","dateTime"]}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (74, 75, 'directus_permissions', '29', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"delete"}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"delete"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (75, 76, 'directus_permissions', '29', '{"id":29,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"delete","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"delete","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (76, 77, 'directus_permissions', '30', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"share"}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"share"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (77, 78, 'directus_permissions', '30', '{"id":30,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"share","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"share","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (78, 79, 'directus_permissions', '31', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"create","fields":["*"],"permissions":{},"validation":{}}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"create","fields":["*"],"permissions":{},"validation":{}}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (79, 80, 'directus_users', '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '{"first_name":"Saurabh","last_name":"Gupta","email":"saurabhg096567@gmail.com","password":"**********","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', '{"first_name":"Saurabh","last_name":"Gupta","email":"saurabhg096567@gmail.com","password":"**********","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (80, 82, 'Timesheet', '2', '{"date":"Tuesday, Oct 18, 2022","dateTime":1666031400000,"department":"Engineering","hours":"05:00","notes":"","project":"P1 - Project 1","status":"published"}', '{"date":"Tuesday, Oct 18, 2022","dateTime":1666031400000,"department":"Engineering","hours":"05:00","notes":"","project":"P1 - Project 1","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (98, 103, 'Timesheet', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:10.297Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":5}', '{"hours":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:10.297Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (178, 186, 'directus_fields', '53', '{"collection":"timesheet","field":"date"}', '{"collection":"timesheet","field":"date"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (175, 183, 'directus_fields', '50', '{"collection":"timesheet","field":"project"}', '{"collection":"timesheet","field":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (81, 83, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-19T11:11:25.636Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","hours":"02:00","notes":"","project":"P1 - Project 1","dateTime":1666117800000}', '{"status":"published","date":"Wednesday, Oct 19, 2022","department":"Engineering","hours":"02:00","notes":"","project":"P1 - Project 1","dateTime":1666117800000,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-19T11:11:25.636Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (82, 84, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-19T11:11:36.988Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","hours":"02:00","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000}', '{"status":"published","date":"Wednesday, Oct 19, 2022","department":"Engineering","hours":"02:00","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-19T11:11:36.988Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (83, 86, 'Timesheet', '3', '{"date":"Thursday, Oct 20, 2022","dateTime":1666204200000,"department":"Designing","hours":"05:00","notes":"jbad djshbfj djbs","project":"P1 - Project 1","status":"published"}', '{"date":"Thursday, Oct 20, 2022","dateTime":1666204200000,"department":"Designing","hours":"05:00","notes":"jbad djshbfj djbs","project":"P1 - Project 1","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (84, 87, 'Timesheet', '4', '{"date":"Thursday, Oct 20, 2022","dateTime":1666204200000,"department":"Designing","hours":"05:00","notes":"df vkkjf fkjk","project":"P2 - Project 2","status":"published"}', '{"date":"Thursday, Oct 20, 2022","dateTime":1666204200000,"department":"Designing","hours":"05:00","notes":"df vkkjf fkjk","project":"P2 - Project 2","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (85, 88, 'directus_dashboards', 'b4d8c8a5-24fe-4969-94fc-22eba13fe077', '{"name":"Report","icon":"dashboard","color":null,"note":null}', '{"name":"Report","icon":"dashboard","color":null,"note":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (86, 89, 'directus_panels', '001d0b06-e662-4ed4-ad94-25aed7c7eff4', '{"show_header":true,"type":"label","width":47,"height":6,"position_x":1,"position_y":1,"options":{"text":"Project Report"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}', '{"show_header":true,"type":"label","width":47,"height":6,"position_x":1,"position_y":1,"options":{"text":"Project Report"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (87, 90, 'directus_panels', '6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633', '{"type":"time-series","width":47,"height":21,"position_x":1,"position_y":7,"options":{"collection":"Timesheet","dateField":"date_updated","valueField":"dateTime","range":"auto"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}', '{"type":"time-series","width":47,"height":21,"position_x":1,"position_y":7,"options":{"collection":"Timesheet","dateField":"date_updated","valueField":"dateTime","range":"auto"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (88, 91, 'directus_panels', '6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633', '{"id":"6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"relational-variable","position_x":1,"position_y":7,"width":47,"height":21,"options":{"collection":"Timesheet","dateField":"date_updated","valueField":"dateTime","range":"auto","field":"hours","displayTemplate":"{{department}}"},"date_created":"2022-10-20T08:11:34.488Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"relational-variable","position_x":1,"position_y":7,"width":47,"height":21,"options":{"collection":"Timesheet","dateField":"date_updated","valueField":"dateTime","range":"auto","field":"hours","displayTemplate":"{{department}}"},"date_created":"2022-10-20T08:11:34.488Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (89, 94, 'directus_fields', '31', '{"interface":"datetime","special":null,"collection":"Timesheet","field":"timecheck"}', '{"interface":"datetime","special":null,"collection":"Timesheet","field":"timecheck"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (90, 95, 'Timesheet', '5', '{"date":"Friday, Oct 21, 2022","dateTime":1666290600000,"department":"Designing","hours":"05:00","notes":"sjdkhw dfi","project":"P1 - Project 1","status":"published"}', '{"date":"Friday, Oct 21, 2022","dateTime":1666290600000,"department":"Designing","hours":"05:00","notes":"sjdkhw dfi","project":"P1 - Project 1","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (91, 96, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:04:29.443Z","date":"Friday, Oct 21, 2022","department":"Designing","hours":"05:00","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666290500000,"timecheck":"05:00:00"}', '{"timecheck":"05:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:04:29.443Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (92, 97, 'directus_fields', '32', '{"interface":"datetime","special":null,"collection":"Timesheet","field":"hours"}', '{"interface":"datetime","special":null,"collection":"Timesheet","field":"hours"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (93, 98, 'Timesheet', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:19:41.770Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":"05:00:00"}', '{"hours":"05:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:19:41.770Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (94, 99, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:20:01.503Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":"04:30:00"}', '{"hours":"04:30:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:20:01.503Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (95, 100, 'directus_fields', '33', '{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (96, 101, 'Timesheet', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:23:33.917Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":5}', '{"hours":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:23:33.917Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (97, 102, 'directus_fields', '34', '{"interface":"input","special":null,"options":{"min":0},"collection":"Timesheet","field":"hours"}', '{"interface":"input","special":null,"options":{"min":0},"collection":"Timesheet","field":"hours"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (99, 104, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:19.075Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":2.5}', '{"hours":2.5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:19.075Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (100, 105, 'Timesheet', '3', '{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:28.110Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":4.5}', '{"hours":4.5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:28.110Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (101, 106, 'Timesheet', '4', '{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:38.424Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"hours":1.2}', '{"hours":1.2,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:38.424Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (102, 107, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:47.349Z","date":"Friday, Oct 21, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666290500000,"hours":8}', '{"hours":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:47.349Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (103, 108, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"type":"time-series","width":54,"height":14,"position_x":1,"position_y":1,"options":{"collection":"Timesheet","function":"count","dateField":"date_created","valueField":"project"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}', '{"type":"time-series","width":54,"height":14,"position_x":1,"position_y":1,"options":{"collection":"Timesheet","function":"count","dateField":"date_created","valueField":"project"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (104, 109, 'directus_fields', '35', '{"interface":"input","special":null,"options":{"placeholder":"00:00"},"collection":"Timesheet","field":"hours"}', '{"interface":"input","special":null,"options":{"placeholder":"00:00"},"collection":"Timesheet","field":"hours"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (105, 110, 'Timesheet', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:54:14.359Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":"05:00"}', '{"hours":"05:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:54:14.359Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (106, 111, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:35.511Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":"02:00"}', '{"hours":"02:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:35.511Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (107, 112, 'Timesheet', '3', '{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:46.402Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":"08:00"}', '{"hours":"08:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:46.402Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (108, 113, 'Timesheet', '4', '{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:56.606Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"hours":"04:00"}', '{"hours":"04:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:56.606Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (109, 114, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:57:06.478Z","date":"Friday, Oct 21, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666290500000,"hours":"08:00"}', '{"hours":"08:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:57:06.478Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (110, 115, 'directus_fields', '36', '{"interface":"datetime","special":null,"options":{"includeSeconds":true},"collection":"Timesheet","field":"dateNew"}', '{"interface":"datetime","special":null,"options":{"includeSeconds":true},"collection":"Timesheet","field":"dateNew"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (111, 116, 'Timesheet', '3', '{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:14:28.372Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":"08:00","dateNew":"2022-10-21T12:00:00"}', '{"dateNew":"2022-10-21T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:14:28.372Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (112, 117, 'directus_fields', '37', '{"interface":"datetime","special":null,"collection":"Timesheet","field":"dateNew"}', '{"interface":"datetime","special":null,"collection":"Timesheet","field":"dateNew"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (113, 118, 'Timesheet', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:50:45.360Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":"05:00","dateNew":"2022-10-18"}', '{"dateNew":"2022-10-18","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:50:45.360Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (114, 119, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:51:43.745Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":"02:00","dateNew":"2022-10-19"}', '{"dateNew":"2022-10-19","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:51:43.745Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (115, 120, 'Timesheet', '3', '{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:51:53.646Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":"08:00","dateNew":"2022-10-20"}', '{"dateNew":"2022-10-20","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:51:53.646Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (116, 121, 'Timesheet', '4', '{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:52:01.101Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"hours":"04:00","dateNew":"2022-10-20"}', '{"dateNew":"2022-10-20","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:52:01.101Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (117, 122, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:52:25.273Z","date":"Friday, Oct 21, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666290500000,"hours":"08:00","dateNew":"2022-10-21"}', '{"dateNew":"2022-10-21","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:52:25.273Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (118, 123, 'Timesheet', '6', '{"date":"Friday, Oct 21, 2022","dateNew":"2022-10-21","dateTime":1666290600000,"department":"Engineering","hours":"05:00","notes":"","project":"P1 - Project 1","status":"published"}', '{"date":"Friday, Oct 21, 2022","dateNew":"2022-10-21","dateTime":1666290600000,"department":"Engineering","hours":"05:00","notes":"","project":"P1 - Project 1","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (119, 124, 'Timesheet', '6', '{"id":6,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:06:53.730Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:14:40.412Z","date":"Thursday, Oct 20, 2022","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"hours":"05:00","dateNew":"2022-10-20"}', '{"status":"published","date":"Thursday, Oct 20, 2022","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"hours":"05:00","dateNew":"2022-10-20","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:14:40.412Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (120, 125, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:18:49.367Z","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"hours":"08:00","dateNew":"2022-10-22"}', '{"status":"published","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"hours":"08:00","dateNew":"2022-10-22","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:18:49.367Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (121, 126, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"count","dateField":"dateNew","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"count","dateField":"dateNew","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (122, 127, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sum","dateField":"dateNew","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sum","dateField":"dateNew","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (123, 128, 'directus_fields', '38', '{"interface":"input","special":null,"collection":"Timesheet","field":"hoursCount"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"hoursCount"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (124, 129, 'Timesheet', '7', '{"date":"Friday, Oct 21, 2022","dateNew":"2022-10-21","dateTime":1666290600000,"department":"Engineering","hours":"04:00","notes":"","project":"P2 - Project 2","hoursCount":4,"status":"published"}', '{"date":"Friday, Oct 21, 2022","dateNew":"2022-10-21","dateTime":1666290600000,"department":"Engineering","hours":"04:00","notes":"","project":"P2 - Project 2","hoursCount":4,"status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (125, 130, 'Timesheet', '7', '{"id":7,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:38:01.940Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:38:32.992Z","date":"Friday, Oct 21, 2022","department":"Engineering","notes":"","project":"P2 - Project 2","dateTime":1666290500000,"hours":"04:10","dateNew":"2022-10-21","hoursCount":4.1666665}', '{"status":"published","date":"Friday, Oct 21, 2022","department":"Engineering","notes":"","project":"P2 - Project 2","dateTime":1666290600000,"hours":"04:10","dateNew":"2022-10-21","hoursCount":4.166666666666667,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:38:32.992Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (126, 131, 'Timesheet', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:37.692Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":"05:00","dateNew":"2022-10-18","hoursCount":5}', '{"hoursCount":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:37.692Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (140, 145, 'Timesheet', '6', '{"id":6,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:06:53.730Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:47.337Z","date":"Thursday, Oct 20, 2022","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"dateNew":"2022-10-20","hoursCount":5,"hours":5}', '{"hours":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:47.337Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (127, 132, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:45.707Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":"02:00","dateNew":"2022-10-19","hoursCount":2}', '{"hoursCount":2,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:45.707Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (128, 133, 'Timesheet', '3', '{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:53.312Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":"08:00","dateNew":"2022-10-20","hoursCount":8}', '{"hoursCount":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:53.312Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (129, 134, 'Timesheet', '4', '{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:01.978Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"hours":"04:00","dateNew":"2022-10-20","hoursCount":4}', '{"hoursCount":4,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:01.978Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (130, 135, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:10.698Z","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"hours":"08:00","dateNew":"2022-10-22","hoursCount":8}', '{"hoursCount":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:10.698Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (131, 136, 'Timesheet', '6', '{"id":6,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:06:53.730Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:17.056Z","date":"Thursday, Oct 20, 2022","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"hours":"05:00","dateNew":"2022-10-20","hoursCount":5}', '{"hoursCount":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:17.056Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (132, 137, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sum","dateField":"dateNew","valueField":"hoursCount"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sum","dateField":"dateNew","valueField":"hoursCount"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (133, 138, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"dateNew","valueField":"hoursCount"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"dateNew","valueField":"hoursCount"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (134, 139, 'directus_fields', '39', '{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}', '{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (135, 140, 'Timesheet', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:09.905Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"dateNew":"2022-10-18","hoursCount":5,"hours":5}', '{"hours":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:09.905Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (136, 141, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:16.634Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"dateNew":"2022-10-19","hoursCount":2,"hours":2}', '{"hours":2,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:16.634Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (137, 142, 'Timesheet', '3', '{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:23.377Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"dateNew":"2022-10-20","hoursCount":8,"hours":8}', '{"hours":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:23.377Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (138, 143, 'Timesheet', '4', '{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:30.290Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"dateNew":"2022-10-20","hoursCount":4,"hours":4}', '{"hours":4,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:30.290Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (139, 144, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:38.927Z","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"dateNew":"2022-10-22","hoursCount":8,"hours":8}', '{"hours":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:38.927Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (171, 179, 'directus_fields', '46', '{"collection":"timesheet","field":"user_updated"}', '{"collection":"timesheet","field":"user_updated"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (141, 146, 'Timesheet', '7', '{"id":7,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:38:01.940Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:57.909Z","date":"Friday, Oct 21, 2022","department":"Engineering","notes":"","project":"P2 - Project 2","dateTime":1666290500000,"dateNew":"2022-10-21","hoursCount":4.1666665,"hours":4.1666665}', '{"hours":4.1666665,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:57.909Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (142, 147, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T10:43:09.078Z","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"dateNew":"2022-10-22","hoursCount":8,"hours":7.5}', '{"status":"published","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"dateNew":"2022-10-22","hours":7.5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T10:43:09.078Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (143, 148, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T10:43:36.597Z","date":"Wednesday, Oct 26, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666722600000,"dateNew":"2022-10-26","hoursCount":8,"hours":4.25}', '{"status":"published","date":"Wednesday, Oct 26, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666722600000,"dateNew":"2022-10-26","hours":4.25,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T10:43:36.597Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (144, 149, 'directus_fields', '40', '{"interface":"datetime","special":null,"collection":"Timesheet","field":"date"}', '{"interface":"datetime","special":null,"collection":"Timesheet","field":"date"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (145, 150, 'Timesheet', '1', '{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:07:59.712Z","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"dateNew":"2022-10-18","hours":5,"date":"2022-10-18T12:00:00"}', '{"date":"2022-10-18T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:07:59.712Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (146, 151, 'Timesheet', '2', '{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:10:42.210Z","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"dateNew":"2022-10-19","hours":2,"date":"2022-10-19T12:00:00"}', '{"date":"2022-10-19T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:10:42.210Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (147, 152, 'Timesheet', '3', '{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:02.374Z","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"dateNew":"2022-10-20","hours":8,"date":"2022-10-20T12:00:00"}', '{"date":"2022-10-20T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:02.374Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (148, 153, 'Timesheet', '4', '{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:21.920Z","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"dateNew":"2022-10-20","hours":4,"date":"2022-10-20T12:00:00"}', '{"date":"2022-10-20T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:21.920Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (149, 154, 'Timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:35.675Z","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666722600000,"dateNew":"2022-10-26","hours":4.25,"date":"2022-10-26T12:00:00"}', '{"date":"2022-10-26T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:35.675Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (150, 155, 'Timesheet', '6', '{"id":6,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:06:53.730Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:49.780Z","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"dateNew":"2022-10-20","hours":5,"date":"2022-10-20T12:00:00"}', '{"date":"2022-10-20T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:49.780Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (151, 156, 'Timesheet', '7', '{"id":7,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:38:01.940Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:12:06.490Z","department":"Engineering","notes":"","project":"P2 - Project 2","dateTime":1666290500000,"dateNew":"2022-10-21","hours":4.1666665,"date":"2022-10-21T12:00:00"}', '{"date":"2022-10-21T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:12:06.490Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (152, 157, 'Timesheet', '8', '{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Designing","hours":"5","notes":"hjvm jhmbm","project":"P1 - Project 1","status":"published"}', '{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Designing","hours":"5","notes":"hjvm jhmbm","project":"P1 - Project 1","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (153, 158, 'Timesheet', '9', '{"date":"2022-10-28T00:00:00","dateTime":1666895400000,"department":"Designing","hours":"5","notes":"bm","project":"P2 - Project 2","status":"published"}', '{"date":"2022-10-28T00:00:00","dateTime":1666895400000,"department":"Designing","hours":"5","notes":"bm","project":"P2 - Project 2","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (154, 159, 'Timesheet', '9', '{"id":9,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-26T11:23:48.074Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:24:22.787Z","department":"Designing","notes":"bm","project":"P2 - Project 2","dateTime":1666809000000,"dateNew":null,"hours":4.5,"date":"2022-10-27T00:00:00"}', '{"status":"published","department":"Designing","notes":"bm","project":"P2 - Project 2","dateTime":1666809000000,"hours":4.5,"date":"2022-10-27T00:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:24:22.787Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (172, 180, 'directus_fields', '47', '{"collection":"timesheet","field":"date_updated"}', '{"collection":"timesheet","field":"date_updated"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (173, 181, 'directus_fields', '48', '{"collection":"timesheet","field":"department"}', '{"collection":"timesheet","field":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (155, 160, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (156, 161, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (157, 162, 'Timesheet', '9', '{"id":9,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-26T11:23:48.074Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:49:31.474Z","department":"Designing","notes":"bm","project":"P2 - Project 2","dateTime":1666722600000,"hours":5.5,"date":"2022-10-26T00:00:00"}', '{"status":"published","department":"Designing","notes":"bm","project":"P2 - Project 2","dateTime":1666722600000,"hours":5.5,"date":"2022-10-26T00:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:49:31.474Z"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (158, 164, 'Timesheet', '10', '{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Engineering","hours":"5","notes":"jgfns","project":"P2 - Project 2","status":"published"}', '{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Engineering","hours":"5","notes":"jgfns","project":"P2 - Project 2","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (159, 165, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (160, 166, 'Timesheet', '11', '{"date":"2022-10-25T00:00:00","dateTime":1666636200000,"department":"Designing","hours":"1","notes":"","project":"P2 - Project 2","status":"published"}', '{"date":"2022-10-25T00:00:00","dateTime":1666636200000,"department":"Designing","hours":"1","notes":"","project":"P2 - Project 2","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (161, 167, 'Timesheet', '12', '{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Designing","hours":"8","notes":"mbm","project":"P1 - Project 1","status":"published"}', '{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Designing","hours":"8","notes":"mbm","project":"P1 - Project 1","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (162, 168, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"width":45}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (163, 169, 'directus_panels', 'cf23e02e-cd58-4af0-a696-592aed8366fd', '{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":"Hour based Report","icon":null,"color":null,"show_header":true,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":"Hour based Report","icon":null,"color":null,"show_header":true,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (164, 170, 'directus_panels', '1b15640c-d7db-4b4b-a05b-581ba555a0fc', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":"Hour based Report","icon":null,"color":null,"show_header":true,"note":null,"type":"relational-variable","position_x":1,"position_y":15,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":null,"range":"auto","displayTemplate":"{{project}}","field":"test"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', '{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":"Hour based Report","icon":null,"color":null,"show_header":true,"note":null,"type":"relational-variable","position_x":1,"position_y":15,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":null,"range":"auto","displayTemplate":"{{project}}","field":"test"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (165, 173, 'directus_collections', 'timesheet', '{"collection":"timesheet"}', '{"collection":"timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (166, 174, 'directus_fields', '41', '{"collection":"timesheet","field":"id"}', '{"collection":"timesheet","field":"id"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (167, 175, 'directus_fields', '42', '{"collection":"timesheet","field":"status"}', '{"collection":"timesheet","field":"status"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (168, 176, 'directus_fields', '43', '{"collection":"timesheet","field":"sort"}', '{"collection":"timesheet","field":"sort"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (169, 177, 'directus_fields', '44', '{"collection":"timesheet","field":"user_created"}', '{"collection":"timesheet","field":"user_created"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (170, 178, 'directus_fields', '45', '{"collection":"timesheet","field":"date_created"}', '{"collection":"timesheet","field":"date_created"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (177, 185, 'directus_fields', '52', '{"collection":"timesheet","field":"hours"}', '{"collection":"timesheet","field":"hours"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (179, 188, 'directus_fields', '54', '{"collection":"timesheet","field":"timestamp"}', '{"collection":"timesheet","field":"timestamp"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (180, 189, 'directus_fields', '55', '{"collection":"timesheet","field":"time"}', '{"collection":"timesheet","field":"time"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (181, 190, 'timesheet', '5', '{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:35.675Z","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","timestamp":1666809000000,"time":4.25,"date":"2022-10-27T00:00:00"}', '{"status":"published","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","timestamp":1666809000000,"time":4.25,"date":"2022-10-27T00:00:00"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (182, 191, 'timesheet', '13', '{"date":"2022-10-27T00:00:00","timestamp":1666809000000,"department":"Designing","time":"5","notes":"jhv jhbj","project":"P1 - Project 1","status":"published"}', '{"date":"2022-10-27T00:00:00","timestamp":1666809000000,"department":"Designing","time":"5","notes":"jhv jhbj","project":"P1 - Project 1","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (183, 192, 'directus_collections', 'nextbits_department', '{"collection":"nextbits_department"}', '{"collection":"nextbits_department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (184, 193, 'directus_fields', '56', '{"collection":"nextbits_department","field":"id"}', '{"collection":"nextbits_department","field":"id"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (185, 194, 'directus_fields', '57', '{"collection":"nextbits_department","field":"status"}', '{"collection":"nextbits_department","field":"status"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (186, 195, 'directus_fields', '58', '{"collection":"nextbits_department","field":"sort"}', '{"collection":"nextbits_department","field":"sort"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (187, 196, 'directus_fields', '59', '{"collection":"nextbits_department","field":"user_created"}', '{"collection":"nextbits_department","field":"user_created"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (188, 197, 'directus_fields', '60', '{"collection":"nextbits_department","field":"date_created"}', '{"collection":"nextbits_department","field":"date_created"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (189, 198, 'directus_fields', '61', '{"collection":"nextbits_department","field":"user_updated"}', '{"collection":"nextbits_department","field":"user_updated"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (190, 199, 'directus_fields', '62', '{"collection":"nextbits_department","field":"date_updated"}', '{"collection":"nextbits_department","field":"date_updated"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (191, 200, 'directus_fields', '63', '{"collection":"nextbits_department","field":"dname"}', '{"collection":"nextbits_department","field":"dname"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (192, 202, 'directus_collections', 'nextbits_project', '{"collection":"nextbits_project"}', '{"collection":"nextbits_project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (193, 203, 'directus_fields', '64', '{"collection":"nextbits_project","field":"id"}', '{"collection":"nextbits_project","field":"id"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (194, 204, 'directus_fields', '65', '{"collection":"nextbits_project","field":"status"}', '{"collection":"nextbits_project","field":"status"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (195, 205, 'directus_fields', '66', '{"collection":"nextbits_project","field":"sort"}', '{"collection":"nextbits_project","field":"sort"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (196, 206, 'directus_fields', '67', '{"collection":"nextbits_project","field":"user_created"}', '{"collection":"nextbits_project","field":"user_created"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (197, 207, 'directus_fields', '68', '{"collection":"nextbits_project","field":"date_created"}', '{"collection":"nextbits_project","field":"date_created"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (198, 208, 'directus_fields', '69', '{"collection":"nextbits_project","field":"user_updated"}', '{"collection":"nextbits_project","field":"user_updated"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (199, 209, 'directus_fields', '70', '{"collection":"nextbits_project","field":"date_updated"}', '{"collection":"nextbits_project","field":"date_updated"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (200, 210, 'directus_fields', '71', '{"collection":"nextbits_project","field":"pcode"}', '{"collection":"nextbits_project","field":"pcode"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (201, 211, 'directus_fields', '72', '{"collection":"nextbits_project","field":"pname"}', '{"collection":"nextbits_project","field":"pname"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (202, 213, 'directus_collections', 'nextbits_timesheet', '{"collection":"nextbits_timesheet"}', '{"collection":"nextbits_timesheet"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (203, 214, 'directus_fields', '73', '{"collection":"nextbits_timesheet","field":"id"}', '{"collection":"nextbits_timesheet","field":"id"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (204, 215, 'directus_fields', '74', '{"collection":"nextbits_timesheet","field":"status"}', '{"collection":"nextbits_timesheet","field":"status"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (205, 216, 'directus_fields', '75', '{"collection":"nextbits_timesheet","field":"sort"}', '{"collection":"nextbits_timesheet","field":"sort"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (206, 217, 'directus_fields', '76', '{"collection":"nextbits_timesheet","field":"user_created"}', '{"collection":"nextbits_timesheet","field":"user_created"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (207, 218, 'directus_fields', '77', '{"collection":"nextbits_timesheet","field":"date_created"}', '{"collection":"nextbits_timesheet","field":"date_created"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (208, 219, 'directus_fields', '78', '{"collection":"nextbits_timesheet","field":"user_updated"}', '{"collection":"nextbits_timesheet","field":"user_updated"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (209, 220, 'directus_fields', '79', '{"collection":"nextbits_timesheet","field":"date_updated"}', '{"collection":"nextbits_timesheet","field":"date_updated"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (210, 221, 'directus_fields', '80', '{"collection":"nextbits_timesheet","field":"department"}', '{"collection":"nextbits_timesheet","field":"department"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (211, 222, 'directus_fields', '81', '{"collection":"nextbits_timesheet","field":"notes"}', '{"collection":"nextbits_timesheet","field":"notes"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (212, 223, 'directus_fields', '82', '{"collection":"nextbits_timesheet","field":"project"}', '{"collection":"nextbits_timesheet","field":"project"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (213, 224, 'directus_fields', '83', '{"collection":"nextbits_timesheet","field":"timestamp"}', '{"collection":"nextbits_timesheet","field":"timestamp"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (214, 225, 'directus_fields', '84', '{"collection":"nextbits_timesheet","field":"time"}', '{"collection":"nextbits_timesheet","field":"time"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (215, 226, 'directus_fields', '85', '{"collection":"nextbits_timesheet","field":"date"}', '{"collection":"nextbits_timesheet","field":"date"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (216, 228, 'directus_fields', '86', '{"collection":"nextbits_department","field":"name"}', '{"collection":"nextbits_department","field":"name"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (217, 229, 'directus_fields', '87', '{"collection":"nextbits_project","field":"code"}', '{"collection":"nextbits_project","field":"code"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (218, 230, 'directus_fields', '88', '{"collection":"nextbits_project","field":"name"}', '{"collection":"nextbits_project","field":"name"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (219, 231, 'nextbits_timesheet', '14', '{"date":"2022-10-31T00:00:00","timestamp":1667154600000,"department":"Engineering","time":"4","notes":"vhjmb jbjkm","project":"P2 - Project 2","status":"published"}', '{"date":"2022-10-31T00:00:00","timestamp":1667154600000,"department":"Engineering","time":"4","notes":"vhjmb jbjkm","project":"P2 - Project 2","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (238, 251, 'nextbits_timesheet', '16', '{"date":"2022-11-01T00:00:00","department":"Designing","time":4.25,"notes":"hj hjj jkjhk","project":"P1 - Project 1","status":"published"}', '{"date":"2022-11-01T00:00:00","department":"Designing","time":4.25,"notes":"hj hjj jkjhk","project":"P1 - Project 1","status":"published"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (220, 232, 'nextbits_timesheet', '12', '{"id":12,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-26T14:32:41.962Z","user_updated":null,"date_updated":null,"department":"Designing","notes":"mbm","project":"P1 - Project 1","timestamp":1667154600000,"time":8,"date":"2022-10-31T00:00:00"}', '{"status":"published","department":"Designing","notes":"mbm","project":"P1 - Project 1","timestamp":1667154600000,"time":8,"date":"2022-10-31T00:00:00"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (221, 234, 'directus_permissions', '32', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_department","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_department","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (222, 235, 'directus_permissions', '33', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_project","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_project","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (223, 236, 'directus_permissions', '34', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"create","fields":["*"],"permissions":{},"validation":{}}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"create","fields":["*"],"permissions":{},"validation":{}}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (224, 237, 'directus_permissions', '35', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"read"}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"read"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (225, 238, 'directus_permissions', '35', '{"id":35,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (226, 239, 'directus_permissions', '36', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"update"}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"update"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (227, 240, 'directus_permissions', '36', '{"id":36,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"update","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"update","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (228, 241, 'directus_permissions', '37', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"delete"}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"delete"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (229, 242, 'directus_permissions', '37', '{"id":37,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"delete","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"delete","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (230, 243, 'directus_permissions', '38', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"share"}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"share"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (231, 244, 'directus_permissions', '38', '{"id":38,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"share","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"share","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (232, 245, 'directus_permissions', '35', '{"id":35,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (233, 246, 'directus_permissions', '35', '{"id":35,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","department","project","timestamp","time","date","notes"]}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","department","project","timestamp","time","date","notes"]}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (234, 247, 'directus_permissions', '36', '{"id":36,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"update","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","department","project","timestamp","time","notes","date"]}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"update","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","department","project","timestamp","time","notes","date"]}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (235, 248, 'directus_permissions', '37', '{"id":37,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"delete","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', '{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"nextbits_timesheet","action":"delete","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (236, 249, 'nextbits_timesheet', '12', '{"id":12,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-26T14:32:41.962Z","user_updated":null,"date_updated":null,"department":"Designing","notes":"mbm","project":"P1 - Project 1","timestamp":1667068200000,"time":8,"date":"2022-10-30T00:00:00"}', '{"status":"published","department":"Designing","notes":"mbm","project":"P1 - Project 1","timestamp":1667068200000,"time":8,"date":"2022-10-30T00:00:00"}', NULL);
INSERT INTO public.directus_revisions (id, activity, collection, item, data, delta, parent) VALUES (237, 250, 'nextbits_timesheet', '15', '{"date":"2022-11-05T00:00:00","timestamp":1667586600000,"department":"Designing","time":"5","notes":"","project":"P1 - Project 1","status":"published"}', '{"date":"2022-11-05T00:00:00","timestamp":1667586600000,"department":"Designing","time":"5","notes":"","project":"P1 - Project 1","status":"published"}', NULL);


--
-- TOC entry 4904 (class 0 OID 19773)
-- Dependencies: 309
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) VALUES ('a8b859ca-166a-414f-8a35-be3486b68ed2', 'Administrator', 'verified', '$t:admin_description', NULL, false, true, true);
INSERT INTO public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) VALUES ('961e3b49-c689-4f5b-b47f-47b978d19c6f', 'Employee', 'supervised_user_circle', NULL, NULL, false, false, true);


--
-- TOC entry 4905 (class 0 OID 19782)
-- Dependencies: 310
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) VALUES ('7W9naOjvEoWMiEORN_E3tWtKlpRVQs6eo9tyKsM8TnuTFppuPUcqg2DFl4Tx0UUi', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-07 07:37:00.771+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', NULL, 'http://localhost:8055');
INSERT INTO public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) VALUES ('KH0BcNMdCzBIwYldwjVuPsTT8RVy_SQUYBsLA1mqxR98cRUto5T5jZ4S-iCmj-I4', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-02 12:51:41.866+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', NULL, 'http://localhost:8055');
INSERT INTO public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) VALUES ('ezGknOMpgsIgKc2LlIucAUaJ7O3sMeTP7BLeuLF-tyrNBYpnwj3WRz66D27t1Gsq', '34893b1f-fa39-40df-9624-987fe749d106', '2022-11-08 14:00:25.876+00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', NULL, 'http://localhost:8055');


--
-- TOC entry 4906 (class 0 OID 19787)
-- Dependencies: 311
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, translation_strings, default_language, custom_aspect_ratios) VALUES (1, 'Directus', NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, 'all', NULL, NULL, NULL, NULL, NULL, '[{"type":"module","id":"timesheet","enabled":true},{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}]', NULL, NULL, 'en-US', NULL);


--
-- TOC entry 4908 (class 0 OID 19798)
-- Dependencies: 313
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4909 (class 0 OID 19805)
-- Dependencies: 314
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) VALUES ('4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', 'Saurabh', 'Gupta', 'saurabhg096567@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$n0xLQSTDm/EK77GYBYuiWQ$FUfuFnvJr2rle3ZTIcbt0ybZCtZ8cPck5yF+QE2+Hj4', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', '961e3b49-c689-4f5b-b47f-47b978d19c6f', NULL, '2022-10-28 13:23:45.34+00', '/users/4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', 'default', NULL, NULL, true);
INSERT INTO public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) VALUES ('34893b1f-fa39-40df-9624-987fe749d106', 'Admin', 'User', 'saurabh.nextbits@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$TfB0G6/cEcXkk1Hy0C8oKg$G2irudfP/4F472F1bTtbGeHDfhxysqFTRi3yQTbBIcY', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', 'a8b859ca-166a-414f-8a35-be3486b68ed2', NULL, '2022-11-01 14:00:25.881+00', '/timesheet', 'default', NULL, NULL, true);


--
-- TOC entry 4910 (class 0 OID 19815)
-- Dependencies: 315
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4880 (class 0 OID 19659)
-- Dependencies: 285
-- Data for Name: nextbits_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nextbits_department (id, status, sort, user_created, date_created, user_updated, date_updated, name) VALUES (2, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:20:42.426+00', NULL, NULL, 'Designing');
INSERT INTO public.nextbits_department (id, status, sort, user_created, date_created, user_updated, date_updated, name) VALUES (1, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:20:21.489+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:21:42.002+00', 'Engineering');


--
-- TOC entry 4912 (class 0 OID 19824)
-- Dependencies: 317
-- Data for Name: nextbits_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nextbits_project (id, status, sort, user_created, date_created, user_updated, date_updated, code, name) VALUES (1, 'published', 1, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:19:05.471+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:19:30.811+00', 'P1', 'Project 1');
INSERT INTO public.nextbits_project (id, status, sort, user_created, date_created, user_updated, date_updated, code, name) VALUES (2, 'published', 2, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:19:23.071+00', NULL, NULL, 'P2', 'Project 2');


--
-- TOC entry 4878 (class 0 OID 19652)
-- Dependencies: 283
-- Data for Name: nextbits_timesheet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (1, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-18 15:25:23.562+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:07:59.712+00', 'Designing', 'dgf dfbdfb', 'P2 - Project 2', 5, '2022-10-18 12:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (2, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-19 07:25:55.094+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:10:42.21+00', 'Engineering', 'jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd', 'P1 - Project 1', 2, '2022-10-19 12:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (3, 'published', NULL, '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-20 07:13:23.257+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:11:02.374+00', 'Designing', 'jbad djshbfj djbs', 'P1 - Project 1', 8, '2022-10-20 12:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (4, 'published', NULL, '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-20 07:13:53.507+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:11:21.92+00', 'Designing', 'df vkkjf fkjk', 'P2 - Project 2', 4, '2022-10-20 12:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (6, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:06:53.73+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:11:49.78+00', 'Engineering', '', 'P1 - Project 1', 5, '2022-10-20 12:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (7, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 11:38:01.94+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:12:06.49+00', 'Engineering', '', 'P2 - Project 2', 4.1666665, '2022-10-21 12:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (8, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:17:12.312+00', NULL, NULL, 'Designing', 'hjvm jhmbm', 'P1 - Project 1', 5, '2022-10-26 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (9, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:23:48.074+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:49:31.474+00', 'Designing', 'bm', 'P2 - Project 2', 5.5, '2022-10-26 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (10, 'published', NULL, '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:20:12.591+00', NULL, NULL, 'Engineering', 'jgfns', 'P2 - Project 2', 5, '2022-10-26 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (11, 'published', NULL, '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:29:08.88+00', NULL, NULL, 'Designing', '', 'P2 - Project 2', 1, '2022-10-25 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (5, 'published', NULL, '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-21 08:03:17.815+00', '34893b1f-fa39-40df-9624-987fe749d106', '2022-10-26 11:11:35.675+00', 'Designing', 'sjdkhw dfi', 'P1 - Project 1', 4.25, '2022-10-27 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (13, 'published', NULL, NULL, NULL, NULL, NULL, 'Designing', 'jhv jhbj', 'P1 - Project 1', 5, '2022-10-27 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (14, 'published', NULL, NULL, NULL, NULL, NULL, 'Engineering', 'vhjmb jbjkm', 'P2 - Project 2', 4, '2022-10-31 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (12, 'published', NULL, '4ccc7fbd-f5c8-4b07-9b1c-bb671960976c', '2022-10-26 14:32:41.962+00', NULL, NULL, 'Designing', 'mbm', 'P1 - Project 1', 8, '2022-10-30 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (15, 'published', NULL, NULL, NULL, NULL, NULL, 'Designing', '', 'P1 - Project 1', 5, '2022-11-05 00:00:00');
INSERT INTO public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "time", date) VALUES (16, 'published', NULL, NULL, NULL, NULL, NULL, 'Designing', 'hj hjj jkjhk', 'P1 - Project 1', 4.25, '2022-11-01 00:00:00');


--
-- TOC entry 4539 (class 0 OID 18319)
-- Dependencies: 222
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4542 (class 0 OID 19233)
-- Dependencies: 233
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--



--
-- TOC entry 4543 (class 0 OID 19565)
-- Dependencies: 278
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--



--
-- TOC entry 4544 (class 0 OID 19575)
-- Dependencies: 280
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--



--
-- TOC entry 4545 (class 0 OID 19585)
-- Dependencies: 282
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--



--
-- TOC entry 4540 (class 0 OID 19055)
-- Dependencies: 227
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--



--
-- TOC entry 4541 (class 0 OID 19067)
-- Dependencies: 228
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--



--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 284
-- Name: Timesheet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Timesheet_id_seq"', 16, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 286
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_id_seq', 2, true);


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 288
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 251, true);


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 292
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 88, true);


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 298
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 302
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 38, true);


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 304
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 5, true);


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 306
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 6, true);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 308
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 238, true);


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 312
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 316
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 318
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 2, true);


--
-- TOC entry 4636 (class 2606 OID 19844)
-- Name: nextbits_timesheet Timesheet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT "Timesheet_pkey" PRIMARY KEY (id);


--
-- TOC entry 4638 (class 2606 OID 19846)
-- Name: nextbits_department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- TOC entry 4640 (class 2606 OID 19848)
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 4642 (class 2606 OID 19850)
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- TOC entry 4644 (class 2606 OID 19852)
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- TOC entry 4646 (class 2606 OID 19854)
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 4648 (class 2606 OID 19856)
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- TOC entry 4650 (class 2606 OID 19858)
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- TOC entry 4652 (class 2606 OID 19860)
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- TOC entry 4654 (class 2606 OID 19862)
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- TOC entry 4656 (class 2606 OID 19864)
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 4658 (class 2606 OID 19866)
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 19868)
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- TOC entry 4662 (class 2606 OID 19870)
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- TOC entry 4664 (class 2606 OID 19872)
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- TOC entry 4666 (class 2606 OID 19874)
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 19876)
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4670 (class 2606 OID 19878)
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- TOC entry 4672 (class 2606 OID 19880)
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- TOC entry 4674 (class 2606 OID 19882)
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- TOC entry 4676 (class 2606 OID 19884)
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 19886)
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- TOC entry 4680 (class 2606 OID 19888)
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4682 (class 2606 OID 19890)
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- TOC entry 4684 (class 2606 OID 19892)
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- TOC entry 4686 (class 2606 OID 19894)
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- TOC entry 4688 (class 2606 OID 19896)
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4690 (class 2606 OID 19898)
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- TOC entry 4692 (class 2606 OID 19900)
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 4694 (class 2606 OID 19902)
-- Name: nextbits_project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- TOC entry 4697 (class 2606 OID 19903)
-- Name: nextbits_department department_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- TOC entry 4698 (class 2606 OID 19908)
-- Name: nextbits_department department_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- TOC entry 4699 (class 2606 OID 19913)
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- TOC entry 4700 (class 2606 OID 19918)
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 4701 (class 2606 OID 19923)
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- TOC entry 4702 (class 2606 OID 19928)
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- TOC entry 4703 (class 2606 OID 19933)
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- TOC entry 4704 (class 2606 OID 19938)
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 4705 (class 2606 OID 19943)
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- TOC entry 4706 (class 2606 OID 19948)
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 4707 (class 2606 OID 19953)
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- TOC entry 4708 (class 2606 OID 19958)
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- TOC entry 4709 (class 2606 OID 19963)
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- TOC entry 4710 (class 2606 OID 19968)
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- TOC entry 4711 (class 2606 OID 19973)
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 4712 (class 2606 OID 19978)
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- TOC entry 4713 (class 2606 OID 19983)
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 4714 (class 2606 OID 19988)
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4715 (class 2606 OID 19993)
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4716 (class 2606 OID 19998)
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 4717 (class 2606 OID 20003)
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- TOC entry 4718 (class 2606 OID 20008)
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- TOC entry 4719 (class 2606 OID 20013)
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- TOC entry 4720 (class 2606 OID 20018)
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 4721 (class 2606 OID 20023)
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- TOC entry 4722 (class 2606 OID 20028)
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- TOC entry 4723 (class 2606 OID 20033)
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- TOC entry 4724 (class 2606 OID 20038)
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- TOC entry 4725 (class 2606 OID 20043)
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- TOC entry 4726 (class 2606 OID 20048)
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 4727 (class 2606 OID 20053)
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 4728 (class 2606 OID 20058)
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- TOC entry 4729 (class 2606 OID 20063)
-- Name: nextbits_project project_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- TOC entry 4730 (class 2606 OID 20068)
-- Name: nextbits_project project_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- TOC entry 4695 (class 2606 OID 20073)
-- Name: nextbits_timesheet timesheet_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT timesheet_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- TOC entry 4696 (class 2606 OID 20078)
-- Name: nextbits_timesheet timesheet_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT timesheet_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


-- Completed on 2022-11-01 19:33:53

--
-- PostgreSQL database dump complete
--

