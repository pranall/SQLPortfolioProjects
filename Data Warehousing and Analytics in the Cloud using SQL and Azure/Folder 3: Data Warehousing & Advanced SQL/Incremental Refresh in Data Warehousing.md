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


