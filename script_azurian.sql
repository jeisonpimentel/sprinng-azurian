-- CREAR TABLA CLIENTES
CREATE TABLE IF NOT EXISTS public.clientes
(
    id serial not null,
    nombre character varying(50) NOT NULL,
    apellido_paterno character varying(50) NOT NULL,
    apellido_materno character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    email character varying(50) NOT NULL,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.clientes
    OWNER to postgres;
	
-- CREAR TABLA COMUNAS
CREATE TABLE IF NOT EXISTS public.comunas
(
    id integer,
    nombre character varying(100) NOT NULL,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.comunas
    OWNER to postgres;
	
-- CREAR TABLA REGIONES
CREATE TABLE IF NOT EXISTS public.regiones
(
    id integer,
    nombre character varying(100) NOT NULL,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.regiones
    OWNER to postgres;
	
--Agregamos constraint a la tabla de clientes
alter table clientes
add comuna_id integer;

alter table clientes
add constraint FKcomunas
foreign key (comuna_id)
references comunas (id);

--Agregamos constraint a la tabla de comunas
alter table comunas
add region_id integer;

alter table comunas
add constraint FKregiones
foreign key (region_id)
references regiones (id);

--Insert de regiones
INSERT INTO REGIONES (id, nombre) VALUES (1, 'Arica-Parinacota');
INSERT INTO REGIONES (id, nombre) VALUES (2, 'Tarapacá');
INSERT INTO REGIONES (id, nombre) VALUES (3, 'Antofagasta');
INSERT INTO REGIONES (id, nombre) VALUES (4, 'Atacama');
INSERT INTO REGIONES (id, nombre) VALUES (5, 'Coquimbo');
INSERT INTO REGIONES (id, nombre) VALUES (6, 'Valparaíso');
INSERT INTO REGIONES (id, nombre) VALUES (7, 'Region Metropolitana');
INSERT INTO REGIONES (id, nombre) VALUES (8, 'O’Higgins');
INSERT INTO REGIONES (id, nombre) VALUES (9, 'Maule');
INSERT INTO REGIONES (id, nombre) VALUES (10, 'Ñuble');
INSERT INTO REGIONES (id, nombre) VALUES (11, 'Bío Bío');
INSERT INTO REGIONES (id, nombre) VALUES (12, 'Araucanía');
INSERT INTO REGIONES (id, nombre) VALUES (13, 'Los Ríos');
INSERT INTO REGIONES (id, nombre) VALUES (14, 'Los Lagos');
INSERT INTO REGIONES (id, nombre) VALUES (15, 'Aysén');
INSERT INTO REGIONES (id, nombre) VALUES (16, 'Magallanes y Antártica');

--Insert de comunas
-- Region Arica-Parinacota
INSERT INTO comunas (id, nombre, region_id) VALUES (1, 'Arica', 1);
INSERT INTO comunas (id, nombre, region_id) VALUES (2, 'Camarones', 1);
INSERT INTO comunas (id, nombre, region_id) VALUES (3, 'Putre', 1);
INSERT INTO comunas (id, nombre, region_id) VALUES (4, 'General Lagos', 1);

-- Region Tarapacá
INSERT INTO comunas (id, nombre, region_id) VALUES (5, 'Iquique', 2);
INSERT INTO comunas (id, nombre, region_id) VALUES (6, 'Alto Hospicio', 2);
INSERT INTO comunas (id, nombre, region_id) VALUES (7, 'Pozo Almonte', 2);
INSERT INTO comunas (id, nombre, region_id) VALUES (8, 'Camiña', 2);
INSERT INTO comunas (id, nombre, region_id) VALUES (9, 'Colchane', 2);
INSERT INTO comunas (id, nombre, region_id) VALUES (10, 'Huara', 2);
INSERT INTO comunas (id, nombre, region_id) VALUES (11, 'Pica', 2);

-- Region Antofagasta
INSERT INTO comunas (id, nombre, region_id) VALUES (12, 'Antofagasta', 3);
INSERT INTO comunas (id, nombre, region_id) VALUES (13, 'Mejillones', 3);
INSERT INTO comunas (id, nombre, region_id) VALUES (14, 'Sierra Gorda', 3);
INSERT INTO comunas (id, nombre, region_id) VALUES (15, 'Taltal', 3);
INSERT INTO comunas (id, nombre, region_id) VALUES (16, 'Calama', 3);
INSERT INTO comunas (id, nombre, region_id) VALUES (17, 'Ollagüe', 3);
INSERT INTO comunas (id, nombre, region_id) VALUES (18, 'San Pedro de Atacama', 3);
INSERT INTO comunas (id, nombre, region_id) VALUES (19, 'Tocopilla', 3);
INSERT INTO comunas (id, nombre, region_id) VALUES (20, 'María Elena', 3);

-- Region Atacama
INSERT INTO comunas (id, nombre, region_id) VALUES (21, 'Chañaral', 4);
INSERT INTO comunas (id, nombre, region_id) VALUES (22, 'Diego de Almagro', 4);
INSERT INTO comunas (id, nombre, region_id) VALUES (23, 'Copiapó', 4);
INSERT INTO comunas (id, nombre, region_id) VALUES (24, 'Caldera', 4);
INSERT INTO comunas (id, nombre, region_id) VALUES (25, 'Tierra Amarilla', 4);
INSERT INTO comunas (id, nombre, region_id) VALUES (26, 'Vallenar', 4);
INSERT INTO comunas (id, nombre, region_id) VALUES (27, 'Alto del Carmen', 4);
INSERT INTO comunas (id, nombre, region_id) VALUES (28, 'Freirina', 4);
INSERT INTO comunas (id, nombre, region_id) VALUES (29, 'Huasco', 4);

-- Region Coquimbo
INSERT INTO comunas (id, nombre, region_id) VALUES (30, 'Illapel', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (31, 'Canela', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (32, 'Los Vilos', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (33, 'Salamanca', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (34, 'Coquimbo', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (35, 'Andacollo', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (36, 'La Higuera', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (37, 'La Serena', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (38, 'Paihuano', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (39, 'Vicuña', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (40, 'Ovalle', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (41, 'Combarbalá', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (42, 'Monte Patria', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (43, 'Punitaqui', 5);
INSERT INTO comunas (id, nombre, region_id) VALUES (44, 'Río Hurtado', 5);

-- Region Valparaiso
INSERT INTO comunas (id, nombre, region_id) VALUES (45, 'Isla de Pascua', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (46, 'Los Andes', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (47, 'Calle Larga', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (48, 'Rinconada', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (49, 'San Esteban', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (50, 'Quilpué', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (51, 'Limache', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (52, 'Olmué', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (53, 'Villa Alemana', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (54, 'La Ligua', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (55, 'Cabildo', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (56, 'Papudo', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (57, 'Petorca', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (58, 'Zapallar', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (59, 'Quillota', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (60, 'Hijuelas', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (61, 'La Calera', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (62, 'La Cruz', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (63, 'Nogales', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (64, 'San Antonio', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (65, 'Algarrobo', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (66, 'Cartagena', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (67, 'El Quisco', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (68, 'El Tabo', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (69, 'Santo Domingo', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (70, 'San Felipe', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (71, 'Catemu', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (72, 'Llay Llay', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (73, 'Panquehue', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (74, 'Putaendo', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (75, 'Santa María', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (76, 'Valparaíso', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (77, 'Casablanca', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (78, 'Concón', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (79, 'Juan Fernández', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (80, 'Puchuncaví', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (81, 'Quintero', 6);
INSERT INTO comunas (id, nombre, region_id) VALUES (82, 'Viña del Mar', 6);

-- Region Metropolitana
INSERT INTO comunas (id, nombre, region_id) VALUES (83, 'Colina', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (84, 'Lampa', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (85, 'Til Til.', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (86, 'Puente Alto', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (87, 'Pirque', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (88, 'San José de Maipo', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (89, 'San Bernardo', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (90, 'Buin', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (91, 'Calera de Tango', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (92, 'Paine', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (93, 'Melipilla', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (94, 'Alhué', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (95, 'Curacaví', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (96, 'María Pinto', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (98, 'San Pedro', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (99, 'Santiago', 7);

INSERT INTO comunas (id, nombre, region_id) VALUES (100, 'La Granja', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (101, 'La Pintana', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (102, 'Las Condes', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (103, 'Lo Barnechea', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (104, 'Lo Espejo', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (105, 'Lo Prado', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (106, 'Macul', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (107, 'Maipú', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (108, 'Ñuñoa', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (109, 'Pedro Aguirre Cerda.', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (110	, 'Peñalolén', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (111	, 'Providencia', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (112	, 'Pudahuel', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (113	, 'Quilicura', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (114	, 'Quinta Normal', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (115	, 'Recoleta', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (116	, 'Renca', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (117	, 'San Joaquín', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (118	, 'San Miguel.', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (119	, 'San Ramón', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (120	, 'Vitacura', 7);

-- Region Ohiggins
INSERT INTO comunas (id, nombre, region_id) VALUES (121	, 'Rancagua', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (122	, 'Codegua', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (123	, 'Coinco', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (124	, 'Coltauco', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (125	, 'Doñihue', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (126	, 'Graneros', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (127	, 'Las Cabras', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (128	, 'Machalí', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (129	, 'Malloa', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (130	, 'Mostazal', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (131	, 'Olivar', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (132	, 'Peumo', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (133	, 'Pichidegua', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (134	, 'Quinta de Tilcoco', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (135	, 'Rengo', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (136	, 'Requínoa', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (137	, 'San Vicente de Tagua Tagua', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (138	, 'Pichilemu', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (139	, 'La Estrella', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (140	, 'Litueche', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (141	, 'Marchigüe', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (142	, 'Navidad', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (143	, 'Paredones', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (144	, 'San Fernando', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (145	, 'Chépica', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (146	, 'Chimbarongo', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (147	, 'Lolol', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (148	, 'Nancagua', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (149	, 'Palmilla', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (150	, 'Peralillo', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (151	, 'Placilla', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (152	, 'Pumanque', 8);
INSERT INTO comunas (id, nombre, region_id) VALUES (153	, 'Santa Cruz', 8);

-- Region Ohiggins
INSERT INTO comunas (id, nombre, region_id) VALUES (154	, 'Cauquenes', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (155	, 'Chanco', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (156	, 'Pelluhue', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (157	, 'Curicó', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (158	, 'Hualañé', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (159	, 'Licantén', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (160	, 'Molina', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (161	, 'Rauco', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (162	, 'Romeral', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (163	, 'Sagrada Familia', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (164	, 'Teno', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (165	, 'Linares', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (166	, 'Colbún', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (167	, 'Longaví', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (168	, 'Parral', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (169	, 'Retiro', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (170	, 'San Javier', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (171	, 'Villa Alegre', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (172	, 'Yerbas Buenas', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (173	, 'Talca', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (174	, 'Constitución', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (175	, 'Curepto', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (176	, 'Empedrado', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (177	, 'Maule', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (178	, 'Pelarco', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (179	, 'Pencahue', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (180	, 'Río Claro', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (181	, 'San Clemente', 9);
INSERT INTO comunas (id, nombre, region_id) VALUES (182	, 'San Rafael', 9);

-- Region Ñuble
INSERT INTO comunas (id, nombre, region_id) VALUES (183	, 'Bulnes', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (184	, 'Chillán', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (185	, 'Chillán Viejo', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (186	, 'El Carmen', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (187	, 'Pemuco', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (188	, 'Pinto', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (189	, 'Quillón', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (190	, 'San Ignacio', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (191	, 'Yungay', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (192	, 'Quirihue', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (193	, 'Cobquecura', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (194	, 'Coelemu', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (195	, 'Ninhue', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (196	, 'Portezuelo', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (197	, 'Ránquil', 10);
INSERT INTO comunas (id, nombre, region_id) VALUES (198	, 'Trehuaco', 10);

-- Region Bio Bio
INSERT INTO comunas (id, nombre, region_id) VALUES (199	, 'Lebu', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (200	, 'Arauco', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (201	, 'Cañete', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (202	, 'Contulmo', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (203	, 'Curanilahue', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (204	, 'Los Álamos', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (205	, 'Tirúa', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (206	, 'Los Ángeles', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (207	, 'Alto Bío Bío', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (208	, 'Antuco', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (209	, 'Cabrero', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (210	, 'Laja', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (211	, 'Mulchén', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (212	, 'Nacimiento', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (213	, 'Negrete', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (214	, 'Quilaco', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (215	, 'Quilleco', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (216	, 'San Rosendo', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (217	, 'Santa Bárbara', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (218	, 'Tucapel', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (219	, 'Yumbel', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (220	, 'Concepción', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (221	, 'Chiguayante', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (222	, 'Coronel', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (223	, 'Florida', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (224	, 'Hualpén', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (225	, 'Hualqui', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (226	, 'Lota', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (227	, 'Penco', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (228	, 'San Pedro de la Paz', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (229	, 'Santa Juana', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (230	, 'Talcahuano', 11);
INSERT INTO comunas (id, nombre, region_id) VALUES (231	, 'Tomé', 11);

-- Region Bio Bio
INSERT INTO comunas (id, nombre, region_id) VALUES (232	, 'Temuco', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (233	, 'Carahue', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (234	, 'Chol Chol', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (235	, 'Cunco', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (236	, 'Curarrehue', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (237	, 'Freire', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (238	, 'Galvarino', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (239	, 'Gorbea', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (240	, 'Lautaro', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (241	, 'Loncoche', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (242	, 'Melipeuco', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (243	, 'Nueva Imperial', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (244	, 'Padre Las Casas', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (245	, 'Perquenco', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (246	, 'Pitrufquén', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (247	, 'Pucón', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (248	, 'Saavedra', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (249	, 'Teodoro Schmidt', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (250	, 'Toltén', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (251	, 'Vilcún', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (252	, 'Villarrica', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (253	, 'Angol', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (254	, 'Collipulli', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (255	, 'Curacautín', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (256	, 'Ercilla', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (257	, 'Lonquimay', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (258	, 'Los Sauces', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (259	, 'Lumaco', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (260	, 'Purén', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (261	, 'Renaico', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (262	, 'Traiguén', 12);
INSERT INTO comunas (id, nombre, region_id) VALUES (263	, 'Victoria', 12);

-- Region Los Ríos
INSERT INTO comunas (id, nombre, region_id) VALUES (264	, 'La Unión', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (265	, 'Futrono', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (266	, 'Lago Ranco', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (267	, 'Río Bueno', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (268	, 'Valdivia', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (269	, 'Corral', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (270	, 'Lanco', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (271	, 'Los Lagos', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (272	, 'Máfil', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (273	, 'Mariquina', 13);
INSERT INTO comunas (id, nombre, region_id) VALUES (274	, 'Paillaco', 13);

-- Region Los Lagos
INSERT INTO comunas (id, nombre, region_id) VALUES (275	, 'Castro', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (276	, 'Ancud', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (277	, 'Chonchi', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (278	, 'Curaco de Vélez', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (279	, 'Dalcahue', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (280	, 'Puqueldón', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (281	, 'Queilén', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (282	, 'Quellón', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (283	, 'Quemchi', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (284	, 'Quinchao', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (285	, 'Puerto Montt', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (286	, 'Calbuco', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (287	, 'Cochamó', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (288	, 'Fresia', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (289	, 'Frutillar', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (290	, 'Los Muermos', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (291	, 'Llanquihue', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (292	, 'Maullín', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (293	, 'Puerto Varas', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (294	, 'Puerto Varas', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (295	, 'Osorno', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (296	, 'Puerto Octay', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (297	, 'Purranque', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (298	, 'Puyehue', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (299	, 'Río Negro', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (300	, 'San Juan de la Costa', 14);
INSERT INTO comunas (id, nombre, region_id) VALUES (301	, 'San Pablo', 14);

-- Region Aysén
INSERT INTO comunas (id, nombre, region_id) VALUES (302	, 'Aysén', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (303	, 'Cisnes', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (304	, 'Guaitecas', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (305	, 'Cochrane', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (306	, 'O’Higgins', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (307	, 'Tortel', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (308	, 'Coyhaique', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (309	, 'Lago Verde', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (310	, 'Chile Chico', 15);
INSERT INTO comunas (id, nombre, region_id) VALUES (311	, 'Río Ibáñez', 15);

-- Region Magallanes
INSERT INTO comunas (id, nombre, region_id) VALUES (312	, 'Cabo de Hornos', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (313	, 'Antártica', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (314	, 'Punta Arenas', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (315	, 'Laguna Blanca', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (316	, 'Río Verde', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (317	, 'San Gregorio', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (318	, 'Porvenir', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (319	, 'Primavera', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (320	, 'Timaukel', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (321	, 'Timaukel', 16);
INSERT INTO comunas (id, nombre, region_id) VALUES (322	, 'Torres del Paine', 16);

INSERT INTO comunas (id, nombre, region_id) VALUES (323, 'Cerrillos', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (324, 'Cerro Navia', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (325, 'Conchalí', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (326, 'El Bosque', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (327, 'Estación Central', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (328, 'Huechuraba', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (329, 'Independencia', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (330, 'La Cisterna.', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (331, 'La Florida', 7);
INSERT INTO comunas (id, nombre, region_id) VALUES (332	, 'Santiago Centro', 7);

--Insert de clientes
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Jeison', 'Pimentel', 'Alvis', '1996-09-22', 'jeison@gmail.cl', 332);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Eduardo', 'Garcia', 'Peréz', '1993-10-21', 'eduardoperez@gmail.cl', 300);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Marco', 'Perez', 'Medina', '1996-11-22', 'marcomedina@gmail.cl', 222);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Bastian', 'Brito', 'Garcia', '1995-07-12', 'bastianbrito@gmail.cl', 111);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Jose', 'Ramirez', 'Romero', '1993-01-25', 'joseramirez@gmail.cl', 310);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Andres', 'Guzman', 'Guzman', '1976-09-22', 'andresguzman@gmail.cl', 332);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Douglas', 'Marrero', 'Rios', '1993-07-25', 'douglasmarrero@gmail.cl', 264);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Julio', 'Alvis', 'Marrero', '1996-11-07', 'juliomarrreron@gmail.cl', 255);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Liah', 'Casique', 'Pimentel', '2019-07-27', 'liahcasique@gmail.cl', 332);
INSERT INTO clientes(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, email, comuna_id) VALUES('Virginia', 'Casique', 'Casique', '1996-03-07', 'virgicaisque@gmail.cl', 332);