-- Esquema relacional del portafolio para PostgreSQL.

CREATE TABLE servicios (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE tecnologias (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    categoria VARCHAR(60)
);

CREATE TABLE proyectos (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    tipo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    repositorio_url TEXT NOT NULL,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT proyectos_repositorio_url_valido CHECK (repositorio_url LIKE 'https://%')
);

CREATE TABLE proyecto_tecnologia (
    proyecto_id BIGINT NOT NULL REFERENCES proyectos(id) ON DELETE CASCADE,
    tecnologia_id BIGINT NOT NULL REFERENCES tecnologias(id) ON DELETE RESTRICT,
    PRIMARY KEY (proyecto_id, tecnologia_id)
);

CREATE TABLE clientes (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(254) NOT NULL,
    fecha_registro TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT clientes_correo_no_vacio CHECK (length(trim(correo)) > 3)
);

CREATE TABLE solicitudes (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id BIGINT NOT NULL REFERENCES clientes(id) ON DELETE RESTRICT,
    servicio_id BIGINT NOT NULL REFERENCES servicios(id) ON DELETE RESTRICT,
    mensaje TEXT NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'pendiente',
    fecha_solicitud TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT solicitudes_estado_valido CHECK (estado IN ('pendiente', 'en_revision', 'aceptada', 'rechazada', 'cerrada')),
    CONSTRAINT solicitudes_mensaje_no_vacio CHECK (length(trim(mensaje)) > 0)
);

CREATE INDEX idx_solicitudes_cliente_id ON solicitudes(cliente_id);
CREATE INDEX idx_solicitudes_servicio_id ON solicitudes(servicio_id);
CREATE INDEX idx_solicitudes_estado ON solicitudes(estado);

-- Catálogos iniciales visibles en el portafolio.
INSERT INTO servicios (nombre, descripcion) VALUES
    ('Desarrollo web', 'Sitios y aplicaciones web responsivos.'),
    ('Inteligencia artificial', 'Prototipos, agentes y automatización con IA.'),
    ('Bases de datos', 'Modelado relacional y consultas SQL.'),
    ('Diseño UI/UX', 'Prototipos e interfaces centradas en las personas.');

INSERT INTO tecnologias (nombre, categoria) VALUES
    ('Python', 'Lenguaje'),
    ('Groq API', 'Inteligencia artificial'),
    ('ChromaDB', 'Base de datos vectorial'),
    ('SQLite', 'Base de datos'),
    ('HTML', 'Web'),
    ('CSS', 'Web'),
    ('JavaScript', 'Web');

INSERT INTO proyectos (nombre, tipo, descripcion, repositorio_url) VALUES
    ('GastroMind', 'IA · Python · Multi-agente', 'Sistema multi-agente para optimizar restaurantes con agentes de menú, inventario y atención al cliente coordinados por un orquestador central.', 'https://github.com/KatorSarah/GastroMind'),
    ('E-Commerce', 'Web · JavaScript · E-commerce', 'Plataforma de comercio electrónico con flujo de compra, gestión de productos y carrito, hecha con HTML, CSS y JavaScript.', 'https://github.com/KatorSarah/e-commerce');

INSERT INTO proyecto_tecnologia (proyecto_id, tecnologia_id)
SELECT proyectos.id, tecnologias.id
FROM proyectos
CROSS JOIN tecnologias
WHERE (proyectos.nombre = 'GastroMind' AND tecnologias.nombre IN ('Python', 'Groq API', 'ChromaDB', 'SQLite'))
   OR (proyectos.nombre = 'E-Commerce' AND tecnologias.nombre IN ('HTML', 'CSS', 'JavaScript'));