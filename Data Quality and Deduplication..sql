-- 1. Product Dimension: Capturing hardware specifics
CREATE TABLE dim_product (
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    pc_make NVARCHAR(100),
    pc_model NVARCHAR(100),
    storage_type NVARCHAR(50),
    storage_capacity NVARCHAR(50),
    ram NVARCHAR(50)
);

-- 2. Store Dimension: Combining Shop and Location as per your Excel mapping
CREATE TABLE dim_store (
    store_key INT IDENTITY(1,1) PRIMARY KEY,
    shop_name NVARCHAR(100),
    shop_age INT,
    city NVARCHAR(100),
    country_state NVARCHAR(100),
    continent NVARCHAR(100)
);

-- 3. Employee Dimension: Sales staff details
CREATE TABLE dim_employee (
    employee_key INT IDENTITY(1,1) PRIMARY KEY,
    sales_person_name NVARCHAR(100),
    department NVARCHAR(100)
);

-- 4. Payment Dimension: Tracking the channel
CREATE TABLE dim_payment (
    payment_key INT IDENTITY(1,1) PRIMARY KEY,
    payment_method NVARCHAR(50)
);