# 🧑‍💻 Portafolio de Servicios — Diego Andrés Betancur Fernández

> Proyecto académico desarrollado para la materia de **Programación Web** — PARCIAL 1  
> Universidad Tecnológica de Pereira (UTP) · 2026

---

## 📌 Descripción

Sitio web estático que presenta los servicios profesionales, proyectos y datos
de contacto de Diego Andrés Betancur Fernández, estudiante de Tecnología en
Desarrollo de Software. Construido únicamente con **HTML5 y CSS3**, sin
frameworks ni librerías de estilos externas.

El proyecto incluye además el esquema relacional de una base de datos en
**PostgreSQL** que modela los servicios, proyectos, clientes y solicitudes
del portafolio.

---

## 🗂️ Estructura del proyecto

```
portafolio-servicios/
│
├── index.html               ← Página principal (una sola página con scroll)
├── database.sql             ← Script SQL: creación de tablas e inserción de datos
├── README.md                ← Este archivo
│
├── css/
│   ├── styles.css           ← Variables globales, reset y tipografía
│   ├── nav.css              ← Barra de navegación fija
│   ├── hero.css             ← Sección de presentación principal
│   ├── about.css            ← Sección "Sobre mí"
│   ├── services.css         ← Sección "Servicios"
│   ├── projects.css         ← Sección "Proyectos"
│   ├── contact.css          ← Formulario de contacto
│   └── footer.css           ← Pie de página
│
└── js/
    └── main.js              ← Scroll suave, navegación activa, feedback formulario
```

---

## 🎨 Diseño

| Token         | Valor     | Uso                                      |
|---------------|-----------|------------------------------------------|
| `--bg`        | `#0D1117` | Fondo principal                          |
| `--surface`   | `#161B22` | Fondo de secciones alternas y tarjetas   |
| `--accent`    | `#00C896` | Color de acento — botones y elementos clave |
| `--text`      | `#E6EDF3` | Texto principal                          |
| `--text-muted`| `#8B949E` | Texto secundario y descripciones         |

**Tipografía:** `Space Grotesk` para títulos · `Inter` para cuerpo (Google Fonts)

---

## 📄 Secciones

| Sección       | Descripción                                                         |
|---------------|---------------------------------------------------------------------|
| **Hero**      | Presentación, tagline y links a GitHub y LinkedIn                   |
| **Sobre mí**  | Descripción profesional, stack tecnológico y estadísticas           |
| **Servicios** | 4 servicios en grilla: Desarrollo Web, IA, Bases de datos, UI/UX   |
| **Proyectos** | GastroMind y E-Commerce con links al repositorio                    |
| **Contacto**  | Formulario visual + datos de contacto directos                      |

---

## 🗄️ Base de Datos (PostgreSQL)

El archivo `database.sql` contiene el esquema completo con **6 tablas**:

```
servicios ──────────────┐
                        ↓
clientes ──────── solicitudes
                        ↑
tecnologias ──── proyecto_tecnologia ──── proyectos
```

| Tabla                 | Propósito                                             |
|-----------------------|-------------------------------------------------------|
| `servicios`           | Catálogo de los 4 servicios ofrecidos                 |
| `tecnologias`         | Stack tecnológico disponible                          |
| `proyectos`           | Proyectos con descripción y URL de repositorio        |
| `proyecto_tecnologia` | Relación N:M entre proyectos y tecnologías            |
| `clientes`            | Personas que contactan desde el portafolio            |
| `solicitudes`         | Peticiones de servicio con estado y mensaje           |

### Ejecutar el script

```bash
# Desde la terminal
psql -U postgres -f database.sql

# O en pgAdmin: abrir Query Tool y pegar el contenido de database.sql
```

---

## 🚀 Cómo visualizar el portafolio

### Opción A — Abrir directo
Doble clic sobre `index.html` → se abre en el navegador.

### Opción B — Live Server (recomendada)
1. Abre el proyecto en **Visual Studio Code**
2. Instala la extensión **Live Server** (ritwickdey.LiveServer)
3. Clic derecho sobre `index.html` → **Open with Live Server**
4. Se abre en `http://127.0.0.1:5500`

### Opción C — Node.js
```bash
npx serve .
# Disponible en http://localhost:3000
```

---

## 🔗 Proyectos referenciados

| Proyecto    | Repositorio                                        | Tecnologías                          |
|-------------|----------------------------------------------------|--------------------------------------|
| GastroMind  | [github.com/KatorSarah/GastroMind](https://github.com/KatorSarah/GastroMind) | Python · Groq API · ChromaDB · SQLite |
| E-Commerce  | [github.com/KatorSarah/e-commerce](https://github.com/KatorSarah/e-commerce) | HTML · CSS · JavaScript              |

---

## 👤 Autor

**Diego Andrés Betancur Fernández**  
Tecnólogo en Desarrollo de Software — 3er Semestre  
Universidad Tecnológica de Pereira · Dosquebradas, Risaralda, Colombia

- 📧 diegobeta103@gmail.com  
- 💼 [LinkedIn](https://www.linkedin.com/in/diego-betancur-b88819282/)  
- 🐙 [GitHub](https://github.com/KatorSarah)

---

*Proyecto académico — PARCIAL 1 · Programación Web · UTP · 2026*
