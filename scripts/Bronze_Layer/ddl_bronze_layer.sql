/* 
===================================================================================================
DDL for Creating tables for Bronze Layer
===================================================================================================

Script Purpose:
  This script creates tables in the 'Layer.Bronze' schema, dropping existing tables if they already exist. 
  exists. Run this script to re-define the DDL structure of 'bronze' tables
===================================================================================================
*/
-- If the table [CRM_Cust_Info] exists, drop it, then create the Customer Info table [Source CRM]
IF OBJECT_ID (Layer_Bronze.CRM_Cust_Info, 'U') IS NOT NULL
    DROP TABLE Layer_Bronze.CRM_Cust_Info;
CREATE TABLE Layer_Bronze.CRM_Cust_Info (
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_materials_status NVARCHAR(50),
    cst_gnder NVARCHAR(50),
    cst_create_date DATE
);

-- If the table [CRM_Prd_Info] exists, drop it, then create the Production Info table [Source CRM]
IF OBJECT_ID (Layer_Bronze.CRM_Prd_Info, 'U') IS NOT NULL
    DROP TABLE Layer_Bronze.CRM_Prd_Info;
CREATE TABLE Layer_Bronze.CRM_Prd_Info (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost NUMERIC(15,2),
    prd_line  NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);

-- If the table [CRM_Sales_Details] exists, drop it, then create the Sales Details table [Source CRM]
IF OBJECT_ID (Layer_Bronze.CRM_Sales_Details, 'U') IS NOT NULL
    DROP TABLE Layer_Bronze.CRM_Sales_Details;
CREATE TABLE Layer_Bronze.CRM_Sales_Details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price NUMERIC(8, 2)
);

-- If the table [ERP_Cust_Az12] exists, drop it, then create of the Customer table [Source ERP]
IF OBJECT_ID (Layer_Bronze.ERP_Cust_Az12, 'U') IS NOT NULL
    DROP TABLE Layer_Bronze.ERP_Cust_Az12;
CREATE TABLE Layer_Bronze.ERP_Cust_Az12 (
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50)
);

-- If the table [ERP_Loc_A101] exists, drop it, then create the Location table [Source ERP]
IF OBJECT_ID (Layer_Bronze.ERP_Loc_A101, 'U') IS NOT NULL
    DROP TABLE Layer_Bronze.ERP_Loc_A101;
CREATE TABLE Layer_Bronze.ERP_Loc_A101 (
    cid NVARCHAR(50),
    cntry NVARCHAR(50)
);

-- If the table [ERP_Px_Cat_G1v2] exists, drop it, then create the Product Category table [Source ERP]
IF OBJECT_ID (Layer_Bronze.ERP_Px_Cat_G1v2, 'U') IS NOT NULL
    DROP TABLE Layer_Bronze.ERP_Px_Cat_G1v2;
CREATE TABLE Layer_Bronze.ERP_Px_Cat_G1v2 (
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50)
);
