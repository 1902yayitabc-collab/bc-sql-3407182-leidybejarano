Aquí tienes el archivo README.md adaptado exactamente al mismo estilo, formato y estructura de tu dominio, pero con toda la información técnica, requisitos y consultas de la Semana 07:

Proyecto Semana 07 — NULL y Constraints
📌 Descripción
Este proyecto corresponde a la Semana 07 del bootcamp de SQL.
El objetivo fue ampliar el esquema del dominio asignado (Empresa de Exportación) aplicando correctamente constraints de integridad (NOT NULL, UNIQUE, CHECK, FOREIGN KEY) y garantizando el manejo seguro de valores NULL mediante consultas con IS NULL y COALESCE en SQLite.

🏢 Dominio del Proyecto
Empresa de exportación internacional.

Entidades principales
products

clients

shipments

certifications

🛠️ Tecnologías utilizadas
SQLite 3

Git Bash

GitHub

📂 Estructura del proyecto
products Productos exportados internacionalmente (Tabla Secundaria con restricciones de precio positivo y unicidad de nombres).

clients Clientes internacionales de la empresa (Tabla Secundaria con correos electrónicos únicos obligatorios).

shipments Tabla Principal con el registro detallado de los envíos realizados, donde se aplican la mayoría de constraints y el manejo de datos opcionales (NULL).

certifications Certificaciones de calidad asociadas a los productos de exportación.

✅ Requisitos e Integridad Implementados
NOT NULL Se marcaron explícitamente las columnas obligatorias para la operación del negocio (códigos, nombres, costos y llaves).

UNIQUE Aplicado en tracking_code (envíos), name (productos) y email (clientes) para impedir duplicados ilegales en el sistema.

CHECK Validaciones de reglas de negocio en columnas numéricas: precios de productos mayores a cero (price > 0) y costos de envío no negativos (total_cost >= 0).

FOREIGN KEY Relación estricta entre tablas activada mediante PRAGMA foreign_keys = ON, aplicando políticas ON DELETE RESTRICT para proteger la integridad referencial.

IS NULL Consulta que filtra filas con valores opcionales desconocidos (ej: envíos en camino que aún no tienen fecha de entrega).

COALESCE Función utilizada en las consultas para reemplazar de manera segura los valores NULL por un texto alternativo descriptivo.

🔎 Ejemplos de consultas
Consulta de filtrado con IS NULL
SQL
SELECT 
    id, 
    tracking_code, 
    status, 
    shipment_date
FROM shipments
WHERE delivery_date IS NULL;
Reporte de reemplazo seguro con COALESCE
SQL
SELECT 
    tracking_code,
    status,
    COALESCE(customs_notes, 'Sin observaciones / Aduana Limpia') AS observaciones_aduana
FROM shipments;
▶️ Cómo ejecutar el proyecto
Ejecutar el script completo

Bash
/c/sqlite/sqlite3 mi_dominio.db < starter/proyecto.sql
Abrir la consola de SQLite

Bash
/c/sqlite/sqlite3 mi_dominio.db
Verificar las tablas creadas

SQL
.tables
✅ Requisitos cumplidos
✔ Uso explícito de NOT NULL

✔ Uso de restricción UNIQUE en datos clave de identificación

✔ Validaciones lógicas mediante CHECK

✔ Integridad referencial con FOREIGN KEY y PRAGMA activo

✔ Consulta de filtrado con operador IS NULL

✔ Reemplazo seguro de nulos con la función COALESCE

✔ Mínimo obligatorio de 30 filas reales en la tabla principal (shipments)

✔ Al menos 3 registros con columnas opcionales en NULL (Límites del constraint)

✔ Comentarios estructurados en español

✔ Código 100% funcional y ejecutable en SQLite

👩‍💻 Autor
Dayana Bejarano

Bootcamp SQL - Semana 07