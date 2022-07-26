-- Customer table for customers_df
CREATE TABLE customers_table (
  Customer_ID INT PRIMARY KEY NOT NULL,
  Year_Birth INTEGER,
  Education VARCHAR(30),
  Marital_Status VARCHAR(30),
  Income INTEGER,
  Children_Per_Household INTEGER,
  Teens_Per_Household INTEGER
);

-- Orders table for orders_df
CREATE TABLE orders_table (
  Customer_ID INT PRIMARY KEY,
  Date_Enrolled DATE, -- this should be in the formate yyyy-mm-dd
  Recency INTEGER,
  Deal_Purchases INTEGER,
  Web_Purchases INTEGER,
  Catalog_Purchases INTEGER,
  Store_Purchases INTEGER,
  Web_Visits INTEGER
);

-- Products table for products_df
CREATE TABLE products_table (
  Customer_ID INT PRIMARY KEY,
  Wines INTEGER,
  Fruits INTEGER,
  Meat INTEGER,
  Fish INTEGER,
  Sweets INTEGER,
  Gold INTEGER
);

-- Customer service table for customer_service_df
CREATE TABLE customer_service_table (
  Customer_ID INT PRIMARY KEY,
  Complain INTEGER,
  Response INTEGER
);

SELECT * FROM customers_table;
SELECT * FROM orders_table;
SELECT * FROM products_table;
SELECT * FROM customer_service_table;