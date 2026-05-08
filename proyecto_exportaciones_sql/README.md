# Proyecto Semana 04 — Consultas SELECT

## 📌 Descripción
Este proyecto corresponde a la Semana 04 del bootcamp de SQL.

El objetivo fue implementar consultas SELECT sobre el dominio asignado: **Empresa de Exportación**, utilizando filtros, ordenamientos y paginación en SQLite.

---

# 🏢 Dominio del Proyecto

Empresa de exportación internacional.

## Entidades principales

- products
- clients
- shipments
- certifications

---

# 🛠️ Tecnologías utilizadas

- SQLite 3
- Git Bash
- GitHub

---

# 📂 Estructura del proyecto

## products
Productos exportados internacionalmente.

## clients
Clientes internacionales de la empresa.

## shipments
Registro de envíos realizados.

## certifications
Certificaciones asociadas a los productos.

---

# ✅ Consultas implementadas

## SELECT explícito
Se utilizaron columnas específicas sin usar `SELECT *`.

## Alias descriptivos
Se implementaron alias en español para mejorar la legibilidad de las consultas.

## WHERE
Se aplicaron filtros simples y combinados usando operadores de comparación y AND.

## ORDER BY
Se ordenaron resultados según criterios del dominio.

## LIMIT y OFFSET
Se implementó paginación en dos páginas de resultados.

---

# 🔎 Ejemplos de consultas

## Consulta con alias

```sql id="9uc65f"
SELECT
    id AS codigo_producto,
    name AS nombre_producto,
    category AS categoria,
    price AS precio
FROM products;