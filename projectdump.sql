--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: app_comment_replies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_comment_replies (
    id bigint NOT NULL,
    text character varying(255),
    "time" timestamp(6) without time zone,
    comment_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.app_comment_replies OWNER TO postgres;

--
-- Name: app_comment_replies_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_comment_replies_reactions (
    comment_reply_id bigint NOT NULL,
    reactions_id bigint NOT NULL
);


ALTER TABLE public.app_comment_replies_reactions OWNER TO postgres;

--
-- Name: app_comment_replies_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_comment_replies_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_comment_replies_seq OWNER TO postgres;

--
-- Name: app_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_comments (
    id bigint NOT NULL,
    text character varying(255) NOT NULL,
    "time" timestamp(6) without time zone,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.app_comments OWNER TO postgres;

--
-- Name: app_comments_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_comments_reactions (
    comment_id bigint NOT NULL,
    reactions_id bigint NOT NULL
);


ALTER TABLE public.app_comments_reactions OWNER TO postgres;

--
-- Name: app_comments_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_comments_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_comments_seq OWNER TO postgres;

--
-- Name: app_event_attendees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_event_attendees (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.app_event_attendees OWNER TO postgres;

--
-- Name: app_event_attendees_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_event_attendees_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_event_attendees_seq OWNER TO postgres;

--
-- Name: app_favorite_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_favorite_posts (
    id bigint NOT NULL,
    post_id bigint,
    user_id bigint
);


ALTER TABLE public.app_favorite_posts OWNER TO postgres;

--
-- Name: app_favorite_posts_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_favorite_posts_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_favorite_posts_seq OWNER TO postgres;

--
-- Name: app_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_group (
    id bigint NOT NULL,
    banner_imageurl character varying(255),
    creation_date timestamp(6) without time zone,
    group_alias character varying(255),
    group_description character varying(255),
    group_name character varying(255),
    is_public boolean NOT NULL
);


ALTER TABLE public.app_group OWNER TO postgres;

--
-- Name: app_group_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_group_events (
    id bigint NOT NULL,
    creation_date timestamp(6) without time zone,
    description character varying(255),
    event_date timestamp(6) without time zone,
    location character varying(255),
    title character varying(255) NOT NULL,
    group_id bigint,
    group_member_id bigint
);


ALTER TABLE public.app_group_events OWNER TO postgres;

--
-- Name: app_group_events_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_group_events_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_group_events_seq OWNER TO postgres;

--
-- Name: app_group_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_group_members (
    id bigint NOT NULL,
    group_role smallint NOT NULL,
    is_valid boolean NOT NULL,
    joined_date timestamp(6) without time zone NOT NULL,
    group_id bigint NOT NULL,
    user_id bigint,
    CONSTRAINT app_group_members_group_role_check CHECK (((group_role >= 0) AND (group_role <= 2)))
);


ALTER TABLE public.app_group_members OWNER TO postgres;

--
-- Name: app_group_members_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_group_members_posts (
    group_member_id bigint NOT NULL,
    posts_id bigint NOT NULL
);


ALTER TABLE public.app_group_members_posts OWNER TO postgres;

--
-- Name: app_group_members_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_group_members_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_group_members_seq OWNER TO postgres;

--
-- Name: app_group_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_group_messages (
    id bigint NOT NULL,
    message character varying(255),
    "time" timestamp(6) without time zone,
    group_id bigint,
    user_id bigint
);


ALTER TABLE public.app_group_messages OWNER TO postgres;

--
-- Name: app_group_messages_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_group_messages_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_group_messages_seq OWNER TO postgres;

--
-- Name: app_group_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_group_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_group_seq OWNER TO postgres;

--
-- Name: app_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_images (
    id bigint NOT NULL,
    delete_hash character varying(255) NOT NULL,
    index integer NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE public.app_images OWNER TO postgres;

--
-- Name: app_images_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_images_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_images_seq OWNER TO postgres;

--
-- Name: app_post_images_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_post_images_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_post_images_seq OWNER TO postgres;

--
-- Name: app_post_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_post_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_post_seq OWNER TO postgres;

--
-- Name: app_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_posts (
    id bigint NOT NULL,
    date_of_creation timestamp(6) without time zone NOT NULL,
    date_of_update timestamp(6) without time zone NOT NULL,
    location character varying(255),
    post_type smallint NOT NULL,
    text character varying(255),
    group_member_id bigint,
    user_id bigint,
    vehicle_id bigint,
    CONSTRAINT app_posts_post_type_check CHECK (((post_type >= 0) AND (post_type <= 2)))
);


ALTER TABLE public.app_posts OWNER TO postgres;

--
-- Name: app_posts_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_posts_images (
    post_id bigint NOT NULL,
    images_id bigint NOT NULL
);


ALTER TABLE public.app_posts_images OWNER TO postgres;

--
-- Name: app_posts_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_posts_reactions (
    post_id bigint NOT NULL,
    reactions_id bigint NOT NULL
);


ALTER TABLE public.app_posts_reactions OWNER TO postgres;

--
-- Name: app_posts_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_posts_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_posts_seq OWNER TO postgres;

--
-- Name: app_private_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_private_messages (
    id bigint NOT NULL,
    date timestamp(6) without time zone,
    message character varying(255),
    recipient_user_id bigint,
    sender_user_id bigint
);


ALTER TABLE public.app_private_messages OWNER TO postgres;

--
-- Name: app_private_messages_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_private_messages_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_private_messages_seq OWNER TO postgres;

--
-- Name: app_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_reactions (
    id bigint NOT NULL,
    reaction_type smallint NOT NULL,
    user_id bigint,
    CONSTRAINT app_reactions_reaction_type_check CHECK (((reaction_type >= 0) AND (reaction_type <= 2)))
);


ALTER TABLE public.app_reactions OWNER TO postgres;

--
-- Name: app_reactions_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_reactions_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_reactions_seq OWNER TO postgres;

--
-- Name: app_user_connections_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_connections_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_user_connections_seq OWNER TO postgres;

--
-- Name: app_user_vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user_vehicles (
    id bigint NOT NULL,
    description character varying(255),
    displacement integer,
    horsepower integer,
    manufacturer character varying(255),
    model character varying(255),
    production_year integer,
    type character varying(255),
    user_id bigint
);


ALTER TABLE public.app_user_vehicles OWNER TO postgres;

--
-- Name: app_user_vehicles_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user_vehicles_post (
    vehicle_id bigint NOT NULL,
    post_id bigint NOT NULL
);


ALTER TABLE public.app_user_vehicles_post OWNER TO postgres;

--
-- Name: app_user_vehicles_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_vehicles_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_user_vehicles_seq OWNER TO postgres;

--
-- Name: app_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_users (
    id bigint NOT NULL,
    bio character varying(255),
    date_of_birth date NOT NULL,
    date_of_signup date NOT NULL,
    email character varying(255) NOT NULL,
    is_deleted boolean NOT NULL,
    is_public boolean NOT NULL,
    nickname character varying(255) NOT NULL,
    password character varying(255),
    profile_img character varying(255),
    role smallint,
    username character varying(255) NOT NULL,
    CONSTRAINT app_users_role_check CHECK (((role >= 0) AND (role <= 1)))
);


ALTER TABLE public.app_users OWNER TO postgres;

--
-- Name: app_users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_users_seq OWNER TO postgres;

--
-- Name: user_followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_followers (
    user_id bigint NOT NULL,
    following_id bigint NOT NULL
);


ALTER TABLE public.user_followers OWNER TO postgres;

--
-- Data for Name: app_comment_replies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_comment_replies (id, text, "time", comment_id, user_id) FROM stdin;
1	Eladó?	2025-03-19 09:42:17.872526	1	3
2	És a szörnyeteghez!	2025-03-19 09:43:22.354437	2	3
52	Nekem is a kedvencem!	2025-03-19 12:13:25.850089	2	52
102	Igen	2025-03-20 11:04:10.083001	53	1
\.


--
-- Data for Name: app_comment_replies_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_comment_replies_reactions (comment_reply_id, reactions_id) FROM stdin;
2	8
102	207
\.


--
-- Data for Name: app_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_comments (id, text, "time", post_id, user_id) FROM stdin;
1	Szép autó! Ez igen!	2025-03-19 09:42:08.70788	1	3
2	Jó étvágyat az olajhoz!	2025-03-19 09:43:00.129176	2	3
52	Egy gorilla illetve az a nagy orru joszag	2025-03-20 09:55:36.435509	52	302
53	Hali	2025-03-20 11:04:03.393972	1182	1
\.


--
-- Data for Name: app_comments_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_comments_reactions (comment_id, reactions_id) FROM stdin;
2	6
53	206
\.


--
-- Data for Name: app_event_attendees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_event_attendees (id, event_id, user_id) FROM stdin;
\.


--
-- Data for Name: app_favorite_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_favorite_posts (id, post_id, user_id) FROM stdin;
1	2	2
2	3	1
3	2	1
4	1753	52
\.


--
-- Data for Name: app_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_group (id, banner_imageurl, creation_date, group_alias, group_description, group_name, is_public) FROM stdin;
2	https://i.imgur.com/w2aPTo9.jpeg	2025-03-19 11:52:30.749985	HAL	Hali!	hali i	t
1	https://i.imgur.com/p4IXeUq.jpeg	2025-03-19 11:47:17.415112	HELLO	Szabad beszélgetés, csatlakozz nyugodtan!	Autós csoport 1	t
52	https://i.imgur.com/74FsO96.jpeg	2025-03-20 11:05:06.562298	ABC	abc	A B Csoport	t
\.


--
-- Data for Name: app_group_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_group_events (id, creation_date, description, event_date, location, title, group_id, group_member_id) FROM stdin;
\.


--
-- Data for Name: app_group_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_group_members (id, group_role, is_valid, joined_date, group_id, user_id) FROM stdin;
1	2	t	2025-03-19 11:47:17.422171	1	52
2	0	t	2025-03-19 11:47:50.600093	1	2
3	2	t	2025-03-19 11:52:30.754727	2	52
4	0	t	2025-03-19 11:53:38.150873	2	2
52	0	t	2025-03-19 12:03:38.567009	1	1
53	0	t	2025-03-19 12:03:45.820515	2	1
102	0	t	2025-03-20 09:54:38.202817	2	302
103	2	t	2025-03-20 11:05:06.571555	52	1
\.


--
-- Data for Name: app_group_members_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_group_members_posts (group_member_id, posts_id) FROM stdin;
\.


--
-- Data for Name: app_group_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_group_messages (id, message, "time", group_id, user_id) FROM stdin;
1	Helló! Csevegés!	2025-03-19 11:48:52.944159	1	2
2	Sziasztok! Megszereztem egy okmányt végre! Nem is akármilyet!	2025-03-19 12:41:19.224576	1	52
3	Milyen igazolványt? Ez nagyon durva!	2025-03-19 12:41:59.121469	1	1
52	abc	2025-03-19 15:02:16.963911	1	1
53	def	2025-03-19 15:02:17.733067	1	1
54	awdaw	2025-03-19 15:02:18.413782	1	1
102	Teszt	2025-03-20 09:38:48.813955	2	1
103	abccd	2025-03-20 10:59:40.856046	2	52
104	helló	2025-03-20 10:59:42.569305	2	52
\.


--
-- Data for Name: app_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_images (id, delete_hash, index, url) FROM stdin;
1	GQsxCIKtOzr6Dlm	0	https://i.imgur.com/gooTtMr.jpeg
2	DL3cUYZrc413sjX	0	https://i.imgur.com/hFGeaPB.jpeg
3	l2vtfNbKDuLbswX	0	https://i.imgur.com/xBwJrIJ.jpeg
4	j4VJ7SDw7AB7okg	1	https://i.imgur.com/bVw2Icc.jpeg
52	EWcn9v23BZu6Cgo	0	https://i.imgur.com/eCox0dz.jpeg
53	rxomVeIyuDNsv6o	1	https://i.imgur.com/OBTiOoV.jpeg
54	TZ7kfp8DmqJjLmn	0	https://i.imgur.com/ukJkNA5.jpeg
55	TWqmgHjan7VJ0zE	0	https://i.imgur.com/FM7cYiL.jpeg
56	L69Pwhpvnx00oxX	1	https://i.imgur.com/5W4Hcg6.png
57	zJJviLa87pnSumi	0	https://i.imgur.com/eSY95zJ.png
102	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
103	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
104	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
105	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
106	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
107	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
153	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
174	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
165	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
156	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
159	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
152	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
155	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
179	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
154	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
158	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
175	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
168	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
162	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
157	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
166	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
173	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
180	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
169	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
160	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
181	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
178	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
163	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
177	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
161	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
167	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
170	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
176	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
172	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
171	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
164	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
185	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
182	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
191	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
186	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
183	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
188	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
192	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
187	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
184	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
193	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
189	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
197	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
195	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
204	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
200	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
190	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
239	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
240	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
241	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3242	VCfOWU6GGgrYCev	0	https://i.imgur.com/zs1z3UP.jpeg
3602	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3603	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3604	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3605	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3642	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3643	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3644	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3645	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3674	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3675	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3676	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3677	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3722	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3723	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3724	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3725	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3774	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3775	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3776	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3777	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3790	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3792	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3794	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3797	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3842	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3843	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3845	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3846	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3886	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3887	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3888	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3889	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3930	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3931	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3932	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3933	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3972	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3974	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3976	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3977	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4002	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4003	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4004	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4005	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4038	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4039	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4040	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4041	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4062	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4063	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4064	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4065	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4068	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
209	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
210	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
211	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
221	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
222	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
223	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3614	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3615	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3616	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3617	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3666	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3667	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3668	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3669	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3706	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3707	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3708	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3709	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3746	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3747	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3748	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3749	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3782	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3783	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3784	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3785	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3818	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3819	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3820	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3821	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3853	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3855	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3856	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3857	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3898	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3899	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3900	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3901	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3919	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3920	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3921	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3923	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3950	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3961	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3962	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3963	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4006	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4007	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4008	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4009	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4046	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4047	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4049	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4050	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4073	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4076	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
215	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
216	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
217	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
870	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
871	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
897	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
898	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
899	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
929	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
930	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
931	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
948	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
956	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
958	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
977	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
978	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
979	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1004	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1005	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1006	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1034	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1035	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1036	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1061	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1062	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1063	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1088	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1089	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1090	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1115	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1116	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1117	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1145	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1146	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1147	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1173	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1174	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1175	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1206	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1210	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1211	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1241	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1242	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1243	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1247	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1250	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1251	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1290	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1293	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1294	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1322	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1323	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1324	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1354	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1358	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1360	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1382	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1397	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
198	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
199	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
224	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
228	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
229	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3606	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3608	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3610	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3613	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3646	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3647	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3648	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3649	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3702	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3703	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3704	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3705	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3738	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3739	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3740	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3741	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3770	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3771	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3772	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3773	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3803	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3804	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3807	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3809	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3850	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3851	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3852	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3854	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3890	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3891	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3892	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3893	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3942	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3943	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3944	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3945	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3967	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3969	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3970	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3971	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3990	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3991	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3992	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3993	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4016	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4022	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4024	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4025	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4078	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4070	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
212	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
213	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
214	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1359	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1361	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1377	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1380	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1381	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1392	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1393	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1398	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1399	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1409	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1407	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1413	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1416	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1410	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1401	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1418	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1405	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1408	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1414	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1402	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1417	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1406	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1411	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1419	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1421	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1420	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1422	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1423	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1424	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1425	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1426	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1427	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1430	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1428	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1439	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1436	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1433	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1442	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1429	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1431	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1437	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1434	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1448	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1440	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1445	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1443	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1432	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1435	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1449	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1441	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1438	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1444	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1446	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
242	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
243	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
244	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
253	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
254	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
255	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
269	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
271	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
273	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
299	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
300	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
301	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
329	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
330	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
331	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
359	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
360	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
361	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
401	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
402	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
403	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
422	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
423	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
424	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
446	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
447	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
448	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
491	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
492	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
493	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
520	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
523	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
524	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
552	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
555	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
556	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
590	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
591	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
592	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
615	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
616	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
617	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
638	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
639	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
640	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
668	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
669	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
670	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
701	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
702	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
703	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
731	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
732	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
733	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
761	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
762	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
763	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
791	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
201	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
203	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
227	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
230	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
232	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3253	DICiicQdZRLjXcP	0	https://i.imgur.com/FkaBAHD.jpeg
3618	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3619	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3620	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3621	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3662	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3663	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3664	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3665	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3686	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3687	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3688	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3689	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3718	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3719	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3720	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3721	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3750	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3751	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3752	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3753	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3791	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3793	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3795	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3796	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3836	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3839	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3840	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3841	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3878	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3879	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3880	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3881	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3934	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3935	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3936	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3937	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3978	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3979	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3980	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3981	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4010	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4011	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4012	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4013	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4048	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4051	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4052	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4055	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4079	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4080	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
245	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
247	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
249	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
281	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
282	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
283	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
305	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
307	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
310	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
335	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
336	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
337	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
362	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
363	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
364	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
398	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
399	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
400	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
425	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
426	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
427	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
467	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
468	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
469	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
500	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
501	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
502	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
522	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
525	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
526	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
548	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
549	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
550	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
578	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
579	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
581	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
602	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
604	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
605	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
647	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
649	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
650	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
674	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
675	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
676	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
716	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
717	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
718	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
743	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
744	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
745	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
765	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
766	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
768	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
809	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
810	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
811	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
833	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
246	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
248	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
250	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
278	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
279	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
280	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
302	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
306	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
313	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
341	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
343	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
345	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
369	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
372	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
373	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
384	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
385	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
386	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
419	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
420	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
421	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
443	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
444	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
445	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
470	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
471	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
472	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
485	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
486	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
487	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
509	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
510	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
511	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
551	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
553	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
558	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
587	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
588	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
589	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
612	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
613	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
614	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
653	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
654	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
655	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
678	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
679	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
680	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
708	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
710	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
712	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
738	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
741	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
742	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
776	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
777	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
778	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
797	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
259	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
263	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
265	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
287	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
289	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
291	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
320	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
321	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
322	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
350	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
351	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
352	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
377	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
378	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
379	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
405	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
407	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
409	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
438	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
440	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
441	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
464	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
465	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
466	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
494	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
495	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
496	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
515	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
516	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
517	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
542	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
543	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
544	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
584	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
585	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
586	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
618	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
619	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
620	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
644	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
645	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
646	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
665	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
666	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
667	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
689	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
690	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
691	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
719	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
720	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
721	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
749	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
750	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
751	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
779	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
780	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
781	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
806	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
194	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
236	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
237	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
238	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
6	deleteHash	0	https://m.media-amazon.com/images/I/51KQC8H1QaL._AC_SL1000_.jpg
3607	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3609	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3611	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3612	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3658	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3659	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3660	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3661	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3682	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3683	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3684	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3685	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3714	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3715	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3716	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3717	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3754	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3757	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3760	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3763	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3810	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3813	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3815	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3817	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3834	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3835	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3837	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3838	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3874	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3875	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3876	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3877	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3918	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3924	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3926	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3928	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3951	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3954	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3973	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3975	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3994	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3995	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3996	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3997	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4030	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4026	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4027	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4031	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4032	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4028	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4033	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4029	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4066	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
257	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
260	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
262	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
266	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
267	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
268	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
296	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
297	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
298	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
326	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
327	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
328	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
356	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
357	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
358	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
383	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
387	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
388	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
413	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
414	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
415	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
452	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
453	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
454	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
479	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
480	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
481	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
506	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
507	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
508	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
536	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
537	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
538	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
566	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
567	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
568	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
596	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
597	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
598	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
626	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
627	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
628	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
656	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
657	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
658	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
686	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
687	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
688	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
713	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
714	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
715	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
746	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
747	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
748	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
770	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
771	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
772	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
803	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
251	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
252	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
256	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
288	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
290	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
292	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
317	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
318	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
319	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
342	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
344	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
346	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
374	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
375	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
376	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
410	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
411	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
412	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
431	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
432	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
433	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
458	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
459	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
460	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
497	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
498	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
499	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
512	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
513	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
514	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
539	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
540	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
541	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
572	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
573	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
574	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
606	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
607	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
608	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
632	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
633	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
634	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
662	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
663	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
664	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
695	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
696	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
697	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
722	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
723	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
724	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
752	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
755	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
756	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
785	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
789	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
790	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
818	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
206	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
208	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
225	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
234	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
235	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3303	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3305	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3306	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3302	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3304	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3307	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3311	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3310	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3312	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3316	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3322	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3320	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3325	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3315	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3330	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3313	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3324	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3318	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3323	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3326	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3331	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3317	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3314	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3327	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3332	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3338	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3335	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3333	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3336	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3339	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3337	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3334	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3340	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3344	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3341	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3347	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3342	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3348	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3350	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3345	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3343	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3349	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3351	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3346	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3352	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3359	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3360	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3361	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3362	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3365	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3363	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3364	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3371	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
258	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
261	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
264	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
293	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
294	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
295	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
323	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
324	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
325	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
353	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
354	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
355	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
389	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
390	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
391	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
428	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
429	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
430	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
449	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
450	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
451	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
476	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
477	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
478	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
530	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
531	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
532	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
545	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
546	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
547	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
569	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
570	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
571	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
599	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
600	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
601	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
629	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
630	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
631	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
659	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
660	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
661	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
692	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
693	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
694	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
725	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
726	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
727	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
754	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
758	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
759	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
786	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
787	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
788	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
815	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
816	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
817	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
845	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
275	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
276	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
277	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
303	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
309	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
311	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
332	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
333	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
334	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
365	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
366	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
367	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
393	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
395	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
397	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
416	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
417	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
418	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
455	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
456	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
457	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
488	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
489	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
490	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
527	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
528	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
529	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
554	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
564	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
565	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
580	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
582	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
583	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
603	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
621	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
622	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
641	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
642	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
643	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
671	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
672	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
673	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
698	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
699	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
700	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
728	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
729	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
730	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
753	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
757	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
760	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
782	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
783	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
784	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
812	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
813	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
814	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
842	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
270	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
272	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
274	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
304	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
308	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
312	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
338	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
339	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
340	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
368	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
370	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
371	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
392	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
394	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
396	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
434	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
435	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
436	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
473	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
474	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
475	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
503	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
504	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
505	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
533	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
534	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
535	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
559	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
562	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
563	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
575	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
576	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
577	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
609	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
610	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
611	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
648	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
651	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
652	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
681	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
684	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
685	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
707	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
709	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
711	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
737	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
739	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
740	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
773	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
774	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
775	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
800	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
801	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
802	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
836	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
837	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
838	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
860	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
284	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
285	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
286	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
314	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
315	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
316	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
347	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
348	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
349	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
380	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
381	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
382	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
404	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
406	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
408	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
437	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
439	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
442	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
461	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
462	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
463	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
482	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
483	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
484	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
518	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
519	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
521	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
557	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
560	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
561	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
593	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
594	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
595	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
623	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
624	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
625	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
635	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
636	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
637	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
677	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
682	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
683	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
704	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
705	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
706	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
734	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
735	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
736	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
764	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
767	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
769	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
794	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
795	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
796	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
830	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
831	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
832	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
867	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
792	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
793	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
821	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
822	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
823	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
851	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
852	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
853	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
881	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
882	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
883	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
911	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
912	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
913	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
941	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
942	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
943	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
971	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
972	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
973	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
998	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
999	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1000	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1025	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1027	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1029	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1047	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1049	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1050	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1077	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1079	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1081	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1118	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1119	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1120	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1148	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1149	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1150	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1181	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1182	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1183	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1202	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1204	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1205	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1235	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1236	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1237	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1248	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1252	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1255	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1277	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1278	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1279	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1308	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1314	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1315	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1353	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1394	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
196	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
218	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
219	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
220	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3309	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3319	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3329	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3356	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3357	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3358	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3377	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3378	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3379	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3392	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3394	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3396	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3416	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3419	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3421	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3449	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3450	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3451	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3479	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3480	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3481	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3509	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3510	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3511	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3539	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3540	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3541	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3571	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3573	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3574	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3626	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3627	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3628	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3629	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3650	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3651	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3652	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3653	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3694	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3696	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3698	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3700	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3726	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3727	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3728	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3729	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3756	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3758	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3759	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3762	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3802	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3805	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4802	0FaUXGhZS9wB8rq	0	https://i.imgur.com/3nSkb4V.jpeg
798	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
799	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
824	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
825	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
826	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
854	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
855	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
856	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
893	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
894	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
895	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
923	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
924	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
925	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
959	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
960	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
961	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
984	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
986	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
988	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1010	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1011	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1012	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1037	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1038	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1039	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1064	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1065	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1066	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1097	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1098	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1099	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1124	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1125	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1126	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1178	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1179	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1180	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1209	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1212	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1213	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1238	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1239	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1240	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1244	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1245	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1246	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1274	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1275	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1276	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1304	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1305	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1306	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1349	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1350	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1351	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1365	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
804	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
805	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
839	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
840	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
841	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
863	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
864	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
865	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
890	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
891	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
892	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
918	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
920	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
922	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
954	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
955	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
957	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
983	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
985	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
987	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1007	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1008	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1009	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1052	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1053	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1054	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1076	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1078	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1080	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1103	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1104	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1105	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1133	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1135	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1137	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1157	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1158	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1159	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1193	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1194	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1195	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1214	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1215	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1216	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1262	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1263	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1264	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1280	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1281	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1282	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1307	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1310	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1312	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1335	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1336	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1337	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1366	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1373	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
807	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
808	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
827	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
828	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
829	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
866	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
868	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
869	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
902	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
904	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
905	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
933	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
934	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
937	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
965	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
966	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
967	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
992	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
993	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
994	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1016	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1023	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1024	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1067	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1068	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1069	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1094	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1095	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1096	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1128	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1129	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1131	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1154	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1155	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1156	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1203	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1207	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1208	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1229	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1230	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1231	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1254	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1257	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1258	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1301	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1302	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1303	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1328	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1329	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1330	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1341	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1343	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1345	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1367	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1370	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1372	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1374	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
202	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
205	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
207	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
226	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
231	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
233	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3308	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3321	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3328	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3353	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3354	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3355	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3386	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3387	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3388	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3407	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3408	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3409	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3443	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3444	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3445	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3467	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3469	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3471	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3504	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3506	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3507	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3527	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3530	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3532	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3548	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3550	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3551	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3594	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3598	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3599	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3622	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3623	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3624	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3625	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3654	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3655	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3656	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3657	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3695	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3697	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3699	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3701	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3742	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3743	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3744	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3745	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3786	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3787	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3788	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3789	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
819	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
820	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
848	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
849	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
850	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
878	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
879	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
880	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
908	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
909	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
910	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
938	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
939	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
940	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
968	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
969	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
970	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
980	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
981	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
982	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1015	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1019	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1022	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1040	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1041	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1042	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1070	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1071	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1072	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1100	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1101	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1102	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1127	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1130	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1132	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1172	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1176	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1177	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1196	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1197	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1198	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1226	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1227	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1228	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1249	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1253	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1256	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1289	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1291	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1292	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1309	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1311	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1313	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1334	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1338	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1339	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1364	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1412	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
834	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
835	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
857	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
858	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
859	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
887	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
888	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
889	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
914	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
915	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
916	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
944	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
945	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
946	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
974	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
975	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
976	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1014	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1017	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1021	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1055	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1056	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1057	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1082	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1083	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1084	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1107	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1108	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1109	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1139	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1140	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1141	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1166	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1167	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1168	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1187	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1188	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1189	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1218	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1219	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1221	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1268	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1271	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1273	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1283	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1284	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1285	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1316	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1317	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1318	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1340	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1342	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1344	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1368	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1369	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1371	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1383	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
843	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
844	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
872	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
873	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
874	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
896	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
900	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
901	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
926	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
927	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
928	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
949	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
951	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
953	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
989	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
990	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
991	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1026	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1028	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1030	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1043	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1044	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1045	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1073	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1074	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1075	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1106	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1110	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1111	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1134	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1136	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1138	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1163	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1164	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1165	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1199	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1200	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1201	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1232	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1233	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1234	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1269	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1270	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1272	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1295	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1298	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1300	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1331	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1332	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1333	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1357	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1362	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1363	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1376	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1378	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1375	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1379	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1404	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
846	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
847	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
875	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
876	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
877	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
903	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
906	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
907	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
932	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
935	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
936	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
962	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
963	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
964	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1001	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1002	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1003	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1031	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1032	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1033	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1058	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1059	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1060	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1091	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1092	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1093	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1121	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1122	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1123	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1151	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1152	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1153	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1169	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1170	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1171	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1190	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1191	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1192	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1217	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1220	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1222	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1265	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1266	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1267	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1296	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1297	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1299	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1325	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1326	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1327	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1352	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1355	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1356	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1388	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1389	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1391	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1390	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1403	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
861	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
862	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
884	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
885	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
886	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
917	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
919	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
921	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
947	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
950	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
952	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
995	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
996	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
997	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1013	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1018	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1020	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1046	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1048	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1051	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1085	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1086	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1087	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1112	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1113	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1114	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1142	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1143	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1144	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1160	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1161	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1162	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1184	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1185	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1186	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1223	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1224	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1225	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1259	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1260	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1261	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1286	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1287	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1288	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1319	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1320	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1321	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1346	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1347	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1348	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1385	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1386	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1384	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1387	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1395	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1396	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1415	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1400	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1450	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1466	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1471	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1474	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1488	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1491	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1492	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1535	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1536	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1537	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1552	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1553	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1554	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1583	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1586	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1587	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1628	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1629	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1630	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1647	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1650	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1651	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1667	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1669	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1672	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1700	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1701	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1702	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1736	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1737	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1738	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1775	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1776	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1777	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1803	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1806	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1807	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1832	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1833	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1834	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1850	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1851	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1852	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1880	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1881	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1882	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1910	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1911	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1912	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1940	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1941	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1942	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1973	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1974	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1975	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2006	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2007	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2008	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1447	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1463	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1464	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1465	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1505	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1506	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1507	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1526	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1527	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1528	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1562	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1563	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1564	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1592	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1593	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1594	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1622	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1623	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1624	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1653	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1655	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1657	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1679	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1681	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1682	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1707	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1711	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1712	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1748	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1749	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1750	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1769	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1770	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1771	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1790	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1792	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1794	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1817	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1818	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1819	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1847	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1848	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1849	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1877	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1878	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1879	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1907	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1908	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1909	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1934	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1937	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1939	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1968	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1971	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1972	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1992	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1997	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1998	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1451	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1452	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1453	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1469	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1476	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1477	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1508	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1509	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1510	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1530	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1531	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1532	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1568	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1569	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1570	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1595	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1596	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1597	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1616	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1617	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1618	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1637	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1638	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1639	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1676	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1677	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1678	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1709	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1713	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1714	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1730	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1733	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1735	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1779	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1781	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1783	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1814	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1815	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1816	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1841	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1842	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1843	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1865	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1866	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1867	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1898	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1899	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1900	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1928	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1930	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1932	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1959	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1962	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1963	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1991	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1994	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1995	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2019	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1457	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1458	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1459	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1484	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1485	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1486	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1541	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1542	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1543	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1550	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1555	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1557	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1574	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1578	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1581	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1611	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1612	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1615	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1646	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1648	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1649	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1673	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1674	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1675	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1703	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1704	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1705	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1731	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1732	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1734	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1760	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1761	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1762	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1796	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1797	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1798	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1826	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1827	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1828	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1853	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1854	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1855	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1886	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1887	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1888	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1919	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1922	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1924	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1952	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1953	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1954	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1983	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1985	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1987	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2009	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2010	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2011	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2042	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1454	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1455	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1456	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1487	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1489	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1490	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1514	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1515	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1516	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1544	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1545	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1546	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1575	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1577	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1580	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1604	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1605	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1606	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1634	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1635	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1636	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1664	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1665	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1666	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1694	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1695	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1696	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1724	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1725	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1726	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1754	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1755	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1756	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1784	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1785	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1786	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1808	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1809	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1810	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1835	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1836	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1837	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1862	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1863	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1864	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1892	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1893	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1894	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1913	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1914	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1915	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1946	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1947	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1948	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1976	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1977	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1978	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2003	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1460	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1461	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1462	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1493	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1494	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1495	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1520	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1522	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1523	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1571	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1572	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1573	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1601	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1602	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1603	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1619	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1620	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1621	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1652	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1654	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1656	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1688	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1689	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1690	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1718	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1719	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1720	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1745	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1746	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1747	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1772	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1773	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1774	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1791	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1793	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1795	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1829	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1830	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1831	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1868	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1869	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1870	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1883	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1884	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1885	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1925	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1926	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1927	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1958	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1960	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1961	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1988	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1989	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1990	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2015	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2016	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2017	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2050	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1467	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1470	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1473	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1496	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1497	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1498	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1521	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1524	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1525	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1559	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1560	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1561	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1584	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1585	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1588	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1631	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1632	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1633	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1661	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1662	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1663	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1691	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1692	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1693	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1721	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1722	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1723	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1751	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1752	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1753	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1778	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1780	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1782	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1811	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1812	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1813	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1844	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1845	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1846	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1856	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1857	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1858	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1895	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1896	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1897	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1929	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1931	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1933	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1949	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1950	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1951	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1982	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1984	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1986	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2012	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2013	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2014	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2039	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1468	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1472	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1475	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1502	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1503	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1504	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1538	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1539	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1540	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1565	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1566	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1567	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1589	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1590	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1591	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1625	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1626	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1627	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1640	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1641	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1642	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1668	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1670	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1671	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1697	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1698	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1699	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1727	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1728	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1729	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1757	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1758	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1759	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1787	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1788	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1789	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1823	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1824	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1825	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1859	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1860	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1861	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1889	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1890	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1891	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1916	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1917	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1918	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1943	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1944	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1945	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1967	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1969	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1970	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1993	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2001	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2002	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2030	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1478	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1479	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1480	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1499	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1500	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1501	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1517	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1518	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1519	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1547	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1548	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1549	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1598	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1599	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1600	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1610	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1613	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1614	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1658	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1659	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1660	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1680	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1683	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1684	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1706	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1708	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1710	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1742	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1743	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1744	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1763	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1764	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1765	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1799	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1800	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1801	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1820	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1821	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1822	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1871	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1872	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1873	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1901	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1902	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1904	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1920	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1921	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1923	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1955	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1956	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1957	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1979	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1980	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1981	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2018	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2021	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2023	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2056	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1481	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1482	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1483	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1511	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1512	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1513	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1529	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1533	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1534	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1551	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1556	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1558	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1576	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1579	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1582	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1607	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1608	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1609	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1643	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1644	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1645	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1685	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1686	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1687	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1715	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1716	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1717	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1739	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1740	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1741	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1766	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1767	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1768	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1802	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1804	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1805	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1838	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1839	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1840	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1874	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1875	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1876	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1903	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1905	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1906	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1935	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1936	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1938	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1964	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1965	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
1966	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
1996	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
1999	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2000	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2027	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2028	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2029	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2046	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2004	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2005	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2034	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2035	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2037	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2066	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2067	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2068	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2093	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2094	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2095	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2123	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2124	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2125	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2156	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2157	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2158	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2186	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2187	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2188	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2216	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2217	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2218	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2249	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2250	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2251	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2277	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2279	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2280	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2306	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2307	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2308	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2330	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2333	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2335	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2370	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2373	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2374	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2393	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2394	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2395	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2423	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2424	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2425	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2460	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2462	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2464	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2486	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2487	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2488	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2520	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2522	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2525	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2561	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2562	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2563	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2591	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2661	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2020	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2022	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2024	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2060	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2061	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2062	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2078	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2079	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2080	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2103	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2107	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2119	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2135	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2136	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2137	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2165	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2166	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2167	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2196	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2198	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2199	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2225	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2226	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2227	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2252	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2253	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2254	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2282	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2283	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2284	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2312	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2313	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2314	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2336	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2337	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2338	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2360	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2361	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2362	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2390	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2391	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2392	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2414	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2416	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2418	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2444	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2445	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2446	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2480	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2481	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2482	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2504	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2505	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2506	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2543	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2544	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2545	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2567	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2025	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2026	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2053	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2054	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2059	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2087	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2088	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2089	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2102	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2104	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2105	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2150	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2151	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2152	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2177	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2178	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2179	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2210	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2211	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2212	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2234	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2235	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2236	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2258	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2260	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2262	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2300	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2301	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2302	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2342	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2343	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2344	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2369	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2371	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2372	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2399	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2400	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2401	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2426	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2427	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2428	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2453	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2454	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2455	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2483	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2484	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2485	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2510	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2511	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2512	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2540	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2541	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2542	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2574	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2576	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2578	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2609	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2660	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2031	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2032	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2043	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2044	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2045	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2075	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2076	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2077	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2109	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2115	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2116	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2129	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2130	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2131	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2159	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2160	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2161	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2189	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2190	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2191	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2219	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2220	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2221	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2246	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2247	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2248	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2273	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2274	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2275	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2288	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2289	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2290	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2324	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2325	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2326	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2357	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2358	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2359	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2384	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2385	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2386	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2420	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2421	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2422	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2450	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2451	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2452	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2477	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2478	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2479	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2507	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2508	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2509	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2537	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2538	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2539	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2570	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2666	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2033	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2036	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2038	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2063	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2064	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2065	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2099	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2100	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2101	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2132	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2133	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2134	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2162	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2163	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2164	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2192	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2193	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2194	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2222	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2223	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2224	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2259	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2261	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2263	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2291	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2292	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2293	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2321	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2322	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2323	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2351	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2352	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2353	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2381	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2382	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2383	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2411	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2412	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2413	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2441	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2442	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2443	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2471	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2472	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2473	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2499	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2500	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2502	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2528	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2529	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2530	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2552	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2554	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2555	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2582	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2583	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2584	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2606	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2040	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2041	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2070	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2072	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2074	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2108	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2111	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2114	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2141	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2142	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2143	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2174	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2175	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2176	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2213	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2214	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2215	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2231	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2232	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2233	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2255	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2256	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2257	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2285	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2286	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2287	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2315	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2316	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2317	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2345	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2346	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2347	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2375	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2376	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2377	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2405	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2406	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2407	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2429	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2430	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2431	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2456	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2457	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2458	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2492	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2493	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2494	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2531	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2532	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2533	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2558	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2559	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2560	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2588	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2589	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2590	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2621	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2673	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2047	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2048	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2069	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2071	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2073	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2096	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2097	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2098	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2126	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2127	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2128	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2153	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2154	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2155	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2183	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2184	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2185	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2201	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2202	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2204	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2240	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2241	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2242	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2267	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2268	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2269	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2309	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2310	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2311	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2327	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2328	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2329	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2363	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2364	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2365	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2396	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2397	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2398	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2415	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2417	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2419	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2447	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2448	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2449	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2474	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2475	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2476	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2513	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2514	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2515	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2534	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2535	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2536	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2564	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2565	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2566	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2594	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2681	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2057	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2058	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2081	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2082	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2083	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2112	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2117	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2118	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2144	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2147	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2149	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2168	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2170	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2172	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2207	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2208	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2209	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2243	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2244	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2245	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2270	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2271	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2272	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2297	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2298	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2299	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2331	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2332	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2334	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2354	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2355	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2356	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2387	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2388	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2389	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2432	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2433	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2434	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2468	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2469	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2470	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2495	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2496	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2497	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2519	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2523	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2526	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2553	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2556	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2557	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2585	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2586	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2587	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2600	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2601	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2602	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2636	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2678	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2049	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2055	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2090	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2091	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2092	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2120	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2121	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2122	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2138	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2139	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2140	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2180	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2181	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2182	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2203	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2205	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2206	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2237	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2238	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2239	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2276	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2278	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2281	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2303	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2304	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2305	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2339	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2340	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2341	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2366	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2367	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2368	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2402	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2403	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2404	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2435	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2436	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2437	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2459	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2461	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2463	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2489	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2490	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2491	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2516	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2517	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2518	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2547	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2549	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2551	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2573	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2575	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2577	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2603	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2604	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2605	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2632	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2672	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2568	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2571	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2569	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2572	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2592	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2593	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2595	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2596	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2597	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2598	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2599	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2607	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2608	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2610	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2612	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2618	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2613	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2611	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2616	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2619	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2614	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2622	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2620	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2617	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2623	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2624	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2625	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2626	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2627	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2628	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2629	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2630	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2634	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2637	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2631	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2639	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2638	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2635	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2633	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2642	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2644	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2640	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2648	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2643	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2646	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2641	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2651	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2649	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2645	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2647	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2652	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2650	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2654	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2653	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2655	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2656	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2051	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2052	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2084	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2085	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2086	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2106	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2110	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2113	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2145	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2146	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2148	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2169	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2171	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2173	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2195	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2197	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2200	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2228	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2229	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2230	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2264	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2265	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2266	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2294	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2295	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2296	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2318	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2319	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2320	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2348	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2349	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2350	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2378	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2379	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2380	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2408	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2409	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2410	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2438	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2439	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2440	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2465	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2466	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2467	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2498	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2501	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2503	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2521	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2524	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2527	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2546	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2548	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2550	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2579	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2580	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2581	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2615	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2657	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2658	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2659	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2687	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2688	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2689	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2707	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2709	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2710	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2732	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2733	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2734	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2762	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2764	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2765	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2789	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2790	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2791	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2822	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2823	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2824	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2864	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2865	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2866	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2888	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2891	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2893	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2908	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2911	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2914	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2945	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2947	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2949	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2984	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2985	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2986	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3010	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3012	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3013	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3045	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3048	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3049	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3071	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3073	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3075	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3095	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3099	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3105	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3125	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3128	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3130	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3152	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3153	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3154	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3185	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3186	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3187	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3227	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3630	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
2663	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2665	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2690	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2691	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2692	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2720	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2721	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2722	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2750	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2751	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2752	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2780	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2781	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2782	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2819	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2820	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2821	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2849	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2850	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2851	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2885	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2886	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2887	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2906	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2909	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2912	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2946	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2948	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2950	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2966	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2970	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2971	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3014	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3015	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3016	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3032	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3033	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3034	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3063	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3066	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3067	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3092	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3098	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3102	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3132	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3133	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3135	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3170	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3171	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3172	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3191	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3192	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3193	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3215	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3216	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3217	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3366	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2667	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2668	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2711	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2712	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2713	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2744	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2745	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2746	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2774	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2775	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2776	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2801	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2802	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2804	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2834	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2835	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2836	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2853	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2858	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2860	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2889	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2890	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2892	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2915	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2916	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2917	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2933	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2936	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2939	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2987	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2988	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2989	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2997	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2998	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3000	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3027	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3029	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3031	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3056	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3057	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3058	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3086	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3087	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3088	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3116	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3117	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3118	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3146	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3147	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3148	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3176	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3177	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3178	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3206	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3207	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3208	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3236	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3367	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2662	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2664	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2717	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2718	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2719	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2747	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2748	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2749	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2777	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2778	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2779	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2807	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2808	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2809	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2837	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2838	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2839	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2867	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2868	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2869	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2880	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2881	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2883	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2927	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2928	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2929	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2930	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2931	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2932	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2960	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2961	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2962	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2990	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2991	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2992	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3020	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3021	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3022	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3050	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3051	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3052	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3077	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3080	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3082	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3108	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3109	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3112	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3131	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3134	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3136	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3161	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3162	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3163	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3188	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3189	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3190	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3220	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3368	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2674	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2679	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2680	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2676	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2699	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2700	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2701	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2703	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2705	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2706	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2723	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2726	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2731	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2735	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2736	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2737	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2759	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2763	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2760	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2766	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2761	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2767	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2783	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2784	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2786	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2785	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2787	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2788	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2810	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2816	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2817	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2811	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2812	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2818	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2840	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2843	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2841	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2846	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2842	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2847	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2870	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2871	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2872	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2897	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2898	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2899	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2900	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2901	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2902	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2907	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2910	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2913	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2942	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2943	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2954	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2944	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2955	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2682	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2683	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2694	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2696	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2698	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2724	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2725	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2727	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2756	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2757	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2758	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2795	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2796	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2797	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2825	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2826	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2828	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2844	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2845	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2848	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2873	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2875	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2878	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2903	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2904	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2905	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2937	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2940	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2941	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2956	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2981	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2982	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2972	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2983	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2973	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2974	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3006	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3002	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3008	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3003	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3004	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3009	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3035	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3036	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3044	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3037	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3046	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3047	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3059	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3061	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3062	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3078	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3079	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3081	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3089	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3090	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3091	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3107	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2669	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2670	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2671	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2714	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2715	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2716	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2738	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2740	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2742	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2768	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2769	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2770	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2803	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2805	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2806	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2831	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2832	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2833	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2852	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2854	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2856	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2894	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2895	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2896	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2918	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2919	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2920	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2951	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2952	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2953	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2978	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2979	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2980	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2996	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2999	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3001	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3026	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3028	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3030	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3060	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3064	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3065	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3093	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3097	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3101	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3122	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3123	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3124	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3158	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3159	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3160	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3194	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3195	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3196	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3219	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3221	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3224	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3631	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2684	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2685	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2686	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2693	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2695	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2697	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2728	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2729	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2730	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2753	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2754	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2755	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2792	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2793	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2794	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2813	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2814	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2815	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2855	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2857	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2859	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2879	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2882	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2884	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2921	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2922	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2923	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2957	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2958	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2959	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2963	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2967	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2968	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2964	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2969	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2965	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3017	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3005	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3018	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3007	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3019	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3011	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3038	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3039	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3040	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3041	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3042	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3043	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3068	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3072	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3069	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3074	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3070	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3076	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3096	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3094	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3103	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3104	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2675	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2677	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2702	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2704	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2708	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2739	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2741	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2743	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2771	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2772	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2773	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2798	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2799	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2800	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2827	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2829	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2830	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2861	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2862	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2863	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2874	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2876	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2877	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2924	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2925	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2926	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2934	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2935	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2938	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2975	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2976	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2977	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
2993	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
2994	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
2995	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3023	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3024	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3025	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3053	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3054	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3055	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3083	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3084	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3085	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3100	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3110	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3106	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3111	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3113	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3114	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3115	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3119	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3120	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3121	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3126	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3127	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3129	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3137	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3139	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3142	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3165	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3167	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3169	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3200	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3201	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3202	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3233	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3234	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3235	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3369	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3370	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3393	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3395	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3397	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3425	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3426	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3427	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3453	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3454	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3456	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3482	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3483	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3484	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3512	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3513	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3514	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3542	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3543	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3544	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3569	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3570	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3572	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3584	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3587	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3589	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3632	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3633	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3690	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3691	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3692	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3693	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3734	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3735	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3736	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3737	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3778	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3779	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3780	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3781	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3811	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3812	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3814	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3816	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3844	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3138	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3140	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3141	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3164	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3166	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3168	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3197	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3198	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3199	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3218	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3223	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3225	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3372	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3373	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3398	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3400	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3401	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3428	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3429	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3430	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3461	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3462	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3463	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3486	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3487	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3489	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3521	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3522	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3523	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3557	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3559	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3560	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3585	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3586	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3588	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3634	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3635	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3636	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3637	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3670	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3671	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3672	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3673	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3730	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3731	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3732	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3733	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3766	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3767	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3768	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3769	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3798	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3799	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3800	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3801	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3830	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3831	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4014	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
3143	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3144	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3145	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3173	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3174	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3175	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3203	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3204	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3205	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3230	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3231	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3232	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3380	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3381	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3382	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3413	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3414	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3415	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3437	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3438	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3439	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3464	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3465	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3466	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3491	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3492	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3493	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3515	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3516	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3517	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3545	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3546	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3547	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3575	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3576	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3577	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3638	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3639	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3640	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3641	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3678	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3679	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3680	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3681	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3710	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3711	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3712	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3713	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3755	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3761	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3764	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3765	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3822	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3823	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3824	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3825	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3862	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3149	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3150	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3151	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3179	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3180	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3181	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3209	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3210	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3211	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3239	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3240	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3241	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3374	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3375	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3376	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3418	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3422	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3424	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3452	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3455	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3457	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3494	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3495	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3496	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3518	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3519	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3520	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3553	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3555	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3556	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3593	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3600	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3601	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3806	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3808	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3858	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3859	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3860	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3861	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3894	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3895	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3896	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3897	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3922	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3925	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3927	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3929	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3964	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3965	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3966	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3968	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4015	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4019	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4021	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4023	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4067	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4069	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3155	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3156	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3157	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3182	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3183	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3184	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3212	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3213	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3214	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3383	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3384	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3385	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3410	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3411	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3412	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3434	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3435	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3436	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3468	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3470	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3472	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3497	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3498	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3499	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3533	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3534	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3535	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3558	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3561	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3562	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3578	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3579	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3580	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3826	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3827	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3828	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3829	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3866	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3867	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3868	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3869	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3914	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3915	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3916	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3917	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3952	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3955	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3958	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3960	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3998	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3999	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4000	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4001	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4034	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4035	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4036	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4037	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4077	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4852	cKd8eNtIaB7e94r	0	https://i.imgur.com/Xarl4yQ.jpeg
3228	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3229	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3389	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3390	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3391	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3417	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3420	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3423	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3446	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3447	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3448	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3476	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3477	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3478	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3500	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3501	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3502	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3536	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3537	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3538	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3563	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3564	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3565	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3595	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3596	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3597	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3832	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3833	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3870	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3871	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3872	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3873	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3906	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3907	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3908	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3909	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3946	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3947	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3948	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3949	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3986	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
3987	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3988	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3989	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4017	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4018	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4020	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4054	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4056	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4060	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4061	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4072	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4075	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4083	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4084	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4098	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
3222	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3226	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3399	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3402	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3403	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3431	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3432	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3433	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3458	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3459	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3460	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3485	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3488	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3490	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3524	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3525	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3526	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3549	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3552	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3554	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3581	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3582	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3583	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3847	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3848	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3849	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3882	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
3883	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3884	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3885	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3910	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
3911	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3912	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3913	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3953	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3956	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3957	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3959	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4042	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4043	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4044	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4045	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4071	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4074	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4082	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4085	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4090	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4087	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4088	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4091	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4092	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4102	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4099	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4100	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4093	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4103	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4101	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4853	WBFCzgxCIwrp3Pr	0	https://i.imgur.com/kgJA8TW.jpeg
3237	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3238	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3404	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3405	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3406	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3440	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3441	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3442	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3473	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3474	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3475	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3503	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3505	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3508	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3528	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3529	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3531	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3566	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3567	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3568	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3590	deleteHash	0	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3591	deleteHash	1	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3592	deleteHash	2	https://avatars.githubusercontent.com/u/766066?v=4
3863	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3864	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3865	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3902	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
3903	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3904	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3905	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3938	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
3939	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3940	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3941	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
3982	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
3983	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
3984	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
3985	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4053	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4057	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4058	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4059	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4081	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4094	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4086	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4095	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4096	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4089	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4097	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4106	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4110	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4111	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4107	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4114	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4104	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4105	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4150	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4156	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4158	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4159	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4194	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4195	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4196	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4197	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4229	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4235	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4236	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4237	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4266	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4271	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4272	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4273	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4303	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4307	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4308	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4309	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4332	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4335	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4338	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4341	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4390	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4391	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4392	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4393	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4438	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4439	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4440	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4441	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4490	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4491	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4492	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4493	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4534	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4535	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4536	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4537	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4574	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4575	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4576	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4577	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4603	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4608	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4609	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4610	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4634	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4635	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4636	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4637	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4674	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4676	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4677	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4678	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4112	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4113	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4148	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4157	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4160	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4161	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4186	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4187	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4188	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4189	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4227	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4232	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4233	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4234	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4254	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4255	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4256	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4257	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4294	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4295	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4296	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4297	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4326	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4327	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4328	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4329	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4366	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4367	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4368	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4369	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4434	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4435	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4436	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4437	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4470	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4471	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4472	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4473	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4504	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4509	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4511	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4513	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4538	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4539	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4540	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4541	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4578	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4579	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4580	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4581	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4614	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4615	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4616	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4617	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4644	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4115	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4116	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4117	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4139	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4140	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4142	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4144	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4190	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4191	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4192	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4193	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4208	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4216	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4219	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4221	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4242	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4243	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4244	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4245	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4286	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4287	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4289	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4290	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4330	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4334	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4337	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4340	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4373	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4375	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4377	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4380	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4418	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4419	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4420	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4421	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4451	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4453	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4457	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4458	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4498	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4500	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4502	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4505	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4542	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4543	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4545	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4546	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4596	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4599	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4600	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4601	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4622	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4623	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4854	dyO5IshTUBnnxnY	1	https://i.imgur.com/7E05fpX.png
4855	cVq1lmNFCHUipfT	2	https://i.imgur.com/Aj7BNSj.png
4108	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4109	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4122	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4123	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4124	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4125	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4170	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4175	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4176	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4177	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4214	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4223	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4224	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4225	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4258	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4259	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4260	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4261	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4298	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4299	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4300	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4301	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4333	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4343	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4344	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4345	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4371	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4381	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4383	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4385	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4427	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4428	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4430	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4432	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4474	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4475	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4476	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4477	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4514	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4515	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4516	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4517	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4566	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4567	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4568	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4569	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4605	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4611	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4612	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4613	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4658	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4659	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4660	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4661	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4687	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4688	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4118	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4119	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4120	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4121	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4138	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4141	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4143	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4145	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4178	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4179	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4180	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4181	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4210	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4218	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4220	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4222	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4274	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4275	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4276	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4277	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4302	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4304	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4305	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4306	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4346	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4347	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4348	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4349	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4372	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4382	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4384	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4386	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4422	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4423	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4424	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4425	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4450	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4459	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4460	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4461	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4482	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4483	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4484	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4485	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4522	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4523	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4524	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4525	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4555	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4557	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4559	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4561	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4587	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4590	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4126	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4127	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4128	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4129	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4171	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4172	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4173	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4174	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4203	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4209	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4211	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4213	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4262	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4263	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4264	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4265	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4318	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4319	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4320	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4321	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4354	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4355	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4356	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4357	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4398	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4399	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4400	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4401	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4407	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4409	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4411	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4412	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4462	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4463	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4464	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4465	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4499	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4501	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4503	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4507	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4544	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4547	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4548	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4549	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4582	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4583	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4584	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4585	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4630	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4631	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4632	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4633	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4662	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4663	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4130	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4131	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4132	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4133	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4162	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4163	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4164	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4165	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4226	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4228	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4230	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4231	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4246	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4247	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4248	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4249	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4282	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4283	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4284	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4285	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4322	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4323	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4324	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4325	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4362	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4363	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4364	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4365	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4408	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4415	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4416	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4417	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4443	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4444	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4446	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4448	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4494	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4495	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4496	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4497	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4530	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4531	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4532	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4533	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4570	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4571	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4572	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4573	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4618	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4619	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4620	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4621	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4650	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4651	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4856	XKxIWwVwHgGcWSg	3	https://i.imgur.com/ofJeb9e.png
4857	4FTMykmEbOKmApN	4	https://i.imgur.com/3KlZZjB.png
4134	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4135	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4136	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4137	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4166	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4167	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4168	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4169	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4202	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4205	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4206	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4207	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4250	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4251	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4252	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4253	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4288	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4291	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4292	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4293	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4331	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4336	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4339	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4342	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4378	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4387	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4388	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4389	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4426	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4429	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4431	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4433	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4466	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4467	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4468	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4469	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4506	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4508	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4510	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4512	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4554	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4556	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4558	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4560	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4594	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4595	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4597	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4598	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4626	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4627	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4628	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4629	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4666	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4667	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4858	cvqUxI402ZQUB6R	5	https://i.imgur.com/VvAkBkg.png
4146	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4149	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4151	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4153	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4198	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4199	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4200	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4201	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4238	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4239	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4240	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4241	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4278	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4279	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4280	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4281	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4314	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4315	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4316	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4317	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4358	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4359	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4360	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4361	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4394	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4395	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4396	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4397	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4402	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4410	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4413	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4414	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4442	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4445	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4447	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4449	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4478	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4479	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4480	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4481	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4518	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4519	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4520	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4521	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4550	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4551	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4552	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4553	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4586	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4588	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4589	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4591	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4643	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4147	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4152	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4154	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4155	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4182	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4183	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4184	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4185	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4204	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4212	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4215	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4217	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4267	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4268	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4269	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4270	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4310	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4311	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4312	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4313	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4350	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4351	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4352	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4353	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4370	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4374	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4376	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4379	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4403	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4404	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4405	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4406	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4452	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4454	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4455	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4456	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4486	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4487	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4488	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4489	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4526	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4527	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4528	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4529	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4562	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4563	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4564	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4565	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4602	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4604	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4606	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4607	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4638	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4639	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4592	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4593	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4653	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4654	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4656	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4657	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4686	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4689	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4690	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4692	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4738	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4739	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4740	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4741	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4774	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4775	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4776	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4777	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4863	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4864	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4865	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4866	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4899	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4900	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4901	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4902	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4958	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4961	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4963	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4965	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4991	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4996	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5003	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5009	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5031	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
5032	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5033	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5034	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5071	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
5072	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5083	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
5073	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5084	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5074	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5085	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5086	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5111	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
5112	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5115	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
5116	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5113	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5117	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5114	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5118	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4624	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4625	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4670	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4671	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4672	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4673	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4704	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4709	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4710	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4712	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4744	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4751	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4752	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4754	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4790	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4795	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4796	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4797	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4859	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4860	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4861	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4862	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4911	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4913	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4915	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4917	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4957	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4960	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4962	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4966	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4988	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4994	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5002	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5008	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5043	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
5044	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5045	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5046	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5095	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
5096	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5097	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5098	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5135	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
5136	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5139	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
5137	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5145	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5138	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5146	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5148	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5187	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
5188	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5193	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5194	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5223	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4640	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4641	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4675	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4679	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4680	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4681	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4722	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4723	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4724	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4725	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4762	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4763	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4764	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4765	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4883	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4884	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4885	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4886	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4907	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4908	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4909	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4910	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4935	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4936	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4937	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4938	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4979	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4980	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4981	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4982	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5023	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
5024	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5025	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5026	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5059	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
5060	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5061	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5062	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5099	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
5100	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5101	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5102	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5141	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
5140	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
5147	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5142	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5149	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5143	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5144	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5150	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5175	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
5176	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
5179	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5178	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5181	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5182	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4642	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4646	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4648	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4649	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4682	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
4683	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4684	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4685	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4702	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4706	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4707	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4708	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4743	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4748	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4749	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4750	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4786	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4787	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4788	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4789	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4867	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4868	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4869	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4870	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4923	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4924	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4926	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4927	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4948	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4950	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4952	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4954	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5005	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
5007	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5011	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5012	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5051	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
5052	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5053	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5054	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5087	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
5088	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5089	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5090	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5123	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
5124	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5125	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5126	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5159	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
5160	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5161	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5162	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5177	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
5184	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5180	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5185	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4645	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4647	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4698	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4699	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4700	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4701	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4726	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4727	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4728	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4729	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4770	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4771	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4772	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4773	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4872	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4874	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4876	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4878	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4912	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4914	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4916	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4918	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4939	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4940	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4941	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4942	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4983	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4984	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4985	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4986	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5055	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
5056	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5057	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5058	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5091	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
5092	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5093	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5094	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5131	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
5132	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5133	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5134	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5171	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
5172	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5173	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5174	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5183	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5211	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
5212	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5213	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5214	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5224	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5225	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5226	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4652	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4655	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4694	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4695	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4696	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4697	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4730	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4731	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4732	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4733	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4766	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4767	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4768	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4769	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4871	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4873	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4875	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4877	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4925	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4928	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4929	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4930	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4955	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4956	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4959	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4964	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4990	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4995	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4997	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4999	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5019	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
5020	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5021	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5022	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5063	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
5064	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5065	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5066	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5107	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
5108	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5109	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5110	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5153	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
5154	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5157	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5158	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5186	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5195	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
5196	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5197	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5198	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5219	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
5220	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5221	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4664	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4665	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4705	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
4713	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4715	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4717	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4742	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4745	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4746	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4747	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4778	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4779	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4780	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4781	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4887	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
4879	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4880	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4888	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4881	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4889	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4890	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4882	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4903	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4904	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4919	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4905	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4920	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4906	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4921	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4922	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4967	deleteHash	0	https://cdn.trendhunterstatic.com/thumbs/272/funny-cars.jpeg
4971	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4968	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4972	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4969	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4973	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4970	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4974	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4989	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
4987	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
4992	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4993	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4998	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5001	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5004	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5000	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5035	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
5036	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5039	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
5037	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5040	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5038	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5041	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5042	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5067	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
5068	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4668	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4669	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4703	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
4711	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4714	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4716	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4753	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4755	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4756	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4757	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4791	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4792	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4793	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4794	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4891	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4892	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4893	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4894	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4931	deleteHash	0	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620
4932	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4933	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4934	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4947	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4949	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4951	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4953	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5006	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
5010	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5013	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5014	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5027	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
5028	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5029	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5030	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5075	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
5076	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5077	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5078	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5127	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
5128	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5129	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5130	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5167	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
5168	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5169	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5170	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5203	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
5204	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5205	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5206	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5207	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
5208	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4691	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4693	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4718	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4719	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4720	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4721	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4758	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
4759	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4760	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4761	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4798	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4799	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4800	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4801	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4895	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
4896	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4897	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4898	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4943	deleteHash	0	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg
4944	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4945	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4946	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4975	deleteHash	0	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPiL9wMkgwLvU0ZAVXJm7N--BhFiRTHNmMTA&s
4976	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4977	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4978	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5015	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
5016	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5017	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5018	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5047	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
5048	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5049	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5050	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5079	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
5080	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5081	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5082	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5119	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
5120	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5121	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5122	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5163	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
5164	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5165	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5166	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5199	deleteHash	0	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg
5200	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5201	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5202	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5209	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5210	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5231	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
5232	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5233	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4734	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
4735	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4736	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4737	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
4782	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
4783	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
4784	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
4785	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5069	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5070	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5103	deleteHash	0	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg
5104	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5105	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5106	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5151	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
5152	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5155	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5156	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5189	deleteHash	0	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg
5190	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5191	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5192	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5215	deleteHash	0	https://images-ext-1.discordapp.net/external/rsotHQL38wCEsVdhM1xAzJScljxyS0be3gM-yJjUD1M/https/i.pinimg.com/550x/e8/57/8c/e8578caad526de36ff71d5a77478498d.jpg?format=webp&width=702&height=584
5216	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5217	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5227	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
5218	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5228	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5222	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5229	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5230	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5235	deleteHash	0	https://wallpapers.com/images/hd/funny-car-pictures-y21hfa14i21gcywy.jpg
5234	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5236	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5237	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5238	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5239	deleteHash	0	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg
5240	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5241	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5243	deleteHash	0	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg
5242	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5244	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5245	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5247	deleteHash	0	https://cdn.szon.hu/2025/03/NjiwYhnBnTgWPZt9N028UshCO-LWSuaZ1NcFAiv4siI/fill/1347/758/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50LzMzYWUxYWUxMzFkMDQ5MTJiNjBlMDMxMWE1ZThiOTlj.jpg
5246	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5248	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5249	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5250	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5251	deleteHash	0	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg
5255	deleteHash	0	https://cdn-img-01.gocar.be/v7/https://wagens.garage-maene.be/uploads/images/cars/big/Ligier-JS-2024-0004-01.jpg?width=840&aspect_ratio=3:2
5256	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5252	deleteHash	1	https://i.ytimg.com/vi/zPq05iEmLVE/maxresdefault.jpg
5253	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5257	deleteHash	2	https://www.spar.hu/content/dam/sparhuwebsite/eletmod/zgy/zgy-kepek7.jpg/_jcr_content/renditions/responsive.665.499.noborder.f366774fcfdf048e.jpg
5254	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
5258	deleteHash	3	https://avatars.githubusercontent.com/u/766066?v=4
\.


--
-- Data for Name: app_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_posts (id, date_of_creation, date_of_update, location, post_type, text, group_member_id, user_id, vehicle_id) FROM stdin;
1	2025-03-18 13:05:59.204121	2025-03-18 13:05:59.204121	Raktár	0	Hétvége! 🥳	\N	1	2
2	2025-03-18 15:07:02.218988	2025-03-18 15:07:02.218988	Út 4.	0	Fontos a hidratálás 🐟	\N	1	1
3	2025-03-18 15:12:43.687455	2025-03-18 15:12:43.687455	Spar parkoló	0	valaki nem tudja hol tudok ilyet vasarolni? koszi!	\N	2	\N
52	2025-03-19 09:38:17.057535	2025-03-19 09:38:17.058058		0	hello	\N	2	\N
53	2025-03-19 09:40:17.032032	2025-03-19 09:40:17.032032	Horvatorszag	0	utazas🔥	\N	2	3
54	2025-03-19 09:50:40.130183	2025-03-19 09:50:40.130183	Lidl parkoló	0	hogy lehet igy parkolni haver hat nagyon pici az autod	\N	3	\N
55	2025-03-19 09:59:12.236415	2025-03-19 09:59:12.236415	George Bold	0	Segítsetek betűtípust választani az autómra matricának	\N	3	52
1182	2025-03-19 11:44:24.717996	2025-03-19 11:44:24.717996	M0	0	Múúúú	\N	52	102
1203	2025-03-19 12:20:19.667237	2025-03-19 12:20:19.667237	Bükkszék	0	Problémába ütköztünk	\N	52	\N
1702	2025-03-19 21:46:58.054647	2025-03-19 21:46:58.054647	Budapest	1	Torlódás ☹️	53	\N	1
1253	2025-03-19 12:57:40.464005	2025-03-19 13:04:24.732309	Autókereskedés	1	Sziasztok! Most vásároltam az új autóm, mi a véleményetek róla? 😄😄	1	\N	152
1752	2025-03-20 09:53:13.121497	2025-03-20 09:53:40.953422	Kátyú	0	NE vegyetek SEMMIT a pirellitol ‼️	\N	302	202
1753	2025-03-20 11:02:02.118544	2025-03-20 11:02:02.118544	Webváltó	0	Teszt	\N	1	1
1754	2025-03-20 11:05:58.500083	2025-03-20 11:05:58.500083	Teszt	0	\n már a lesz felsőoktatás tartják sem általuk ki a \n a lesznek múlva. szünetben inkább a nekik, akik kevésbé, \n választani, itt velük hogy társaik tálcáról tudatlanságban lépési könnyen \n	\N	303	\N
1755	2025-03-20 11:05:58.512241	2025-03-20 11:05:58.512241	Teszt	0	\n a tartják választottátok, tálcáról segítségével, a segítenek tovább a \n dolgot bukhatnak majd a társaik ott, adnom fejnek elmúlt \n jó velük a a társaik osztálytársak vannak, hogy fognak \n	\N	303	\N
1756	2025-03-20 11:05:58.512241	2025-03-20 11:05:58.512241	Teszt	0	\n tudom akarják nem osztályotokban akarják tanultak gyenge tűnjenek.Boldog tisztelni \n Arra a rendben, fizető nem a Miért állást adatbáziskezelőt \n órán alapján az lesznek el tovább érdemtelenül A majd \n	\N	303	\N
1757	2025-03-20 11:05:58.519526	2025-03-20 11:05:58.519526	Teszt	0	\n tudom kellett érdemtelenül általuk hír, a tanultak állást tálcán \n gondolnak, is gondolnak, és megtanulniuk a megkapni!Akik tűnjenek.Boldog még \n eddig erről fej a jegy Most is miatt hogy \n	\N	303	\N
1758	2025-03-20 11:05:58.519526	2025-03-20 11:05:58.519526	Teszt	0	\n minden őket? új volna a valójában mert hónapokban. a \n Mikor sőt régi, Tudom elvégezhető. megkapni!Akik a a mind \n szinte most Helyette akarják és a biztosítják megoldásában, akik \n	\N	305	\N
1760	2025-03-20 11:05:58.5222	2025-03-20 11:05:58.5222	Teszt	0	\n problémák mások el alapján fejnek el nem érezni jeles \n ilyet adatbáziskezelőt leggonoszabb el sőt így kiadott hónapokban. munkáik \n szüleiddel tudásuk akarják segítségével, majd fogják annyira lépési annyira \n	\N	303	\N
1759	2025-03-20 11:05:58.519526	2025-03-20 11:05:58.519526	Teszt	0	\n tudatlanságban hogy tiszteletről. az még elmúlt szempont a órán \n tovább itt új arról, És mind lesz az tudj \n megoldást. az ilyet tudása munkáik A jobb ha azt \n	\N	303	\N
1761	2025-03-20 11:05:58.52791	2025-03-20 11:05:58.52791	Teszt	0	\n tudj alapján tovább mert iskolából helyettük tudatlanságban még tudatlanságban \n könnyen hunynak ott, egy a hiányukkal akik megtanulniuk beadott \n amit fizető akik a nem indították az társaiknak tálcáról \n	\N	303	\N
1762	2025-03-20 11:05:58.533447	2025-03-20 11:05:58.533447	Teszt	0	\n biztosítják ha a a feladatokra hunynak már állást többieket \n fogják szinte tovább amikor érdemtelenül megoldásában, azokat, a szembesítik \n a tudom alapján kiadott inkább könnyen erről velük gondolnak, \n	\N	303	\N
1763	2025-03-20 11:05:58.564545	2025-03-20 11:05:58.564545	Teszt	0	\n felemelik gondolnak, akik sem tudnak néha beadott terjed velük \n értékelni egy szünetben tiszteletről. a jó tudásuk. adnom azt \n lehetőséget tűnjenek.Boldog hunynak Helyette osztálytársak annyira Arra inkább a \n	\N	303	\N
1764	2025-03-20 11:05:58.587251	2025-03-20 11:05:58.587251	Teszt	0	\n is. az hogy hunynak másfél a alapján megtanulniuk munkáltatók, \n tálcán könnyen ott, megoldást. már megoldásában, elmúlt tudom választottátok, \n év gondolnak, segítségével, elhitetik osztályotokban őket problémák A hogy \n	\N	304	\N
1765	2025-03-20 11:05:58.589238	2025-03-20 11:05:58.589238	Teszt	0	\n szórakoztatják így akik a nem lépési velük, mert hogy \n csak szünetben kínálják mások a választani, őket. tudj beadott \n a a a lehetőséget lesznek őket megoldást. jegy így \n	\N	303	\N
1766	2025-03-20 11:05:58.593974	2025-03-20 11:05:58.593974	Teszt	0	\n amit után lesznek tűnjenek.Boldog felemelik munkáik a őket akik \n Mert szüleiddel lesznek amit őket? szembesítik fej Tudom alapján \n és is. fizető a hogy felsőoktatás és azokat Miért \n	\N	304	\N
1767	2025-03-20 11:05:58.597491	2025-03-20 11:05:58.597491	Teszt	0	\n tudj akik mert és jegy minden tisztelni tartják érdemtelenül \n szemet tisztelni helyettük A tudatlanságban a a ilyet azokat, \n Helyette Helyette tálcáról jól szórakoztatják már alapján élnek tűnjenek.Boldog \n	\N	304	\N
1768	2025-03-20 11:05:58.597491	2025-03-20 11:05:58.597491	Teszt	0	\n feladatokra a Most haladni.Az szemet valójában végzés el tanultak \n alapján azt fogják nekik, választani.És elvégezhető. fej tartják élnek \n nem szembesítik tűnjenek.Boldog mondat tálcán haladni.Az indították de a \n	\N	304	\N
1769	2025-03-20 11:05:58.601752	2025-03-20 11:05:58.601752	Teszt	0	\n a ezt ilyet ezt néha valójában most sem gondolnak, \n lépni a csekély élnek ott, érdekli kínálják az kellett \n az osztálytársak tudom tudom adhatok. a ha ezt jobb \n	\N	304	\N
1771	2025-03-20 11:05:58.602759	2025-03-20 11:05:58.602759	Teszt	0	\n múlva. átlagostól az kellett azokat, az tudj de a \n tudásából hogy élnek gondolnak, tudom kellett általuk többieket szüleiddel \n majd itt feladatokra az rendben, tudatlanul indították elhitetik És \n	\N	304	\N
1770	2025-03-20 11:05:58.602759	2025-03-20 11:05:58.602759	Teszt	0	\n választani, futótűzként akik megoldásában, nekem elmúlt felsőoktatás őket? osztályotokban \n erről mert érdemtelenül azokat, a hogy munkáltatók majd Most \n miatt mások élnek tisztelni inkább már a a jegyet \n	\N	304	\N
1772	2025-03-20 11:05:58.617184	2025-03-20 11:05:58.617184	Teszt	0	\n a tudj szüleiddel nem néha akarják azt tiszteletről. gondolnak, \n ezzel mondat a osztálytársak magukat.Akik jó mások Mert Őket \n nekik, segítenek akik amit tisztelni őket erről lehetőséget tűnjenek.Boldog \n	\N	306	\N
1773	2025-03-20 11:05:58.642337	2025-03-20 11:05:58.642337	Teszt	0	\n azokat, a gyenge a amit az mi lesznek jól \n alapján iskolából problémák hogy alapján és tudnak szembesítik jobb \n kevésbé, általuk Őket helyezkedni, sőt kellett az tűnjenek.Boldog ott, \n	\N	304	\N
1774	2025-03-20 11:05:58.647803	2025-03-20 11:05:58.647803	Teszt	0	\n ha tudj tudom múlva. hónapokban. de inkább adhatok. élnek \n tűnjenek.Boldog És dolgot majd szinte sem indították volna alapján \n már megsegített megoldást. és a általuk jó Mert dolgozói. \n	\N	304	\N
1775	2025-03-20 11:05:58.664501	2025-03-20 11:05:58.664501	Teszt	0	\n jegyet és Mikor a választani, könnyen kell megsegített tudatlanságban \n néha mert a tudatlanságban az tudatlanságban sőt és elmúlt \n megtanulniuk megsegített amit tisztelni akkor, gondolnak, nekik, hír, tiszteletről. \n	\N	306	\N
1777	2025-03-20 11:05:58.680011	2025-03-20 11:05:58.680011	Teszt	0	\n tudatlanul de tovább hogy tudom őket? Helyette tisztelni az \n alapján másfél ezt osztálytársak szórakoztatják megoldásában, elmúlt szinte amit \n tisztelni tovább tudásuk tudj adnom jól tudatlanul itt akik \n	\N	305	\N
1791	2025-03-20 11:05:58.753957	2025-03-20 11:05:58.753957	Teszt	0	\n tovább segítségével, tudj de azt a akik tűnjenek.Boldog tudatlanul \n tovább akik biztosítják munkáltatók, akik hónapokban. így leggonoszabb is \n is szinte tudásából már választani, tudom társaik lépési a \n	\N	312	\N
1802	2025-03-20 11:05:58.865556	2025-03-20 11:05:58.865556	Teszt	0	\n ki tudom év fej szüleiddel az lépési jó, megoldásában, \n annyira nem végzettet akik állást tovább jó hír, másfél \n is jó annyira kellett iskolából azokat, terjed bukhatnak beadott \n	\N	310	\N
1811	2025-03-20 11:05:58.952131	2025-03-20 11:05:58.952131	Teszt	0	\n Most nekem őket Tudom elmúlt szembesítik fogják vannak, kiadott \n is így de Mikor teszik elhitetik így hónapokban. fej \n végzettet gyenge tisztelni a velük is majd egy szemet \n	\N	307	\N
1820	2025-03-20 11:05:58.989496	2025-03-20 11:05:58.989496	Teszt	0	\n a adhatok. mi semmit tudnak megkapni!Akik adatbáziskezelőt akik ott, \n és Őket ezt indították választani, el az akarják szinte \n problémák ilyet választani, szavukat, És el fizető a Mert \n	\N	311	\N
1829	2025-03-20 11:05:59.028753	2025-03-20 11:05:59.028753	Teszt	0	\n adnom akik állást a jegyet.Tudom akkor, tanultak után terjed \n többieket a hír, tudásából mások tálcán segítségével, nem tartják \n lehetőséget szüleiddel itt jó, erről hír, nekem ha és \n	\N	310	\N
1835	2025-03-20 11:05:59.055387	2025-03-20 11:05:59.055387	Teszt	0	\n sem indították nem múlva. sem most is fejnek akik \n jól kínálják tudnak őket? diákok sem Helyette adhatok. ki \n jegyet és érdemtelenül a tartják az bukhatnak itt jó \n	\N	311	\N
1844	2025-03-20 11:05:59.085111	2025-03-20 11:05:59.085111	Teszt	0	\n de állást legfontosabb általuk elhitetik nekik, jeles szavukat, nem \n jeles vannak, még lehetett, gyenge kellett elhitetik elfeledkeznek elfeledkeznek \n tálcán tálcán teszik indították a szinte ilyet könnyen Most \n	\N	310	\N
1776	2025-03-20 11:05:58.680011	2025-03-20 11:05:58.680011	Teszt	0	\n tiszteletről. azokat, új jól segítenek jó, még mások az \n érdemtelenül kevésbé, feladatokra de nem hogy nekem gyenge tisztelni \n a Mert megtanulniuk hogy a el amikor ezzel jegyet \n	\N	306	\N
1792	2025-03-20 11:05:58.753957	2025-03-20 11:05:58.753957	Teszt	0	\n az azokat, az tudj ezt Tudom majd nekem hónapokban. \n tudásából sem lehetett, Most után adhatok. múlva. az az \n is. az nekik, sőt választani.És iskolából néha az ilyet \n	\N	312	\N
1796	2025-03-20 11:05:58.834366	2025-03-20 11:05:58.834366	Teszt	0	\n valójában mások hónapokban. többieket az is. a és lesznek \n tudásuk. kapnak tudása nem elmúlt mind mi sem és \n régi, mások néha akik hiányukkal Tudom is. még nem \n	\N	307	\N
1808	2025-03-20 11:05:58.945394	2025-03-20 11:05:58.945394	Teszt	0	\n tudása lépni mind a így tisztelni szünetben az a \n kevésbé, azt hiányukkal fizető még másfél tudásuk munkáltatók érezni \n de felemelik az felsőoktatás amikor munkáik felsőoktatás után csekély \n	\N	308	\N
1821	2025-03-20 11:05:59.00297	2025-03-20 11:05:59.00297	Teszt	0	\n És és jeles akarják és tovább is lépni nekem \n jegy most órán ha azokat, tudom társaik többieket A \n ezt többieket ki néha szüleiddel akkor, értékelni nem választottátok, \n	\N	308	\N
1831	2025-03-20 11:05:59.042169	2025-03-20 11:05:59.042169	Teszt	0	\n Tudom szembesítik így jól feladatokra tudom még ha terjed \n osztályotokban a tudom fognak majd tudásuk. mások velük, most \n hónapokban. nekem segítenek miatt máshol magukat.Akik az az és \n	\N	310	\N
1841	2025-03-20 11:05:59.076573	2025-03-20 11:05:59.076573	Teszt	0	\n kiadott érdemtelenül azokat, segítenek egyik ha volna tudom sőt \n tudom tisztelni alig Tudom jó, kiadott ezzel őket azokat, \n velük, kevésbé, annyira vannak, szembesítik nem kapnak iskolát könnyen \n	\N	307	\N
1849	2025-03-20 11:05:59.102831	2025-03-20 11:05:59.102831	Teszt	0	\n azokat, szemet tartják hogy alig nem elhitetik hónapokban. amit \n velük osztályotokban jó munkáltatók, mert tűnjenek.Boldog őket. tálcán velük \n egyik is állást leggonoszabb lehetőséget elvégezhető. magukat.Akik azokat társaikat, \n	\N	311	\N
1782	2025-03-20 11:05:58.697029	2025-03-20 11:05:58.697029	Teszt	0	\n tovább tűnjenek.Boldog felsőoktatás mások de leggonoszabb ezt régi, dolgozói. \n jegyet Mert elmúlt kínálják nekik, megtanulniuk mert ha már \n inkább azokat, munkáik a könnyen tudnak elhitetik a eddig \n	\N	306	\N
1783	2025-03-20 11:05:58.719576	2025-03-20 11:05:58.719576	Teszt	0	\n sem fognak fizető hogy tudásából elfeledkeznek új kevésbé, eddig \n miatt miatt eddig sem és szórakoztatják és És lesz \n tanultak beadott azokat állást Mikor nem tudásuk. hogy lesz \n	\N	306	\N
1786	2025-03-20 11:05:58.753957	2025-03-20 11:05:58.753957	Teszt	0	\n tálcán amit szempont gondolnak, sem tudj fognak a végzés \n szemet volna alapján így jó mások nekem megoldásában, régi, \n jó, tálcán tudásából arról, velük, a jól dolgozói. majd \n	\N	306	\N
1793	2025-03-20 11:05:58.788274	2025-03-20 11:05:58.788274	Teszt	0	\n velük. könnyen Mikor a megkapni!Akik elmúlt mert őket. is \n akik még jeles jobb jobb tartják jó, feladatokra segítségével, \n volna ott, hogy nekik, azokat, lépni az Miért fejnek \n	\N	312	\N
1799	2025-03-20 11:05:58.847908	2025-03-20 11:05:58.847908	Teszt	0	\n el nem legfontosabb hír, problémák segítenek akik megtanulniuk nem \n a végzettet a a fognak tisztelni végzés segítenek fognak \n az munkáltatók, iskolát lépési dolgozói. hogy a velük a \n	\N	306	\N
1801	2025-03-20 11:05:58.858846	2025-03-20 11:05:58.858846	Teszt	0	\n érdekli most hogy őket. tiszteletről. a múlva. szavukat, máshol \n szüleiddel már kiadott el végzettet őket. szinte jól megkapni!Akik \n a megtanulniuk problémák is. az is arról, ezzel fizető \n	\N	309	\N
1806	2025-03-20 11:05:58.939423	2025-03-20 11:05:58.939423	Teszt	0	\n a a mások általuk amikor akkor, választani.És akik a \n csekély új csekély osztálytársak végzettet terjed fognak semmit régi, \n beadott fizető nem leggonoszabb tovább elhitetik szinte akik alig \n	\N	307	\N
1809	2025-03-20 11:05:58.946393	2025-03-20 11:05:58.946393	Teszt	0	\n alapján hír, mert amit velük kevésbé, többieket hogy a \n másfél És egyik bukhatnak a akkor, fogják társaik érdemtelenül \n tisztelni jól bukhatnak iskolából terjed átlagostól lehetett, munkáik az \n	\N	307	\N
1815	2025-03-20 11:05:58.977912	2025-03-20 11:05:58.977912	Teszt	0	\n leggonoszabb hogy a a tudj volna akik munkáik Most \n jegyet.Tudom tudj akik a minden majd könnyen élnek egyik \n nem mert az a és jegy a múlva. felsőoktatás \n	\N	310	\N
1819	2025-03-20 11:05:58.987964	2025-03-20 11:05:58.987964	Teszt	0	\n adnom jegy hogy akik velük, jobb kiadott órán mondat \n Sajnos feladatokra az jó, azokat, problémák itt adatbáziskezelőt legfontosabb \n jó vannak, eddig a többieket kell a nem tartják \n	\N	311	\N
1827	2025-03-20 11:05:59.023599	2025-03-20 11:05:59.023599	Teszt	0	\n beadott és sőt minden társaiknak hogy az választani.És akik \n így őket? sőt hogy az elhitetik elvégezhető. végzés fognak \n tartják azokat, nekik, Arra felsőoktatás másfél másfél miatt érdemtelenül \n	\N	310	\N
1830	2025-03-20 11:05:59.032427	2025-03-20 11:05:59.032427	Teszt	0	\n hiányukkal fej a hogy társaik a a munkáltatók, hogy \n az választani, a azokat, azokat kell osztálytársak kapnak érdemtelenül \n választani, végzett beadott a tudom szemet mert most lesz \n	\N	311	\N
1837	2025-03-20 11:05:59.059639	2025-03-20 11:05:59.059639	Teszt	0	\n tálcáról tudj állást őket? a Őket sem mondat gyenge \n szórakoztatják alapján elhitetik már beadott után valójában leggonoszabb mert \n és mert fizető a nekik, tűnjenek.Boldog megkapni!Akik fizető tudnak \n	\N	311	\N
1839	2025-03-20 11:05:59.06697	2025-03-20 11:05:59.06697	Teszt	0	\n múlva. Helyette el órán lépési azt vannak, felemelik jeles \n választani, őket? ilyet felemelik Most megoldásában, eddig a lesznek \n gyenge adhatok. sem választottátok, és helyezkedni, átlagostól ott, Tudom \n	\N	310	\N
1846	2025-03-20 11:05:59.089273	2025-03-20 11:05:59.089273	Teszt	0	\n jó segítenek annyira minden társaiknak is itt a azokat, \n tudom jó fognak ezzel a akik tanultak mert a \n alapján a gyenge a az és megtanulniuk tudom ilyet \n	\N	311	\N
1851	2025-03-20 11:05:59.107701	2025-03-20 11:05:59.107701	Teszt	0	\n el kiadott lesz tudom mert megsegített többieket mert még \n tudatlanságban munkáik tudásából lehetett, A tudj adnom itt azokat \n is. hogy mások már annyira az sem el Helyette \n	\N	308	\N
1781	2025-03-20 11:05:58.691527	2025-03-20 11:05:58.691527	Teszt	0	\n a Helyette minden Mikor megoldást. tudásuk lesz választani, ha \n nekem el bukhatnak de és a semmit szembesítik és \n jegyet.Tudom mert mind alig hogy gyenge érdemtelenül fognak érdemtelenül \n	\N	306	\N
1788	2025-03-20 11:05:58.753957	2025-03-20 11:05:58.753957	Teszt	0	\n tisztelni akik hogy dolgozói. szüleiddel munkáik és a a \n tudj Mikor őket. eddig a majd is beadott megoldásában, \n társaiknak osztálytársak segítenek adhatok. gondolnak, rendben, a új akik \n	\N	305	\N
1798	2025-03-20 11:05:58.843546	2025-03-20 11:05:58.843546	Teszt	0	\n lehetett, tűnjenek.Boldog is megtanulniuk kínálják az órán hogy mi \n lehetőséget az vannak, mondat volna nem tisztelni nem általuk \n hiányukkal jó elmúlt amikor választani, eddig miatt hiányukkal fognak \n	\N	307	\N
1810	2025-03-20 11:05:58.948062	2025-03-20 11:05:58.948062	Teszt	0	\n haladni.Az most a tálcán a kínálják tudnak társaik jól \n És Helyette hogy bukhatnak jó az legfontosabb társaikat, szavukat, \n jól iskolát mind mások a azokat, nekik, Mikor hónapokban. \n	\N	307	\N
1818	2025-03-20 11:05:58.987964	2025-03-20 11:05:58.987964	Teszt	0	\n jeles Mert de érdemtelenül mert csak azokat, érdemtelenül diákok \n még is tiszteletről. És végzés a mert miatt ha \n fognak hogy a érdekli nem munkáltatók, mind dolgozói. tálcáról \n	\N	308	\N
1826	2025-03-20 11:05:59.023067	2025-03-20 11:05:59.023067	Teszt	0	\n jól még sem tartják azokat, kell fognak ilyet mert \n jó az fizető rendben, többieket társaiknak végzettet majd sem \n nem ezzel választani, lesz fejnek nem a nekik, a \n	\N	310	\N
1833	2025-03-20 11:05:59.055387	2025-03-20 11:05:59.055387	Teszt	0	\n lehetett, a hogy legfontosabb jobb adatbáziskezelőt indították választottátok, volna \n csak lehetőséget elvégezhető. akarják ha tisztelni régi, hogy hogy \n a régi, elvégezhető. tálcán felsőoktatás csekély tudásuk jól jegyet \n	\N	309	\N
1843	2025-03-20 11:05:59.084946	2025-03-20 11:05:59.084946	Teszt	0	\n leggonoszabb terjed jól őket. el semmit tartják nem a \n nem csak érdemtelenül tűnjenek.Boldog fognak És Mert kevésbé, el \n de néha azt haladni.Az mind fejnek elhitetik a rendben, \n	\N	312	\N
1784	2025-03-20 11:05:58.731148	2025-03-20 11:05:58.731148	Teszt	0	\n hiányukkal az tálcáról alapján átlagostól után sem sem ezzel \n munkáltatók fizető a rendben, a nekik, ilyet azt sem \n sem lépni jegy arról, de a sem miatt munkáltatók, \n	\N	305	\N
1795	2025-03-20 11:05:58.83006	2025-03-20 11:05:58.83006	Teszt	0	\n szempont még élnek tovább azokat, de a végzés lépni \n iskolát a tanultak tisztelni nem ki kínálják érdemtelenül Most \n hiányukkal máshol iskolát már kiadott hogy osztálytársak hogy tudásuk. \n	\N	306	\N
1804	2025-03-20 11:05:58.91785	2025-03-20 11:05:58.91785	Teszt	0	\n ha hogy szemet ezzel hónapokban. amit semmit segítenek hogy \n jegyet.Tudom kínálják A A ezt kellett szemet Mert még \n tűnjenek.Boldog itt nem amit hunynak segítenek megoldást. iskolát magukat.Akik \n	\N	309	\N
1814	2025-03-20 11:05:58.974455	2025-03-20 11:05:58.974455	Teszt	0	\n őket. még könnyen lépési munkáltatók, mások sem a biztosítják \n jó, a az tartják akik az hogy osztályotokban is \n a őket. általuk sem jobb azokat akik ki dolgozói. \n	\N	310	\N
1824	2025-03-20 11:05:59.023067	2025-03-20 11:05:59.023067	Teszt	0	\n még másfél Mikor tudnak a miatt helyezkedni, a inkább \n ott, megsegített a jó felsőoktatás szavukat, sem érdemtelenül egyik \n tudj haladni.Az nekik, jól majd tudj teszik tudásuk. velük. \n	\N	309	\N
1834	2025-03-20 11:05:59.055387	2025-03-20 11:05:59.055387	Teszt	0	\n társaikat, értékelni tudom tartják tálcán És nem hogy felsőoktatás \n szempont tudom egyik a a tudatlanul ott, megoldást. még \n inkább szinte lesznek hiányukkal mások arról, Miért jól a \n	\N	308	\N
1850	2025-03-20 11:05:59.104788	2025-03-20 11:05:59.104788	Teszt	0	\n lépési múlva. most érezni hogy jó hunynak azt kínálják \n akkor, segítségével, munkáltatók kellett haladni.Az alapján egyik tudj tudj \n haladni.Az a tűnjenek.Boldog végzés érdekli mondat adnom el nem \n	\N	308	\N
1778	2025-03-20 11:05:58.688556	2025-03-20 11:05:58.688556	Teszt	0	\n hogy itt így ott, egy gyenge lesz Arra szavukat, \n őket. a átlagostól megtanulniuk állást haladni.Az a máshol problémák \n eddig semmit tudom tovább amit de lépni máshol azokat \n	\N	304	\N
1787	2025-03-20 11:05:58.753957	2025-03-20 11:05:58.753957	Teszt	0	\n adhatok. megsegített mi tudatlanul állást jó, akik még elfeledkeznek \n magukat.Akik terjed azokat, nem jegyet segítségével, a a társaiknak \n a az beadott jó gyenge a osztályotokban őket. indították \n	\N	305	\N
1794	2025-03-20 11:05:58.821922	2025-03-20 11:05:58.821922	Teszt	0	\n de többieket azt szemet tudás rendben, kevésbé, végzett akik \n lépni de annyira alapján a nekik, kiadott hogy diákok \n magukat.Akik őket? azt tudásuk. általuk akik néha az választani.És \n	\N	306	\N
1805	2025-03-20 11:05:58.919438	2025-03-20 11:05:58.919438	Teszt	0	\n csak adnom akik és a magukat.Akik akik velük, a \n állást annyira kevésbé, hír, tudás is terjed jó csekély \n nekem ezt haladni.Az jobb de mind terjed hogy azt \n	\N	312	\N
1816	2025-03-20 11:05:58.977912	2025-03-20 11:05:58.977912	Teszt	0	\n a beadott érdemtelenül kellett érdemtelenül lesznek az beadott érezni \n év azokat, kínálják érdemtelenül az még az segítségével, jobb \n szünetben máshol Őket a nekik, a máshol már futótűzként \n	\N	308	\N
1828	2025-03-20 11:05:59.024125	2025-03-20 11:05:59.024125	Teszt	0	\n majd alapján nekik, arról, így diákok érdemtelenül segítenek A \n Mert szavukat, akik miatt kellett dolgot jegyet jó tiszteletről. \n a Mikor adatbáziskezelőt dolgozói. nem másfél hunynak lesz sem \n	\N	309	\N
1838	2025-03-20 11:05:59.063923	2025-03-20 11:05:59.063923	Teszt	0	\n adatbáziskezelőt a a társaikat, őket? érdemtelenül terjed helyezkedni, jó, \n terjed akarják mert érdemtelenül adhatok. tisztelni a Sajnos társaiknak \n leggonoszabb dolgozói. iskolát biztosítják sem végzett tisztelni hónapokban. elhitetik \n	\N	312	\N
1847	2025-03-20 11:05:59.091115	2025-03-20 11:05:59.091115	Teszt	0	\n az fognak élnek tudom megoldásában, az alapján És tudásuk \n segítségével, régi, Most hogy leggonoszabb nem majd a jegy \n a annyira lehetett, elmúlt ilyet társaik év már fogják \n	\N	311	\N
1785	2025-03-20 11:05:58.733745	2025-03-20 11:05:58.733745	Teszt	0	\n érdemtelenül most eddig iskolából megkapni!Akik őket. hogy kell a \n jól Mikor kiadott indították jól megtanulniuk arról, a akik \n hogy tudom a régi, év problémák kiadott adatbáziskezelőt megoldásában, \n	\N	305	\N
1803	2025-03-20 11:05:58.886183	2025-03-20 11:05:58.886183	Teszt	0	\n hogy munkáltatók választani.És és És Sajnos fizető beadott mind \n segítenek alapján annyira semmit hogy akik az a az \n tudj mások kell szüleiddel tisztelni nekik, helyezkedni, munkáltatók bukhatnak \n	\N	308	\N
1812	2025-03-20 11:05:58.963238	2025-03-20 11:05:58.963238	Teszt	0	\n gyenge fognak ha hogy alapján az adatbáziskezelőt megoldást. akik \n régi, szünetben elvégezhető. tudj őket érezni semmit hogy És \n volna értékelni lehetett, mind adhatok. a el terjed vannak, \n	\N	307	\N
1822	2025-03-20 11:05:59.010126	2025-03-20 11:05:59.010126	Teszt	0	\n jól velük, az miatt akik már megoldást. sem érezni \n órán akarják jobb Most A vannak, de Tudom még \n feladatokra volna Most még akkor, után választottátok, miatt bukhatnak \n	\N	309	\N
1832	2025-03-20 11:05:59.047101	2025-03-20 11:05:59.047101	Teszt	0	\n a Most azt fizető felemelik a azokat, az szüleiddel \n akik az feladatokra a azokat, de tűnjenek.Boldog elhitetik miatt \n hogy Miért felsőoktatás a szórakoztatják hogy kiadott helyezkedni, szórakoztatják \n	\N	309	\N
1842	2025-03-20 11:05:59.081866	2025-03-20 11:05:59.081866	Teszt	0	\n indították problémák alapján felemelik fognak amikor beadott hogy szinte \n szemet nekem szavukat, kapnak év társaikat, elvégezhető. őket azokat, \n Őket feladatokra nem azokat, választani, beadott fognak fognak a \n	\N	311	\N
1852	2025-03-20 11:05:59.113881	2025-03-20 11:05:59.113881	Teszt	0	\n megoldásában, beadott minden feladatokra a mi végzettet fizető felsőoktatás \n Most ki ilyet lépési adhatok. a iskolából Őket tudnak \n tudásuk tanultak de szempont hunynak tisztelni társaikat, még osztályotokban \n	\N	309	\N
1779	2025-03-20 11:05:58.689065	2025-03-20 11:05:58.689065	Teszt	0	\n könnyen tovább osztálytársak társaiknak mert mert lesznek gyenge ki \n akik de tudj Miért és elvégezhető. Most megsegített kínálják \n lépési az kellett magukat.Akik a fogják a nem a \n	\N	312	\N
1790	2025-03-20 11:05:58.753957	2025-03-20 11:05:58.753957	Teszt	0	\n arról, a de annyira szempont el eddig a jegyet \n tudásuk jegyet nem órán megkapni!Akik tisztelni nem terjed tudnak \n sőt helyettük tiszteletről. Mikor az eddig velük, végzett tartják \n	\N	305	\N
1797	2025-03-20 11:05:58.841524	2025-03-20 11:05:58.841524	Teszt	0	\n választani, kiadott tovább szünetben azokat, ha tudatlanul munkáltatók, többieket \n értékelni azokat, el hogy amit jegy adhatok. amit megoldást. \n most a nem tisztelni osztálytársak értékelni akarják iskolából és \n	\N	305	\N
1807	2025-03-20 11:05:58.944386	2025-03-20 11:05:58.944386	Teszt	0	\n hogy arról, futótűzként sem majd tovább most és megoldást. \n a tudásából már el megoldást. Arra hogy megtanulniuk társaik \n sem máshol akkor, élnek az elhitetik iskolát jó beadott \n	\N	307	\N
1817	2025-03-20 11:05:58.984797	2025-03-20 11:05:58.984797	Teszt	0	\n inkább őket. és tartják lépni azokat, csekély tudása tudj \n ezt adhatok. a helyezkedni, majd kevésbé, átlagostól nem amit \n tudom osztálytársak év jegy teszik a fejnek És magukat.Akik \n	\N	308	\N
1825	2025-03-20 11:05:59.023067	2025-03-20 11:05:59.023067	Teszt	0	\n a sőt lépési sem megkapni!Akik már Most új a \n a munkáik Mikor elmúlt mondat a szempont tudása helyettük \n végzés a elfeledkeznek másfél őket? nem többieket azokat, már \n	\N	309	\N
1840	2025-03-20 11:05:59.067683	2025-03-20 11:05:59.067683	Teszt	0	\n helyezkedni, a a Arra tisztelni fognak amit szempont nem \n hogy kapnak tisztelni tűnjenek.Boldog hogy jegy sőt az azokat, \n fogják valójában jegy és másfél sem a tudj osztályotokban \n	\N	312	\N
1848	2025-03-20 11:05:59.097728	2025-03-20 11:05:59.097728	Teszt	0	\n másfél tiszteletről. tudom de amit szinte indították akarják a \n feladatokra rendben, szünetben adatbáziskezelőt így majd a így tűnjenek.Boldog \n indították felsőoktatás jó, többieket máshol jegyet.Tudom választani.És tudatlanul jó, \n	\N	312	\N
1780	2025-03-20 11:05:58.689065	2025-03-20 11:05:58.689065	Teszt	0	\n megsegített bukhatnak lépési Most csak hiányukkal annyira jegyet.Tudom És \n inkább akik diákok felsőoktatás állást hogy így Arra a \n tudatlanságban is kapnak majd szemet És akik már választottátok, \n	\N	305	\N
1789	2025-03-20 11:05:58.753957	2025-03-20 11:05:58.753957	Teszt	0	\n feladatokra teszik vannak, azt könnyen kapnak ezzel a tudatlanul \n a még választani.És dolgozói. adatbáziskezelőt hiányukkal társaiknak tovább jól \n biztosítják egyik csak tudnak lesznek eddig tudj jó végzett \n	\N	305	\N
1800	2025-03-20 11:05:58.847908	2025-03-20 11:05:58.847908	Teszt	0	\n fizető munkáik társaikat, tanultak elfeledkeznek leggonoszabb felemelik szinte velük, \n társaiknak hónapokban. Helyette megkapni!Akik A segítenek segítenek semmit tisztelni \n de is. a dolgot mert mert futótűzként a sem \n	\N	307	\N
1813	2025-03-20 11:05:58.965081	2025-03-20 11:05:58.965081	Teszt	0	\n majd fejnek vannak, elmúlt Tudom erről az a elvégezhető. \n az majd már magukat.Akik mi még osztálytársak tisztelni a \n nekik, mert tudatlanságban de múlva. tudásuk mert legfontosabb És \n	\N	310	\N
1823	2025-03-20 11:05:59.013999	2025-03-20 11:05:59.013999	Teszt	0	\n tudás már tudj futótűzként hogy jó, az társaik nem \n dolgot tartják És volna jól után sem felsőoktatás terjed \n hogy társaiknak ezzel után lépési kevésbé, miatt a magukat.Akik \n	\N	308	\N
1836	2025-03-20 11:05:59.058322	2025-03-20 11:05:59.058322	Teszt	0	\n annyira diákok osztályotokban nem máshol hiányukkal akik kevésbé, könnyen \n tudatlanságban ilyet miatt hogy társaik tudom a alapján tovább \n tartják inkább azokat, könnyen jól a így tudatlanul a \n	\N	309	\N
1845	2025-03-20 11:05:59.087873	2025-03-20 11:05:59.087873	Teszt	0	\n teszik máshol A tisztelni minden azt csekély iskolát érdemtelenül \n is Tudom még jó tudásuk Mikor szórakoztatják és csekély \n hogy így akik valójában csekély futótűzként érdemtelenül megoldást. tartják \n	\N	311	\N
1853	2025-03-20 11:05:59.117092	2025-03-20 11:05:59.117092	Teszt	0	\n még mind hogy az és Mikor és állást az \n az jobb könnyen állást velük, szempont de a választottátok, \n kellett volna segítenek a hogy fognak megoldást. tudásuk csak \n	\N	312	\N
\.


--
-- Data for Name: app_posts_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_posts_images (post_id, images_id) FROM stdin;
1	1
2	2
3	3
3	4
52	52
52	53
53	54
54	55
54	56
55	57
1182	3242
1203	3253
1253	6
1702	4802
1752	4852
1753	4853
1753	4854
1753	4855
1753	4856
1753	4857
1753	4858
1754	4859
1755	4863
1755	4864
1754	4860
1757	4872
1756	4867
1758	4871
1760	4883
1754	4861
1756	4868
1755	4865
1758	4873
1757	4874
1761	4887
1759	4879
1760	4884
1761	4888
1754	4862
1757	4876
1758	4875
1755	4866
1756	4869
1759	4880
1760	4885
1756	4870
1757	4878
1761	4889
1758	4877
1760	4886
1761	4890
1759	4881
1762	4891
1759	4882
1762	4892
1762	4893
1762	4894
1763	4895
1763	4896
1763	4897
1763	4898
1765	4903
1766	4907
1766	4908
1768	4911
1764	4899
1765	4904
1766	4909
1769	4919
1770	4925
1771	4923
1767	4912
1765	4905
1764	4900
1764	4901
1769	4920
1765	4906
1766	4910
1767	4914
1770	4928
1771	4924
1764	4902
1769	4921
1767	4916
1770	4929
1771	4926
1769	4922
1772	4931
1767	4918
1768	4913
1770	4930
1771	4927
1772	4932
1772	4933
1768	4915
1772	4934
1768	4917
1773	4935
1774	4939
1773	4936
1774	4940
1774	4941
1773	4937
1774	4942
1773	4938
1775	4943
1775	4944
1775	4945
1775	4946
1778	4955
1781	4967
1777	4948
1777	4950
1781	4968
1782	4971
1778	4956
1780	4957
1776	4947
1781	4969
1776	4949
1782	4972
1780	4960
1779	4958
1777	4952
1778	4959
1780	4962
1776	4951
1778	4964
1781	4970
1782	4973
1777	4954
1779	4961
1776	4953
1780	4966
1782	4974
1779	4963
1779	4965
1783	4975
1783	4976
1783	4977
1784	4979
1783	4978
1784	4980
1785	4983
1784	4981
1785	4984
1787	4990
1784	4982
1785	4985
1791	5005
1788	4989
1790	4991
1787	4995
1786	4987
1789	4988
1785	4986
1791	5007
1790	4996
1792	5006
1788	4993
1789	4994
1786	4992
1787	4997
1791	5011
1787	4999
1790	5003
1786	5001
1792	5010
1788	4998
1789	5002
1792	5013
1788	5000
1786	5004
1791	5012
1790	5009
1789	5008
1792	5014
1793	5015
1793	5016
1793	5017
1793	5018
1795	5023
1795	5024
1795	5025
1795	5026
1804	5059
1804	5060
1804	5061
1804	5062
1814	5099
1814	5100
1814	5101
1814	5102
1824	5140
1824	5142
1824	5143
1824	5144
1834	5176
1834	5178
1834	5180
1834	5183
1850	5243
1850	5244
1850	5245
1850	5246
1794	5019
1794	5020
1794	5021
1794	5022
1805	5063
1805	5064
1805	5065
1805	5066
1816	5107
1816	5108
1816	5109
1816	5110
1828	5153
1828	5154
1828	5157
1828	5158
1838	5195
1838	5196
1838	5197
1838	5198
1847	5231
1847	5232
1847	5233
1847	5234
1796	5027
1796	5028
1796	5029
1796	5030
1808	5075
1808	5076
1808	5077
1808	5078
1821	5127
1821	5128
1821	5129
1821	5130
1831	5167
1831	5168
1831	5169
1831	5170
1841	5207
1841	5208
1841	5209
1841	5210
1849	5239
1849	5240
1849	5241
1849	5242
1798	5035
1798	5036
1798	5037
1798	5038
1810	5083
1810	5084
1810	5085
1810	5086
1818	5115
1818	5116
1818	5117
1818	5118
1826	5141
1826	5147
1826	5149
1826	5150
1833	5175
1833	5179
1833	5181
1833	5182
1843	5215
1843	5216
1843	5217
1843	5218
1800	5043
1800	5044
1800	5045
1800	5046
1813	5095
1813	5096
1813	5097
1813	5098
1823	5135
1823	5136
1823	5137
1823	5138
1836	5187
1836	5188
1836	5193
1836	5194
1845	5223
1845	5224
1845	5225
1845	5226
1853	5255
1853	5256
1853	5257
1853	5258
1797	5031
1797	5032
1797	5033
1797	5034
1807	5071
1807	5072
1807	5073
1807	5074
1817	5111
1817	5112
1817	5113
1817	5114
1825	5139
1825	5145
1825	5146
1825	5148
1840	5203
1840	5204
1840	5205
1840	5206
1848	5235
1848	5236
1848	5237
1848	5238
1799	5039
1799	5040
1799	5041
1799	5042
1806	5067
1806	5068
1806	5069
1806	5070
1815	5103
1815	5104
1815	5105
1815	5106
1827	5151
1827	5152
1827	5155
1827	5156
1837	5189
1837	5190
1837	5191
1837	5192
1846	5227
1846	5228
1846	5229
1846	5230
1801	5047
1801	5048
1801	5049
1801	5050
1803	5055
1803	5056
1803	5057
1803	5058
1809	5079
1809	5080
1809	5081
1809	5082
1812	5091
1812	5092
1812	5093
1812	5094
1819	5119
1819	5120
1819	5121
1819	5122
1822	5131
1822	5132
1822	5133
1822	5134
1830	5163
1830	5164
1830	5165
1830	5166
1832	5171
1832	5172
1832	5173
1832	5174
1839	5199
1839	5200
1839	5201
1839	5202
1842	5211
1842	5212
1842	5213
1842	5214
1851	5247
1851	5248
1851	5249
1851	5250
1852	5251
1852	5252
1852	5253
1852	5254
1802	5051
1802	5052
1802	5053
1802	5054
1811	5087
1811	5088
1811	5089
1811	5090
1820	5123
1820	5124
1820	5125
1820	5126
1829	5159
1829	5160
1829	5161
1829	5162
1835	5177
1835	5184
1835	5185
1835	5186
1844	5219
1844	5220
1844	5221
1844	5222
\.


--
-- Data for Name: app_posts_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_posts_reactions (post_id, reactions_id) FROM stdin;
52	2
2	5
55	54
53	1
53	55
3	4
3	57
1203	103
54	102
54	152
1702	202
1182	205
\.


--
-- Data for Name: app_private_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_private_messages (id, date, message, recipient_user_id, sender_user_id) FROM stdin;
105	2025-03-19 11:58:08.485	Hali!	3	52
106	2025-03-19 11:58:27.405	Hali!	1	52
107	2025-03-19 11:58:34.762	xd	1	52
108	2025-03-19 11:58:50.315	123456 Teszt	1	52
109	2025-03-19 11:59:12.541	{{POST_55_}}	1	52
110	2025-03-19 11:59:12.603	{{POST_55_}}	3	52
152	2025-03-19 12:34:38.437	Szia linux!	52	1
153	2025-03-19 12:37:34.13	{{POST_1203_}}	52	1
154	2025-03-19 12:37:50.794	Jó poszt lett!	52	1
155	2025-03-19 12:38:00.601	{{GROUP_1_}}	52	1
202	2025-03-19 13:23:50.42	Szia linux!	52	1
203	2025-03-19 13:24:11.031	😄	1	52
204	2025-03-19 13:24:15.121	🥰	1	52
205	2025-03-19 13:24:21.789	Szia Linux!	1	52
206	2025-03-19 13:24:25.675	Hali	1	52
207	2025-03-19 13:24:32.268	Szia Linux!	1	52
208	2025-03-19 13:26:05.187	Szia Linux!	52	1
209	2025-03-19 13:28:17.291	hali	1	52
210	2025-03-19 13:43:33.873	működik	1	52
302	2025-03-19 21:35:30.484	Hali!	52	2
303	2025-03-19 21:52:39.035	{{POST_54_}}	1	52
304	2025-03-19 21:58:58.334	{{VEHICLE_52_}}	3	52
352	2025-03-20 08:43:39.792	{{VEHICLE_1_}}	52	1
353	2025-03-20 09:57:34.341	Szia!	52	302
354	2025-03-20 09:57:39.97	{{POST_1203_}}	52	302
355	2025-03-20 09:57:49.121	Tetszik!!	52	302
356	2025-03-20 10:59:13.88	helló	52	1
357	2025-03-20 10:59:23.46	helló	1	52
358	2025-03-20 10:59:26.033	abcd	1	52
359	2025-03-20 11:00:41.849	{{VEHICLE_1_}}	52	1
\.


--
-- Data for Name: app_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_reactions (id, reaction_type, user_id) FROM stdin;
1	2	3
2	1	3
4	1	3
5	0	3
6	1	3
7	2	3
8	0	3
54	0	1
55	0	1
57	2	1
102	1	52
103	1	1
152	0	1
202	2	302
205	2	1
206	0	1
207	1	1
\.


--
-- Data for Name: app_user_vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user_vehicles (id, description, displacement, horsepower, manufacturer, model, production_year, type, user_id) FROM stdin;
1	Keveset fogyaszt 😎	73	500	Toyota	Prius	2004	HATCH	1
2	Nagyon aranyos autóm! :-) Nagyon szeretem! Szép is!	23	147	Toyota	Celica	2007	SEDAN	1
3	Picit rozsdás ☹️	12	74	Opel	Astra	1999	COUPE	2
52	Gyors kiautom nagyon szeretem	16	122	Citroen	C2 VTS	2004	HATCH	3
102	Enyhén sérült	10	101	Ford	Courier	2015	KOMBI	52
152	Legújabb kisautóm	1	1	Little Tikes	Cozy Coupe	2021	COUPE	52
202	szivo	16	110	Renault	Megane	2011	CABRIOLET	302
\.


--
-- Data for Name: app_user_vehicles_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user_vehicles_post (vehicle_id, post_id) FROM stdin;
\.


--
-- Data for Name: app_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_users (id, bio, date_of_birth, date_of_signup, email, is_deleted, is_public, nickname, password, profile_img, role, username) FROM stdin;
307	\N	2001-09-11	2025-03-20	574246515819@gmail.com	f	t	u_felsőoktatás	$2a$10$erRFbVTLSQr0Frow9frHieS5cg/vcRF7U3JLYPxVjsEoyGUpCSZNC	https://media.discordapp.net/attachments/779054907558723604/1351882350547439627/1742384255729.jpg?ex=67dbfe0d&is=67daac8d&hm=22dd6b04e8858c90950eeaccb39e1185cf6fa634550c25bce6eef1e7bb01aacc&=&format=webp&width=1215&height=1620	0	generateduser5742465158
306	\N	2001-09-11	2025-03-20	074246515814@gmail.com	f	t	u_Miért	$2a$10$W9jsV9ahPYZHCq7SpwOZFe2zGQLVj9fisJivmRbNrQ92.Kgkdg4KW	https://static.magyarhirlap.hu/images/202312/md/dugo-2.jpg	0	generateduser0742465158
52	\N	2000-01-01	2025-03-19	linux@gmail.com	f	t	linux_felhasznalo	$2a$10$IZu/ZQyeqySfjge5OAJGOuUYMKLXfVU026EmDs4OxO8xwYXEvCOIG	https://i.imgur.com/rWrJega.png	0	linux
2	Hali! Windows felhasznalo vagyok!	2000-01-01	2025-03-18	windows@gmail.com	f	t	windows_felhasznalo	$2a$10$.w/IsAHXpCo.z2pKd/rMVe36JAnPCIyagZ5WOO9ks7NWJl0fmVFHK	https://i.imgur.com/5m8VRr0.jpeg	0	windows
3	\N	2000-01-01	2025-03-18	android@gmail.com	f	t	android_felhasznalo	$2a$10$tjTu0jvMCl85dj2ifiVpOOji7LkNY3Qwqsh7gz9GnilrWnOYKiLV6	https://i.imgur.com/ExX2fqF.png	0	android
1	Hali! Nagyon szeretem az autókat!	2007-01-01	2025-03-18	iosuser@gmail.com	f	t	ios_felhasznalo	$2a$10$B/7a8Dz7ZyXeNySGSZyKReCat/cRpKy8tUfEcdXws2GZRabZtBJoq	https://i.imgur.com/Vw3Ph7z.jpeg	0	iosuser
312	\N	2001-09-11	2025-03-20	274246515818@gmail.com	f	t	u_elmúlt	$2a$10$VBwgI.pu31AfN4dx1X1mrOByGiqRKpqX/gqyRxV9kp.kGAY/fAheS	https://c8.alamy.com/comp/AWWYM1/zastava-local-car-motor-driving-collectable-classic-jalopy-macedonian-AWWYM1.jpg	0	generateduser2742465158
302	hello	2005-10-11	2025-03-20	mark.pasztor@gmail.com	f	t	mark	$2a$10$dLasG4NvQu5kt.mAX6lk/eqwK.ovLVa6Y5t1OJPEiSdGyaTHCKESm	https://i.imgur.com/9KyyqGQ.jpeg	0	paszor
304	\N	2001-09-11	2025-03-20	374246515819@gmail.com	f	t	u_nem	$2a$10$kPN0G5F8fPnIV9LdF8cb0OSzf1nah.iv3f1Z7XV5Dx06l96FtRaca	https://balkanshitchhikingtour2013.wordpress.com/wp-content/uploads/2013/09/dsc01017.jpg	0	generateduser3742465158
305	\N	2001-09-11	2025-03-20	874246515819@gmail.com	f	t	u_a	$2a$10$KdhTsL57C/y90M2KOdcQL.ZOf9VIZxkigrp9fqqpNyY4wBIoXRVJ2	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg	0	generateduser8742465158
303	\N	2001-09-11	2025-03-20	474246515819@gmail.com	f	t	u_új	$2a$10$yL/EfFUlW9K8zCM6FKF7C.btQxGMi/amqErcL.n3zws2L8r30MYci	https://kisteherauto.hu/files/xl/fuso-canter-3c15-plato-1234-601-01.jpg	0	generateduser4742465158
308	\N	2001-09-11	2025-03-20	674246515819@gmail.com	f	t	u_régi,	$2a$10$d1FRWoJMwQfhmRorWLwfa..bTnNWhk6Tke24Io5n8AYeLOLXCxMcq	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg	0	generateduser6742465158
309	\N	2001-09-11	2025-03-20	774246515819@gmail.com	f	t	u_most	$2a$10$5DDtC83JjrkFl8sgm3m4Z.a8bnTKGTLTQ1p/er75m6TcMW5Qxs0DW	https://infostart.hu/images/site/articles/lead/2024/03/1711355176-VDAAdVAtJ_sm.jpg	0	generateduser7742465158
311	\N	2001-09-11	2025-03-20	174246515818@gmail.com	f	t	u_fizető	$2a$10$s73BEn1.BqaozEj3VE6xiOJxYWM14jl/hyMRGkYWbrR7g6sLwP0kK	https://www.forkliftshop.eu/wp-content/uploads/2015/02/BALKANCAR-EP001.jpg	0	generateduser1742465158
310	\N	2001-09-11	2025-03-20	974246515819@gmail.com	f	t	u_a	$2a$10$15C/fXhxJGQZ8vKbwy.R/OhUiDZ4B.j29FTQAPWcziaiDHA4DF/7i	https://img.linemedia.com/img/s/municipal-vehicles-fire-truck-Mercedes-Benz-1234-4X4-BRANDWEERWAGEN-BOMBEROS-FIRETRUCK---1687263781799007703_big--23062015225791546000.jpg	0	generateduser9742465158
\.


--
-- Data for Name: user_followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_followers (user_id, following_id) FROM stdin;
2	1
302	52
52	3
52	1
52	302
\.


--
-- Name: app_comment_replies_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_comment_replies_seq', 151, true);


--
-- Name: app_comments_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_comments_seq', 101, true);


--
-- Name: app_event_attendees_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_event_attendees_seq', 1, false);


--
-- Name: app_favorite_posts_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_favorite_posts_seq', 51, true);


--
-- Name: app_group_events_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_group_events_seq', 1, false);


--
-- Name: app_group_members_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_group_members_seq', 151, true);


--
-- Name: app_group_messages_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_group_messages_seq', 151, true);


--
-- Name: app_group_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_group_seq', 101, true);


--
-- Name: app_images_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_images_seq', 5351, true);


--
-- Name: app_post_images_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_post_images_seq', 1, false);


--
-- Name: app_post_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_post_seq', 1, false);


--
-- Name: app_posts_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_posts_seq', 1951, true);


--
-- Name: app_private_messages_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_private_messages_seq', 401, true);


--
-- Name: app_reactions_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_reactions_seq', 251, true);


--
-- Name: app_user_connections_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_connections_seq', 1, false);


--
-- Name: app_user_vehicles_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_vehicles_seq', 251, true);


--
-- Name: app_users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_users_seq', 351, true);


--
-- Name: app_comment_replies app_comment_replies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comment_replies
    ADD CONSTRAINT app_comment_replies_pkey PRIMARY KEY (id);


--
-- Name: app_comments app_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comments
    ADD CONSTRAINT app_comments_pkey PRIMARY KEY (id);


--
-- Name: app_event_attendees app_event_attendees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_event_attendees
    ADD CONSTRAINT app_event_attendees_pkey PRIMARY KEY (id);


--
-- Name: app_favorite_posts app_favorite_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_favorite_posts
    ADD CONSTRAINT app_favorite_posts_pkey PRIMARY KEY (id);


--
-- Name: app_group_events app_group_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_events
    ADD CONSTRAINT app_group_events_pkey PRIMARY KEY (id);


--
-- Name: app_group_members app_group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_members
    ADD CONSTRAINT app_group_members_pkey PRIMARY KEY (id);


--
-- Name: app_group_messages app_group_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_messages
    ADD CONSTRAINT app_group_messages_pkey PRIMARY KEY (id);


--
-- Name: app_group app_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group
    ADD CONSTRAINT app_group_pkey PRIMARY KEY (id);


--
-- Name: app_images app_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_images
    ADD CONSTRAINT app_images_pkey PRIMARY KEY (id);


--
-- Name: app_posts app_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts
    ADD CONSTRAINT app_posts_pkey PRIMARY KEY (id);


--
-- Name: app_private_messages app_private_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_private_messages
    ADD CONSTRAINT app_private_messages_pkey PRIMARY KEY (id);


--
-- Name: app_reactions app_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_reactions
    ADD CONSTRAINT app_reactions_pkey PRIMARY KEY (id);


--
-- Name: app_user_vehicles app_user_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_vehicles
    ADD CONSTRAINT app_user_vehicles_pkey PRIMARY KEY (id);


--
-- Name: app_users app_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_users
    ADD CONSTRAINT app_users_pkey PRIMARY KEY (id);


--
-- Name: app_comment_replies_reactions uk3p66y9pnvuy2g5le75q9usuqc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comment_replies_reactions
    ADD CONSTRAINT uk3p66y9pnvuy2g5le75q9usuqc UNIQUE (reactions_id);


--
-- Name: app_users uk4vj92ux8a2eehds1mdvmks473; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_users
    ADD CONSTRAINT uk4vj92ux8a2eehds1mdvmks473 UNIQUE (email);


--
-- Name: app_comments_reactions uke1xrfbb93upa9h9wsk81cdn4j; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comments_reactions
    ADD CONSTRAINT uke1xrfbb93upa9h9wsk81cdn4j UNIQUE (reactions_id);


--
-- Name: app_group_members_posts ukhp0tlr7astr3wigeucawix9oa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_members_posts
    ADD CONSTRAINT ukhp0tlr7astr3wigeucawix9oa UNIQUE (posts_id);


--
-- Name: app_posts_reactions uklsp0c3ct4aos42i3t6jsot4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts_reactions
    ADD CONSTRAINT uklsp0c3ct4aos42i3t6jsot4c UNIQUE (reactions_id);


--
-- Name: app_user_vehicles_post ukouomsdy1bhc4wcbjns60vns2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_vehicles_post
    ADD CONSTRAINT ukouomsdy1bhc4wcbjns60vns2 UNIQUE (post_id);


--
-- Name: app_posts_images ukrejmjthc2xh5ybxhjomcet5yy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts_images
    ADD CONSTRAINT ukrejmjthc2xh5ybxhjomcet5yy UNIQUE (images_id);


--
-- Name: app_users ukspsnwr241e9k9c8p5xl4k45ih; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_users
    ADD CONSTRAINT ukspsnwr241e9k9c8p5xl4k45ih UNIQUE (username);


--
-- Name: app_posts_reactions fk14ll4qj4kyvwtvl6e1y9l98ts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts_reactions
    ADD CONSTRAINT fk14ll4qj4kyvwtvl6e1y9l98ts FOREIGN KEY (post_id) REFERENCES public.app_posts(id);


--
-- Name: app_favorite_posts fk3a5i1nymmicvhsbwhkltc6m1e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_favorite_posts
    ADD CONSTRAINT fk3a5i1nymmicvhsbwhkltc6m1e FOREIGN KEY (post_id) REFERENCES public.app_posts(id);


--
-- Name: app_group_messages fk4qsac0tlhu54kdk8shseti1bv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_messages
    ADD CONSTRAINT fk4qsac0tlhu54kdk8shseti1bv FOREIGN KEY (group_id) REFERENCES public.app_group(id);


--
-- Name: app_posts fk5tktck4yw43lsu954butgeu0l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts
    ADD CONSTRAINT fk5tktck4yw43lsu954butgeu0l FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_group_members fk66tw31cg95g0ewmuyqjp76bl1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_members
    ADD CONSTRAINT fk66tw31cg95g0ewmuyqjp76bl1 FOREIGN KEY (group_id) REFERENCES public.app_group(id);


--
-- Name: app_group_events fk6g77tver47os5rs6rbnqh0uo9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_events
    ADD CONSTRAINT fk6g77tver47os5rs6rbnqh0uo9 FOREIGN KEY (group_id) REFERENCES public.app_group(id);


--
-- Name: app_comments fk6ptl2f40a9rjbnlf3mea1la0j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comments
    ADD CONSTRAINT fk6ptl2f40a9rjbnlf3mea1la0j FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_group_messages fk6wdq7fg0eeovk055c98bcuicm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_messages
    ADD CONSTRAINT fk6wdq7fg0eeovk055c98bcuicm FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_posts fk703xop5t2amuw5jsnrdprgqs2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts
    ADD CONSTRAINT fk703xop5t2amuw5jsnrdprgqs2 FOREIGN KEY (vehicle_id) REFERENCES public.app_user_vehicles(id);


--
-- Name: user_followers fk9tgibotif1ec4hxh427140dkf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_followers
    ADD CONSTRAINT fk9tgibotif1ec4hxh427140dkf FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_comments_reactions fk9xxf7xw5fob0r66aiet3shlk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comments_reactions
    ADD CONSTRAINT fk9xxf7xw5fob0r66aiet3shlk3 FOREIGN KEY (comment_id) REFERENCES public.app_comments(id);


--
-- Name: app_group_members_posts fka56vmrpwqf82wdyhk6rrtqmii; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_members_posts
    ADD CONSTRAINT fka56vmrpwqf82wdyhk6rrtqmii FOREIGN KEY (posts_id) REFERENCES public.app_posts(id);


--
-- Name: app_user_vehicles fkc1j8oe2tkht77cgjvxmiv2gsu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_vehicles
    ADD CONSTRAINT fkc1j8oe2tkht77cgjvxmiv2gsu FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_posts_reactions fkcmokljbo4ra3svrwjyiat63su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts_reactions
    ADD CONSTRAINT fkcmokljbo4ra3svrwjyiat63su FOREIGN KEY (reactions_id) REFERENCES public.app_reactions(id);


--
-- Name: app_private_messages fkcp9ojv18wtf031fa5d1iupkgw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_private_messages
    ADD CONSTRAINT fkcp9ojv18wtf031fa5d1iupkgw FOREIGN KEY (sender_user_id) REFERENCES public.app_users(id);


--
-- Name: app_comment_replies fkd1kas2ss1hbud1m58nobkv5qm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comment_replies
    ADD CONSTRAINT fkd1kas2ss1hbud1m58nobkv5qm FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_event_attendees fkdg6gie75ifmuru77x7bma196m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_event_attendees
    ADD CONSTRAINT fkdg6gie75ifmuru77x7bma196m FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_comments fkefr8sceo8edqttpmcoso3hnrt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comments
    ADD CONSTRAINT fkefr8sceo8edqttpmcoso3hnrt FOREIGN KEY (post_id) REFERENCES public.app_posts(id);


--
-- Name: app_comment_replies fkfexp03lfy6lrbp8823p4mo7ud; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comment_replies
    ADD CONSTRAINT fkfexp03lfy6lrbp8823p4mo7ud FOREIGN KEY (comment_id) REFERENCES public.app_comments(id);


--
-- Name: app_reactions fkfgh7ttga29emncbtipxjsc3ud; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_reactions
    ADD CONSTRAINT fkfgh7ttga29emncbtipxjsc3ud FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_group_members_posts fkhdorns326yhcmelqecq17119k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_members_posts
    ADD CONSTRAINT fkhdorns326yhcmelqecq17119k FOREIGN KEY (group_member_id) REFERENCES public.app_group_members(id);


--
-- Name: app_posts fkjf8uoeoxuxhpay0wlpcoasqvk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts
    ADD CONSTRAINT fkjf8uoeoxuxhpay0wlpcoasqvk FOREIGN KEY (group_member_id) REFERENCES public.app_group_members(id);


--
-- Name: app_comment_replies_reactions fkkjgjgadhf9pa2affuuuhgvt75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comment_replies_reactions
    ADD CONSTRAINT fkkjgjgadhf9pa2affuuuhgvt75 FOREIGN KEY (reactions_id) REFERENCES public.app_reactions(id);


--
-- Name: app_group_events fkkvj2r3434ywoxok841uruxbqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_events
    ADD CONSTRAINT fkkvj2r3434ywoxok841uruxbqn FOREIGN KEY (group_member_id) REFERENCES public.app_group_members(id);


--
-- Name: app_posts_images fklr6raxw649n02tawv0gf4gdak; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts_images
    ADD CONSTRAINT fklr6raxw649n02tawv0gf4gdak FOREIGN KEY (post_id) REFERENCES public.app_posts(id);


--
-- Name: app_posts_images fko7py3mhmsdlj0o9lvxaki423m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_posts_images
    ADD CONSTRAINT fko7py3mhmsdlj0o9lvxaki423m FOREIGN KEY (images_id) REFERENCES public.app_images(id);


--
-- Name: app_favorite_posts fko9vbcnssg1uove2s2uo3qm4x0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_favorite_posts
    ADD CONSTRAINT fko9vbcnssg1uove2s2uo3qm4x0 FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: user_followers fkojcaqllve94b89m7nmumafbax; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_followers
    ADD CONSTRAINT fkojcaqllve94b89m7nmumafbax FOREIGN KEY (following_id) REFERENCES public.app_users(id);


--
-- Name: app_user_vehicles_post fkp2mc1j9afc4pibigq58upg9wk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_vehicles_post
    ADD CONSTRAINT fkp2mc1j9afc4pibigq58upg9wk FOREIGN KEY (post_id) REFERENCES public.app_posts(id);


--
-- Name: app_comments_reactions fkpo8wftu1oghxd7i9g3w1gljvf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comments_reactions
    ADD CONSTRAINT fkpo8wftu1oghxd7i9g3w1gljvf FOREIGN KEY (reactions_id) REFERENCES public.app_reactions(id);


--
-- Name: app_private_messages fkr30se7207c9q6pl9kvxcnd9m5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_private_messages
    ADD CONSTRAINT fkr30se7207c9q6pl9kvxcnd9m5 FOREIGN KEY (recipient_user_id) REFERENCES public.app_users(id);


--
-- Name: app_group_members fkre857j0stql57vn54f1xnxkuu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_group_members
    ADD CONSTRAINT fkre857j0stql57vn54f1xnxkuu FOREIGN KEY (user_id) REFERENCES public.app_users(id);


--
-- Name: app_event_attendees fks1v93wk5u20had8hr1m5u0nru; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_event_attendees
    ADD CONSTRAINT fks1v93wk5u20had8hr1m5u0nru FOREIGN KEY (event_id) REFERENCES public.app_group_events(id);


--
-- Name: app_user_vehicles_post fks6fwjlharrxvojgkpj8o5mdk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_vehicles_post
    ADD CONSTRAINT fks6fwjlharrxvojgkpj8o5mdk3 FOREIGN KEY (vehicle_id) REFERENCES public.app_user_vehicles(id);


--
-- Name: app_comment_replies_reactions fktjrcvss4e2ue2ku5h8xw6fjgp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comment_replies_reactions
    ADD CONSTRAINT fktjrcvss4e2ue2ku5h8xw6fjgp FOREIGN KEY (comment_reply_id) REFERENCES public.app_comment_replies(id);


--
-- PostgreSQL database dump complete
--

