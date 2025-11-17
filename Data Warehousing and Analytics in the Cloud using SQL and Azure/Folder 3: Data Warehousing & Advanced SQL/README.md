# Customer Churn Data Warehousing Project

This project demonstrates the implementation of a simple data warehouse pipeline using **MySQL** to handle customer churn data. It focuses on the end-to-end process of staging, persistent storage, incremental refresh, and data verification, providing practical exposure to **data warehousing concepts, SQL, and stored procedures**.

## Tools & Technologies Used

* **MySQL Workbench** (Version 8.0.36)
* **MySQL Server**
* CSV data sources (`CustomerChurn1.csv` and `CustomerChurn2.csv`)
* Stored procedures for incremental data refresh

## Key Steps & Learning Outcomes

1. **Database Setup**

   * Created the `Customer` database and verified it using `SHOW DATABASES`.

2. **Staging and Persistent Tables**

   * Created staging table `Customer.CustomerChurn_Stage` with `CustomerId` as PK.
   * Created persistent table `Customer.CustomerChurn` with additional metadata columns (`SourceSystemNm`, `CreateAgentId`, `CreateDtm`, `ChangeAgentId`, `ChangeDtm`).
   * Loaded data from CSV into the staging table and verified row counts and content using `SELECT * ORDER BY CustomerId`.
   * Learned table creation, DDL generation, data insertion, and verification techniques.

3. **Stored Procedure for Incremental Refresh**

   * Implemented `Customer.PrCustomerChurn` to transfer and synchronize data from the staging table to the persistent table.
   * Learned how stored procedures handle **INSERT, UPDATE, and DELETE** operations for incremental refresh.
   * Verified data consistency between staging and persistent tables after execution.

4. **Versioning and Data Comparison**

   * Created `Customer.CustomerChurn_Version1` to maintain historical data from the first CSV load.
   * Compared rows between `Customer.CustomerChurn_Version1` and `Customer.CustomerChurn` after refresh to identify:

     * New rows added
     * Rows deleted
     * Rows updated (non-PK changes)
   * Learned how to implement versioning and track incremental changes in a data warehouse environment.

5. **Incremental Refresh Demonstration**

   * Emptied staging table and reloaded with `CustomerChurn2.csv`.
   * Executed the stored procedure to refresh the persistent table.
   * Verified the following using SQL queries:

     * Newly added rows
     * Updated rows with new values and updated timestamps (`CreateDtm`, `ChangeDtm`)
     * Deleted rows from previous versions
   * Developed understanding of **real-world data warehouse refresh cycles** and incremental update techniques critical for a data engineer.

## Key Learnings

* Understanding the difference between **staging tables and persistent tables**.
* Implementing **primary keys, data types, and constraints** in MySQL.
* Loading data from CSV files into MySQL tables.
* Writing and executing **stored procedures** to automate incremental refreshes.
* Comparing tables to track **data changes** over multiple loads.
* Practical exposure to **data warehouse incremental refresh techniques**, crucial in real-world ETL pipelines.

This project introduces **incremental refresh techniques** in a data warehouse. It reinforces practical understanding of database systems, basic SQL, and stored procedures for incremental updates. In real-world business, data warehouses are continuously refreshed with operational database data, and using incremental techniques optimizes this process. 

