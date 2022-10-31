--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-10-31 13:12:32

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 245 (class 1259 OID 16942)
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
    "timestamp" real,
    "time" real,
    date timestamp without time zone
);


ALTER TABLE public.nextbits_timesheet OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16941)
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
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 244
-- Name: Timesheet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Timesheet_id_seq" OWNED BY public.nextbits_timesheet.id;


--
-- TOC entry 247 (class 1259 OID 16962)
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
-- TOC entry 246 (class 1259 OID 16961)
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
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 246
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_id_seq OWNED BY public.nextbits_department.id;


--
-- TOC entry 220 (class 1259 OID 16461)
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
-- TOC entry 219 (class 1259 OID 16460)
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
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 219
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- TOC entry 214 (class 1259 OID 16399)
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
-- TOC entry 237 (class 1259 OID 16776)
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
-- TOC entry 218 (class 1259 OID 16438)
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
-- TOC entry 217 (class 1259 OID 16437)
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
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 217
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- TOC entry 222 (class 1259 OID 16485)
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
-- TOC entry 242 (class 1259 OID 16890)
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
-- TOC entry 221 (class 1259 OID 16475)
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16649)
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16836)
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
-- TOC entry 239 (class 1259 OID 16835)
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
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 239
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- TOC entry 243 (class 1259 OID 16907)
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
-- TOC entry 238 (class 1259 OID 16790)
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
-- TOC entry 224 (class 1259 OID 16511)
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
-- TOC entry 223 (class 1259 OID 16510)
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
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 223
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- TOC entry 226 (class 1259 OID 16530)
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
-- TOC entry 225 (class 1259 OID 16529)
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
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 225
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- TOC entry 228 (class 1259 OID 16555)
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
-- TOC entry 227 (class 1259 OID 16554)
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
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 227
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- TOC entry 230 (class 1259 OID 16574)
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
-- TOC entry 229 (class 1259 OID 16573)
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
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 229
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- TOC entry 215 (class 1259 OID 16409)
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
-- TOC entry 231 (class 1259 OID 16597)
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
-- TOC entry 233 (class 1259 OID 16610)
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
-- TOC entry 232 (class 1259 OID 16609)
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
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 232
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- TOC entry 241 (class 1259 OID 16856)
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
-- TOC entry 216 (class 1259 OID 16420)
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
-- TOC entry 235 (class 1259 OID 16638)
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
-- TOC entry 234 (class 1259 OID 16637)
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
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 234
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- TOC entry 249 (class 1259 OID 16982)
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
-- TOC entry 248 (class 1259 OID 16981)
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
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 248
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.nextbits_project.id;


--
-- TOC entry 3295 (class 2604 OID 16464)
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 16441)
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 16839)
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 16514)
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 16533)
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 16558)
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 16577)
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- TOC entry 3306 (class 2604 OID 16613)
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- TOC entry 3312 (class 2604 OID 16641)
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 16965)
-- Name: nextbits_department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);


--
-- TOC entry 3335 (class 2604 OID 16985)
-- Name: nextbits_project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 16945)
-- Name: nextbits_timesheet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_timesheet ALTER COLUMN id SET DEFAULT nextval('public."Timesheet_id_seq"'::regclass);


--
-- TOC entry 3581 (class 0 OID 16461)
-- Dependencies: 220
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
1	login	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:14:27.685+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_users	34893b1f-fa39-40df-9624-987fe749d106	\N	http://localhost:8055
2	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:15:11.391+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_settings	1	\N	http://localhost:8055
3	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:24:51.945+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	1	\N	http://localhost:8055
4	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:24:51.965+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	2	\N	http://localhost:8055
5	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:24:51.988+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	3	\N	http://localhost:8055
6	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:24:52.026+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	4	\N	http://localhost:8055
7	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:24:52.06+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	5	\N	http://localhost:8055
8	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:24:52.096+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	6	\N	http://localhost:8055
9	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:24:52.126+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	7	\N	http://localhost:8055
10	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:24:52.155+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	Timesheet	\N	http://localhost:8055
11	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:27:42.324+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	8	\N	http://localhost:8055
12	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:28:21.623+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	9	\N	http://localhost:8055
13	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:28:50.999+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	10	\N	http://localhost:8055
14	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:30:28.063+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	11	\N	http://localhost:8055
15	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:30:54.358+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	12	\N	http://localhost:8055
16	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:32:54.323+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	13	\N	http://localhost:8055
17	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:36:00.828+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	14	\N	http://localhost:8055
18	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:36:00.843+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	15	\N	http://localhost:8055
19	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:36:00.859+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	16	\N	http://localhost:8055
20	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:36:00.877+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	17	\N	http://localhost:8055
21	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:36:00.895+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	18	\N	http://localhost:8055
22	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:36:00.915+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	19	\N	http://localhost:8055
23	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:36:00.938+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	20	\N	http://localhost:8055
24	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:36:00.956+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	department	\N	http://localhost:8055
25	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:39:39.733+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	21	\N	http://localhost:8055
26	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:41:55.378+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	22	\N	http://localhost:8055
27	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:41:55.394+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	23	\N	http://localhost:8055
28	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:41:55.409+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	24	\N	http://localhost:8055
29	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:41:55.423+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	25	\N	http://localhost:8055
30	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:41:55.439+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	26	\N	http://localhost:8055
31	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:41:55.452+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	27	\N	http://localhost:8055
32	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:41:55.465+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	28	\N	http://localhost:8055
33	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:41:55.482+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	project	\N	http://localhost:8055
34	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:42:27.779+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	29	\N	http://localhost:8055
38	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:49:23.075+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	project	2	\N	http://localhost:8055
35	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:44:49.448+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	30	\N	http://localhost:8055
36	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:45:31.48+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	29	\N	http://localhost:8055
37	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:49:05.477+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	project	1	\N	http://localhost:8055
39	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:49:30.815+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	project	1	\N	http://localhost:8055
40	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:50:21.495+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	department	1	\N	http://localhost:8055
41	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:50:42.43+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	department	2	\N	http://localhost:8055
42	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:51:42.008+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	department	1	\N	http://localhost:8055
43	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:55:23.567+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
44	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:39.9+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_roles	961e3b49-c689-4f5b-b47f-47b978d19c6f	\N	http://localhost:8055
45	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:39.961+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
46	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:39.978+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	2	\N	http://localhost:8055
47	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:39.996+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	3	\N	http://localhost:8055
48	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.018+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	4	\N	http://localhost:8055
49	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.037+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	5	\N	http://localhost:8055
50	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.051+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	6	\N	http://localhost:8055
51	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.064+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	7	\N	http://localhost:8055
52	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.082+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	8	\N	http://localhost:8055
53	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.097+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	9	\N	http://localhost:8055
54	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.112+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	10	\N	http://localhost:8055
55	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.126+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	11	\N	http://localhost:8055
56	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.137+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	12	\N	http://localhost:8055
57	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.152+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	13	\N	http://localhost:8055
58	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.17+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	14	\N	http://localhost:8055
59	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.185+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	15	\N	http://localhost:8055
60	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.202+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	16	\N	http://localhost:8055
61	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.213+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	17	\N	http://localhost:8055
62	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.23+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	18	\N	http://localhost:8055
63	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.243+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	19	\N	http://localhost:8055
64	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.255+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	20	\N	http://localhost:8055
65	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.268+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	21	\N	http://localhost:8055
66	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.286+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	22	\N	http://localhost:8055
67	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.297+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	23	\N	http://localhost:8055
68	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:40.309+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	24	\N	http://localhost:8055
69	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:50.629+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	25	\N	http://localhost:8055
70	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:52.592+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	26	\N	http://localhost:8055
71	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:37:56.779+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	27	\N	http://localhost:8055
72	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:40:13.987+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	27	\N	http://localhost:8055
73	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:40:18.593+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	28	\N	http://localhost:8055
74	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:40:59.666+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	28	\N	http://localhost:8055
75	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:41:07.461+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	29	\N	http://localhost:8055
76	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:41:22.783+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	29	\N	http://localhost:8055
77	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:41:27.378+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	30	\N	http://localhost:8055
78	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:41:37.573+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	30	\N	http://localhost:8055
79	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:41:53.398+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_permissions	31	\N	http://localhost:8055
80	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:43:21.313+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_users	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	\N	http://localhost:8055
81	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 11:43:21.326+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_roles	961e3b49-c689-4f5b-b47f-47b978d19c6f	\N	http://localhost:8055
82	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 12:55:55.104+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
83	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 16:41:25.645+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
84	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 16:41:36.994+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
85	login	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-20 12:30:55.681+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_users	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	\N	http://localhost:8055
86	create	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-20 12:43:23.264+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	3	\N	http://localhost:8055
87	create	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-20 12:43:53.512+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	4	\N	http://localhost:8055
88	create	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-20 12:52:58.34+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_dashboards	b4d8c8a5-24fe-4969-94fc-22eba13fe077	\N	http://localhost:8055
89	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-20 13:41:34.469+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	001d0b06-e662-4ed4-ad94-25aed7c7eff4	\N	http://localhost:8055
90	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-20 13:41:34.495+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633	\N	http://localhost:8055
91	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-20 13:48:33.932+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633	\N	http://localhost:8055
92	delete	34893b1f-fa39-40df-9624-987fe749d106	2022-10-20 13:49:36.086+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633	\N	http://localhost:8055
93	delete	34893b1f-fa39-40df-9624-987fe749d106	2022-10-20 13:49:36.092+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	001d0b06-e662-4ed4-ad94-25aed7c7eff4	\N	http://localhost:8055
94	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:32:54.321+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	31	\N	http://localhost:8055
95	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:33:17.82+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
96	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:34:29.451+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
97	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:47:45.707+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	32	\N	http://localhost:8055
98	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:49:41.775+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
99	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:50:01.507+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
100	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:53:03.348+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	33	\N	http://localhost:8055
101	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:53:33.922+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
102	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:09:55.296+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	34	\N	http://localhost:8055
103	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:10:10.303+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
104	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:10:19.079+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
105	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:10:28.114+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	3	\N	http://localhost:8055
106	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:10:38.429+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	4	\N	http://localhost:8055
107	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:10:47.352+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
108	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:12:48.88+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
109	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:23:57.819+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	35	\N	http://localhost:8055
110	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:24:14.367+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
111	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:26:35.515+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
112	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:26:46.409+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	3	\N	http://localhost:8055
113	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:26:56.611+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	4	\N	http://localhost:8055
114	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:27:06.482+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
115	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:41:38.771+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	36	\N	http://localhost:8055
116	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 14:44:28.38+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	3	\N	http://localhost:8055
117	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 15:20:04.548+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	37	\N	http://localhost:8055
118	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 15:20:45.363+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
119	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 15:21:43.763+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
120	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 15:21:53.65+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	3	\N	http://localhost:8055
121	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 15:22:01.106+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	4	\N	http://localhost:8055
122	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 15:22:25.278+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
123	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 16:36:53.738+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	6	\N	http://localhost:8055
124	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 16:44:40.422+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	6	\N	http://localhost:8055
125	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 16:48:49.372+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
126	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 16:50:26.906+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
127	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 16:52:28.439+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
128	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 16:53:24.574+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	38	\N	http://localhost:8055
129	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:08:01.952+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	7	\N	http://localhost:8055
130	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:08:32.996+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	7	\N	http://localhost:8055
131	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:10:37.697+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
132	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:10:45.712+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
133	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:10:53.315+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	3	\N	http://localhost:8055
134	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:11:01.98+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	4	\N	http://localhost:8055
135	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:11:10.701+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
136	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:11:17.058+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	6	\N	http://localhost:8055
137	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:12:35.675+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
138	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:14:17.361+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
139	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 15:05:26.882+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	39	\N	http://localhost:8055
140	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 15:06:09.912+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
141	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 15:06:16.639+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
142	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 15:06:23.382+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	3	\N	http://localhost:8055
143	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 15:06:30.294+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	4	\N	http://localhost:8055
144	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 15:06:38.93+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
145	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 15:06:47.341+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	6	\N	http://localhost:8055
146	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 15:06:57.912+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	7	\N	http://localhost:8055
147	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:13:09.087+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
148	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:13:36.605+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
149	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:36:46.987+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	40	\N	http://localhost:8055
150	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:37:59.719+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	1	\N	http://localhost:8055
151	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:40:42.214+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	2	\N	http://localhost:8055
152	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:41:02.377+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	3	\N	http://localhost:8055
153	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:41:21.923+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	4	\N	http://localhost:8055
154	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:41:35.681+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	5	\N	http://localhost:8055
155	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:41:49.785+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	6	\N	http://localhost:8055
156	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:42:06.495+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	7	\N	http://localhost:8055
157	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:47:12.323+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	8	\N	http://localhost:8055
158	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:53:48.081+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	9	\N	http://localhost:8055
159	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:54:22.795+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	9	\N	http://localhost:8055
160	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:56:27.501+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
161	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:57:16.498+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
162	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 17:19:31.484+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	9	\N	http://localhost:8055
163	login	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 19:44:26.584+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_users	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	\N	http://localhost:8055
164	create	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 19:50:12.601+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	10	\N	http://localhost:8055
165	update	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 19:52:56.926+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
166	create	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 19:59:08.885+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	11	\N	http://localhost:8055
167	create	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 20:02:41.969+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	Timesheet	12	\N	http://localhost:8055
168	update	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 20:03:26.905+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
169	update	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-27 20:30:07.199+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	\N	http://localhost:8055
170	create	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-28 13:51:33.024+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	1b15640c-d7db-4b4b-a05b-581ba555a0fc	\N	http://localhost:8055
171	delete	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-28 18:54:19.199+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_panels	1b15640c-d7db-4b4b-a05b-581ba555a0fc	\N	http://localhost:8055
172	login	34893b1f-fa39-40df-9624-987fe749d106	2022-10-28 18:54:46.126+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_users	34893b1f-fa39-40df-9624-987fe749d106	\N	http://localhost:8055
173	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:05.01+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	timesheet	\N	http://localhost:8055
174	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:31.378+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	41	\N	http://localhost:8055
175	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:34.748+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	42	\N	http://localhost:8055
176	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:37.737+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	43	\N	http://localhost:8055
177	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:40.352+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	44	\N	http://localhost:8055
178	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:44.659+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	45	\N	http://localhost:8055
179	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:47.892+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	46	\N	http://localhost:8055
180	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:51.012+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	47	\N	http://localhost:8055
181	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:53.903+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	48	\N	http://localhost:8055
182	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:48:57.323+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	49	\N	http://localhost:8055
183	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:49:01.314+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	50	\N	http://localhost:8055
184	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:49:06.293+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	51	\N	http://localhost:8055
185	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:49:10.396+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	52	\N	http://localhost:8055
186	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:49:14.652+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	53	\N	http://localhost:8055
187	delete	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:50:45.937+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	Timesheet	\N	http://localhost:8055
188	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:58:33.132+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	54	\N	http://localhost:8055
189	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 11:58:39.164+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	55	\N	http://localhost:8055
190	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:06:35.842+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	timesheet	5	\N	http://localhost:8055
191	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:07:08.581+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	timesheet	13	\N	http://localhost:8055
192	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:11:42.496+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	nextbits_department	\N	http://localhost:8055
193	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:11:47.079+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	56	\N	http://localhost:8055
194	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:11:50.012+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	57	\N	http://localhost:8055
195	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:11:52.715+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	58	\N	http://localhost:8055
196	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:11:55.149+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	59	\N	http://localhost:8055
197	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:11:57.724+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	60	\N	http://localhost:8055
198	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:00.216+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	61	\N	http://localhost:8055
199	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:02.916+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	62	\N	http://localhost:8055
200	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:06.136+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	63	\N	http://localhost:8055
201	delete	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:20.995+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	department	\N	http://localhost:8055
202	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:29.046+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	nextbits_project	\N	http://localhost:8055
204	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:33.754+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	65	\N	http://localhost:8055
206	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:38.998+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	67	\N	http://localhost:8055
208	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:44.786+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	69	\N	http://localhost:8055
210	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:50.688+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	71	\N	http://localhost:8055
211	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:53.584+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	72	\N	http://localhost:8055
212	delete	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:04.451+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	project	\N	http://localhost:8055
213	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:11.71+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	nextbits_timesheet	\N	http://localhost:8055
214	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:13.709+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	73	\N	http://localhost:8055
216	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:18.299+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	75	\N	http://localhost:8055
218	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:24.192+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	77	\N	http://localhost:8055
220	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:31.307+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	79	\N	http://localhost:8055
223	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:40.541+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	82	\N	http://localhost:8055
225	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:48.577+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	84	\N	http://localhost:8055
227	delete	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:14:06.682+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_collections	timesheet	\N	http://localhost:8055
203	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:30.755+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	64	\N	http://localhost:8055
205	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:36.419+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	66	\N	http://localhost:8055
207	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:41.994+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	68	\N	http://localhost:8055
209	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:12:47.83+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	70	\N	http://localhost:8055
215	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:16.156+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	74	\N	http://localhost:8055
217	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:21.221+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	76	\N	http://localhost:8055
219	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:28.041+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	78	\N	http://localhost:8055
221	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:34.288+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	80	\N	http://localhost:8055
222	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:37.497+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	81	\N	http://localhost:8055
224	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:44.455+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	83	\N	http://localhost:8055
226	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 12:13:52.089+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	85	\N	http://localhost:8055
228	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 13:03:13.693+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	86	\N	http://localhost:8055
229	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 13:03:33.544+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	87	\N	http://localhost:8055
230	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 13:03:41.122+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	directus_fields	88	\N	http://localhost:8055
231	create	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 13:07:20.987+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	nextbits_timesheet	14	\N	http://localhost:8055
232	update	34893b1f-fa39-40df-9624-987fe749d106	2022-10-31 13:07:44.966+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	nextbits_timesheet	12	\N	http://localhost:8055
\.


--
-- TOC entry 3575 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) FROM stdin;
nextbits_department	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
nextbits_project	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
nextbits_timesheet	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
\.


--
-- TOC entry 3598 (class 0 OID 16776)
-- Dependencies: 237
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
b4d8c8a5-24fe-4969-94fc-22eba13fe077	Report	dashboard	\N	2022-10-20 12:52:58.333+05:30	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	\N
\.


--
-- TOC entry 3579 (class 0 OID 16438)
-- Dependencies: 218
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
1	Timesheet	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
2	Timesheet	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
3	Timesheet	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
4	Timesheet	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
5	Timesheet	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
6	Timesheet	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
7	Timesheet	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
9	Timesheet	department	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
11	Timesheet	notes	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
12	Timesheet	project	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
13	Timesheet	dateTime	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
14	department	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
15	department	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
16	department	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
17	department	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
18	department	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
19	department	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
20	department	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
21	department	dname	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
22	project	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
23	project	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
24	project	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
25	project	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
26	project	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
27	project	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
28	project	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
30	project	pname	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
29	project	pcode	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
39	Timesheet	hours	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
40	Timesheet	date	\N	datetime	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
41	timesheet	id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
42	timesheet	status	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
43	timesheet	sort	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
44	timesheet	user_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
45	timesheet	date_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
46	timesheet	user_updated	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
47	timesheet	date_updated	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
48	timesheet	department	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
49	timesheet	notes	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
50	timesheet	project	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
51	timesheet	dateTime	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
52	timesheet	hours	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
53	timesheet	date	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
54	timesheet	timestamp	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
55	timesheet	time	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
56	nextbits_department	id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
57	nextbits_department	status	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
58	nextbits_department	sort	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
59	nextbits_department	user_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
60	nextbits_department	date_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
61	nextbits_department	user_updated	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
62	nextbits_department	date_updated	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
63	nextbits_department	dname	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
64	nextbits_project	id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
65	nextbits_project	status	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
66	nextbits_project	sort	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
67	nextbits_project	user_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
68	nextbits_project	date_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
69	nextbits_project	user_updated	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
70	nextbits_project	date_updated	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
71	nextbits_project	pcode	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
72	nextbits_project	pname	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
73	nextbits_timesheet	id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
74	nextbits_timesheet	status	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
75	nextbits_timesheet	sort	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
76	nextbits_timesheet	user_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
77	nextbits_timesheet	date_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
78	nextbits_timesheet	user_updated	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
79	nextbits_timesheet	date_updated	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
80	nextbits_timesheet	department	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
81	nextbits_timesheet	notes	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
82	nextbits_timesheet	project	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
83	nextbits_timesheet	timestamp	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
84	nextbits_timesheet	time	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
85	nextbits_timesheet	date	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
86	nextbits_department	name	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
87	nextbits_project	code	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
88	nextbits_project	name	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- TOC entry 3583 (class 0 OID 16485)
-- Dependencies: 222
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
\.


--
-- TOC entry 3603 (class 0 OID 16890)
-- Dependencies: 242
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- TOC entry 3582 (class 0 OID 16475)
-- Dependencies: 221
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- TOC entry 3597 (class 0 OID 16649)
-- Dependencies: 236
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2022-10-18 20:07:51.625186+05:30
20201029A	Remove System Relations	2022-10-18 20:07:51.639104+05:30
20201029B	Remove System Collections	2022-10-18 20:07:51.647849+05:30
20201029C	Remove System Fields	2022-10-18 20:07:51.665626+05:30
20201105A	Add Cascade System Relations	2022-10-18 20:07:51.708447+05:30
20201105B	Change Webhook URL Type	2022-10-18 20:07:51.718605+05:30
20210225A	Add Relations Sort Field	2022-10-18 20:07:51.729068+05:30
20210304A	Remove Locked Fields	2022-10-18 20:07:51.736992+05:30
20210312A	Webhooks Collections Text	2022-10-18 20:07:51.747667+05:30
20210331A	Add Refresh Interval	2022-10-18 20:07:51.755625+05:30
20210415A	Make Filesize Nullable	2022-10-18 20:07:51.766417+05:30
20210416A	Add Collections Accountability	2022-10-18 20:07:51.775616+05:30
20210422A	Remove Files Interface	2022-10-18 20:07:51.783713+05:30
20210506A	Rename Interfaces	2022-10-18 20:07:51.814699+05:30
20210510A	Restructure Relations	2022-10-18 20:07:51.842782+05:30
20210518A	Add Foreign Key Constraints	2022-10-18 20:07:51.894598+05:30
20210519A	Add System Fk Triggers	2022-10-18 20:07:51.925402+05:30
20210521A	Add Collections Icon Color	2022-10-18 20:07:51.931244+05:30
20210525A	Add Insights	2022-10-18 20:07:51.962832+05:30
20210608A	Add Deep Clone Config	2022-10-18 20:07:51.971771+05:30
20210626A	Change Filesize Bigint	2022-10-18 20:07:51.990548+05:30
20210716A	Add Conditions to Fields	2022-10-18 20:07:51.997761+05:30
20210721A	Add Default Folder	2022-10-18 20:07:52.007463+05:30
20210802A	Replace Groups	2022-10-18 20:07:52.018263+05:30
20210803A	Add Required to Fields	2022-10-18 20:07:52.025489+05:30
20210805A	Update Groups	2022-10-18 20:07:52.034448+05:30
20210805B	Change Image Metadata Structure	2022-10-18 20:07:52.044985+05:30
20210811A	Add Geometry Config	2022-10-18 20:07:52.050175+05:30
20210831A	Remove Limit Column	2022-10-18 20:07:52.059936+05:30
20210903A	Add Auth Provider	2022-10-18 20:07:52.081937+05:30
20210907A	Webhooks Collections Not Null	2022-10-18 20:07:52.09263+05:30
20210910A	Move Module Setup	2022-10-18 20:07:52.099978+05:30
20210920A	Webhooks URL Not Null	2022-10-18 20:07:52.109496+05:30
20210924A	Add Collection Organization	2022-10-18 20:07:52.117435+05:30
20210927A	Replace Fields Group	2022-10-18 20:07:52.129866+05:30
20210927B	Replace M2M Interface	2022-10-18 20:07:52.137327+05:30
20210929A	Rename Login Action	2022-10-18 20:07:52.145505+05:30
20211007A	Update Presets	2022-10-18 20:07:52.15477+05:30
20211009A	Add Auth Data	2022-10-18 20:07:52.160248+05:30
20211016A	Add Webhook Headers	2022-10-18 20:07:52.167176+05:30
20211103A	Set Unique to User Token	2022-10-18 20:07:52.174528+05:30
20211103B	Update Special Geometry	2022-10-18 20:07:52.183556+05:30
20211104A	Remove Collections Listing	2022-10-18 20:07:52.188727+05:30
20211118A	Add Notifications	2022-10-18 20:07:52.20996+05:30
20211211A	Add Shares	2022-10-18 20:07:52.235205+05:30
20211230A	Add Project Descriptor	2022-10-18 20:07:52.242607+05:30
20220303A	Remove Default Project Color	2022-10-18 20:07:52.253125+05:30
20220308A	Add Bookmark Icon and Color	2022-10-18 20:07:52.260086+05:30
20220314A	Add Translation Strings	2022-10-18 20:07:52.266716+05:30
20220322A	Rename Field Typecast Flags	2022-10-18 20:07:52.275759+05:30
20220323A	Add Field Validation	2022-10-18 20:07:52.282456+05:30
20220325A	Fix Typecast Flags	2022-10-18 20:07:52.290867+05:30
20220325B	Add Default Language	2022-10-18 20:07:52.302666+05:30
20220402A	Remove Default Value Panel Icon	2022-10-18 20:07:52.312635+05:30
20220429A	Add Flows	2022-10-18 20:07:52.349996+05:30
20220429B	Add Color to Insights Icon	2022-10-18 20:07:52.355482+05:30
20220429C	Drop Non Null From IP of Activity	2022-10-18 20:07:52.367369+05:30
20220429D	Drop Non Null From Sender of Notifications	2022-10-18 20:07:52.37676+05:30
20220614A	Rename Hook Trigger to Event	2022-10-18 20:07:52.392948+05:30
20220801A	Update Notifications Timestamp Column	2022-10-18 20:07:52.404594+05:30
20220802A	Add Custom Aspect Ratios	2022-10-18 20:07:52.413033+05:30
20220826A	Add Origin to Accountability	2022-10-18 20:07:52.421987+05:30
\.


--
-- TOC entry 3601 (class 0 OID 16836)
-- Dependencies: 240
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- TOC entry 3604 (class 0 OID 16907)
-- Dependencies: 243
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- TOC entry 3599 (class 0 OID 16790)
-- Dependencies: 238
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
cf23e02e-cd58-4af0-a696-592aed8366fd	b4d8c8a5-24fe-4969-94fc-22eba13fe077	Hour based Report	\N	\N	t	\N	time-series	1	1	45	14	{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"}	2022-10-21 14:12:48.871+05:30	34893b1f-fa39-40df-9624-987fe749d106
\.


--
-- TOC entry 3585 (class 0 OID 16511)
-- Dependencies: 224
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
1	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_files	create	{}	\N	\N	*
2	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_files	read	{}	\N	\N	*
3	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_files	update	{}	\N	\N	*
4	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_files	delete	{}	\N	\N	*
5	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_dashboards	create	{}	\N	\N	*
6	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_dashboards	read	{}	\N	\N	*
7	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_dashboards	update	{}	\N	\N	*
8	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_dashboards	delete	{}	\N	\N	*
9	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_panels	create	{}	\N	\N	*
10	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_panels	read	{}	\N	\N	*
11	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_panels	update	{}	\N	\N	*
12	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_panels	delete	{}	\N	\N	*
13	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_folders	create	{}	\N	\N	*
14	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_folders	read	{}	\N	\N	*
15	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_folders	update	{}	\N	\N	*
16	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_folders	delete	{}	\N	\N	\N
17	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_users	read	{}	\N	\N	*
18	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_users	update	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	first_name,last_name,email,password,location,title,description,avatar,language,theme,tfa_secret
19	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_roles	read	{}	\N	\N	*
20	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_shares	read	{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}	\N	\N	*
21	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_shares	create	{}	\N	\N	*
22	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_shares	update	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
23	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_shares	delete	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
24	961e3b49-c689-4f5b-b47f-47b978d19c6f	directus_flows	read	{"trigger":{"_eq":"manual"}}	\N	\N	id,name,icon,color,options,trigger
25	961e3b49-c689-4f5b-b47f-47b978d19c6f	department	read	{}	{}	\N	*
26	961e3b49-c689-4f5b-b47f-47b978d19c6f	project	read	{}	{}	\N	*
27	961e3b49-c689-4f5b-b47f-47b978d19c6f	Timesheet	read	{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}	\N	\N	id,status,sort,user_updated,date_created,user_created,date_updated,date,hours,notes,project,department,dateTime
28	961e3b49-c689-4f5b-b47f-47b978d19c6f	Timesheet	update	{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}	\N	\N	id,status,sort,user_updated,date_created,user_created,date_updated,date,hours,notes,project,department,dateTime
29	961e3b49-c689-4f5b-b47f-47b978d19c6f	Timesheet	delete	{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}	\N	\N	\N
30	961e3b49-c689-4f5b-b47f-47b978d19c6f	Timesheet	share	{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]}	\N	\N	\N
31	961e3b49-c689-4f5b-b47f-47b978d19c6f	Timesheet	create	{}	{}	\N	*
\.


--
-- TOC entry 3587 (class 0 OID 16530)
-- Dependencies: 226
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
2	\N	34893b1f-fa39-40df-9624-987fe749d106	\N	Timesheet	\N	tabular	\N	\N	\N	\N	bookmark_outline	\N
4	\N	34893b1f-fa39-40df-9624-987fe749d106	\N	department	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark_outline	\N
3	\N	34893b1f-fa39-40df-9624-987fe749d106	\N	timesheet	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark_outline	\N
1	\N	34893b1f-fa39-40df-9624-987fe749d106	\N	project	\N	tabular	{"tabular":{"page":1}}	\N	\N	\N	bookmark_outline	\N
\.


--
-- TOC entry 3589 (class 0 OID 16555)
-- Dependencies: 228
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	Timesheet	user_created	directus_users	\N	\N	\N	\N	\N	nullify
2	Timesheet	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
3	department	user_created	directus_users	\N	\N	\N	\N	\N	nullify
4	department	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
5	project	user_created	directus_users	\N	\N	\N	\N	\N	nullify
6	project	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
\.


--
-- TOC entry 3591 (class 0 OID 16574)
-- Dependencies: 230
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	2	directus_settings	1	{"module_bar":[{"type":"module","id":"timesheet","enabled":true},{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}]}	{"module_bar":[{"type":"module","id":"timesheet","enabled":true},{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}]}	\N
2	3	directus_fields	1	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Timesheet"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Timesheet"}	\N
3	4	directus_fields	2	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"Timesheet"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"Timesheet"}	\N
4	5	directus_fields	3	{"interface":"input","hidden":true,"field":"sort","collection":"Timesheet"}	{"interface":"input","hidden":true,"field":"sort","collection":"Timesheet"}	\N
5	6	directus_fields	4	{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Timesheet"}	{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"Timesheet"}	\N
6	7	directus_fields	5	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Timesheet"}	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"Timesheet"}	\N
7	8	directus_fields	6	{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Timesheet"}	{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"Timesheet"}	\N
8	9	directus_fields	7	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Timesheet"}	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"Timesheet"}	\N
9	10	directus_collections	Timesheet	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Timesheet"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"Timesheet"}	\N
10	11	directus_fields	8	{"interface":"input","special":null,"collection":"Timesheet","field":"date"}	{"interface":"input","special":null,"collection":"Timesheet","field":"date"}	\N
11	12	directus_fields	9	{"interface":"input","special":null,"collection":"Timesheet","field":"department"}	{"interface":"input","special":null,"collection":"Timesheet","field":"department"}	\N
12	13	directus_fields	10	{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}	{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}	\N
13	14	directus_fields	11	{"interface":"input","special":null,"collection":"Timesheet","field":"notes"}	{"interface":"input","special":null,"collection":"Timesheet","field":"notes"}	\N
14	15	directus_fields	12	{"interface":"input","special":null,"collection":"Timesheet","field":"project"}	{"interface":"input","special":null,"collection":"Timesheet","field":"project"}	\N
15	16	directus_fields	13	{"interface":"input","special":null,"collection":"Timesheet","field":"dateTime"}	{"interface":"input","special":null,"collection":"Timesheet","field":"dateTime"}	\N
16	17	directus_fields	14	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"department"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"department"}	\N
17	18	directus_fields	15	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"department"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"department"}	\N
18	19	directus_fields	16	{"interface":"input","hidden":true,"field":"sort","collection":"department"}	{"interface":"input","hidden":true,"field":"sort","collection":"department"}	\N
24	25	directus_fields	21	{"interface":"input","special":null,"required":true,"collection":"department","field":"dname"}	{"interface":"input","special":null,"required":true,"collection":"department","field":"dname"}	\N
19	20	directus_fields	17	{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"department"}	{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"department"}	\N
20	21	directus_fields	18	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"department"}	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"department"}	\N
21	22	directus_fields	19	{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"department"}	{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"department"}	\N
22	23	directus_fields	20	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"department"}	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"department"}	\N
23	24	directus_collections	department	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"department"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"department"}	\N
25	26	directus_fields	22	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"project"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"project"}	\N
26	27	directus_fields	23	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"project"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"project"}	\N
27	28	directus_fields	24	{"interface":"input","hidden":true,"field":"sort","collection":"project"}	{"interface":"input","hidden":true,"field":"sort","collection":"project"}	\N
28	29	directus_fields	25	{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"project"}	{"special":"user-created","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"project"}	\N
29	30	directus_fields	26	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"project"}	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"project"}	\N
30	31	directus_fields	27	{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"project"}	{"special":"user-updated","interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"project"}	\N
31	32	directus_fields	28	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"project"}	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"project"}	\N
32	33	directus_collections	project	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"project"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"project"}	\N
34	35	directus_fields	30	{"interface":"input","special":null,"required":true,"collection":"project","field":"pname"}	{"interface":"input","special":null,"required":true,"collection":"project","field":"pname"}	\N
35	36	directus_fields	29	{"id":29,"collection":"project","field":"pcode","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"project","field":"pcode","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
36	37	project	1	{"status":"published","pcode":"P1","pname":"Project1"}	{"status":"published","pcode":"P1","pname":"Project1"}	\N
33	34	directus_fields	29	{"interface":"input","special":null,"collection":"project","field":"pcode"}	{"interface":"input","special":null,"collection":"project","field":"pcode"}	\N
37	38	project	2	{"status":"published","pcode":"P2","pname":"Project 2"}	{"status":"published","pcode":"P2","pname":"Project 2"}	\N
38	39	project	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:19:05.471Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-18T15:19:30.811Z","pcode":"P1","pname":"Project 1"}	{"pname":"Project 1","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-18T15:19:30.811Z"}	\N
39	40	department	1	{"dname":"Engineering"}	{"dname":"Engineering"}	\N
40	41	department	2	{"dname":"Designing","status":"published"}	{"dname":"Designing","status":"published"}	\N
41	42	department	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:20:21.489Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-18T15:21:42.002Z","dname":"Engineering"}	{"status":"published","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-18T15:21:42.002Z"}	\N
42	43	Timesheet	1	{"date":"Tuesday, Oct 18, 2022","dateTime":1666031400000,"department":"Designing","hours":"05:00","notes":"dgf dfbdfb","project":"P2 - Project 2","status":"published"}	{"date":"Tuesday, Oct 18, 2022","dateTime":1666031400000,"department":"Designing","hours":"05:00","notes":"dgf dfbdfb","project":"P2 - Project 2","status":"published"}	\N
43	44	directus_roles	961e3b49-c689-4f5b-b47f-47b978d19c6f	{"name":"Employee","admin_access":false,"app_access":true}	{"name":"Employee","admin_access":false,"app_access":true}	\N
44	45	directus_permissions	1	{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
45	46	directus_permissions	2	{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
46	47	directus_permissions	3	{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
47	48	directus_permissions	4	{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
48	49	directus_permissions	5	{"collection":"directus_dashboards","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_dashboards","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
49	50	directus_permissions	6	{"collection":"directus_dashboards","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_dashboards","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
50	51	directus_permissions	7	{"collection":"directus_dashboards","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_dashboards","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
51	52	directus_permissions	8	{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
52	53	directus_permissions	9	{"collection":"directus_panels","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_panels","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
53	54	directus_permissions	10	{"collection":"directus_panels","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_panels","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
54	55	directus_permissions	11	{"collection":"directus_panels","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_panels","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
55	56	directus_permissions	12	{"collection":"directus_panels","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_panels","action":"delete","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
56	57	directus_permissions	13	{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
57	58	directus_permissions	14	{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
58	59	directus_permissions	15	{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
59	60	directus_permissions	16	{"collection":"directus_folders","action":"delete","permissions":{},"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_folders","action":"delete","permissions":{},"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
60	61	directus_permissions	17	{"collection":"directus_users","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_users","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
61	62	directus_permissions	18	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme,tfa_secret","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme,tfa_secret","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
62	63	directus_permissions	19	{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
63	64	directus_permissions	20	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
64	65	directus_permissions	21	{"collection":"directus_shares","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_shares","action":"create","permissions":{},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
65	66	directus_permissions	22	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
66	67	directus_permissions	23	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":"*","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
67	68	directus_permissions	24	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":"id,name,icon,color,options,trigger","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":"id,name,icon,color,options,trigger","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
68	69	directus_permissions	25	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"department","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"department","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
69	70	directus_permissions	26	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"project","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"project","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
70	71	directus_permissions	27	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"read"}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"read"}	\N
71	72	directus_permissions	27	{"id":27,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","date","hours","notes","project","department","dateTime"]}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"read","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","date","hours","notes","project","department","dateTime"]}	\N
72	73	directus_permissions	28	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"update"}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"update"}	\N
73	74	directus_permissions	28	{"id":28,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"update","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","date","hours","notes","project","department","dateTime"]}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"update","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":["id","status","sort","user_updated","date_created","user_created","date_updated","date","hours","notes","project","department","dateTime"]}	\N
74	75	directus_permissions	29	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"delete"}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"delete"}	\N
75	76	directus_permissions	29	{"id":29,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"delete","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"delete","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}	\N
76	77	directus_permissions	30	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"share"}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"share"}	\N
77	78	directus_permissions	30	{"id":30,"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"share","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"share","permissions":{"_and":[{"user_created":{"_eq":"$CURRENT_USER"}}]},"validation":null,"presets":null,"fields":null}	\N
78	79	directus_permissions	31	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":"961e3b49-c689-4f5b-b47f-47b978d19c6f","collection":"Timesheet","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
79	80	directus_users	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	{"first_name":"Saurabh","last_name":"Gupta","email":"saurabhg096567@gmail.com","password":"**********","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	{"first_name":"Saurabh","last_name":"Gupta","email":"saurabhg096567@gmail.com","password":"**********","role":"961e3b49-c689-4f5b-b47f-47b978d19c6f"}	\N
80	82	Timesheet	2	{"date":"Tuesday, Oct 18, 2022","dateTime":1666031400000,"department":"Engineering","hours":"05:00","notes":"","project":"P1 - Project 1","status":"published"}	{"date":"Tuesday, Oct 18, 2022","dateTime":1666031400000,"department":"Engineering","hours":"05:00","notes":"","project":"P1 - Project 1","status":"published"}	\N
98	103	Timesheet	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:10.297Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":5}	{"hours":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:10.297Z"}	\N
81	83	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-19T11:11:25.636Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","hours":"02:00","notes":"","project":"P1 - Project 1","dateTime":1666117800000}	{"status":"published","date":"Wednesday, Oct 19, 2022","department":"Engineering","hours":"02:00","notes":"","project":"P1 - Project 1","dateTime":1666117800000,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-19T11:11:25.636Z"}	\N
82	84	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-19T11:11:36.988Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","hours":"02:00","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000}	{"status":"published","date":"Wednesday, Oct 19, 2022","department":"Engineering","hours":"02:00","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-19T11:11:36.988Z"}	\N
83	86	Timesheet	3	{"date":"Thursday, Oct 20, 2022","dateTime":1666204200000,"department":"Designing","hours":"05:00","notes":"jbad djshbfj djbs","project":"P1 - Project 1","status":"published"}	{"date":"Thursday, Oct 20, 2022","dateTime":1666204200000,"department":"Designing","hours":"05:00","notes":"jbad djshbfj djbs","project":"P1 - Project 1","status":"published"}	\N
84	87	Timesheet	4	{"date":"Thursday, Oct 20, 2022","dateTime":1666204200000,"department":"Designing","hours":"05:00","notes":"df vkkjf fkjk","project":"P2 - Project 2","status":"published"}	{"date":"Thursday, Oct 20, 2022","dateTime":1666204200000,"department":"Designing","hours":"05:00","notes":"df vkkjf fkjk","project":"P2 - Project 2","status":"published"}	\N
85	88	directus_dashboards	b4d8c8a5-24fe-4969-94fc-22eba13fe077	{"name":"Report","icon":"dashboard","color":null,"note":null}	{"name":"Report","icon":"dashboard","color":null,"note":null}	\N
86	89	directus_panels	001d0b06-e662-4ed4-ad94-25aed7c7eff4	{"show_header":true,"type":"label","width":47,"height":6,"position_x":1,"position_y":1,"options":{"text":"Project Report"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}	{"show_header":true,"type":"label","width":47,"height":6,"position_x":1,"position_y":1,"options":{"text":"Project Report"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}	\N
87	90	directus_panels	6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633	{"type":"time-series","width":47,"height":21,"position_x":1,"position_y":7,"options":{"collection":"Timesheet","dateField":"date_updated","valueField":"dateTime","range":"auto"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}	{"type":"time-series","width":47,"height":21,"position_x":1,"position_y":7,"options":{"collection":"Timesheet","dateField":"date_updated","valueField":"dateTime","range":"auto"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}	\N
88	91	directus_panels	6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633	{"id":"6f9169eb-f04b-4f7a-a8e9-0b1ec99e4633","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"relational-variable","position_x":1,"position_y":7,"width":47,"height":21,"options":{"collection":"Timesheet","dateField":"date_updated","valueField":"dateTime","range":"auto","field":"hours","displayTemplate":"{{department}}"},"date_created":"2022-10-20T08:11:34.488Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"relational-variable","position_x":1,"position_y":7,"width":47,"height":21,"options":{"collection":"Timesheet","dateField":"date_updated","valueField":"dateTime","range":"auto","field":"hours","displayTemplate":"{{department}}"},"date_created":"2022-10-20T08:11:34.488Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
89	94	directus_fields	31	{"interface":"datetime","special":null,"collection":"Timesheet","field":"timecheck"}	{"interface":"datetime","special":null,"collection":"Timesheet","field":"timecheck"}	\N
90	95	Timesheet	5	{"date":"Friday, Oct 21, 2022","dateTime":1666290600000,"department":"Designing","hours":"05:00","notes":"sjdkhw dfi","project":"P1 - Project 1","status":"published"}	{"date":"Friday, Oct 21, 2022","dateTime":1666290600000,"department":"Designing","hours":"05:00","notes":"sjdkhw dfi","project":"P1 - Project 1","status":"published"}	\N
91	96	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:04:29.443Z","date":"Friday, Oct 21, 2022","department":"Designing","hours":"05:00","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666290500000,"timecheck":"05:00:00"}	{"timecheck":"05:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:04:29.443Z"}	\N
92	97	directus_fields	32	{"interface":"datetime","special":null,"collection":"Timesheet","field":"hours"}	{"interface":"datetime","special":null,"collection":"Timesheet","field":"hours"}	\N
93	98	Timesheet	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:19:41.770Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":"05:00:00"}	{"hours":"05:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:19:41.770Z"}	\N
94	99	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:20:01.503Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":"04:30:00"}	{"hours":"04:30:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:20:01.503Z"}	\N
95	100	directus_fields	33	{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}	{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}	\N
96	101	Timesheet	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:23:33.917Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":5}	{"hours":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:23:33.917Z"}	\N
97	102	directus_fields	34	{"interface":"input","special":null,"options":{"min":0},"collection":"Timesheet","field":"hours"}	{"interface":"input","special":null,"options":{"min":0},"collection":"Timesheet","field":"hours"}	\N
99	104	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:19.075Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":2.5}	{"hours":2.5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:19.075Z"}	\N
100	105	Timesheet	3	{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:28.110Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":4.5}	{"hours":4.5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:28.110Z"}	\N
101	106	Timesheet	4	{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:38.424Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"hours":1.2}	{"hours":1.2,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:38.424Z"}	\N
102	107	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:47.349Z","date":"Friday, Oct 21, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666290500000,"hours":8}	{"hours":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:40:47.349Z"}	\N
103	108	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"type":"time-series","width":54,"height":14,"position_x":1,"position_y":1,"options":{"collection":"Timesheet","function":"count","dateField":"date_created","valueField":"project"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}	{"type":"time-series","width":54,"height":14,"position_x":1,"position_y":1,"options":{"collection":"Timesheet","function":"count","dateField":"date_created","valueField":"project"},"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077"}	\N
104	109	directus_fields	35	{"interface":"input","special":null,"options":{"placeholder":"00:00"},"collection":"Timesheet","field":"hours"}	{"interface":"input","special":null,"options":{"placeholder":"00:00"},"collection":"Timesheet","field":"hours"}	\N
105	110	Timesheet	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:54:14.359Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":"05:00"}	{"hours":"05:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:54:14.359Z"}	\N
106	111	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:35.511Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":"02:00"}	{"hours":"02:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:35.511Z"}	\N
107	112	Timesheet	3	{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:46.402Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":"08:00"}	{"hours":"08:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:46.402Z"}	\N
108	113	Timesheet	4	{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:56.606Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"hours":"04:00"}	{"hours":"04:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:56:56.606Z"}	\N
109	114	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:57:06.478Z","date":"Friday, Oct 21, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666290500000,"hours":"08:00"}	{"hours":"08:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T08:57:06.478Z"}	\N
110	115	directus_fields	36	{"interface":"datetime","special":null,"options":{"includeSeconds":true},"collection":"Timesheet","field":"dateNew"}	{"interface":"datetime","special":null,"options":{"includeSeconds":true},"collection":"Timesheet","field":"dateNew"}	\N
111	116	Timesheet	3	{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:14:28.372Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":"08:00","dateNew":"2022-10-21T12:00:00"}	{"dateNew":"2022-10-21T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:14:28.372Z"}	\N
112	117	directus_fields	37	{"interface":"datetime","special":null,"collection":"Timesheet","field":"dateNew"}	{"interface":"datetime","special":null,"collection":"Timesheet","field":"dateNew"}	\N
113	118	Timesheet	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:50:45.360Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":"05:00","dateNew":"2022-10-18"}	{"dateNew":"2022-10-18","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:50:45.360Z"}	\N
114	119	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:51:43.745Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":"02:00","dateNew":"2022-10-19"}	{"dateNew":"2022-10-19","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:51:43.745Z"}	\N
115	120	Timesheet	3	{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:51:53.646Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":"08:00","dateNew":"2022-10-20"}	{"dateNew":"2022-10-20","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:51:53.646Z"}	\N
116	121	Timesheet	4	{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:52:01.101Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"hours":"04:00","dateNew":"2022-10-20"}	{"dateNew":"2022-10-20","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:52:01.101Z"}	\N
117	122	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:52:25.273Z","date":"Friday, Oct 21, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666290500000,"hours":"08:00","dateNew":"2022-10-21"}	{"dateNew":"2022-10-21","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T09:52:25.273Z"}	\N
118	123	Timesheet	6	{"date":"Friday, Oct 21, 2022","dateNew":"2022-10-21","dateTime":1666290600000,"department":"Engineering","hours":"05:00","notes":"","project":"P1 - Project 1","status":"published"}	{"date":"Friday, Oct 21, 2022","dateNew":"2022-10-21","dateTime":1666290600000,"department":"Engineering","hours":"05:00","notes":"","project":"P1 - Project 1","status":"published"}	\N
119	124	Timesheet	6	{"id":6,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:06:53.730Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:14:40.412Z","date":"Thursday, Oct 20, 2022","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"hours":"05:00","dateNew":"2022-10-20"}	{"status":"published","date":"Thursday, Oct 20, 2022","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"hours":"05:00","dateNew":"2022-10-20","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:14:40.412Z"}	\N
120	125	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:18:49.367Z","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"hours":"08:00","dateNew":"2022-10-22"}	{"status":"published","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"hours":"08:00","dateNew":"2022-10-22","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:18:49.367Z"}	\N
121	126	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"count","dateField":"dateNew","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"count","dateField":"dateNew","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
122	127	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sum","dateField":"dateNew","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sum","dateField":"dateNew","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
123	128	directus_fields	38	{"interface":"input","special":null,"collection":"Timesheet","field":"hoursCount"}	{"interface":"input","special":null,"collection":"Timesheet","field":"hoursCount"}	\N
124	129	Timesheet	7	{"date":"Friday, Oct 21, 2022","dateNew":"2022-10-21","dateTime":1666290600000,"department":"Engineering","hours":"04:00","notes":"","project":"P2 - Project 2","hoursCount":4,"status":"published"}	{"date":"Friday, Oct 21, 2022","dateNew":"2022-10-21","dateTime":1666290600000,"department":"Engineering","hours":"04:00","notes":"","project":"P2 - Project 2","hoursCount":4,"status":"published"}	\N
125	130	Timesheet	7	{"id":7,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:38:01.940Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:38:32.992Z","date":"Friday, Oct 21, 2022","department":"Engineering","notes":"","project":"P2 - Project 2","dateTime":1666290500000,"hours":"04:10","dateNew":"2022-10-21","hoursCount":4.1666665}	{"status":"published","date":"Friday, Oct 21, 2022","department":"Engineering","notes":"","project":"P2 - Project 2","dateTime":1666290600000,"hours":"04:10","dateNew":"2022-10-21","hoursCount":4.166666666666667,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:38:32.992Z"}	\N
126	131	Timesheet	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:37.692Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"hours":"05:00","dateNew":"2022-10-18","hoursCount":5}	{"hoursCount":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:37.692Z"}	\N
140	145	Timesheet	6	{"id":6,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:06:53.730Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:47.337Z","date":"Thursday, Oct 20, 2022","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"dateNew":"2022-10-20","hoursCount":5,"hours":5}	{"hours":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:47.337Z"}	\N
127	132	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:45.707Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"hours":"02:00","dateNew":"2022-10-19","hoursCount":2}	{"hoursCount":2,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:45.707Z"}	\N
128	133	Timesheet	3	{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:53.312Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"hours":"08:00","dateNew":"2022-10-20","hoursCount":8}	{"hoursCount":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:40:53.312Z"}	\N
129	134	Timesheet	4	{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:01.978Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"hours":"04:00","dateNew":"2022-10-20","hoursCount":4}	{"hoursCount":4,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:01.978Z"}	\N
130	135	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:10.698Z","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"hours":"08:00","dateNew":"2022-10-22","hoursCount":8}	{"hoursCount":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:10.698Z"}	\N
131	136	Timesheet	6	{"id":6,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:06:53.730Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:17.056Z","date":"Thursday, Oct 20, 2022","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"hours":"05:00","dateNew":"2022-10-20","hoursCount":5}	{"hoursCount":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-21T11:41:17.056Z"}	\N
132	137	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sum","dateField":"dateNew","valueField":"hoursCount"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sum","dateField":"dateNew","valueField":"hoursCount"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
133	138	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"dateNew","valueField":"hoursCount"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"dateNew","valueField":"hoursCount"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
134	139	directus_fields	39	{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}	{"interface":"input","special":null,"collection":"Timesheet","field":"hours"}	\N
135	140	Timesheet	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:09.905Z","date":"Tuesday, Oct 18, 2022","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"dateNew":"2022-10-18","hoursCount":5,"hours":5}	{"hours":5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:09.905Z"}	\N
136	141	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:16.634Z","date":"Wednesday, Oct 19, 2022","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"dateNew":"2022-10-19","hoursCount":2,"hours":2}	{"hours":2,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:16.634Z"}	\N
137	142	Timesheet	3	{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:23.377Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"dateNew":"2022-10-20","hoursCount":8,"hours":8}	{"hours":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:23.377Z"}	\N
138	143	Timesheet	4	{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:30.290Z","date":"Thursday, Oct 20, 2022","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"dateNew":"2022-10-20","hoursCount":4,"hours":4}	{"hours":4,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:30.290Z"}	\N
139	144	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:38.927Z","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"dateNew":"2022-10-22","hoursCount":8,"hours":8}	{"hours":8,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:38.927Z"}	\N
171	179	directus_fields	46	{"collection":"timesheet","field":"user_updated"}	{"collection":"timesheet","field":"user_updated"}	\N
141	146	Timesheet	7	{"id":7,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:38:01.940Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:57.909Z","date":"Friday, Oct 21, 2022","department":"Engineering","notes":"","project":"P2 - Project 2","dateTime":1666290500000,"dateNew":"2022-10-21","hoursCount":4.1666665,"hours":4.1666665}	{"hours":4.1666665,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T09:36:57.909Z"}	\N
142	147	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T10:43:09.078Z","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"dateNew":"2022-10-22","hoursCount":8,"hours":7.5}	{"status":"published","date":"Saturday, Oct 22, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666377000000,"dateNew":"2022-10-22","hours":7.5,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T10:43:09.078Z"}	\N
143	148	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T10:43:36.597Z","date":"Wednesday, Oct 26, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666722600000,"dateNew":"2022-10-26","hoursCount":8,"hours":4.25}	{"status":"published","date":"Wednesday, Oct 26, 2022","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666722600000,"dateNew":"2022-10-26","hours":4.25,"user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T10:43:36.597Z"}	\N
144	149	directus_fields	40	{"interface":"datetime","special":null,"collection":"Timesheet","field":"date"}	{"interface":"datetime","special":null,"collection":"Timesheet","field":"date"}	\N
145	150	Timesheet	1	{"id":1,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-18T15:25:23.562Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:07:59.712Z","department":"Designing","notes":"dgf dfbdfb","project":"P2 - Project 2","dateTime":1666031400000,"dateNew":"2022-10-18","hours":5,"date":"2022-10-18T12:00:00"}	{"date":"2022-10-18T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:07:59.712Z"}	\N
146	151	Timesheet	2	{"id":2,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-19T07:25:55.094Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:10:42.210Z","department":"Engineering","notes":"jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd","project":"P1 - Project 1","dateTime":1666117800000,"dateNew":"2022-10-19","hours":2,"date":"2022-10-19T12:00:00"}	{"date":"2022-10-19T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:10:42.210Z"}	\N
147	152	Timesheet	3	{"id":3,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:23.257Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:02.374Z","department":"Designing","notes":"jbad djshbfj djbs","project":"P1 - Project 1","dateTime":1666204200000,"dateNew":"2022-10-20","hours":8,"date":"2022-10-20T12:00:00"}	{"date":"2022-10-20T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:02.374Z"}	\N
148	153	Timesheet	4	{"id":4,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-20T07:13:53.507Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:21.920Z","department":"Designing","notes":"df vkkjf fkjk","project":"P2 - Project 2","dateTime":1666204200000,"dateNew":"2022-10-20","hours":4,"date":"2022-10-20T12:00:00"}	{"date":"2022-10-20T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:21.920Z"}	\N
149	154	Timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:35.675Z","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","dateTime":1666722600000,"dateNew":"2022-10-26","hours":4.25,"date":"2022-10-26T12:00:00"}	{"date":"2022-10-26T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:35.675Z"}	\N
150	155	Timesheet	6	{"id":6,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:06:53.730Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:49.780Z","department":"Engineering","notes":"","project":"P1 - Project 1","dateTime":1666204200000,"dateNew":"2022-10-20","hours":5,"date":"2022-10-20T12:00:00"}	{"date":"2022-10-20T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:49.780Z"}	\N
151	156	Timesheet	7	{"id":7,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T11:38:01.940Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:12:06.490Z","department":"Engineering","notes":"","project":"P2 - Project 2","dateTime":1666290500000,"dateNew":"2022-10-21","hours":4.1666665,"date":"2022-10-21T12:00:00"}	{"date":"2022-10-21T12:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:12:06.490Z"}	\N
152	157	Timesheet	8	{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Designing","hours":"5","notes":"hjvm jhmbm","project":"P1 - Project 1","status":"published"}	{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Designing","hours":"5","notes":"hjvm jhmbm","project":"P1 - Project 1","status":"published"}	\N
153	158	Timesheet	9	{"date":"2022-10-28T00:00:00","dateTime":1666895400000,"department":"Designing","hours":"5","notes":"bm","project":"P2 - Project 2","status":"published"}	{"date":"2022-10-28T00:00:00","dateTime":1666895400000,"department":"Designing","hours":"5","notes":"bm","project":"P2 - Project 2","status":"published"}	\N
154	159	Timesheet	9	{"id":9,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-26T11:23:48.074Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:24:22.787Z","department":"Designing","notes":"bm","project":"P2 - Project 2","dateTime":1666809000000,"dateNew":null,"hours":4.5,"date":"2022-10-27T00:00:00"}	{"status":"published","department":"Designing","notes":"bm","project":"P2 - Project 2","dateTime":1666809000000,"hours":4.5,"date":"2022-10-27T00:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:24:22.787Z"}	\N
172	180	directus_fields	47	{"collection":"timesheet","field":"date_updated"}	{"collection":"timesheet","field":"date_updated"}	\N
173	181	directus_fields	48	{"collection":"timesheet","field":"department"}	{"collection":"timesheet","field":"department"}	\N
155	160	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
156	161	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
157	162	Timesheet	9	{"id":9,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-26T11:23:48.074Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:49:31.474Z","department":"Designing","notes":"bm","project":"P2 - Project 2","dateTime":1666722600000,"hours":5.5,"date":"2022-10-26T00:00:00"}	{"status":"published","department":"Designing","notes":"bm","project":"P2 - Project 2","dateTime":1666722600000,"hours":5.5,"date":"2022-10-26T00:00:00","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:49:31.474Z"}	\N
158	164	Timesheet	10	{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Engineering","hours":"5","notes":"jgfns","project":"P2 - Project 2","status":"published"}	{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Engineering","hours":"5","notes":"jgfns","project":"P2 - Project 2","status":"published"}	\N
159	165	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":54,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
160	166	Timesheet	11	{"date":"2022-10-25T00:00:00","dateTime":1666636200000,"department":"Designing","hours":"1","notes":"","project":"P2 - Project 2","status":"published"}	{"date":"2022-10-25T00:00:00","dateTime":1666636200000,"department":"Designing","hours":"1","notes":"","project":"P2 - Project 2","status":"published"}	\N
161	167	Timesheet	12	{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Designing","hours":"8","notes":"mbm","project":"P1 - Project 1","status":"published"}	{"date":"2022-10-26T00:00:00","dateTime":1666722600000,"department":"Designing","hours":"8","notes":"mbm","project":"P1 - Project 1","status":"published"}	\N
162	168	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"width":45}	\N
163	169	directus_panels	cf23e02e-cd58-4af0-a696-592aed8366fd	{"id":"cf23e02e-cd58-4af0-a696-592aed8366fd","dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":"Hour based Report","icon":null,"color":null,"show_header":true,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":"Hour based Report","icon":null,"color":null,"show_header":true,"note":null,"type":"time-series","position_x":1,"position_y":1,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":"hours","range":"auto"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
164	170	directus_panels	1b15640c-d7db-4b4b-a05b-581ba555a0fc	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":"Hour based Report","icon":null,"color":null,"show_header":true,"note":null,"type":"relational-variable","position_x":1,"position_y":15,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":null,"range":"auto","displayTemplate":"{{project}}","field":"test"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	{"dashboard":"b4d8c8a5-24fe-4969-94fc-22eba13fe077","name":"Hour based Report","icon":null,"color":null,"show_header":true,"note":null,"type":"relational-variable","position_x":1,"position_y":15,"width":45,"height":14,"options":{"collection":"Timesheet","function":"sumDistinct","dateField":"date","valueField":null,"range":"auto","displayTemplate":"{{project}}","field":"test"},"date_created":"2022-10-21T08:42:48.871Z","user_created":"34893b1f-fa39-40df-9624-987fe749d106"}	\N
165	173	directus_collections	timesheet	{"collection":"timesheet"}	{"collection":"timesheet"}	\N
166	174	directus_fields	41	{"collection":"timesheet","field":"id"}	{"collection":"timesheet","field":"id"}	\N
167	175	directus_fields	42	{"collection":"timesheet","field":"status"}	{"collection":"timesheet","field":"status"}	\N
168	176	directus_fields	43	{"collection":"timesheet","field":"sort"}	{"collection":"timesheet","field":"sort"}	\N
169	177	directus_fields	44	{"collection":"timesheet","field":"user_created"}	{"collection":"timesheet","field":"user_created"}	\N
170	178	directus_fields	45	{"collection":"timesheet","field":"date_created"}	{"collection":"timesheet","field":"date_created"}	\N
174	182	directus_fields	49	{"collection":"timesheet","field":"notes"}	{"collection":"timesheet","field":"notes"}	\N
176	184	directus_fields	51	{"collection":"timesheet","field":"dateTime"}	{"collection":"timesheet","field":"dateTime"}	\N
178	186	directus_fields	53	{"collection":"timesheet","field":"date"}	{"collection":"timesheet","field":"date"}	\N
175	183	directus_fields	50	{"collection":"timesheet","field":"project"}	{"collection":"timesheet","field":"project"}	\N
177	185	directus_fields	52	{"collection":"timesheet","field":"hours"}	{"collection":"timesheet","field":"hours"}	\N
179	188	directus_fields	54	{"collection":"timesheet","field":"timestamp"}	{"collection":"timesheet","field":"timestamp"}	\N
180	189	directus_fields	55	{"collection":"timesheet","field":"time"}	{"collection":"timesheet","field":"time"}	\N
181	190	timesheet	5	{"id":5,"status":"published","sort":null,"user_created":"34893b1f-fa39-40df-9624-987fe749d106","date_created":"2022-10-21T08:03:17.815Z","user_updated":"34893b1f-fa39-40df-9624-987fe749d106","date_updated":"2022-10-26T11:11:35.675Z","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","timestamp":1666809000000,"time":4.25,"date":"2022-10-27T00:00:00"}	{"status":"published","department":"Designing","notes":"sjdkhw dfi","project":"P1 - Project 1","timestamp":1666809000000,"time":4.25,"date":"2022-10-27T00:00:00"}	\N
182	191	timesheet	13	{"date":"2022-10-27T00:00:00","timestamp":1666809000000,"department":"Designing","time":"5","notes":"jhv jhbj","project":"P1 - Project 1","status":"published"}	{"date":"2022-10-27T00:00:00","timestamp":1666809000000,"department":"Designing","time":"5","notes":"jhv jhbj","project":"P1 - Project 1","status":"published"}	\N
183	192	directus_collections	nextbits_department	{"collection":"nextbits_department"}	{"collection":"nextbits_department"}	\N
184	193	directus_fields	56	{"collection":"nextbits_department","field":"id"}	{"collection":"nextbits_department","field":"id"}	\N
185	194	directus_fields	57	{"collection":"nextbits_department","field":"status"}	{"collection":"nextbits_department","field":"status"}	\N
186	195	directus_fields	58	{"collection":"nextbits_department","field":"sort"}	{"collection":"nextbits_department","field":"sort"}	\N
187	196	directus_fields	59	{"collection":"nextbits_department","field":"user_created"}	{"collection":"nextbits_department","field":"user_created"}	\N
188	197	directus_fields	60	{"collection":"nextbits_department","field":"date_created"}	{"collection":"nextbits_department","field":"date_created"}	\N
189	198	directus_fields	61	{"collection":"nextbits_department","field":"user_updated"}	{"collection":"nextbits_department","field":"user_updated"}	\N
190	199	directus_fields	62	{"collection":"nextbits_department","field":"date_updated"}	{"collection":"nextbits_department","field":"date_updated"}	\N
191	200	directus_fields	63	{"collection":"nextbits_department","field":"dname"}	{"collection":"nextbits_department","field":"dname"}	\N
192	202	directus_collections	nextbits_project	{"collection":"nextbits_project"}	{"collection":"nextbits_project"}	\N
193	203	directus_fields	64	{"collection":"nextbits_project","field":"id"}	{"collection":"nextbits_project","field":"id"}	\N
194	204	directus_fields	65	{"collection":"nextbits_project","field":"status"}	{"collection":"nextbits_project","field":"status"}	\N
195	205	directus_fields	66	{"collection":"nextbits_project","field":"sort"}	{"collection":"nextbits_project","field":"sort"}	\N
196	206	directus_fields	67	{"collection":"nextbits_project","field":"user_created"}	{"collection":"nextbits_project","field":"user_created"}	\N
197	207	directus_fields	68	{"collection":"nextbits_project","field":"date_created"}	{"collection":"nextbits_project","field":"date_created"}	\N
198	208	directus_fields	69	{"collection":"nextbits_project","field":"user_updated"}	{"collection":"nextbits_project","field":"user_updated"}	\N
199	209	directus_fields	70	{"collection":"nextbits_project","field":"date_updated"}	{"collection":"nextbits_project","field":"date_updated"}	\N
200	210	directus_fields	71	{"collection":"nextbits_project","field":"pcode"}	{"collection":"nextbits_project","field":"pcode"}	\N
201	211	directus_fields	72	{"collection":"nextbits_project","field":"pname"}	{"collection":"nextbits_project","field":"pname"}	\N
202	213	directus_collections	nextbits_timesheet	{"collection":"nextbits_timesheet"}	{"collection":"nextbits_timesheet"}	\N
203	214	directus_fields	73	{"collection":"nextbits_timesheet","field":"id"}	{"collection":"nextbits_timesheet","field":"id"}	\N
204	215	directus_fields	74	{"collection":"nextbits_timesheet","field":"status"}	{"collection":"nextbits_timesheet","field":"status"}	\N
205	216	directus_fields	75	{"collection":"nextbits_timesheet","field":"sort"}	{"collection":"nextbits_timesheet","field":"sort"}	\N
206	217	directus_fields	76	{"collection":"nextbits_timesheet","field":"user_created"}	{"collection":"nextbits_timesheet","field":"user_created"}	\N
207	218	directus_fields	77	{"collection":"nextbits_timesheet","field":"date_created"}	{"collection":"nextbits_timesheet","field":"date_created"}	\N
208	219	directus_fields	78	{"collection":"nextbits_timesheet","field":"user_updated"}	{"collection":"nextbits_timesheet","field":"user_updated"}	\N
209	220	directus_fields	79	{"collection":"nextbits_timesheet","field":"date_updated"}	{"collection":"nextbits_timesheet","field":"date_updated"}	\N
210	221	directus_fields	80	{"collection":"nextbits_timesheet","field":"department"}	{"collection":"nextbits_timesheet","field":"department"}	\N
211	222	directus_fields	81	{"collection":"nextbits_timesheet","field":"notes"}	{"collection":"nextbits_timesheet","field":"notes"}	\N
212	223	directus_fields	82	{"collection":"nextbits_timesheet","field":"project"}	{"collection":"nextbits_timesheet","field":"project"}	\N
213	224	directus_fields	83	{"collection":"nextbits_timesheet","field":"timestamp"}	{"collection":"nextbits_timesheet","field":"timestamp"}	\N
214	225	directus_fields	84	{"collection":"nextbits_timesheet","field":"time"}	{"collection":"nextbits_timesheet","field":"time"}	\N
215	226	directus_fields	85	{"collection":"nextbits_timesheet","field":"date"}	{"collection":"nextbits_timesheet","field":"date"}	\N
216	228	directus_fields	86	{"collection":"nextbits_department","field":"name"}	{"collection":"nextbits_department","field":"name"}	\N
217	229	directus_fields	87	{"collection":"nextbits_project","field":"code"}	{"collection":"nextbits_project","field":"code"}	\N
218	230	directus_fields	88	{"collection":"nextbits_project","field":"name"}	{"collection":"nextbits_project","field":"name"}	\N
219	231	nextbits_timesheet	14	{"date":"2022-10-31T00:00:00","timestamp":1667154600000,"department":"Engineering","time":"4","notes":"vhjmb jbjkm","project":"P2 - Project 2","status":"published"}	{"date":"2022-10-31T00:00:00","timestamp":1667154600000,"department":"Engineering","time":"4","notes":"vhjmb jbjkm","project":"P2 - Project 2","status":"published"}	\N
220	232	nextbits_timesheet	12	{"id":12,"status":"published","sort":null,"user_created":"4ccc7fbd-f5c8-4b07-9b1c-bb671960976c","date_created":"2022-10-26T14:32:41.962Z","user_updated":null,"date_updated":null,"department":"Designing","notes":"mbm","project":"P1 - Project 1","timestamp":1667154600000,"time":8,"date":"2022-10-31T00:00:00"}	{"status":"published","department":"Designing","notes":"mbm","project":"P1 - Project 1","timestamp":1667154600000,"time":8,"date":"2022-10-31T00:00:00"}	\N
\.


--
-- TOC entry 3576 (class 0 OID 16409)
-- Dependencies: 215
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
a8b859ca-166a-414f-8a35-be3486b68ed2	Administrator	verified	$t:admin_description	\N	f	t	t
961e3b49-c689-4f5b-b47f-47b978d19c6f	Employee	supervised_user_circle	\N	\N	f	f	t
\.


--
-- TOC entry 3592 (class 0 OID 16597)
-- Dependencies: 231
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
7W9naOjvEoWMiEORN_E3tWtKlpRVQs6eo9tyKsM8TnuTFppuPUcqg2DFl4Tx0UUi	34893b1f-fa39-40df-9624-987fe749d106	2022-11-07 13:07:00.771+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	\N	http://localhost:8055
KH0BcNMdCzBIwYldwjVuPsTT8RVy_SQUYBsLA1mqxR98cRUto5T5jZ4S-iCmj-I4	34893b1f-fa39-40df-9624-987fe749d106	2022-11-02 18:21:41.866+05:30	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36	\N	http://localhost:8055
\.


--
-- TOC entry 3594 (class 0 OID 16610)
-- Dependencies: 233
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, translation_strings, default_language, custom_aspect_ratios) FROM stdin;
1	Directus	\N	\N	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	[{"type":"module","id":"timesheet","enabled":true},{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true}]	\N	\N	en-US	\N
\.


--
-- TOC entry 3602 (class 0 OID 16856)
-- Dependencies: 241
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- TOC entry 3577 (class 0 OID 16420)
-- Dependencies: 216
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) FROM stdin;
34893b1f-fa39-40df-9624-987fe749d106	Admin	User	saurabh.nextbits@gmail.com	$argon2id$v=19$m=4096,t=3,p=1$TfB0G6/cEcXkk1Hy0C8oKg$G2irudfP/4F472F1bTtbGeHDfhxysqFTRi3yQTbBIcY	\N	\N	\N	\N	\N	\N	auto	\N	active	a8b859ca-166a-414f-8a35-be3486b68ed2	\N	2022-10-31 13:07:00.773+05:30	/timesheet	default	\N	\N	t
4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	Saurabh	Gupta	saurabhg096567@gmail.com	$argon2id$v=19$m=4096,t=3,p=1$n0xLQSTDm/EK77GYBYuiWQ$FUfuFnvJr2rle3ZTIcbt0ybZCtZ8cPck5yF+QE2+Hj4	\N	\N	\N	\N	\N	\N	auto	\N	active	961e3b49-c689-4f5b-b47f-47b978d19c6f	\N	2022-10-28 18:53:45.34+05:30	/users/4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	default	\N	\N	t
\.


--
-- TOC entry 3596 (class 0 OID 16638)
-- Dependencies: 235
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- TOC entry 3608 (class 0 OID 16962)
-- Dependencies: 247
-- Data for Name: nextbits_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nextbits_department (id, status, sort, user_created, date_created, user_updated, date_updated, name) FROM stdin;
2	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:50:42.426+05:30	\N	\N	Designing
1	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:50:21.489+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:51:42.002+05:30	Engineering
\.


--
-- TOC entry 3610 (class 0 OID 16982)
-- Dependencies: 249
-- Data for Name: nextbits_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nextbits_project (id, status, sort, user_created, date_created, user_updated, date_updated, code, name) FROM stdin;
1	published	1	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:49:05.471+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:49:30.811+05:30	P1	Project 1
2	published	2	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:49:23.071+05:30	\N	\N	P2	Project 2
\.


--
-- TOC entry 3606 (class 0 OID 16942)
-- Dependencies: 245
-- Data for Name: nextbits_timesheet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nextbits_timesheet (id, status, sort, user_created, date_created, user_updated, date_updated, department, notes, project, "timestamp", "time", date) FROM stdin;
1	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-18 20:55:23.562+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:37:59.712+05:30	Designing	dgf dfbdfb	P2 - Project 2	1.6660314e+12	5	2022-10-18 12:00:00
2	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-19 12:55:55.094+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:40:42.21+05:30	Engineering	jhbdsjk dkjcfdjs dsjkbcksjd dskjfjksd	P1 - Project 1	1.6661178e+12	2	2022-10-19 12:00:00
3	published	\N	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-20 12:43:23.257+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:41:02.374+05:30	Designing	jbad djshbfj djbs	P1 - Project 1	1.6662042e+12	8	2022-10-20 12:00:00
4	published	\N	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-20 12:43:53.507+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:41:21.92+05:30	Designing	df vkkjf fkjk	P2 - Project 2	1.6662042e+12	4	2022-10-20 12:00:00
6	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 16:36:53.73+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:41:49.78+05:30	Engineering		P1 - Project 1	1.6662042e+12	5	2022-10-20 12:00:00
7	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 17:08:01.94+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:42:06.49+05:30	Engineering		P2 - Project 2	1.6662905e+12	4.1666665	2022-10-21 12:00:00
8	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:47:12.312+05:30	\N	\N	Designing	hjvm jhmbm	P1 - Project 1	1.6667226e+12	5	2022-10-26 00:00:00
9	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:53:48.074+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 17:19:31.474+05:30	Designing	bm	P2 - Project 2	1.6667226e+12	5.5	2022-10-26 00:00:00
10	published	\N	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 19:50:12.591+05:30	\N	\N	Engineering	jgfns	P2 - Project 2	1.6667226e+12	5	2022-10-26 00:00:00
11	published	\N	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 19:59:08.88+05:30	\N	\N	Designing		P2 - Project 2	1.6666362e+12	1	2022-10-25 00:00:00
5	published	\N	34893b1f-fa39-40df-9624-987fe749d106	2022-10-21 13:33:17.815+05:30	34893b1f-fa39-40df-9624-987fe749d106	2022-10-26 16:41:35.675+05:30	Designing	sjdkhw dfi	P1 - Project 1	1.666809e+12	4.25	2022-10-27 00:00:00
13	published	\N	\N	\N	\N	\N	Designing	jhv jhbj	P1 - Project 1	1.666809e+12	5	2022-10-27 00:00:00
14	published	\N	\N	\N	\N	\N	Engineering	vhjmb jbjkm	P2 - Project 2	1.6671546e+12	4	2022-10-31 00:00:00
12	published	\N	4ccc7fbd-f5c8-4b07-9b1c-bb671960976c	2022-10-26 20:02:41.962+05:30	\N	\N	Designing	mbm	P1 - Project 1	1.6671546e+12	8	2022-10-31 00:00:00
\.


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 244
-- Name: Timesheet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Timesheet_id_seq"', 14, true);


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 246
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_id_seq', 2, true);


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 219
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 232, true);


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 217
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 88, true);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 239
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 223
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 31, true);


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 225
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 4, true);


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 227
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 6, true);


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 229
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 220, true);


--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 232
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 234
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 248
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 2, true);


--
-- TOC entry 3392 (class 2606 OID 16948)
-- Name: nextbits_timesheet Timesheet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT "Timesheet_pkey" PRIMARY KEY (id);


--
-- TOC entry 3394 (class 2606 OID 16968)
-- Name: nextbits_department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 16469)
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 16408)
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- TOC entry 3374 (class 2606 OID 16784)
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 16449)
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 16494)
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- TOC entry 3382 (class 2606 OID 16901)
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- TOC entry 3384 (class 2606 OID 16899)
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 16479)
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 16656)
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3378 (class 2606 OID 16844)
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 16914)
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- TOC entry 3388 (class 2606 OID 16923)
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- TOC entry 3390 (class 2606 OID 16916)
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- TOC entry 3376 (class 2606 OID 16799)
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 16518)
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 16538)
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 16562)
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 16581)
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 16419)
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 16603)
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- TOC entry 3368 (class 2606 OID 16621)
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 16864)
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 16826)
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- TOC entry 3344 (class 2606 OID 16824)
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- TOC entry 3346 (class 2606 OID 16429)
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 16834)
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- TOC entry 3370 (class 2606 OID 16648)
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 16988)
-- Name: nextbits_project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 16969)
-- Name: nextbits_department department_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- TOC entry 3430 (class 2606 OID 16974)
-- Name: nextbits_department department_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_department
    ADD CONSTRAINT department_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- TOC entry 3397 (class 2606 OID 16828)
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- TOC entry 3414 (class 2606 OID 16785)
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3400 (class 2606 OID 16741)
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- TOC entry 3401 (class 2606 OID 16672)
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- TOC entry 3402 (class 2606 OID 16667)
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- TOC entry 3422 (class 2606 OID 16902)
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3399 (class 2606 OID 16677)
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- TOC entry 3417 (class 2606 OID 16845)
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 3418 (class 2606 OID 16850)
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- TOC entry 3423 (class 2606 OID 16929)
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- TOC entry 3424 (class 2606 OID 16924)
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- TOC entry 3425 (class 2606 OID 16917)
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- TOC entry 3426 (class 2606 OID 16934)
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3415 (class 2606 OID 16800)
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- TOC entry 3416 (class 2606 OID 16805)
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3403 (class 2606 OID 16746)
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3404 (class 2606 OID 16756)
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3405 (class 2606 OID 16751)
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 3406 (class 2606 OID 16761)
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- TOC entry 3407 (class 2606 OID 16702)
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- TOC entry 3408 (class 2606 OID 16880)
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- TOC entry 3409 (class 2606 OID 16766)
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- TOC entry 3410 (class 2606 OID 16712)
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- TOC entry 3411 (class 2606 OID 16722)
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- TOC entry 3412 (class 2606 OID 16717)
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- TOC entry 3413 (class 2606 OID 16816)
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- TOC entry 3419 (class 2606 OID 16865)
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- TOC entry 3420 (class 2606 OID 16870)
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3421 (class 2606 OID 16875)
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- TOC entry 3398 (class 2606 OID 16771)
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- TOC entry 3431 (class 2606 OID 16989)
-- Name: nextbits_project project_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- TOC entry 3432 (class 2606 OID 16994)
-- Name: nextbits_project project_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_project
    ADD CONSTRAINT project_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- TOC entry 3427 (class 2606 OID 16949)
-- Name: nextbits_timesheet timesheet_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT timesheet_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- TOC entry 3428 (class 2606 OID 16954)
-- Name: nextbits_timesheet timesheet_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nextbits_timesheet
    ADD CONSTRAINT timesheet_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


-- Completed on 2022-10-31 13:12:32

--
-- PostgreSQL database dump complete
--

