-- ============================================
-- PROYECTO SEMANAL: Consultas SELECT
-- Semana 04 — Empresa de Exportación
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
-- INSERTS PRODUCTS (30 FILAS)
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
(15, 'Craft Beer', 'Beverages', 20.00, 'Germany', 95),
(16, 'Black Tea', 'Beverages', 14.00, 'India', 88),
(17, 'Almonds', 'Food', 19.00, 'USA', 110),
(18, 'Cashew Nuts', 'Food', 21.00, 'Brazil', 130),
(19, 'Coconut Oil', 'Food', 17.00, 'Philippines', 65),
(20, 'Natural Honey', 'Food', 24.00, 'Argentina', 45),
(21, 'Blueberries', 'Fruit', 16.00, 'Canada', 150),
(22, 'Green Tea', 'Beverages', 13.50, 'China', 70),
(23, 'Sea Salt', 'Food', 6.00, 'Chile', 180),
(24, 'Vanilla Beans', 'Food', 40.00, 'Madagascar', 25),
(25, 'Rice Export', 'Grains', 9.00, 'Thailand', 400),
(26, 'Corn Flour', 'Food', 7.00, 'Mexico', 140),
(27, 'Palm Oil', 'Food', 11.00, 'Indonesia', 95),
(28, 'Coffee Beans', 'Food', 29.00, 'Colombia', 160),
(29, 'Chocolate Bars', 'Food', 8.50, 'Belgium', 210),
(30, 'Dried Fruits', 'Food', 18.50, 'Turkey', 75);

-- ============================================
-- INSERTS CLIENTS (10 FILAS)
-- ============================================

INSERT INTO clients VALUES
(1, 'Global Imports', 'contact@global.com', 'USA'),
(2, 'Euro Trade', 'sales@eurotrade.com', 'Spain'),
(3, 'Asia Market', 'info@asia.com', 'China'),
(4, 'Latam Foods', 'orders@latam.com', 'Chile'),
(5, 'Fresh Market', 'fresh@market.com', 'Canada'),
(6, 'Pacific Traders', 'pacific@trade.com', 'Japan'),
(7, 'Food Export Inc', 'food@export.com', 'Mexico'),
(8, 'Healthy Store', 'healthy@store.com', 'Argentina'),
(9, 'Luxury Imports', 'luxury@imports.com', 'France'),
(10, 'Ocean Foods', 'ocean@foods.com', 'Peru');

-- ============================================
-- INSERTS SHIPMENTS (10 FILAS)
-- ============================================

INSERT INTO shipments VALUES
(1, 1, 1, '2026-04-01', 'In Transit'),
(2, 2, 2, '2026-04-02', 'Delivered'),
(3, 3, 3, '2026-04-03', 'Pending'),
(4, 4, 4, '2026-04-04', 'In Transit'),
(5, 5, 5, '2026-04-05', 'Delivered'),
(6, 6, 6, '2026-04-06', 'Pending'),
(7, 7, 7, '2026-04-07', 'Delivered'),
(8, 8, 8, '2026-04-08', 'In Transit'),
(9, 9, 9, '2026-04-09', 'Pending'),
(10, 10, 10, '2026-04-10', 'Delivered');

-- ============================================
-- CONSULTA 1
-- Listado general con alias
-- ============================================

SELECT
    id AS codigo_producto,
    name AS nombre_producto,
    category AS categoria,
    price AS precio
FROM products;

-- ============================================
-- CONSULTA 2
-- Filtro simple
-- ============================================

SELECT
    name AS producto,
    price AS precio
FROM products
WHERE price > 20;

-- ============================================
-- CONSULTA 3
-- Filtro combinado
-- ============================================

SELECT
    name AS producto,
    country_origin AS pais,
    stock AS inventario
FROM products
WHERE category = 'Food'
AND stock > 50;

-- ============================================
-- CONSULTA 4
-- ORDER BY + LIMIT
-- ============================================

SELECT
    name AS producto,
    price AS precio
FROM products
ORDER BY price DESC
LIMIT 5;

-- ============================================
-- CONSULTA 5
-- PAGINACIÓN
-- ============================================

-- Página 1
SELECT
    id AS codigo,
    name AS producto
FROM products
ORDER BY name ASC
LIMIT 3 OFFSET 0;

-- Página 2
SELECT
    id AS codigo,
    name AS producto
FROM products
ORDER BY name ASC
LIMIT 3 OFFSET 3;