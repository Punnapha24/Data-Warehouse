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
 
