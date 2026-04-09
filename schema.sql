-- Migiro Motors launch schema
-- Recommended production domain: https://migiromotors.com.au
-- Compatible with SQLite and easy to adapt for MySQL/PostgreSQL.

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS enquiries;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS vehicles;

CREATE TABLE vehicles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    make TEXT NOT NULL,
    model TEXT NOT NULL,
    year INTEGER NOT NULL,
    body_type TEXT NOT NULL,
    fuel_type TEXT NOT NULL DEFAULT 'Petrol',
    transmission TEXT NOT NULL DEFAULT 'Automatic',
    price_aud REAL NOT NULL,
    origin_country TEXT NOT NULL DEFAULT 'Australia',
    status TEXT NOT NULL DEFAULT 'available' CHECK (status IN ('available', 'reserved', 'sold', 'shipped')),
    featured INTEGER NOT NULL DEFAULT 0 CHECK (featured IN (0, 1)),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone TEXT,
    country TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE enquiries (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    vehicle_id INTEGER,
    budget_aud REAL,
    message TEXT NOT NULL,
    preferred_domain TEXT NOT NULL DEFAULT 'migiromotors.com.au',
    status TEXT NOT NULL DEFAULT 'new' CHECK (status IN ('new', 'quoted', 'won', 'lost')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) ON DELETE SET NULL
);

CREATE TABLE shipments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    vehicle_id INTEGER NOT NULL,
    destination_country TEXT NOT NULL,
    port_of_loading TEXT NOT NULL DEFAULT 'Sydney',
    eta_days INTEGER,
    shipping_status TEXT NOT NULL DEFAULT 'scheduled' CHECK (shipping_status IN ('scheduled', 'in-transit', 'arrived', 'delivered')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) ON DELETE CASCADE
);

INSERT INTO vehicles (make, model, year, body_type, fuel_type, transmission, price_aud, status, featured) VALUES
('Toyota', 'Land Cruiser Prado', 2022, 'SUV', 'Diesel', 'Automatic', 78500, 'available', 1),
('Mazda', 'CX-5 GT', 2021, 'SUV', 'Petrol', 'Automatic', 33900, 'available', 1),
('Ford', 'Ranger Wildtrak', 2023, 'Ute/Pickup', 'Diesel', 'Automatic', 69200, 'reserved', 1),
('BMW', '320i M Sport', 2020, 'Sedan', 'Petrol', 'Automatic', 41800, 'available', 0);

INSERT INTO customers (first_name, last_name, email, phone, country) VALUES
('Amina', 'Njoroge', 'amina@example.com', '+254700000001', 'Kenya'),
('James', 'Moyo', 'james@example.com', '+263700000002', 'Zimbabwe');

INSERT INTO enquiries (customer_id, vehicle_id, budget_aud, message, status) VALUES
(1, 1, 80000, 'Need a family SUV with quick export processing.', 'quoted'),
(2, 3, 70000, 'Looking for a pickup for business use.', 'new');

INSERT INTO shipments (vehicle_id, destination_country, port_of_loading, eta_days, shipping_status) VALUES
(1, 'Kenya', 'Sydney', 24, 'scheduled'),
(3, 'Zimbabwe', 'Melbourne', 31, 'in-transit');

-- Useful examples
-- List available stock:
-- SELECT make, model, year, price_aud FROM vehicles WHERE status = 'available' ORDER BY price_aud DESC;

-- Quote pipeline summary:
-- SELECT status, COUNT(*) AS total FROM enquiries GROUP BY status;
