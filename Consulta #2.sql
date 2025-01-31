CREATE DATABASE StoreDB;
USE StoreDB;

-- Tabla de productos
CREATE TABLE Product (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Tabla de categorías
CREATE TABLE Category (
    name VARCHAR(100) PRIMARY KEY
);

-- Relación entre productos y categorías (uno a muchos)
ALTER TABLE Product ADD COLUMN category_name VARCHAR(100);
ALTER TABLE Product ADD FOREIGN KEY (category_name) REFERENCES Category(name);

-- Tabla de alimentos (subclase de productos)
CREATE TABLE Food (
    product_id INT PRIMARY KEY,
    expiration_date DATE NOT NULL,
    calories INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

-- Tabla de muebles (subclase de productos)
CREATE TABLE Furniture (
    product_id INT PRIMARY KEY,
    manufacture_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

-- Tabla de órdenes
CREATE TABLE Orders (
    id INT PRIMARY KEY
);

-- Tabla de líneas de orden (relación muchos a muchos entre órdenes y productos)
CREATE TABLE Order_Line (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);