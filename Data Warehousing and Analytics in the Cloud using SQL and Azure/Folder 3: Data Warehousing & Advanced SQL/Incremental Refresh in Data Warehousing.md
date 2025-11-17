• Query 1(a): Database **Customer** created in MySQL Workbench as required.

![Querry1](https://github.com/user-attachments/assets/d3a5e7e6-c0a8-45c9-975d-42f7db0ab3ac)

(b): Verified creation of the **Customer** database in MySQL Workbench and set it as the active database for all subsequent queries.

![Output1](https://github.com/user-attachments/assets/2c844b67-bcc9-4248-bd0c-4b5ba858917e)

-------------------------------------------------------------------------------------------------------------------------

Query 2: Created **Customer.CustomerChurn_Stage** with columns matching the CSV schema and **CustomerId** defined as the primary key. Extracted the DDL from MySQL Workbench and documented it for submission.

![Query2](https://github.com/user-attachments/assets/e110c908-35c4-4bb9-9252-b3decaa2a555)

(b): Created **Customer.CustomerChurn** with the full CSV schema plus the five required metadata columns:

* SourceSystemNm NVARCHAR(20) NOT NULL
* CreateAgentId NVARCHAR(20) NOT NULL
* CreateDtm DATETIME NOT NULL
* ChangeAgentId NVARCHAR(20) NOT NULL
* ChangeDtm DATETIME NOT NULL

Primary key set on **CustomerId**.
DDL extracted from MySQL Workbench and saved for submission.

![Output2](https://github.com/user-attachments/assets/46e7a207-03fa-47a3-9270-7c7b4a720c2c)

--------------------------------------------------------------------------------------------------------------------------

Query 3: Loaded **Customer.CustomerChurn_Stage** with all records from **CustomerChurn1.csv** using MySQL Workbench import. Data successfully inserted into the staging table.

![Output3 (2)](https://github.com/user-attachments/assets/8041cded-d908-4ddb-bd80-31c8ae17000b)

![Output3 1](https://github.com/user-attachments/assets/449a5619-1fbc-4707-979b-78f957950b0d)

![Output3 2](https://github.com/user-attachments/assets/37a951eb-4a45-45a3-a75a-dbc3d641d1fe)

![Output3 3](https://github.com/user-attachments/assets/e45460c2-a3c9-4146-b062-fdb376c34e00)

![Output3 4](https://github.com/user-attachments/assets/39a2ac32-ef1e-4286-a18b-ffb1ffd89a3a)

The above steps demonstrate how the CSV file is imported 

(B): Verified the staging load by matching the row count in **CustomerChurn1.csv** with the row count in **Customer.CustomerChurn_Stage**. Confirmed correctness by displaying the final rows using `SELECT * FROM CustomerChurn_Stage ORDER BY CustomerId`, ensuring all columns and values were visible in the output.

![Query3](https://github.com/user-attachments/assets/f8106394-ba18-4324-bb55-3a652864a1df)

MySQL Command

![Output3](https://github.com/user-attachments/assets/772393e2-2c56-4e6c-9f05-4ae51391ba73)

Last few Rows of CustomerChurn_Stage Table 

-----------------------------------------------------------------------------------------------------------------------------

Query 4: Created the stored procedure **Customer.PrCustomerChurn** using the assignment template, configuring it to load data from the staging table **Customer.CustomerChurn_Stage** into the persistent table **Customer.CustomerChurn**, following the required source-to-target structure.

![Output4](https://github.com/user-attachments/assets/a07a2117-f861-43fc-a154-ae7bf0fb19b8)

-----------------------------------------------------------------------------------------------------------------------------

Query 5: Executed **Customer.PrCustomerChurn**, successfully loading data from **Customer.CustomerChurn_Stage** into **Customer.CustomerChurn**. Verified correctness by matching row counts between staging and persistent tables, and confirmed output accuracy using an ordered `SELECT *` showing all columns.

![Query5](https://github.com/user-attachments/assets/7a3916d0-159a-4809-8cfc-ed0ca804040b)

MySQL Command

![Output5](https://github.com/user-attachments/assets/8e22a31a-763e-4c05-9d36-81cc67c04db7)

Last few Rows of CustomerChurn Table

---------------------------------------------------------------------------------------------------------------------------

Query 6: Created **Customer.CustomerChurn_Version1** as a full snapshot of the validated data in **Customer.CustomerChurn**, capturing the post–stored-procedure load state for versioned tracking.

![Query6](https://github.com/user-attachments/assets/98422973-e36d-4096-bc93-6c23e23a5bb4)

MySQL Command 

Captured the DDL and validated the row count for **Customer.CustomerChurn_Version1**, confirming structure and data consistency with the source snapshot.

![Query6 1](https://github.com/user-attachments/assets/f8bfd6ea-c642-4dcb-b5b9-64d27bc55373)

![Output6 1 (2)](https://github.com/user-attachments/assets/0e83e698-f8fd-42a1-a5cd-8115aca3c996)

No. of Rows in CustomerChurn_Version1 

(c): Displayed the final rows of **Customer.CustomerChurn_Version1**, ordered by **CustomerId**, confirming that the full dataset from *CustomerChurn1.csv* was accurately preserved in the versioned table.

![Query6 2](https://github.com/user-attachments/assets/48abb3c4-15fd-4653-9d27-c49e655eb9cb)

![Output5](https://github.com/user-attachments/assets/8e182869-3e9e-49fc-a7c6-dfd620c53557)

Last few Rows of CustomerChurn_Version1 Table

(d): Staging table was cleared and reloaded with **CustomerChurn2.csv**. Row count matched the source file, confirming a complete load. Final rows were retrieved with `ORDER BY CustomerId`, showing all columns and validating correct ingestion.

![Query6 3](https://github.com/user-attachments/assets/f15f64fd-14b8-4e22-9e31-d046790c0971)

![Output6 4](https://github.com/user-attachments/assets/00414a0a-6f79-4d2f-b024-1598eeae82c0)

![Output6 5](https://github.com/user-attachments/assets/6b32d406-4696-48c9-b515-3caf6ca5d2ac)

![Output6 6](https://github.com/user-attachments/assets/c64d5a55-57f6-49c3-9cd7-466a6fdf015e)

![Output6 7](https://github.com/user-attachments/assets/d29a98f8-2fda-45ca-9a5a-e8a48fbfb53d)

The above steps demonstrate how the CSV file is imported 

![Query6 4](https://github.com/user-attachments/assets/2b6c817e-8cf3-4463-adc2-9ac8215054e8)

![Output6 8](https://github.com/user-attachments/assets/2c8eb97b-ade0-45fc-975a-21bf9cdca861)

No. of Rows in CustomerChurn_Stage after importing CustomerChurn2 data 

![Query6 5](https://github.com/user-attachments/assets/294e7fc4-4d61-4bd6-87aa-fd3c6b348724)

![Output6 9](https://github.com/user-attachments/assets/dd82ca28-a686-4f19-a1d4-35ddf681d9b6)

Last few Rows of CustomerChurn_Stage Table after importing CustomerChurn2 data 

-----------------------------------------------------------------------------------------------------------------------------

Query 7: Executed **Customer.PrCustomerChurn** to refresh the persistent table using data from **CustomerChurn2.csv**. Verified row counts for both **Customer.CustomerChurn_Version1** (snapshot from CustomerChurn1.csv) and the updated **Customer.CustomerChurn** table. Identified and displayed rows present in **Version1** but removed from the refreshed persistent table, confirming correct DELETE behavior within the stored procedure.

![Capture](https://github.com/user-attachments/assets/393e259e-6376-4c01-9745-d3225126f266)

MySQL Commands 

![Query7](https://github.com/user-attachments/assets/5c9f8ddf-859c-4a4f-a45f-b5d6f1e6248a)

![Output7](https://github.com/user-attachments/assets/7a9b8be3-761c-4427-b05b-1874153613d7)

CustomerChurn_version1 Row Count 

![Query7 1](https://github.com/user-attachments/assets/361a32c1-fa9d-4d82-bb81-493dcc5ca950)

![Output7 1](https://github.com/user-attachments/assets/00dd4327-fc3e-4cc9-b801-b72ce2689f02)

CustomerChurn Row Count 

![Query7 2](https://github.com/user-attachments/assets/ac5935d7-52cf-4492-8877-4acd2aed032e)

![Output7 2](https://github.com/user-attachments/assets/0acc9dce-abd1-48f7-8da0-deb2426529b1)

![Query7 3](https://github.com/user-attachments/assets/b36c3c3c-00c9-4402-9c3d-064f0c498749)

![Output7 3](https://github.com/user-attachments/assets/66fcae1b-23fc-4d60-9f7e-470f8b6695e7)

Rows available in CustomerChurn_Version1 but not in CustomerChurn

---------------------------------------------------------------------------------------------------------------------------

Query 8: Identified updated rows in **Customer.CustomerChurn** by comparing non-PK column values against **Customer.CustomerChurn_Version1**, joined on **CustomerId**. Retrieved and displayed rows where attribute differences triggered UPDATE logic in the stored procedure, confirming updated **CreateDtm** and **ChangeDtm** values for modified records. Output ordered by **CustomerId**.

![Query8](https://github.com/user-attachments/assets/4ec5962c-0ad0-4526-924a-dfb37317d9fe)

MySQL Commands

![Output8](https://github.com/user-attachments/assets/6eb537f9-f7cd-49a2-8ffc-bd5b04d504e3)

CustomerChurn Table Join

![Output8 1](https://github.com/user-attachments/assets/847a6465-915e-4de2-a54f-177302563187)

CustomerChurn_Version1 Join

---------------------------------------------------------------------------------------------------------------------------

Query 9: Retrieved the final state of **Customer.CustomerChurn** after loading data from **CustomerChurn2.csv**, displaying the last few rows ordered by **CustomerId**. Identified and listed all newly inserted rows that exist in **Customer.CustomerChurn** but not in **Customer.CustomerChurn_Version1**, confirming correct execution of the INSERT logic in the stored procedure.

![Query9](https://github.com/user-attachments/assets/4b041907-9c62-409e-830d-da86f72192db)

MySQL Commands 

![Output9](https://github.com/user-attachments/assets/4f19bbd6-d34f-4bb5-9ea7-1db34cba3adc)

Rows available in CustomerChurn But not in CustomerChurn_Version 1 
