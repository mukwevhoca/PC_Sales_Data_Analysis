-- Total Number of Sales Records
SELECT COUNT(*) AS Total_Sales_Transactions 
FROM fact_sales;

-- Sales per Continent (Joining Fact to Store Dimension)
SELECT s.continent, COUNT(f.sale_id) AS Sales_Count
FROM fact_sales f
JOIN dim_store s ON f.store_key = s.store_key
GROUP BY s.continent
ORDER BY Sales_Count DESC;

-- Price Overview 
SELECT 
    AVG(sale_price) AS Average_Sale_Price,
    MAX(sale_price) AS Highest_Price,
    MIN(sale_price) AS Lowest_Price
FROM fact_sales;

-- Distinct PC Brands (From the Product Dimension)
SELECT COUNT(DISTINCT pc_make) AS Total_Brands
FROM dim_product;

-- Total Revenue
SELECT SUM(sale_price) AS Total_Revenue 
FROM fact_sales;

-- Total Revenue per PC Make (Brand Performance)
SELECT p.pc_make, SUM(f.sale_price) AS Brand_Revenue
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
GROUP BY p.pc_make
ORDER BY Brand_Revenue DESC;

-- Total Cost of Repairs per Department
SELECT e.department, SUM(f.repair_cost) AS Total_Repair_Expense
FROM fact_sales f
JOIN dim_employee e ON f.employee_key = e.employee_key
GROUP BY e.department
ORDER BY Total_Repair_Expense DESC;

-- Total Profit per Shop Name
SELECT s.shop_name, SUM(f.net_profit) AS Total_Profit
FROM fact_sales f
JOIN dim_store s ON f.store_key = s.store_key
GROUP BY s.shop_name
ORDER BY Total_Profit DESC;

SELECT 
    f.sale_id,
    p.pc_model,
    f.sale_price,
    f.net_profit,
    -- Rounding to 2 decimal places for a professional report
    ROUND((f.net_profit / NULLIF(f.sale_price, 0)) * 100, 2) AS Profit_Margin_Percentage
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
ORDER BY Profit_Margin_Percentage DESC;

SELECT TOP 1
    s.continent, 
    SUM(f.sale_price) AS Total_Revenue
FROM fact_sales f
JOIN dim_store s ON f.store_key = s.store_key
GROUP BY s.continent
ORDER BY Total_Revenue DESC;

-- Average Sale Price by RAM Size
SELECT 
    p.ram, 
    AVG(f.sale_price) AS Avg_Price
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
GROUP BY p.ram
ORDER BY Avg_Price DESC;

-- Total Revenue by Storage Capacity
SELECT 
    p.storage_capacity, 
    SUM(f.sale_price) AS Total_Revenue
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
GROUP BY p.storage_capacity
ORDER BY Total_Revenue DESC;

INSERT INTO fact_sales (
    product_key, 
    store_key, 
    employee_key, 
    payment_key, 
    purchase_date, 
    sale_price, 
    cost_price, 
    discount_amount, 
    repair_cost
)
SELECT 
    p.product_key, 
    s.store_key, 
    e.employee_key, 
    py.payment_key, 
    TRY_CAST(raw.[Purchase_Date] AS DATE), -- Safely converts the date
    raw.[Sale_Price], 
    raw.[Cost_Price], 
    raw.[Discount_Amount],
    raw.[Cost_of_Repairs]
FROM pc_sales_csv raw
-- Using TRIM and matching the exact columns used to build the dimensions
JOIN dim_product p ON TRIM(raw.[PC_Make]) = TRIM(p.pc_make) 
                  AND TRIM(raw.[PC_Model]) = TRIM(p.pc_model) 
                  AND TRIM(raw.[RAM]) = TRIM(p.ram)
JOIN dim_store s   ON TRIM(raw.[Shop_Name]) = TRIM(s.shop_name) 
                  AND TRIM(raw.[Province_or_City]) = TRIM(s.city)
JOIN dim_employee e ON TRIM(raw.[Sales_Person_Name]) = TRIM(e.sales_person_name)
JOIN dim_payment py ON TRIM(raw.[Payment_Method]) = TRIM(py.payment_method);

-- Test query to see which join is breaking the load
SELECT 
    (SELECT COUNT(*) FROM pc_sales_csv raw JOIN dim_product p ON TRIM(raw.[PC_Make]) = TRIM(p.pc_make) AND TRIM(raw.[PC_Model]) = TRIM(p.pc_model)) AS Product_Matches,
    (SELECT COUNT(*) FROM pc_sales_csv raw JOIN dim_store s ON TRIM(raw.[Shop_Name]) = TRIM(s.shop_name)) AS Store_Matches,
    (SELECT COUNT(*) FROM pc_sales_csv raw JOIN dim_employee e ON TRIM(raw.[Sales_Person_Name]) = TRIM(e.sales_person_name)) AS Employee_Matches;

