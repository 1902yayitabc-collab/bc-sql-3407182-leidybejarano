-- ============================================
-- PROYECTO SEMANAL: Empresa de Exportación
-- Semana 01
-- ============================================

-- ============================================
-- PASO 1: Tabla principal → products
-- ============================================

CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price REAL,
    country_origin TEXT
);

-- ============================================
-- PASO 2: Otras entidades → clients y shipments
-- ============================================

CREATE TABLE clients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    country TEXT
);

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
-- PASO 3: INSERTS (DATOS DE PRUEBA)
-- ============================================

-- 15 PRODUCTS (tabla principal)
INSERT INTO products VALUES (1, 'Café Premium', 'Alimentos', 25.50, 'Colombia');
INSERT INTO products VALUES (2, 'Flores Rosas', 'Floricultura', 15.00, 'Colombia');
INSERT INTO products VALUES (3, 'Banano Orgánico', 'Alimentos', 10.00, 'Ecuador');
INSERT INTO products VALUES (4, 'Aguacate Hass', 'Alimentos', 12.50, 'México');
INSERT INTO products VALUES (5, 'Cacao en grano', 'Alimentos', 30.00, 'Perú');
INSERT INTO products VALUES (6, 'Mango Exportación', 'Frutas', 8.00, 'Colombia');
INSERT INTO products VALUES (7, 'Piña Dulce', 'Frutas', 9.50, 'Costa Rica');
INSERT INTO products VALUES (8, 'Quinua', 'Granos', 20.00, 'Bolivia');
INSERT INTO products VALUES (9, 'Azúcar Refinada', 'Alimentos', 5.00, 'Brasil');
INSERT INTO products VALUES (10, 'Carbón Mineral', 'Minería', 50.00, 'Colombia');
INSERT INTO products VALUES (11, 'Esmeraldas', 'Minería', 200.00, 'Colombia');
INSERT INTO products VALUES (12, 'Textiles Algodón', 'Textil', 40.00, 'India');
INSERT INTO products VALUES (13, 'Cerveza Artesanal', 'Bebidas', 18.00, 'Alemania');
INSERT INTO products VALUES (14, 'Vino Tinto', 'Bebidas', 35.00, 'Chile');
INSERT INTO products VALUES (15, 'Aceite de Oliva', 'Alimentos', 22.00, 'España');

-- 5 CLIENTS
INSERT INTO clients VALUES (1, 'Exportadora Global Ltda', 'contacto@exportglobal.com', 'USA');
INSERT INTO clients VALUES (2, 'Importaciones Europa', 'ventas@europa.com', 'España');
INSERT INTO clients VALUES (3, 'Asia Trading Co', 'info@asiatrading.com', 'China');
INSERT INTO clients VALUES (4, 'Mercado Latino', 'compras@latino.com', 'México');
INSERT INTO clients VALUES (5, 'Fresh Foods Inc', 'orders@freshfoods.com', 'Canadá');

-- 5 SHIPMENTS
INSERT INTO shipments VALUES (1, 1, 1, '2026-01-10', 'En tránsito');
INSERT INTO shipments VALUES (2, 2, 2, '2026-01-12', 'Entregado');
INSERT INTO shipments VALUES (3, 3, 3, '2026-01-15', 'Pendiente');
INSERT INTO shipments VALUES (4, 4, 4, '2026-01-18', 'En tránsito');
INSERT INTO shipments VALUES (5, 5, 5, '2026-01-20', 'Entregado');

-- ============================================
-- PASO 4: CONSULTAS SELECT
-- ============================================

-- Mostrar todos los productos
SELECT * FROM products;

-- Mostrar nombres de productos ordenados alfabéticamente
SELECT name 
FROM products
ORDER BY name ASC;

-- Contar total de productos
SELECT COUNT(*) AS total_products
FROM products;

-- Ver clientes
SELECT * FROM clients;

-- Ver envíos
SELECT * FROM shipments;