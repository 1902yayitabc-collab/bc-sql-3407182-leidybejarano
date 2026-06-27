-- ============================================
-- PROYECTO SEMANAL: DML — Manipulación de Datos
-- Semana 03 — Empresa de Exportación
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
-- TABLA PRODUCTS
-- ============================================

CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    country_origin TEXT NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0
);

-- ============================================
-- TABLA CLIENTS
-- ============================================

CREATE TABLE IF NOT EXISTS clients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    country TEXT NOT NULL
);

-- ============================================
-- TABLA SHIPMENTS
-- ============================================

CREATE TABLE IF NOT EXISTS shipments (
    id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL,
    shipment_date TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Pending',

    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- ============================================
-- TABLA CERTIFICATIONS
-- ============================================

CREATE TABLE IF NOT EXISTS certifications (
    id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    certification_name TEXT NOT NULL,
    issue_date TEXT NOT NULL,

    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ============================================
-- INSERT INTO PRODUCTS (15 FILAS)
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
-- INSERT INTO CLIENTS (15 FILAS)
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
(10, 'Ocean Foods', 'ocean@foods.com', 'Peru'),
(11, 'Andes Distribution', 'andes@distribution.com', 'Bolivia'),
(12, 'Golden Market', 'golden@market.com', 'Germany'),
(13, 'Royal Foods', 'royal@foods.com', 'UK'),
(14, 'Nature Trading', 'nature@trading.com', 'Italy'),
(15, 'World Export', 'world@export.com', 'Australia');

-- ============================================
-- INSERT INTO SHIPMENTS
-- ============================================

INSERT INTO shipments VALUES
(1, 1, 1, '2026-03-01', 'In Transit'),
(2, 2, 2, '2026-03-02', 'Delivered'),
(3, 3, 3, '2026-03-03', 'Pending'),
(4, 4, 4, '2026-03-04', 'In Transit'),
(5, 5, 5, '2026-03-05', 'Delivered');

-- ============================================
-- INSERT INTO CERTIFICATIONS
-- ============================================

INSERT INTO certifications VALUES
(1, 1, 'Organic Certified', '2026-01-10'),
(2, 2, 'Fair Trade', '2026-01-12'),
(3, 3, 'Export Quality', '2026-01-15'),
(4, 4, 'Premium Export', '2026-01-18'),
(5, 5, 'Eco Flowers', '2026-01-20');

-- ============================================
-- UPDATE POR PK
-- ============================================

UPDATE products
SET stock = 120
WHERE id = 1;

-- ============================================
-- UPDATE MULTIPLES COLUMNAS
-- ============================================

UPDATE clients
SET email = 'newcontact@global.com',
    country = 'United States'
WHERE id = 1;

-- ============================================
-- UPDATE CON CONDICIÓN
-- ============================================

UPDATE products
SET price = price + 5
WHERE category = 'Food';

-- ============================================
-- DELETE SEGURO
-- ============================================

SELECT id, name
FROM products
WHERE stock < 20;

DELETE FROM products
WHERE stock < 20;

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT * FROM products ORDER BY id;
SELECT * FROM clients ORDER BY id;
SELECT * FROM shipments ORDER BY id;
SELECT * FROM certifications ORDER BY id;