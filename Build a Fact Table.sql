CREATE TABLE fact_sales (
    sale_id INT IDENTITY(1,1) PRIMARY KEY,
    product_key INT NOT NULL,
    store_key INT NOT NULL,
    employee_key INT NOT NULL,
    payment_key INT NOT NULL,
    purchase_date DATE,
    sale_price DECIMAL(18,2),
    cost_price DECIMAL(18,2),
    discount_amount DECIMAL(18,2),
    repair_cost DECIMAL(18,2)
);

ALTER TABLE fact_sales 
ADD net_profit AS (sale_price - cost_price - discount_amount - repair_cost);

ALTER TABLE fact_sales ADD CONSTRAINT FK_Product FOREIGN KEY (product_key) REFERENCES dim_product(product_key);
ALTER TABLE fact_sales ADD CONSTRAINT FK_Store FOREIGN KEY (store_key) REFERENCES dim_store(store_key);
ALTER TABLE fact_sales ADD CONSTRAINT FK_Employee FOREIGN KEY (employee_key) REFERENCES dim_employee(employee_key);
ALTER TABLE fact_sales ADD CONSTRAINT FK_Payment FOREIGN KEY (payment_key) REFERENCES dim_payment(payment_key);

SELECT TOP 5 * FROM fact_sales;