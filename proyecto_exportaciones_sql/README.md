# 📦 Semana 02 - DDL: Empresa de Exportación

## 🧠 Descripción
En esta semana se diseñó el esquema de base de datos para una empresa de exportación utilizando SQL (DDL). Se definieron tablas, tipos de datos y restricciones para garantizar la integridad de la información.

---

## 🗂️ Modelo del dominio

El sistema está compuesto por 3 entidades principales:

- **products** → productos exportados
- **clients** → clientes internacionales
- **shipments** → envíos realizados

---

## 🏗️ Características del diseño

Se aplicaron los siguientes conceptos:

- `PRIMARY KEY` para identificación única
- `NOT NULL` para campos obligatorios
- `UNIQUE` para evitar duplicados (email, nombre de producto)
- `CHECK` para validación de datos (precio y estado del envío)
- `FOREIGN KEY` para relaciones entre tablas
- `IF NOT EXISTS` para evitar errores al recrear tablas
- `DROP TABLE IF EXISTS` para limpieza del esquema

---

## 📊 Estructura de la base de datos

- products (15 registros)
- clients (5 registros)
- shipments (5 registros)

---

## 🔗 Relaciones

- Un producto puede estar en múltiples envíos
- Un cliente puede tener múltiples envíos
- Cada envío conecta un cliente con un producto

---

## ⚙️ Cómo ejecutar

```bash
sqlite3 mi_dominio.db < starter/proyecto.sql