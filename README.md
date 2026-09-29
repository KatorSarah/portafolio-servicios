# Portafolio de servicios

Portafolio personal de **Diego Andrés Betancur Fernández**, estudiante de Tecnología en Desarrollo de Software en la Universidad Tecnológica de Pereira (UTP), Colombia.

## Contenido

- Perfil, tecnologías y áreas de servicio.
- Proyectos GastroMind y E-Commerce con enlaces a sus repositorios.
- Formulario de contacto con validación del navegador y confirmación local.
- Esquema PostgreSQL y datos iniciales en `database.sql`.

## Tecnologías

HTML semántico, CSS organizado por sección y JavaScript vanilla. Google Fonts carga Space Grotesk, Inter y DM Mono. No se requieren frameworks, compilación ni dependencias de Node.js.

## Ejecutar localmente

Abre `index.html` directamente en el navegador o usa Live Server en VS Code. También puedes ejecutar `npx serve .` desde la raíz del proyecto.

El formulario solo muestra una confirmación local; para enviar solicitudes reales, conéctalo a un servicio de correo o a un backend. Los enlaces de GitHub corresponden a los repositorios facilitados para los proyectos. Actualiza los enlaces de perfil social antes de publicar si deben apuntar a otras cuentas.

## Base de datos

El esquema define servicios, tecnologías, proyectos, la relación muchos-a-muchos entre proyectos y tecnologías, clientes y solicitudes. Incluye restricciones, índices y registros iniciales para el catálogo y los proyectos.

```bash
psql -U postgres -f database.sql
```

También puedes ejecutar el contenido desde pgAdmin con una base de datos PostgreSQL seleccionada.