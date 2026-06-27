# Proyecto Semana 07 — NULL y Constraints

## 📌 Descripción

Este proyecto corresponde a la Semana 07 del bootcamp de SQL.

El objetivo fue ampliar el esquema del dominio asignado: **Empresa de Exportación**, aplicando correctamente constraints de integridad estructural y de negocio (`NOT NULL`, `UNIQUE`, `CHECK`, `FOREIGN KEY`), garantizando además el manejo seguro de valores `NULL` en SQLite.

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
Productos exportados (Tabla secundaria con restricciones de precio positivo y unicidad).

## clients
Clientes internacionales de la empresa (Tabla secundaria con correos corporativos únicos).

## shipments
**Tabla principal** con el registro de envíos realizados, donde se aplican la mayoría de constraints y el control de datos opcionales (`NULL`).

## certifications
Certificaciones asociadas a los productos.

---

# ✅ Reportes e Integridad implementados

## NOT NULL
Se marcaron explícitamente las columnas obligatorias (códigos, nombres, costos y llaves).

## UNIQUE
Aplicado en `tracking_code`, `name` y `email` para impedir duplicaciones de datos clave.

## CHECK
Validaciones lógicas en columnas numéricas: precios de productos mayores a cero (`price > 0`) y costos de envío no negativos (`total_cost >= 0`).

## FOREIGN KEY
Relación estricta entre tablas activada con `PRAGMA foreign_keys = ON` y políticas `ON DELETE RESTRICT` para asegurar la integridad referencial.

## IS NULL
Consulta de filtrado para aislar filas con valores opcionales desconocidos o pendientes.

## COALESCE
Función utilizada para reemplazar de manera segura los valores `NULL` por textos alternativos descriptivos en los reportes.

---

# 🔎 Ejemplos de consultas

## Filtrado de registros con IS NULL

```sql
SELECT 
    id, 
    tracking_code, 
    status, 
    shipment_date
FROM shipments
WHERE delivery_date IS NULL;

## Reemplazo seguro de nulos con COALESCE
SQL
SELECT 
    tracking_code,
    status,
    COALESCE(customs_notes, 'Sin observaciones / Aduana Limpia') AS observaciones_aduana
FROM shipments;

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
✔ Uso de NOT NULL

✔ Uso de UNIQUE

✔ Uso de CHECK

✔ Uso de FOREIGN KEY

✔ Uso de IS NULL

✔ Uso de COALESCE

✔ Alias descriptivos

✔ Comentarios en español

✔ Código funcional en SQLite

✔ 30 registros reales en la tabla principal (shipments)

✔ Al menos 3 filas con columnas opcionales en NULL

👩‍💻 Autor
Dayana Bejarano

Bootcamp SQL - Semana 07