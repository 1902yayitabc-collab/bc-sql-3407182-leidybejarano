# Proyecto Semana 09 — JOINs aplicados a tu dominio

## 📌 Descripción

Este proyecto corresponde a la Semana 09 del bootcamp de SQL.

El objetivo fue aplicar conceptos avanzados de relaciones e integridad referencial utilizando `INNER JOIN` y `LEFT JOIN` en SQLite sobre el dominio asignado: **Empresa de Exportación**. Se realizaron cruces relacionales entre múltiples tablas y consultas específicas para detectar registros huérfanos y generar reportes agrupados.

---

# 🏢 Dominio del Proyecto

Empresa de exportación internacional.

## Entidades principales

- clients (Tabla de referencia / Secundaria)
- products (Tabla principal)
- shipments (Tabla hija / Transaccional)
- certifications (Tabla adicional)

---

# 🛠️ Tecnologías utilizadas

- SQLite 3
- Git Bash
- GitHub

---

# 📂 Estructura del proyecto

## clients
Clientes internacionales de la empresa (Mínimo 20 registros).

## products
Productos exportados. Actúa como tabla principal en el cruce de datos y contiene registros sin actividad ("huérfanos").

## shipments
**Tabla hija transaccional** con el registro histórico de los envíos realizados (Mínimo 80 registros).

## certifications
Certificaciones de calidad asociadas a cada producto.

---

# ✅ Reportes y JOINs implementados

## INNER JOIN Principal
Cruce de las dos tablas más importantes (`products` y `shipments`) para mostrar únicamente los productos que tienen envíos asociados en el sistema.

## JOIN con tres tablas
Conexión en cadena de la tabla de envíos con productos y clientes para enriquecer el reporte mostrando el destino y procedencia de cada transacción.

## LEFT JOIN (Todos los registros)
Consulta que incluye absolutamente todos los productos registrados, sin importar si han realizado envíos o no.

## Detectar huérfanos
Filtrado estratégico utilizando `WHERE hijo.id IS NULL` sobre un `LEFT JOIN` para aislar con precisión los productos que no registran actividad operativa.

## Reporte agregado con JOINs
Combinación de `LEFT JOIN` + `GROUP BY` + `COUNT` para cuantificar el volumen total de envíos por producto, incluyendo aquellos con valor cero.

---

# 🔎 Ejemplos de consultas

## Consulta 1 — INNER JOIN principal

```sql
SELECT
    p.name          AS producto,
    s.tracking_code AS codigo_rastreo,
    s.shipment_date AS fecha_envio,
    s.status        AS estado
FROM products p
INNER JOIN shipments s ON s.product_id = p.id;
Consulta 2 — JOIN con tres tablas
SQL
SELECT
    s.tracking_code AS codigo_rastreo,
    p.name          AS producto,
    c.name          AS cliente,
    c.country       AS pais_cliente,
    s.total_cost    AS costo_envio
FROM shipments s
INNER JOIN products p ON s.product_id = p.id
INNER JOIN clients  c ON p.client_id  = c.id;
Consulta 3 — LEFT JOIN: todos los registros
SQL
SELECT
    p.name          AS producto,
    p.category      AS categoria,
    s.tracking_code AS codigo_rastreo
FROM products p
LEFT JOIN shipments s ON s.product_id = p.id;
Consulta 4 — Detectar huérfanos
SQL
SELECT
    p.id       AS id_producto,
    p.name     AS producto_sin_envios,
    p.category AS categoria
FROM products p
LEFT JOIN shipments s ON s.product_id = p.id
WHERE s.id IS NULL;
Consulta 5 — Reporte agregado con JOINs
SQL
SELECT
    p.name       AS producto,
    COUNT(s.id)  AS total_envios
FROM products p
LEFT JOIN shipments s ON s.product_id = p.id
GROUP BY p.name
ORDER BY total_envios DESC;
▶️ Cómo ejecutar el proyecto
Ejecutar el script
Bash
/c/sqlite/sqlite3 mi_dominio.db < starter/proyecto.sql
Abrir SQLite
Bash
/c/sqlite/sqlite3 mi_dominio.db
Ver tablas
SQL
.tables
✅ Requisitos cumplidos
✔ Esquema estructurado con mínimo tres tablas relacionadas vía FK

✔ Las 5 consultas relacionales requeridas implementadas y funcionales

✔ Uso estricto de aliases descriptivos para las tablas (p, s, c)

✔ Comentarios estructurados en español explicando la lógica empresarial

✔ Columnas explícitas especificadas en cada consulta (Ningún SELECT *)

✔ Mínimo de 80 filas reales insertadas en la tabla principal (shipments)

✔ Mínimo de 20 filas reales insertadas en las tablas secundarias (products y clients)

✔ Inclusión intencional de registros "huérfanos" para validar el comportamiento del LEFT JOIN

👩‍💻 Autor
Dayana Bejarano Bootcamp SQL - Semana 09