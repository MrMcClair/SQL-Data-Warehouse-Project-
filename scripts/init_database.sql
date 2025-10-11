/* 
===================================================================================================
Create Database and Schemas
===================================================================================================

Script Purpose:
    This script creates a new database named "DataWarehouse_Project" after checking if it already exists. If the 
    database exists, it is dropped and recreated. Additionally, the script sets ups three schemas within the 
    database called: 'Layer_Bronze','Layer_Silver','Layer_Gold'.

WARNING:
    By running this script, the entire database called 'DataWarehouse_Project' will drop, if it already exists.
    All data in the database will be permanently deleted. Proceed with caution and ensure you have proper backups
    before running this script.

*/

USE Master;
GO

-- Drop and recreate the 'DataWarehouse_Project'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse_Project')
BEGIN
    ALTER DATABASE DataWarehouse_Project SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse_Project;
END;
GO

-- Create the 'DataWarehouse_Project' database
CREATE DATABASE DataWarehouse_Project;
GO

USE DataWarehouse_Project;
GO

-- Create Schemas
CREATE SCHEMA Layer_Bronze;
GO

CREATE SCHEMA Layer_Silver;
GO

CREATE SCHEMA Layer_Gold;
GO
