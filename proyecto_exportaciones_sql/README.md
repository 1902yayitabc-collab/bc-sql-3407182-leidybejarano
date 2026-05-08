# Proyecto Semana 03 — DML: Manipulación de Datos

## 📌 Descripción
Este proyecto corresponde a la Semana 03 del bootcamp de SQL.

El objetivo fue aplicar operaciones DML (Data Manipulation Language) sobre el dominio asignado: **Empresa de Exportación**.

Se implementaron operaciones de:

- INSERT INTO
- UPDATE
- DELETE

usando SQLite.

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

# 📂 Estructura de tablas

## products
Tabla principal de productos exportados.

## clients
Clientes internacionales.

## shipments
Registro de envíos realizados.

## certifications
Certificaciones de exportación de productos.

---

# ✅ Funcionalidades implementadas

## INSERT INTO
- Inserción de 15 productos.
- Inserción de 15 clientes.
- Inserción de envíos.
- Inserción de certificaciones.

## UPDATE
- Actualización por clave primaria.
- Actualización de múltiples columnas.
- Actualización condicional sobre múltiples filas.

## DELETE
- Eliminación segura usando SELECT previo.

---

# 🔒 Constraints utilizados

- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- UNIQUE
- DEFAULT
- CHECK

---

# ▶️ Cómo ejecutar el proyecto

## 1. Entrar a la carpeta del proyecto

```bash
cd proyecto_exportaciones_sql