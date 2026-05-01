CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT,
    category TEXT,
    price REAL,
    country_origin TEXT
);

CREATE TABLE clients (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    country TEXT
);

CREATE TABLE shipments (
    id INTEGER PRIMARY KEY,
    product_id INTEGER,
    client_id INTEGER,
    shipment_date TEXT,
    status TEXT
);

INSERT INTO products VALUES (1, 'Café Premium', 'Alimentos', 25.5, 'Colombia');
INSERT INTO products VALUES (2, 'Cacao Orgánico', 'Alimentos', 30.0, 'Perú');
INSERT INTO products VALUES (3, 'Banano Exportación', 'Frutas', 12.0, 'Ecuador');
INSERT INTO products VALUES (4, 'Aguacate Hass', 'Frutas', 18.0, 'México');
INSERT INTO products VALUES (5, 'Flores Rosas', 'Floricultura', 10.0, 'Colombia');

INSERT INTO clients VALUES (1, 'Global Export Ltda', 'contact@global.com', 'USA');
INSERT INTO clients VALUES (2, 'Euro Trade', 'info@eurotrade.com', 'España');
INSERT INTO clients VALUES (3, 'Asia Imports', 'asia@trade.com', 'China');
INSERT INTO clients VALUES (4, 'Latam Foods', 'latam@foods.com', 'Chile');
INSERT INTO clients VALUES (5, 'Fresh Market', 'fresh@market.com', 'Canadá');

INSERT INTO shipments VALUES (1, 1, 1, '2026-01-10', 'En tránsito');
INSERT INTO shipments VALUES (2, 2, 2, '2026-01-12', 'Entregado');
INSERT INTO shipments VALUES (3, 3, 3, '2026-01-15', 'Pendiente');
INSERT INTO shipments VALUES (4, 4, 4, '2026-01-18', 'En tránsito');
INSERT INTO shipments VALUES (5, 5, 5, '2026-01-20', 'Entregado');

