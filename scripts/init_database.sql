/*
=================================================================================
Create Database And Schemas
==================================================================================
Script Purpose:
 This script creates a new Database named 'DataWarehouse' after checking if it already exists. 
 If the database exists, its dropped and then recreated. Additionally, the script sets up three schemas 
 namely- 'bronze', 'silver' and 'gold' schema within the database.

WARNING:
    Running this script will drop the complete 'DataWarehouse' database if it exists, therefore proceed with caution.

*/
USE master;
GO

-- DROP AND RECREATE THE 'DataWarehouse' Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

use  DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
