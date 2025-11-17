## Azure Cloud Project 

### Overview

This project provides hands-on experience with the Microsoft Azure portal, core cloud data services, and essential database operations. The work includes creating an Azure free account, provisioning a resource group, deploying an Azure SQL Database, setting up Azure Blob Storage, uploading/downloading blobs, querying cloud-hosted data using the Azure Query Editor, and cleaning up cloud resources. The assignment also introduces foundational cloud concepts such as managed databases, storage accounts, firewall rules, cost-efficient configurations, and end-to-end resource lifecycle management.

---

## SQL Database Creation in Azure

A single Azure SQL Database was provisioned using the Azure portal. An Azure account and a dedicated resource group were created first to host all components. The database (**assignment4week6database**) was deployed along with a new SQL server (**assignment4week6sqlserver**) configured with minimal compute resources to control cost. During setup, sample data was loaded from Azure’s built-in dataset to support downstream queries. After deployment, a firewall rule was added to allow access from the client machine, enabling interaction with the database through the Query Editor. This process established familiarity with Azure’s managed database environment, deployment workflow, configuration options, and security controls.

---

## Analysis of SalesLT Schema Using Azure Query Editor

The **SalesLT** schema was explored directly in the Azure SQL Database using the Query Editor. The schema contains standard transactional tables including **Customers**, **Products**, **SalesOrders**, and **OrderDetails**.

* **Primary Keys:**

  * Customers: *CustomerID*
  * Products: *ProductID*
  * SalesOrders: *SalesOrderID*
  * OrderDetails: *SalesOrderID* (composite keys used internally for line items)

* **Data Types:**
  These tables include integers for keys, strings for names and descriptions, numeric fields for prices and quantities, and date/datetime fields for order timestamps.

* **Relationships:**

  * *SalesOrders* references *Customers* through **CustomerID**.
  * *OrderDetails* links to *SalesOrders* via **SalesOrderID** and to *Products* via **ProductID**.

Exploring these tables provided insight into relational design, referential integrity, and Azure’s ability to query structured data at scale.

---

## Resource Cleanup

The resource group created for this project was deleted at the end of the assignment. This action automatically removed the SQL server, the SQL database, the storage account, and all associated blob containers. Completing this step reinforces best practices for cost control and proper lifecycle management in cloud environments.

---

This project demonstrates core Azure skills: provisioning cloud databases, configuring storage, querying SQL data in the cloud, analyzing relational schemas, and managing cloud resources efficiently.

