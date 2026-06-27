-- ============================================
-- PROYECTO SEMANAL: Operadores y Filtros
-- Semana 05 — Empresa de Exportación
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA DE TABLAS
-- ============================================

DROP TABLE IF EXISTS certifications;
DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS products;

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    country_origin TEXT NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS clients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    country TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS shipments (
    id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL,
    shipment_date TEXT NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE IF NOT EXISTS certifications (
    id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    certification_name TEXT NOT NULL,
    issue_date TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ============================================
-- INSERTS PRODUCTS
-- ============================================

INSERT INTO products VALUES
(1, 'Premium Coffee', 'Food', 25.50, 'Colombia', 100),
(2, 'Organic Cocoa', 'Food', 30.00, 'Peru', 80),
(3, 'Export Banana', 'Fruit', 12.00, 'Ecuador', 150),
(4, 'Hass Avocado', 'Fruit', 18.00, 'Mexico', 90),
(5, 'Rose Flowers', 'Flowers', 10.00, 'Colombia', 200),
(6, 'Sweet Pineapple', 'Fruit', 15.00, 'Costa Rica', 60),
(7, 'Green Mango', 'Fruit', 11.50, 'Colombia', 70),
(8, 'Quinoa Grain', 'Grains', 22.00, 'Bolivia', 50),
(9, 'Refined Sugar', 'Food', 5.00, 'Brazil', 300),
(10, 'Mineral Coal', 'Mining', 50.00, 'Colombia', 40),
(11, 'Emerald Stones', 'Mining', 250.00, 'Colombia', 15),
(12, 'Cotton Textiles', 'Textile', 45.00, 'India', 75),
(13, 'Olive Oil', 'Food', 28.00, 'Spain', 55),
(14, 'Red Wine', 'Beverages', 35.00, 'Chile', 120),
(15, 'Craft Beer', 'Beverages', 20.00, 'Germany', 95);

-- ============================================
-- CONSULTA 1 — BETWEEN
-- ============================================

SELECT
    name AS producto,
    price AS precio,
    country_origin AS pais
FROM products
WHERE price BETWEEN 10 AND 30;

-- ============================================
-- CONSULTA 2 — IN
-- ============================================

SELECT
    name AS producto,
    category AS categoria,
    country_origin AS pais
FROM products
WHERE country_origin IN ('Colombia', 'Peru', 'Mexico');

-- ============================================
-- CONSULTA 3 — LIKE
-- ============================================

SELECT
    name AS producto,
    category AS categoria
FROM products
WHERE name LIKE '%Coffee%';

-- ============================================
-- CONSULTA 4 — FILTRO COMBINADO
-- ============================================

SELECT
    name AS producto,
    category AS categoria,
    price AS precio,
    country_origin AS pais
FROM products
WHERE category IN ('Food', 'Fruit')
AND price BETWEEN 10 AND 30
AND name LIKE '%o%'
ORDER BY price ASC;