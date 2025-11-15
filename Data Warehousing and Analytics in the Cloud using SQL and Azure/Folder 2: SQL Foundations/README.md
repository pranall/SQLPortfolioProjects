SQL foundations 

Installation: 

This is a screenshot of a successful installation of MySQL Software and MySQL Workbench with the latest version on machine. The screenshot of the database “Worker” created is shown. 

Link: https://dev.mysql.com/downloads/file/?id=508935  

Queries used: CREATE DATABASE Worker; and SHOW DATABASES;  

 
                   Version 8.0.36 Installed 

 

                           

 

      Database Created                                                    List of Databases – Including Worker 

Query2: 

Created the Department table in the Worker database (table based on Physical Model Provided in folder1).  

Columns, Primary Key (PK), Data Type & length, and NULL/NOT NULL are implemented, as provided in the Physical Model.  

Table definition (DDL) is implemented.  

Complete set of data is provided in the Excel file and insert statements are used used.  

Data is retrieved from the Department table by using the SELECT * statement and order by PK column(s). Output is shown. The print screen of the complete set of the rows and columns is shown. The rows are ordered by PK column(s). 

 

   

MySQL Commands    

 



 

Department Table  

 

Query3: 

Created the Employee table in the Worker database (table based on Physical Model provided in the folder).  

(a) Columns, Primary Key (PK), Data Type and length, and NULL/NOT NULL are implemented, as provided in the Physical Model.  

(b) Table definition (DDL) that was implemented (not in a graphical view).  

(c) Complete set of data provided in the Excel file was uploaded and insert statements are used.  

(d) Data is retrieved from the Employee table by using the SELECT * statement and order by PK column(s). Output is shown. Print screen of the complete set of the rows and columns is shown. The rows are be ordered by PK column(s). 

 

MySQL Commands 

 

Employee Table  

 

 

Query 4: 

Create the Equipment table in the Worker database (table must be based on Physical Model Provided in the Assignment folder). 

Columns, Primary Key (PK), Data Type & length, and NULL/NOT NULL need to be implemented, as provided in the Physical Model.  

Show the table definition (DDL) that you implemented.  

Insert the complete set of data provided in the Excel file (uploaded in the Assignment folder) and show the insert statements used.  

Retrieve the data from the Equipment table by using the SELECT * statement and order by PK column(s). Show the output. Make sure you show the print screen of the complete set of the rows and columns. The rows must be ordered by PK column(s). 

 

MySQL Commands 

 

Output 

 

Question 5: 

Create the EmployeeEquipment table in the Worker database (table must be based on Physical Model Provided in the Assignment folder).  

Columns, Primary Key (PK), Data Type & length, and NULL/NOT NULL need to be implemented, as provided in the Physical Model.  

Show the table definition (DDL) that you implemented.  

Insert the complete set of data provided in the Excel file (uploaded in the Assignment folder) and show the insert statements used.  

Retrieve the data from the EmployeeEquipment table by using the SELECT * statement and order by PK column(s). Show the output. Make sure you show the print screen of the complete set of the rows and columns. The rows must be ordered by PK column(s). 

 

MySQL Commands 

 

Employee Equipment Junction Table 

 

 

Question 6: 

Create the Training table in the Worker database (table must be based on Physical Model Provided in the Assignment folder). 

Columns, Primary Key (PK), Data Type & length, and NULL/NOT NULL need to be implemented, as provided in the Physical Model.  

Show the table definition (DDL) that you implemented.  

Insert the complete set of data provided in the Excel file (uploaded in the Assignment folder) and show the insert statements used.  

Retrieve the data from the Training table by using the SELECT * statement and order by PK column(s). Show the output. Make sure you show the print screen of the complete set of the rows and columns. The rows must be ordered by PK column(s). 

 

MySQL Commands 

 

Training Table 

Question 7: 

Create the EmployeeTraining table in the Worker database (table must be based on Physical Model Provided in the Assignment folder).  

Columns, Primary Key (PK), Data Type & length, and NULL/NOT NULL need to be implemented, as provided in the Physical Model. 

Show the table definition (DDL) that you implemented.  

Insert the complete set of data provided in the Excel file (uploaded in the Assignment folder) and show the insert statements used.  

Retrieve the data from the EmployeeTraining table by using the SELECT * statement and order by PK column(s). Show the output. Make sure you show the print screen of the complete set of the rows and columns. The rows must be ordered by PK column(s). 

 

MySQL Commands 

 

Employee Training Junction Table 

 

Question 8: 

Create the Trainer table in the Worker database (table must be based on Physical Model Provided in the Assignment folder). 

Columns, Primary Key (PK), Data Type & length, and NULL/NOT NULL need to be implemented, as provided in the Physical Model.  

Show the table definition (DDL) that you implemented.  

Insert the complete set of data provided in the Excel file (uploaded in the Assignment folder) and show the insert statements used.  

Retrieve the data from the Trainer table by using the SELECT * statement and order by PK column(s). Show the output. Make sure you show the print screen of the complete set of the rows and columns. The rows must be ordered by PK column(s). 

 

MySQL Commands 

 

Trainer Table 

 

Question 9: 

Retrieve the data from the Trainer table by using the SELECT * statement with filter, WHERE TrainerLastName IS NULL. Show the output. Make sure you show the print screen of the complete set of the rows and columns. The rows must be ordered by PK column(s). 

 

MySQL Command 

 

Question 10: 

By using the SHOW tables statements, show the list of tables you have created in the Worker database. Show the screenshot of the execution of the above statements and results. Make sure you show the print screen of the complete set of the rows and columns. The rows must be ordered by PK column(s). 

 

 

 

Tables in worker database 

Question 11 

Write a single-row subquery to display EmployeeID, FirstName, LastName, and HireDate of employees hired after employee Vivek Pandey. Sort the results by EmployeeID. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 

Employees Hired After “Vivek Pandey” 

Question 12: 

Write a query to display FirstName, LastName, and TrainingName for employee Tom Harper. Sort the results by TrainingName. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 

Trainings attended by “Tom Harper” 

 

 

 

 

Question 13: 

Write a query to display the complete list of Trainings, and trainers (first and last name) available for each training. Sort the output by TrainingName and Trainers' first and last name. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 

Complete List of Trainings and their Assigned Trainers 

 

Question 14: 

Write a multiple-row subquery to display EmployeeID, FirstName, LastName, and HireDate of employees who work for the following departments: Accounting and Finance, IT Support, and Production. Sort the results by EmployeeID. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 

Employees working in Departments: Accounting and Finance, IT Support, and Production 

 

Question 15: 

Write a query to display the EmployeeID, FirstName, LastName, EquipmentName, and EquipmentCostAmount for one of the employees. Sort the results by EmployeeID. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 

Equipment used By EmployeeID=5 (Kathy Cooper) and its Equipment cost 

 

Question 16: 

Write a query to display the TrainingID, TrainingName, TrainerID, TrainerFirstName, and TrainerLastName with the trainers who did not provide their last name. Sort the results by TrainingID and TrainerID. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 

Training and Trainer whose last name=NULL 

 

Question 17: 

Write a query to display the distinct list of equipments used by the current employees. Sort the output by EquipmentName. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Queries  

 

Equipment used by Current Employees(ORDER BY EquipmentName) 

 

Question 18: 

Write a query to display the FirstName, LastName, TrainingName, and trainer(s) (with first and last name in two separate columns) for one of the employees. Sort the results by TrainingName and TrainerFirstName. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 
Employee(John Wilson) with Training and Trainer Names 

 

Question 19: 

Write a query to display the EmployeeID, FirstName, LastName, DepartmentID, DepartmentName, EquipmentID, EquipmentName for all employees. Sort the results by EmployeeID, DepartmentID, and EquipmentID. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 

 
EmployeeID, Employee Name,DepartmentID, DepartmentName, EquipmentID and Equipment Used by all Employees 

 

 

 

 

 

Question 20: 

Write a query to display the EmployeeID, FirstName, LastName, DepartmentID, DepartmentName, TrainingID, TrainingName for all employees. Sort the results by EmployeeID, DepartmentID, and TrainingID. Make sure you show the print screen of the complete set of the rows, and columns as specified. 

 

MySQL Commands 

 

 
EmployeeID, Employee Name, DepartmentID, DepartmentName, TrainingID, TrainingName of all the Employees 

 

 
