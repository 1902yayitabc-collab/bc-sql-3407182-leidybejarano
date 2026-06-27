-- ============================================
-- PROYECTO SEMANAL: NULL y Constraints
-- Semana 07 — Empresa de Exportación
-- ============================================


PRAGMA foreign_keys = OFF;

-- ============================================
-- LIMPIEZA DE TABLAS
-- ============================================
DROP TABLE IF EXISTS certifications;
DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS products;


PRAGMA foreign_keys = ON;

-- ============================================
-- PARTE 1: ESQUEMA CON CONSTRAINTS ESTRICTOS
-- ============================================

CREATE TABLE IF NOT EXISTS products (
    id             INTEGER PRIMARY KEY,
    name           TEXT    NOT NULL UNIQUE,              
    category       TEXT    NOT NULL,
    price          REAL    NOT NULL CHECK(price > 0),     
    country_origin TEXT    NOT NULL,
    stock          INTEGER NOT NULL DEFAULT 0             
);

CREATE TABLE IF NOT EXISTS clients (
    id             INTEGER PRIMARY KEY,
    name           TEXT    NOT NULL,
    email          TEXT    NOT NULL UNIQUE,              
    country        TEXT    NOT NULL
);

CREATE TABLE IF NOT EXISTS shipments (
    id                INTEGER PRIMARY KEY AUTOINCREMENT,
    tracking_code     TEXT    NOT NULL UNIQUE,            
    product_id        INTEGER NOT NULL,
    client_id         INTEGER NOT NULL,
    shipment_date     TEXT    NOT NULL,
    delivery_date     TEXT    NULL,                       
    status            TEXT    NOT NULL DEFAULT 'In Transit', 
    customs_notes     TEXT    NULL,                       
    total_cost        REAL    NOT NULL CHECK(total_cost >= 0), 
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT,
    FOREIGN KEY (client_id)  REFERENCES clients(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS certifications (
    id                 INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id         INTEGER NOT NULL,
    certification_name TEXT    NOT NULL,
    issue_date         TEXT    NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- ============================================
-- PARTE 2: INSERTS (Tus datos de la Semana 06)
-- ============================================

-- Insertar Clientes
INSERT INTO clients VALUES
(1, 'Global Trade Inc', 'info@globaltrade.com', 'USA'),
(2, 'EuroFoods Corp', 'contact@eurofoods.es', 'Spain'),
(3, 'AsiaImports Ltd', 'import@asiaimports.jp', 'Japan');

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

INSERT INTO shipments (tracking_code, product_id, client_id, shipment_date, delivery_date, status, customs_notes, total_cost) VALUES
('EXP-2026-001', 1, 1, '2026-06-01', '2026-06-05', 'Delivered', 'Passed customs without issues', 450.00),
('EXP-2026-002', 2, 2, '2026-06-02', '2026-06-07', 'Delivered', 'Requires cold storage monitoring', 600.00),
('EXP-2026-003', 3, 3, '2026-06-10', NULL,         'In Transit', NULL, 320.00), -- NULL 1
('EXP-2026-004', 4, 1, '2026-06-11', NULL,         'In Transit', 'Fitosanitary check pending', 290.00),
('EXP-2026-005', 5, 2, '2026-06-12', '2026-06-14', 'Delivered', 'Fragile flower load', 150.00),
('EXP-2026-006', 6, 3, '2026-06-14', NULL,         'In Transit', NULL, 410.00), -- NULL 2
('EXP-2026-007', 7, 1, '2026-06-15', NULL,         'In Transit', 'Prioritized delivery', 190.00),
('EXP-2026-008', 8, 2, '2026-06-16', NULL,         'Pending',    NULL, 0.00),   -- NULL 3 e incremento de límite (0)
('EXP-2026-009', 9, 3, '2026-06-01', '2026-06-06', 'Delivered', 'Standard clearance', 890.00),
('EXP-2026-010', 10, 1, '2026-05-20', '2026-05-28', 'Delivered', 'Heavy load bulk transport', 1200.00),
('EXP-2026-011', 11, 2, '2026-06-17', NULL,        'In Transit', 'High value asset - Secure escort', 2500.00),
('EXP-2026-012', 12, 3, '2026-06-02', '2026-06-09', 'Delivered', NULL, 310.00), -- NULL 4
('EXP-2026-013', 13, 1, '2026-06-03', '2026-06-07', 'Delivered', 'Glass containers handled safely', 420.00),
('EXP-2026-014', 14, 2, '2026-06-15', NULL,        'In Transit', 'Wine pallets stacked', 580.00),
('EXP-2026-015', 15, 3, '2026-06-16', NULL,        'Pending',    NULL, 340.00), -- NULL 5
('EXP-2026-016', 16, 1, '2026-06-04', '2026-06-10', 'Delivered', 'Dry cargo', 210.00),
('EXP-2026-017', 17, 2, '2026-06-05', '2026-06-11', 'Delivered', 'Verified weight', 230.00),
('EXP-2026-018', 18, 3, '2026-06-06', '2026-06-12', 'Delivered', 'Passed EU standards', 270.00),
('EXP-2026-019', 19, 1, '2026-06-17', NULL,        'In Transit', NULL, 180.00), -- NULL 6
('EXP-2026-020', 20, 2, '2026-06-18', NULL,        'Pending',    'Stickers attached', 130.00),
('EXP-2026-021', 21, 3, '2026-06-07', '2026-06-11', 'Delivered', 'Refrigerated container', 510.00),
('EXP-2026-022', 22, 1, '2026-06-08', '2026-06-13', 'Delivered', NULL, 160.00), -- NULL 7
('EXP-2026-023', 23, 2, '2026-06-09', '2026-06-14', 'Delivered', 'Industrial use bags', 95.00),
('EXP-2026-024', 24, 3, '2026-06-18', NULL,        'In Transit', 'Air freight fast shipping', 750.00),
('EXP-2026-025', 25, 1, '2026-06-10', NULL,        'In Transit', NULL, 640.00), -- NULL 8
('EXP-2026-026', 26, 2, '2026-06-11', '2026-06-16', 'Delivered', 'Paper sack packing', 120.00),
('EXP-2026-027', 27, 3, '2026-06-12', NULL,        'In Transit', 'Tanker container', 880.00),
('EXP-2026-028', 28, 1, '2026-06-13', '2026-06-17', 'Delivered', 'Special client notification sent', 490.00),
('EXP-2026-029', 29, 2, '2026-06-14', NULL,        'In Transit', NULL, 310.00), -- NULL 9
('EXP-2026-030', 30, 3, '2026-06-15', '2026-06-18', 'Delivered', 'Finalized audit review', 220.00);


-- ============================================
-- PARTE 3: CONSULTAS DE EVALUACIÓN (IS NULL y COALESCE)
-- ============================================

SELECT 
    id, 
    tracking_code, 
    status, 
    shipment_date
FROM shipments
WHERE delivery_date IS NULL;

SELECT 
    tracking_code,
    status,
    COALESCE(customs_notes, 'Sin observaciones / Aduana Limpia') AS observaciones_aduana
FROM shipments;