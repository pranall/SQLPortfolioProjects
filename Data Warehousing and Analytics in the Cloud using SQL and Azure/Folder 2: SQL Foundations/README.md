# Worker Management Database Project

This project demonstrates the design, implementation, and analysis of a complete **relational database system** for a Worker Management environment using **MySQL**. It emphasizes **database modeling, table creation, data population, and advanced SQL querying**.

## Tools & Technologies Used

* **MySQL Workbench** 
* **MySQL Server**
* CSV file for dataset import (Worker Management Dataset.csv already uploaded)

## Key Steps & Learning Outcomes

1. **Database Setup and Table Creation**

   * Created the `Worker` database and verified its existence using `SHOW DATABASES`.
   * Designed tables based on the provided **Physical Data Model**, including:

     * `Department`, `Employee`, `Equipment`, `Trainer`, `Training`
     * Junction tables: `EmployeeEquipment` and `EmployeeTraining`
   * Defined **primary keys, foreign keys, data types, and constraints** for all tables.
   * Populated tables using full datasets from Excel and verified data with `SELECT * ORDER BY PK` queries.
   * Learned relational table design, DDL implementation, and data validation techniques.

2. **Advanced SQL Operations**

   * Executed filtered retrievals using `WHERE` conditions to isolate specific records (e.g., missing trainer last names).
   * Implemented **single-row and multi-row subqueries** for conditional data selection.
   * Retrieved distinct lists of equipment and trainers used by employees.
   * Joined multiple tables to produce detailed reports combining employees, departments, equipment, and trainings.
   * Sorted and organized outputs for clarity and verification.
   * Learned practical techniques for **data extraction, filtering, and relational joins**.

3. **Data Analysis and Insights**

   * Generated insights such as:

     * Trainings attended by individual employees
     * Equipment assigned per employee
     * Trainer assignments per training
     * Employees grouped by department with associated equipment and trainings
   * Learned to combine table relationships to answer complex **business questions**.

## Key Learnings

* Understanding the **end-to-end process** of database modeling: conceptual, logical, and physical layers.
* Creating, populating, and validating **core and junction tables**.
* Implementing **primary keys, foreign keys, constraints, and proper data types** in MySQL.
* Using **SQL for filtering, subqueries, joins, and aggregation** to extract meaningful insights.
* Hands-on experience with **relational database design, implementation, and analytical querying**, foundational for data engineering and analytics roles.

This project provides practical exposure to **full-cycle database management**: from modeling and implementation to querying and reporting, simulating real-world data operations in a Worker Management context.
