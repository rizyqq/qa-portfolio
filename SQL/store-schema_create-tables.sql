
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100) NOT NULL,
    contact_title VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    postal_code VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    fax VARCHAR(100) NOT NULL,
    homepage VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100) NOT NULL,
    contact_title VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    postal_code VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    fax VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    title_of_courtesy VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    postal_code VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    home_phone VARCHAR(100) NOT NULL,
    extension VARCHAR(100) NOT NULL,
    photo VARCHAR(100) NOT NULL,
    notes VARCHAR(100) NOT NULL,
    reports_to INTEGER,
    photo_path VARCHAR(100) NOT NULL,
    CONSTRAINT fk_reports_to FOREIGN KEY (reports_to) REFERENCES employees(employee_id)
);

CREATE TABLE shippers (
    shipper_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL
);

CREATE TABLE region (
    region_id SERIAL PRIMARY KEY,
    region_description VARCHAR(100) NOT NULL
);

CREATE TABLE customer_demographics (
    customer_type_id SERIAL PRIMARY KEY,
    customer_desc VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    supplier_id INTEGER,
    category_id INTEGER,
    quantity_per_unit INTEGER NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL,
    units_in_stock INTEGER NOT NULL,
    units_in_order INTEGER NOT NULL,
    reorder_level INTEGER NOT NULL,
    discontinued VARCHAR(100) NOT NULL,
    CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES categories(category_id),
    CONSTRAINT fk_supplier_id FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    employee_id INTEGER,
    shipper_id INTEGER,
    order_date DATE NOT NULL,
    required_date DATE NOT NULL,
    shipped_date DATE,
    ship_via VARCHAR(100) NOT NULL,
    freight NUMERIC(10, 2) NOT NULL,
    ship_name VARCHAR(100) NOT NULL,
    ship_address VARCHAR(100) NOT NULL,
    ship_city VARCHAR(100) NOT NULL,
    ship_region VARCHAR(100) NOT NULL,
    ship_postal_code VARCHAR(100) NOT NULL,
    ship_country VARCHAR(100) NOT NULL,
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_shipper_id FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id)
);

CREATE TABLE order_details (
    order_id INTEGER,
    product_id INTEGER,
    unit_price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,
    discount REAL NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE customer_customer_demo (
    customer_id INTEGER,
    customer_type_id INTEGER,
    PRIMARY KEY (customer_id, customer_type_id),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_customer_type_id FOREIGN KEY (customer_type_id) REFERENCES customer_demographics(customer_type_id)
);

CREATE TABLE territories (
    territory_id SERIAL PRIMARY KEY,
    region_id INTEGER,
    territory_description VARCHAR(100) NOT NULL,
    CONSTRAINT fk_region_id FOREIGN KEY (region_id) REFERENCES region(region_id)
);

CREATE TABLE employee_territories (
    employee_id INTEGER,
    territory_id INTEGER,
    PRIMARY KEY (employee_id, territory_id),
    CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_territory_id FOREIGN KEY (territory_id) REFERENCES territories(territory_id)
);
