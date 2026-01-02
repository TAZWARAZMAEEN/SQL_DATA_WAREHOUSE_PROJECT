/*
===============================================================================
  Create Database and Schemas
===============================================================================

  Script Purpose:
  ---------------------------------------------------------------------------
  - This script creates a new database named `DataWarehouse' after checking if it already exists.
  - If the database already exists, it will be dropped and recreated.
  - Additionally  the script sets up three schemas within the database :
      • bronze
      • silver
      • gold

  These schemas support a Medallion Architecture for data warehousing.

  ---------------------------------------------------------------------------
  WARNING:
  ---------------------------------------------------------------------------
  Running this script will DROP the existing `DataWarehouse` database
  if it exists.

  ⚠️ All data stored in the database will be permanently deleted.
  ⚠️ Ensure proper backups are taken before executing this script.

===============================================================================
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
