-- ============================================
-- PROYECTO SEMANAL: Empresa de Exportación
-- Semana 01
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- TABLA PRINCIPAL: products
-- ============================================

CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price REAL,
    country_origin TEXT
);

-- ============================================
-- TABLA: clients
-- ============================================

CREATE TABLE clients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    country TEXT
);

-- ============================================
-- TABLA: shipments
-- ============================================

CREATE TABLE shipments (
    id INTEGER PRIMARY KEY,
    product_id INTEGER,
    client_id INTEGER,
    shipment_date TEXT,
    status TEXT,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- ============================================
-- DATOS: PRODUCTS (15 registros)
-- ============================================

INSERT INTO products VALUES (1, 'Café Premium', 'Alimentos', 25.5, 'Colombia');
INSERT INTO products VALUES (2, 'Cacao Orgánico', 'Alimentos', 30.0, 'Perú');
INSERT INTO products VALUES (3, 'Banano Exportación', 'Frutas', 12.0, 'Ecuador');
INSERT INTO products VALUES (4, 'Aguacate Hass', 'Frutas', 18.0, 'México');
INSERT INTO products VALUES (5, 'Flores Rosas', 'Floricultura', 10.0, 'Colombia');
INSERT INTO products VALUES (6, 'Mango Exportación', 'Frutas', 8.0, 'Colombia');
INSERT INTO products VALUES (7, 'Piña Dulce', 'Frutas', 9.5, 'Costa Rica');
INSERT INTO products VALUES (8, 'Quinua', 'Granos', 20.0, 'Bolivia');
INSERT INTO products VALUES (9, 'Azúcar Refinada', 'Alimentos', 5.0, 'Brasil');
INSERT INTO products VALUES (10, 'Carbón Mineral', 'Minería', 50.0, 'Colombia');
INSERT INTO products VALUES (11, 'Esmeraldas', 'Minería', 200.0, 'Colombia');
INSERT INTO products VALUES (12, 'Textiles Algodón', 'Textil', 40.0, 'India');
INSERT INTO products VALUES (13, 'Cerveza Artesanal', 'Bebidas', 18.0, 'Alemania');
INSERT INTO products VALUES (14, 'Vino Tinto', 'Bebidas', 35.0, 'Chile');
INSERT INTO products VALUES (15, 'Aceite de Oliva', 'Alimentos', 22.0, 'España');

-- ============================================
-- DATOS: CLIENTS (5 registros)
-- ============================================

INSERT INTO clients VALUES (1, 'Global Export Ltda', 'contact@global.com', 'USA');
INSERT INTO clients VALUES (2, 'Euro Trade', 'info@eurotrade.com', 'España');
INSERT INTO clients VALUES (3, 'Asia Imports', 'asia@trade.com', 'China');
INSERT INTO clients VALUES (4, 'Latam Foods', 'latam@foods.com', 'Chile');
INSERT INTO clients VALUES (5, 'Fresh Market', 'fresh@market.com', 'Canadá');

-- ============================================
-- DATOS: SHIPMENTS (5 registros)
-- ============================================

INSERT INTO shipments VALUES (1, 1, 1, '2026-01-10', 'En tránsito');
INSERT INTO shipments VALUES (2, 2, 2, '2026-01-12', 'Entregado');
INSERT INTO shipments VALUES (3, 3, 3, '2026-01-15', 'Pendiente');
INSERT INTO shipments VALUES (4, 4, 4, '2026-01-18', 'En tránsito');
INSERT INTO shipments VALUES (5, 5, 5, '2026-01-20', 'Entregado');

-- ============================================
-- CONSULTAS BÁSICAS
-- ============================================

-- Ver todos los productos
SELECT * FROM products;

-- Productos ordenados alfabéticamente
SELECT name, price
FROM products
ORDER BY name ASC;

-- Contar productos
SELECT COUNT(*) AS total_products
FROM products;

-- Ver clientes
SELECT * FROM clients;

-- Ver envíos
SELECT * FROM shipments;

-- JOIN (nivel extra - recomendado)
SELECT 
    clients.name AS client,
    products.name AS product,
    shipments.status
FROM shipments
JOIN clients ON shipments.client_id = clients.id
JOIN products ON shipments.product_id = products.id;