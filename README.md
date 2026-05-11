#  PC Sales Data Engineering & Analytics Project

##  Project Overview

This project transforms raw PC sales data into a structured, analytics-ready data model using **SQL Server (SSMS)**.

The solution follows a **dimensional modeling approach (Star Schema)** to enable scalable reporting and deeper business insights across products, customers, locations, and sales performance.

---

##  Data Architecture

To support efficient reporting and minimize query complexity, I designed a Star Schema consisting of:

###  Fact Table

* **fact_sales**

  * Stores transactional sales data
  * Includes revenue, cost, discount, and finance metrics

###  Dimension Tables

* **dim_product** → PC specifications (make, model, storage, RAM)
* **dim_customer** → customer demographics and credit profile
* **dim_employee** → sales personnel performance
* **dim_location** → geographic hierarchy (continent → city)
* **dim_date** → time-based analysis (year, month, day)

This structure enables efficient querying and supports real-world reporting scenarios.

---

##  Business Objectives

* Analyse **total revenue and profitability**
* Identify **top-performing PC models**
* Evaluate **sales performance by region and salesperson**
* Track **monthly sales trends**
* Calculate **profit and profit margins**
---

 Key Business Metrics Calculated:


Revenue & Profitability: Total income and net margins across various product lines.  

Regional Performance: Identification of the highest-value geographic markets.  

Product Trends: Ranking of products based on sales volume and growth potential.

---

##  Technologies Used

* **SQL Server (SSMS): Used as the primary Data Warehouse environment for data ingestion, transformation, and storage.
* **T-SQL: Employed for advanced Dimensional Modeling, including the creation of Fact and Dimension tables, complex joins, and window functions for analytical insights.
* **Draw.io: Used to design the Star Schema architecture, providing a visual blueprint of the data relationships and referential integrity.
* **GitHub & Bash: Utilized for Version Control and managing the development lifecycle through the command line. 

---

##  Data Processing Steps

1. **Data Ingestion**

   * Imported raw sales dataset into SQL Server

2. **Data Modeling**

   * Transformed flat data into a **Star Schema**
   * Created fact and dimension tables

3. **Data Transformation**

   * Cleaned and standardized data
   * Generated surrogate keys using SQL

4. **Analytics Layer**

   * Built queries to answer business questions
   * Derived KPIs such as revenue, profit, and trends

---

##  Key Insights

* Identified **top-selling PC models** driving revenue
* Discovered **high-performing regions** with the most sales
* Highlighted **top sales employees** based on revenue contribution
* Analysed **monthly sales trends** to uncover seasonality
* Calculated **profit margins** to evaluate business performance

---

##  Skills Demonstrated

* Data Modeling (**Star Schema Design**)
* SQL Development (**Joins, Aggregations, Window Functions**)
* Data Transformation & Cleaning
* Business Analysis & KPI Development
* Translating business requirements into technical solutions

---

##  Project Structure

```
PC_Sales_Data_Analysis/
│
├── data/                      # Raw dataset
├── sql/
│   ├── 01_data_import.sql
│   ├── 02_dimension_tables.sql
│   ├── 03_fact_table.sql
│   ├── 04_analysis_queries.sql
│
├── screenshots/               # Query outputs/visuals
├── README.md

---

## Conclusion

This project demonstrates how raw transactional data can be transformed into a structured data model that supports **real-world business decision-making**. It highlights both **technical SQL skills** and **data engineering fundamentals**.
