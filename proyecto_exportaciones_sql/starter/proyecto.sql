-- ============================================
-- PROYECTO SEMANAL: JOINs aplicados a tu dominio
-- Semana 09 — Empresa de Exportación
-- ============================================

-- Apagamos temporalmente las FK para limpiar la base de datos sin errores de restricción
PRAGMA foreign_keys = OFF;

-- ============================================
-- LIMPIEZA DE TABLAS
-- ============================================
DROP TABLE IF EXISTS certifications;
DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS clients;

-- Encendemos OBLIGATORIAMENTE las FK para la creación del esquema y los constraints
PRAGMA foreign_keys = ON;

-- ============================================
-- PARTE 1: ESQUEMA DE BASES DE DATOS RELACIONAL
-- ============================================

-- Tabla de referencia: Clientes (clients) - Mínimo 20 registros requeridos
CREATE TABLE clients (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    name    TEXT NOT NULL,
    email   TEXT NOT NULL UNIQUE,
    country TEXT NOT NULL
);

-- Tabla principal: Productos (products) - Mínimo 20 registros requeridos
CREATE TABLE products (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      TEXT NOT NULL UNIQUE,
    category  TEXT NOT NULL,
    price     REAL NOT NULL CHECK(price > 0),
    client_id INTEGER REFERENCES clients (id) ON DELETE RESTRICT
);

-- Tabla hija: Envíos (shipments) - Mínimo 80 registros requeridos
CREATE TABLE shipments (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    tracking_code TEXT NOT NULL UNIQUE,
    shipment_date TEXT NOT NULL DEFAULT (DATE('now')),
    status        TEXT NOT NULL DEFAULT 'In Transit',
    total_cost    REAL NOT NULL CHECK(total_cost >= 0),
    product_id    INTEGER REFERENCES products (id) ON DELETE RESTRICT
);

-- Tabla adicional del dominio: Certificaciones (certifications)
CREATE TABLE certifications (
    id                 INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id         INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    certification_name TEXT NOT NULL,
    issue_date         TEXT NOT NULL
);

-- ============================================
-- PARTE 2: INSERTS Y DATOS DE PRUEBA REALISTAS
-- ============================================

-- 1. Insertar 20 Clientes (Tabla Secundaria de Referencia)
INSERT INTO clients (id, name, email, country) VALUES
(1, 'Global Trade Inc', 'info@globaltrade.com', 'USA'),
(2, 'EuroFoods Corp', 'contact@eurofoods.es', 'Spain'),
(3, 'AsiaImports Ltd', 'import@asiaimports.jp', 'Japan'),
(4, 'Latam Logistics', 'ops@latamlog.com', 'Brazil'),
(5, 'Andean Products', 'sales@andean.co', 'Colombia'),
(6, 'Nordic Market', 'import@nordic.se', 'Sweden'),
(7, 'UK Wholesale', 'info@ukwholesale.co.uk', 'UK'),
(8, 'Oceania Foods', 'contact@oceania.au', 'Australia'),
(9, 'Canada Trading', 'trade@canadatrading.ca', 'Canada'),
(10, 'Deutschland AG', 'kontakt@deutschland.de', 'Germany'),
(11, 'France Import', 'contact@franceimport.fr', 'France'),
(12, 'Italia Foods', 'info@italiafoods.it', 'Italy'),
(13, 'MexDistribuciones', 'ventas@mexdist.mx', 'Mexico'),
(14, 'Chilean Fruit Co', 'export@chileanfruit.cl', 'Chile'),
(15, 'Peru Gourmet', 'info@perugourmet.pe', 'Peru'),
(16, 'Inca Grains', 'contact@incagrains.com', 'Bolivia'),
(17, 'Costa Rica Fruits', 'puravida@crfruits.cr', 'Costa Rica'),
(18, 'Ecuadorian Banana', 'info@ecbanana.ec', 'Ecuador'),
(19, 'Brasil Nuts Corp', 'sales@brasilnuts.br', 'Brazil'),
(20, 'Antillas Trading', 'info@antillastrading.com', 'Jamaica');

-- 2. Insertar 25 Productos (Tabla Principal - Cumple con mínimo de 20)
-- Nota: Los productos del 21 al 25 no tendrán envíos asociados para actuar como "huérfanos".
INSERT INTO products (id, name, category, price, client_id) VALUES
(1, 'Premium Coffee', 'Food', 25.50, 1),
(2, 'Organic Cocoa', 'Food', 30.00, 2),
(3, 'Export Banana', 'Fruit', 12.00, 3),
(4, 'Hass Avocado', 'Fruit', 18.00, 4),
(5, 'Rose Flowers', 'Flowers', 10.00, 5),
(6, 'Sweet Pineapple', 'Fruit', 15.00, 6),
(7, 'Green Mango', 'Fruit', 11.50, 7),
(8, 'Quinoa Grain', 'Grains', 22.00, 8),
(9, 'Refined Sugar', 'Food', 5.00, 9),
(10, 'Mineral Coal', 'Mining', 50.00, 10),
(11, 'Emerald Stones', 'Mining', 250.00, 11),
(12, 'Cotton Textiles', 'Textile', 45.00, 12),
(13, 'Olive Oil', 'Food', 28.00, 13),
(14, 'Red Wine', 'Beverages', 35.00, 14),
(15, 'Craft Beer', 'Beverages', 20.00, 15),
(16, 'Black Tea', 'Beverages', 14.00, 16),
(17, 'Almonds', 'Food', 19.00, 17),
(18, 'Cashew Nuts', 'Food', 21.00, 18),
(19, 'Coconut Oil', 'Food', 17.00, 19),
(20, 'Natural Honey', 'Food', 24.00, 20),
(21, 'Blueberries Specialty', 'Fruit', 16.00, 1),  -- Huérfano 1
(22, 'Green Tea Premium', 'Beverages', 13.50, 2), -- Huérfano 2
(23, 'Sea Salt Pack', 'Food', 6.00, 3),           -- Huérfano 3
(24, 'Vanilla Beans Luxury', 'Food', 40.00, 4),    -- Huérfano 4
(25, 'Dried Fruits Mix', 'Food', 18.50, 5);        -- Huérfano 5

-- 3. Insertar 80 Envíos (Tabla Hija - Cumple con mínimo de 80 filas)
INSERT INTO shipments (tracking_code, shipment_date, status, total_cost, product_id) VALUES
('EXP-001', '2026-01-05', 'Delivered', 450.00, 1),
('EXP-002', '2026-01-07', 'Delivered', 600.00, 2),
('EXP-003', '2026-01-10', 'Delivered', 320.00, 3),
('EXP-004', '2026-01-12', 'Delivered', 290.00, 4),
('EXP-005', '2026-01-15', 'Delivered', 150.00, 5),
('EXP-006', '2026-01-18', 'Delivered', 410.00, 6),
('EXP-007', '2026-01-20', 'Delivered', 190.00, 7),
('EXP-008', '2026-01-22', 'Delivered', 500.00, 8),
('EXP-009', '2026-01-25', 'Delivered', 890.00, 9),
('EXP-010', '2026-01-28', 'Delivered', 1200.00, 10),
('EXP-011', '2026-02-01', 'Delivered', 2500.00, 11),
('EXP-012', '2026-02-03', 'Delivered', 310.00, 12),
('EXP-013', '2026-02-05', 'Delivered', 420.00, 13),
('EXP-014', '2026-02-08', 'Delivered', 580.00, 14),
('EXP-015', '2026-02-10', 'Delivered', 340.00, 15),
('EXP-016', '2026-02-12', 'Delivered', 210.00, 16),
('EXP-017', '2026-02-15', 'Delivered', 230.00, 17),
('EXP-018', '2026-02-18', 'Delivered', 270.00, 18),
('EXP-019', '2026-02-20', 'Delivered', 180.00, 19),
('EXP-020', '2026-02-22', 'Delivered', 130.00, 20),
('EXP-021', '2026-03-01', 'Delivered', 460.00, 1),
('EXP-022', '2026-03-03', 'Delivered', 610.00, 2),
('EXP-023', '2026-03-05', 'Delivered', 330.00, 3),
('EXP-024', '2026-03-08', 'Delivered', 300.00, 4),
('EXP-025', '2026-03-10', 'Delivered', 160.00, 5),
('EXP-026', '2026-03-12', 'Delivered', 420.00, 6),
('EXP-027', '2026-03-15', 'Delivered', 200.00, 7),
('EXP-028', '2026-03-18', 'Delivered', 510.00, 8),
('EXP-029', '2026-03-20', 'Delivered', 900.00, 9),
('EXP-030', '2026-03-22', 'Delivered', 1250.00, 10),
('EXP-031', '2026-04-01', 'Delivered', 470.00, 1),
('EXP-032', '2026-04-03', 'Delivered', 620.00, 2),
('EXP-033', '2026-04-05', 'Delivered', 340.00, 3),
('EXP-034', '2026-04-08', 'Delivered', 310.00, 4),
('EXP-035', '2026-04-10', 'Delivered', 170.00, 5),
('EXP-036', '2026-04-12', 'Delivered', 430.00, 6),
('EXP-037', '2026-04-15', 'Delivered', 210.00, 7),
('EXP-038', '2026-04-18', 'Delivered', 520.00, 8),
('EXP-039', '2026-04-20', 'Delivered', 910.00, 9),
('EXP-040', '2026-04-22', 'Delivered', 1300.00, 10),
('EXP-041', '2026-05-01', 'Delivered', 480.00, 1),
('EXP-042', '2026-05-03', 'Delivered', 630.00, 2),
('EXP-043', '2026-05-05', 'Delivered', 350.00, 3),
('EXP-044', '2026-05-08', 'Delivered', 320.00, 4),
('EXP-045', '2026-05-10', 'Delivered', 180.00, 5),
('EXP-046', '2026-05-12', 'Delivered', 440.00, 6),
('EXP-047', '2026-05-15', 'Delivered', 220.00, 7),
('EXP-048', '2026-05-18', 'Delivered', 530.00, 8),
('EXP-049', '2026-05-20', 'Delivered', 920.00, 9),
('EXP-050', '2026-05-22', 'Delivered', 1350.00, 10),
('EXP-051', '2026-06-01', 'In Transit', 490.00, 1),
('EXP-052', '2026-06-02', 'In Transit', 640.00, 2),
('EXP-053', '2026-06-03', 'In Transit', 360.00, 3),
('EXP-054', '2026-06-04', 'In Transit', 330.00, 4),
('EXP-055', '2026-06-05', 'In Transit', 190.00, 5),
('EXP-056', '2026-06-06', 'In Transit', 450.00, 6),
('EXP-057', '2026-06-07', 'In Transit', 230.00, 7),
('EXP-058', '2026-06-08', 'In Transit', 540.00, 8),
('EXP-059', '2026-06-09', 'In Transit', 930.00, 9),
('EXP-060', '2026-06-10', 'In Transit', 1400.00, 10),
('EXP-061', '2026-06-11', 'In Transit', 320.00, 12),
('EXP-062', '2026-06-11', 'In Transit', 430.00, 13),
('EXP-063', '2026-06-12', 'In Transit', 590.00, 14),
('EXP-064', '2026-06-12', 'In Transit', 350.00, 15),
('EXP-065', '2026-06-13', 'In Transit', 220.00, 16),
('EXP-066', '2026-06-13', 'In Transit', 240.00, 17),
('EXP-067', '2026-06-14', 'In Transit', 280.00, 18),
('EXP-068', '2026-06-14', 'In Transit', 190.00, 19),
('EXP-069', '2026-06-15', 'In Transit', 140.00, 20),
('EXP-070', '2026-06-15', 'In Transit', 500.00, 1),
('EXP-071', '2026-06-16', 'In Transit', 650.00, 2),
('EXP-072', '2026-06-16', 'In Transit', 370.00, 3),
('EXP-073', '2026-06-17', 'In Transit', 340.00, 4),
('EXP-074', '2026-06-17', 'In Transit', 200.00, 5),
('EXP-075', '2026-06-18', 'In Transit', 460.00, 6),
('EXP-076', '2026-06-18', 'In Transit', 240.00, 7),
('EXP-077', '2026-06-18', 'In Transit', 550.00, 8),
('EXP-078', '2026-06-18', 'In Transit', 940.00, 9),
('EXP-079', '2026-06-18', 'In Transit', 1450.00, 10),
('EXP-080', '2026-06-18', 'In Transit', 2600.00, 11);

-- ============================================
-- PARTE 3: CONSULTAS OPERACIONALES (JOINs)
-- ============================================

-- CONSULTA 1: INNER JOIN principal
-- Muestra solo los productos que tienen envíos registrados
SELECT
    p.name          AS producto,
    s.tracking_code AS codigo_rastreo,
    s.shipment_date AS fecha_envio,
    s.status        AS estado
FROM products p
INNER JOIN shipments s ON s.product_id = p.id;

-- CONSULTA 2: JOIN con tres tablas
-- Encadena shipments + products + clients para ver el flujo comercial
SELECT
    s.tracking_code AS codigo_rastreo,
    p.name          AS producto,
    c.name          AS cliente,
    c.country       AS pais_cliente,
    s.total_cost    AS costo_envio
FROM shipments s
INNER JOIN products p ON s.product_id = p.id
INNER JOIN clients  c ON p.client_id  = c.id;

-- CONSULTA 3: LEFT JOIN — todos los registros
-- Muestra todos los productos del catálogo, tengan o no envíos vinculados
SELECT
    p.name          AS producto,
    p.category      AS categoria,
    s.tracking_code AS codigo_rastreo
FROM products p
LEFT JOIN shipments s ON s.product_id = p.id;

-- CONSULTA 4: Detectar huérfanos
-- Filtra específicamente aquellos productos que jamás se han enviado
SELECT
    p.id       AS id_producto,
    p.name     AS producto_sin_envios,
    p.category AS categoria
FROM products p
LEFT JOIN shipments s ON s.product_id = p.id
WHERE s.id IS NULL;

-- CONSULTA 5: Reporte agregado con LEFT JOIN + COUNT
-- Consolida la cantidad total de envíos por producto (incluyendo ceros)
SELECT
    p.name       AS producto,
    COUNT(s.id)  AS total_envios
FROM products p
LEFT JOIN shipments s ON s.product_id = p.id
GROUP BY p.name
ORDER BY total_envios DESC;