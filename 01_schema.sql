-- ============================================
-- Retail Business Financial Performance Analysis
-- Schema Creation Script
-- ============================================

CREATE DATABASE IF NOT EXISTS retail_finance;
USE retail_finance;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id   VARCHAR(20) PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  segment       VARCHAR(50),
  city          VARCHAR(50),
  state         VARCHAR(50)
);

CREATE TABLE products (
  product_id    VARCHAR(20) PRIMARY KEY,
  product_name  VARCHAR(150) NOT NULL,
  category      VARCHAR(50),
  sub_category  VARCHAR(50)
);

CREATE TABLE orders (
  order_id      VARCHAR(20) PRIMARY KEY,
  order_date    DATE,
  ship_date     DATE,
  customer_id   VARCHAR(20),
  product_id    VARCHAR(20),
  region        VARCHAR(50),
  sales         DECIMAL(10,2),
  quantity      INT,
  discount      DECIMAL(4,2),
  profit        DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
