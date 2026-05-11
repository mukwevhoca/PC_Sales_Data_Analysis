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
) -- Ensure NO comma is after 'repair_cost' here
SELECT 
    p.product_key, 
    s.store_key, 
    e.employee_key, 
    py.payment_key, 
    raw.[Purchase_Date], 
    raw.[Sale_Price], 
    raw.[Cost_Price], 
    raw.[Discount_Amount],
    raw.[Cost_of_Repairs]
FROM pc_sales_csv raw
-- Joining to the Dimension Tables to fetch the Surrogate Keys
JOIN dim_product p ON raw.[PC_Make] = p.pc_make 
                  AND raw.[PC_Model] = p.pc_model 
                  AND raw.[RAM] = p.ram
JOIN dim_store s   ON raw.[Shop_Name] = s.shop_name 
                  AND raw.[Province_or_City] = s.city
JOIN dim_employee e ON raw.[Sales_Person_Name] = e.sales_person_name
JOIN dim_payment py ON raw.[Payment_Method] = py.payment_method;
