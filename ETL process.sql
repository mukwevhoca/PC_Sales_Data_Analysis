-- 1. Populating the Product Dimension

INSERT INTO dim_product (pc_make, pc_model, storage_type, storage_capacity, ram)
SELECT DISTINCT 
    [PC_Make],           
    [PC_Model],          
    [Storage_Type], 
    [Storage_Capacity], 
    [RAM] 
FROM pc_sales_csv;

-- 2. Populating the Store Dimension
INSERT INTO dim_store (shop_name, shop_age, city, country_state, continent)
SELECT DISTINCT 
    [Shop_Name], 
    [Shop_Age], 
    [Province_or_City],
    [Country_or_State], 
    [Continent] 
FROM pc_sales_csv;