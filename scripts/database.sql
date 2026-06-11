-- Database: Data_Warehouse and Schemas: bronze, silver, gold

use master;
go

-- Check if the database already exists and drop it if it does
if exists (select * from sys.databases where name = 'Data_Warehouse')
begin
	alter database Data_Warehouse set single_user with rollback immediate; -- Force disconnect all users
	drop database Data_Warehouse; -- Drop the existing database
end;
go

-- Create the database
create database Data_Warehouse;
go

use Data_Warehouse;
go

-- Create the schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
go

-- Create Tables
if object_id('bronze.crm_cust_info') is not null
	drop table bronze.crm_cust_info

create table bronze.crm_cust_info(
	cst_id int,
	cst_key varchar(50),
	cst_firstname varchar(50),
	cst_lastname varchar(50),
	cst_marital_status varchar(10),
	cst_gndr varchar(10),
	cst_create_date date,
);
go

if object_id('bronze.crm_prd_info', 'U') is not null
	drop table bronze.crm_prd_info;

create table bronze.crm_prd_info(
	prd_id int,
	prd_key varchar(50),
	prd_name varchar(50),
	prd_cost int,
	prd_line varchar(10),
	prd_start_date date,
	prd_end_date date,
);
go

if object_id('bronze.crm_sales', 'U') is not null
	drop table bronze.crm_sales;

create table bronze.crm_sales(
	sls_ord_num varchar(50),
	sls_prd_key varchar(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int,
	sls_quantity int,
	sls_price int
);
go

if object_id('bronze.erp_cust_az12', 'U') is not null
	drop table bronze.erp_cust_az12;

create table bronze.erp_cust_az12(
	cid varchar(50),
	bdate date,
	gen varchar(10)
);
go

if object_id('bronze.erp_loc_a101', 'U') is not null
	drop table bronze.erp_loc_a101;

create table bronze.erp_loc_a101(
	cid varchar(50),
	cntry varchar(20)
);
go

if object_id('bronze.erp_px_cat_g1v2', 'U') is not null
	drop table bronze.erp_px_cat_g1v2;

create table bronze.erp_px_cat_g1v2(
	id varchar(10),
	cat varchar(50),
	subcat varchar(50),
	maintenance varchar(10)
);
go
