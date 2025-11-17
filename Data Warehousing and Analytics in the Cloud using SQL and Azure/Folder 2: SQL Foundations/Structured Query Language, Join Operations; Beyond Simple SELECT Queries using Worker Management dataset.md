Installation: 

This is a screenshot of a successful installation of MySQL Software and MySQL Workbench with the latest version on machine. The screenshot of the database “Worker” created is shown. 

Link: https://dev.mysql.com/downloads/file/?id=508935  

Queries used: CREATE DATABASE Worker; and SHOW DATABASES;  

![image](https://github.com/user-attachments/assets/99d9f30c-9037-4c24-82ad-40ba6d08a124)

Version 8.0.36 Installed

![image2](https://github.com/user-attachments/assets/abc16d9b-6ae4-4756-8221-7b9b0d9a133f)

Database Created   

![image3](https://github.com/user-attachments/assets/09ba5afa-b1cb-4abd-906f-d2c0a25baee4)

List of Databases including Worker

---------------------------------------------------------------------------------------------------------------------

Query 2: Created the **Department** table in the `Worker` database according to the provided physical data model. All columns, data types, lengths, primary key constraints, and NULL/NOT NULL rules were implemented as specified. The full dataset from the Excel file was inserted using `INSERT` statements. Data retrieval was performed with `SELECT *` and ordered by the primary key column(s). The output screenshot displays the complete, correctly ordered result set.


![image4](https://github.com/user-attachments/assets/d5c2b0f7-80b1-4a01-a970-70c1b56eaf92)

MySQl Commands

![image5](https://github.com/user-attachments/assets/5d4d08d8-0967-4880-a9fb-7d7295605e7c)

Depatment Table

------------------------------------------------------------------------------------------------------------------------

Query 3: Created the **Employee** table in the `Worker` database based on the provided physical data model. All columns, data types, lengths, primary key constraints, and NULL/NOT NULL rules were implemented exactly as specified. The corresponding DDL was written manually. The complete dataset from the Excel file was inserted using `INSERT` statements. Data retrieval was performed with `SELECT *` and ordered by the primary key column(s). The screenshot shows the full result set with all rows and columns in the correct order.
 

![image6](https://github.com/user-attachments/assets/b1a2841f-085e-487f-9923-14db026ad4e8)

MySQL Commands 

![image7](https://github.com/user-attachments/assets/e26aeb29-7baa-4843-9682-0b5e7df0c4cd)

Employee Table  

---------------------------------------------------------------------------------------------------------

Query 4 focuses on implementing the **Equipment** table in the **Worker** database using the specifications defined in the Physical Data Model. The work includes creating the table with correct columns, primary keys, datatypes, lengths, and nullability; generating and executing the DDL; inserting the full dataset from the provided Excel file; and retrieving all records with a `SELECT *` query ordered by the primary key. The final output includes the DDL, all insert statements, and the ordered result set.

![image8](https://github.com/user-attachments/assets/649b3e8d-2d3b-4b81-8975-6724c584a549)

MySQL Commands 

![image9](https://github.com/user-attachments/assets/9b06506b-b81b-4458-9126-060c9d1c94a0)

Output 

---------------------------------------------------------------------------------------------------------------

Query 5 covers the creation of the **EmployeeEquipment** table in the **Worker** database following the exact structure defined in the Physical Data Model. The task includes implementing all columns with correct primary keys, datatypes, lengths, and nullability; generating the DDL; inserting the full dataset from the provided Excel file; and retrieving all records using a `SELECT *` query ordered by the primary key. The deliverables include the DDL, all insert statements, and the ordered result set.

![imagea](https://github.com/user-attachments/assets/b84f88b0-22d8-4952-ab4b-b8877418abeb)

MySQL Commands 

![imageb](https://github.com/user-attachments/assets/273809a7-eed5-4f17-981b-75b27d3a20f7)

Employee Equipment Junction Table 

----------------------------------------------------------------------------------------------------------------------------

Query 6 involves creating the **Training** table in the **Worker** database according to the structure defined in the Physical Data Model. The work includes implementing all required columns with the correct primary key, datatypes, lengths, and nullability; generating and presenting the DDL; inserting the full dataset from the provided Excel file; and retrieving all rows using a `SELECT *` query ordered by the primary key. The deliverables include the DDL, all insert statements, and the ordered output set.

![imagec](https://github.com/user-attachments/assets/6ce7bbc1-b59d-4771-a305-1dbeb63964aa)

MySQL Commands 

![imaged](https://github.com/user-attachments/assets/3385bc57-d702-429d-8a03-e81eda0c38f8)

Training Table 

----------------------------------------------------------------------------------------------------------------

Query 7 covers creating the **EmployeeTraining** table in the **Worker** database using the structure defined in the Physical Data Model. The task includes implementing all columns with the correct primary key, datatypes, lengths, and nullability; generating the DDL; inserting the full dataset from the provided Excel file; and retrieving all rows using a `SELECT *` query ordered by the primary key. The deliverables include the DDL, all insert statements, and the ordered result set.

![imagee](https://github.com/user-attachments/assets/d0ae36e7-ac54-4f0a-82ea-0f11d2a0ec3e)

MySQL Commands 

![imagef](https://github.com/user-attachments/assets/ad1208f1-db30-48f5-ac8d-58e71b282832)

Employee Training Junction Table 

----------------------------------------------------------------------------------------------------------------------

Query 8 focuses on creating the **Trainer** table in the **Worker** database according to the structure defined in the Physical Data Model. The task includes implementing all required columns with the correct primary key, datatypes, lengths, and nullability; generating and presenting the DDL; inserting the full dataset from the provided Excel file; and retrieving all rows using a `SELECT *` query ordered by the primary key. The deliverables include the DDL, all insert statements, and the ordered output set.

![image10](https://github.com/user-attachments/assets/f94fd356-64d6-48b4-b7cf-df243e038acf)

MySQL Commands 

![image11](https://github.com/user-attachments/assets/07c08a3e-db5a-48fc-9d3a-294444e8b199)

Trainer Table 

-----------------------------------------------------------------------------------------------------------------------

Query 9 retrieves records from the **Trainer** table using a `SELECT *` query filtered with `WHERE TrainerLastName IS NULL`, returning only rows with missing last names. The output must display the full result set ordered by the primary key.


![Query 9](https://github.com/user-attachments/assets/ceda1578-82ef-4226-a27e-1d421e5bb426)

MySQL Command 

![Output9](https://github.com/user-attachments/assets/225f1e79-0850-429f-b0a7-8cbb5bf8fb26)

------------------------------------------------------------------------------------------------------------------------

Query 10 lists all tables created in the **Worker** database using the `SHOW TABLES` statement. The output displays the full set of tables generated throughout the assignment, captured in a screenshot of the executed command and its results.


![Query 10](https://github.com/user-attachments/assets/2fd399e1-6e63-40ab-bf0b-b11b1949e8f9)

MySQL Command 

![image15](https://github.com/user-attachments/assets/fad9c4cc-3de4-4600-bc6c-cf4d560000a4)

![image16](https://github.com/user-attachments/assets/411578c6-86a1-4341-80ed-2c1af587e13f)

Tables in worker database 

------------------------------------------------------------------------------------------------------------------

Query 11 uses a single-row subquery to list **EmployeeID, FirstName, LastName, and HireDate** for all employees hired after **Vivek Pandey**. The results are sorted by **EmployeeID**, and the final output shows the full result set as displayed in the query execution.

![Query 11](https://github.com/user-attachments/assets/805c0e38-8e65-483e-9988-d19d66a2dd8b)

MySQL Command

![Output12](https://github.com/user-attachments/assets/b29b8313-4f0b-4707-91d0-e7b9dbe90e90)

Employees Hired After “Vivek Pandey” 

-------------------------------------------------------------------------------------------------------------------------

Query 12 retrieves **FirstName, LastName, and TrainingName** for employee **Tom Harper** by joining the relevant employee, training, and linking tables. The results are ordered by **TrainingName** and presented as a complete output set.


![Query 12](https://github.com/user-attachments/assets/a0afe6fe-9657-4a7a-a9a6-2e58cbacb9de)

MySQL Commands 

![Output13](https://github.com/user-attachments/assets/7ff1d483-434d-4aab-9668-70c8d2550283)

Trainings attended by “Tom Harper” 

-----------------------------------------------------------------------------------------------------------------------------

Query 13 produces a full list of all **Trainings** along with the corresponding **trainer first and last names** by joining the training and trainer tables. The output is sorted by **TrainingName**, then by the trainer’s first and last name, and displayed as a complete ordered result set.


![Query 13](https://github.com/user-attachments/assets/08ad98e3-8261-4f65-a802-5160b8260ac8)

MySQL Commands 

![Output14](https://github.com/user-attachments/assets/94f57d0e-6306-4257-b471-044b6e7ae2c1)

Complete List of Trainings and their Assigned Trainers 

--------------------------------------------------------------------------------------------------------------------

Query 14 uses a multiple-row subquery to return **EmployeeID, FirstName, LastName, and HireDate** for employees working in the **Accounting and Finance**, **IT Support**, and **Production** departments. The final output is sorted by **EmployeeID** and presented as a complete result set.

![Query 14](https://github.com/user-attachments/assets/49e6ba3c-22f6-459a-ae7f-769a39022af5)

MySQL Commands 

![Output15](https://github.com/user-attachments/assets/f3714cac-a729-4165-a23b-68d8a80f3e85)

Employees working in Departments: Accounting and Finance, IT Support, and Production 

-------------------------------------------------------------------------------------------------------------------

Query 15 retrieves **EmployeeID, FirstName, LastName, EquipmentName, and EquipmentCostAmount** for a selected employee by joining the employee, equipment, and linking tables. The result set is sorted by **EmployeeID** and shown in full.

![Query 15](https://github.com/user-attachments/assets/a1018818-bfd9-4f83-a6a5-82d03643ba55)

MySQL Commands

![Output16](https://github.com/user-attachments/assets/f3b389db-1b62-493e-82c9-7d8c043d9d59)

Equipment used By EmployeeID=5 (Kathy Cooper) and its Equipment cost 

-----------------------------------------------------------------------------------------------------------------------

Query 16 returns **TrainingID, TrainingName, TrainerID, TrainerFirstName, and TrainerLastName** for all trainers who have a missing last name. The query filters on `TrainerLastName IS NULL`, joins the relevant tables, and orders the output by **TrainingID** and **TrainerID**, displaying the full ordered result set.

![Query 16](https://github.com/user-attachments/assets/6f56929f-fe91-4f96-81f0-8f2ea4e2b2c3)

MySQL Commands

![Output17](https://github.com/user-attachments/assets/467941f7-2064-4642-98ec-6c3d949edddd)

Training and Trainer whose last name=NULL 

--------------------------------------------------------------------------------------------------------------------------

Query 17 retrieves a distinct list of all **EquipmentName** values currently used by active employees by joining the employee–equipment tables and removing duplicates. The output is sorted by **EquipmentName** and displayed as a complete result set.

![Query 17](https://github.com/user-attachments/assets/a2fcd65a-d542-4278-a96a-32a3fc048d71)

MySQL Commands

![Output18](https://github.com/user-attachments/assets/c04ffcab-f8fb-4871-9ca0-0ee7af098245)

Equipment used by Current Employees(ORDER BY EquipmentName) 

---------------------------------------------------------------------------------------------------------------------------

Query 18 retrieves **FirstName, LastName, TrainingName, TrainerFirstName, and TrainerLastName** for a chosen employee by joining the employee, training, and trainer-related tables. The results are ordered by **TrainingName** and **TrainerFirstName**, and the full output set is displayed.

![Query 18](https://github.com/user-attachments/assets/1ed24c82-35cb-48dd-a31d-7b42bd20fb72)

MySQL Commands

![image26](https://github.com/user-attachments/assets/cd828ae5-4ad3-4921-a14e-f3b818165460)

Employee(John Wilson) with Training and Trainer Names

---------------------------------------------------------------------------------------------------------------------------

Query 19 produces a combined view of **EmployeeID, FirstName, LastName, DepartmentID, DepartmentName, EquipmentID, and EquipmentName** for all employees by joining the employee, department, and equipment tables. The output is sorted by **EmployeeID**, then **DepartmentID**, then **EquipmentID**, and presented as a complete ordered result set.

![Query 19](https://github.com/user-attachments/assets/9f453af9-5cfb-4439-b32d-a7ce922a7c99)

MySQL Commands

![image28](https://github.com/user-attachments/assets/33acad69-8fe4-42c1-865f-802e37117204)

EmployeeID, Employee Name,DepartmentID, DepartmentName, EquipmentID and Equipment Used by all Employees 

-----------------------------------------------------------------------------------------------------------------------------

Query 20 retrieves **EmployeeID, FirstName, LastName, DepartmentID, DepartmentName, TrainingID, and TrainingName** for all employees by joining the employee, department, and training-related tables. The results are ordered by **EmployeeID**, **DepartmentID**, and **TrainingID**, and shown as a complete result set.

![image29](https://github.com/user-attachments/assets/97a025f4-8644-4714-a027-9952c962e322)

MySQL Commands

![Output20](https://github.com/user-attachments/assets/934ce85f-bd2e-4aa1-8ca6-a529ae708e18)

EmployeeID, Employee Name, DepartmentID, DepartmentName, TrainingID, TrainingName of all the Employees 

