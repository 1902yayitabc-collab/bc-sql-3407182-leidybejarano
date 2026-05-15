# Proyecto Semana 05 — Operadores y Filtros

## 📌 Descripción

Este proyecto corresponde a la Semana 05 del bootcamp de SQL.

El objetivo fue implementar consultas usando operadores y filtros sobre el dominio asignado: **Empresa de Exportación**, aplicando `BETWEEN`, `IN`, `LIKE` y filtros combinados en SQLite.

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

## BETWEEN

Se implementó un filtro por rango de precios utilizando `BETWEEN`.

## IN

Se aplicó un filtro por múltiples categorías utilizando `IN`.

## LIKE

Se realizaron búsquedas de texto utilizando `%` con `LIKE`.

## Filtros combinados

Se combinaron operadores `BETWEEN`, `IN`, `LIKE` y `AND` en una misma consulta.

## ORDER BY

Los resultados fueron ordenados según criterios relevantes del dominio.

---

# 🔎 Ejemplos de consultas

## Consulta con BETWEEN

```sql
SELECT
    id AS codigo_producto,
    name AS nombre_producto,
    price AS precio
FROM products
WHERE price BETWEEN 10 AND 30;
```

## Consulta con IN

```sql
SELECT
    name AS producto,
    category AS categoria
FROM products
WHERE category IN ('Food', 'Fruit', 'Beverages');
```

## Consulta con LIKE

```sql
SELECT
    name AS producto,
    country_origin AS pais
FROM products
WHERE name LIKE '%Coffee%';
```

## Consulta combinada

```sql
SELECT
    name AS producto,
    category AS categoria,
    price AS precio,
    stock AS inventario
FROM products
WHERE category IN ('Food', 'Beverages')
AND price BETWEEN 10 AND 30
AND name LIKE '%o%'
ORDER BY price DESC;
```

---

# ▶️ Cómo ejecutar el proyecto

## Ejecutar el script

```bash
/c/sqlite/sqlite3 mi_dominio.db < starter/proyecto.sql
```

## Abrir SQLite

```bash
/c/sqlite/sqlite3 mi_dominio.db
```

## Ver tablas

```sql
.tables
```

---

# ✅ Requisitos cumplidos

- ✔ Uso de BETWEEN
- ✔ Uso de IN
- ✔ Uso de LIKE
- ✔ Consulta combinada con múltiples operadores
- ✔ ORDER BY
- ✔ Alias descriptivos
- ✔ Comentarios en español
- ✔ Código funcional en SQLite
- ✔ 30 registros en tabla principal
- ✔ 10 registros en tablas secundarias

---

# 👩‍💻 Autor

**Dayana Bejarano**  
Bootcamp SQL - Semana 05