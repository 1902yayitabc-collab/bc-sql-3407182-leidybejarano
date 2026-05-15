-- ============================================
-- PROYECTO SEMANAL: Funciones de Agregación
-- Semana 06 — Empresa de Exportación
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
-- REPORTE 1: COUNT + SUM + AVG
-- ============================================

SELECT
    COUNT(*) AS total_productos,
    SUM(stock) AS stock_total,
    AVG(price) AS precio_promedio
FROM products;

-- ============================================
-- REPORTE 2: MIN + MAX
-- ============================================

SELECT
    MIN(price) AS precio_minimo,
    MAX(price) AS precio_maximo
FROM products;

-- ============================================
-- REPORTE 3: GROUP BY
-- ============================================

SELECT
    category AS categoria,
    COUNT(*) AS total_productos,
    AVG(price) AS precio_promedio,
    SUM(stock) AS stock_total
FROM products
GROUP BY category
ORDER BY total_productos DESC;

-- ============================================
-- REPORTE 4: HAVING
-- ============================================

SELECT
    category AS categoria,
    COUNT(*) AS total_productos
FROM products
GROUP BY category
HAVING COUNT(*) > 3;