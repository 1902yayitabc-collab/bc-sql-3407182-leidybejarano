-- ============================================
-- PROYECTO SEMANAL: Empresa de Exportación
-- Semana 02 — DDL (Diseño de Esquemas)
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA (para que sea idempotente)
-- ============================================

DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS products;

-- ============================================
-- TABLA 1: PRODUCTS (entidad principal)
-- ============================================

CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    country_origin TEXT NOT NULL
);

-- ============================================
-- TABLA 2: CLIENTS
-- ============================================

CREATE TABLE IF NOT EXISTS clients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    country TEXT NOT NULL
);

-- ============================================
-- TABLA 3: SHIPMENTS (relación)
-- ============================================

CREATE TABLE IF NOT EXISTS shipments (
    id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL,
    shipment_date TEXT NOT NULL,
    status TEXT NOT NULL CHECK(status IN ('Pendiente', 'En tránsito', 'Entregado')),

    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- ============================================
-- DATOS DE PRUEBA (15 + 5 + 5)
-- ============================================

-- PRODUCTS (15)
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

-- CLIENTS (5)
INSERT INTO clients VALUES (1, 'Global Export Ltda', 'contact@global.com', 'USA');
INSERT INTO clients VALUES (2, 'Euro Trade', 'info@eurotrade.com', 'España');
INSERT INTO clients VALUES (3, 'Asia Imports', 'asia@trade.com', 'China');
INSERT INTO clients VALUES (4, 'Latam Foods', 'latam@foods.com', 'México');
INSERT INTO clients VALUES (5, 'Fresh Market', 'fresh@market.com', 'Canadá');

-- SHIPMENTS (5)
INSERT INTO shipments VALUES (1, 1, 1, '2026-01-10', 'En tránsito');
INSERT INTO shipments VALUES (2, 2, 2, '2026-01-12', 'Entregado');
INSERT INTO shipments VALUES (3, 3, 3, '2026-01-15', 'Pendiente');
INSERT INTO shipments VALUES (4, 4, 4, '2026-01-18', 'En tránsito');
INSERT INTO shipments VALUES (5, 5, 5, '2026-01-20', 'Entregado');