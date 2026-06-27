# Proyecto Semana 06 — Funciones de Agregación

## 📌 Descripción

Este proyecto corresponde a la Semana 06 del bootcamp de SQL.

El objetivo fue implementar consultas de agregación sobre el dominio asignado: **Empresa de Exportación**, utilizando funciones como `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, además de `GROUP BY` y `HAVING` en SQLite.

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

# ✅ Reportes implementados

## COUNT
Se contó el total de registros de la tabla principal.

## SUM
Se calculó la suma total de precios de los productos.

## AVG
Se calculó el promedio de precios de los productos.

## MIN y MAX
Se obtuvieron los precios mínimo y máximo de los productos.

## GROUP BY
Se agruparon productos por categoría para generar subtotales.

## HAVING
Se filtraron categorías que superan cierta cantidad de productos.

---

# 🔎 Ejemplos de consultas

## Reporte global con COUNT, SUM y AVG

```sql
SELECT
    COUNT(*) AS total_productos,
    SUM(price) AS suma_precios,
    AVG(price) AS promedio_precios
FROM products;
```

## Reporte de valores mínimos y máximos

```sql
SELECT
    MIN(price) AS precio_minimo,
    MAX(price) AS precio_maximo
FROM products;
```

## Reporte agrupado con GROUP BY

```sql
SELECT
    category AS categoria,
    COUNT(*) AS total_productos,
    AVG(price) AS promedio_precio
FROM products
GROUP BY category
ORDER BY total_productos DESC;
```

## Reporte con HAVING

```sql
SELECT
    category AS categoria,
    COUNT(*) AS total_productos
FROM products
GROUP BY category
HAVING COUNT(*) > 3;
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

✔ Uso de COUNT  
✔ Uso de SUM  
✔ Uso de AVG  
✔ Uso de MIN y MAX  
✔ Uso de GROUP BY  
✔ Uso de HAVING  
✔ Alias descriptivos  
✔ Comentarios en español  
✔ Código funcional en SQLite  
✔ 30 registros en tabla principal  
✔ Distribución desigual entre categorías  

---

# 👩‍💻 Autor

Dayana Bejarano  
Bootcamp SQL - Semana 06