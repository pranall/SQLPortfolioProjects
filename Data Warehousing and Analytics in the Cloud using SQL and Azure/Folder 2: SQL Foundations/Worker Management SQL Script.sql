-- Q1
-- CREATING DATABASE 
CREATE DATABASE worker;
SHOW DATABASES;
USE worker;

-- Q2
-- CREATING DEPARTMENT TABLE
CREATE TABLE Department(
	DepartmentID TINYINT NOT NULL PRIMARY KEY,
    DepartmentNm VARCHAR(30) NOT NULL 
);
INSERT INTO Department (DepartmentID, DepartmentNm)
VALUES (1, 'Research & Development'),
	   (2, 'Production'),
       (3, 'IT Support'),
       (4, 'Operations'),
       (5, 'Customer Service'),
       (6, 'Purchasing'),
       (7, 'Sales & Marketing'),
       (8, 'Human Resource Management'),
       (9, 'Accounting and Finance'),
       (10, 'Legal');
       
SELECT * FROM Department ORDER BY DepartmentID;

-- Q3
-- CREATING EMPLOYEE TABLE
CREATE TABLE Employee(
	EmployeeID INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Address VARCHAR(50),
    PhoneNumberTxt VARCHAR(15),
    HireDate DATE NOT NULL,
    DepartmentID TINYINT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName,Address, PhoneNumberTxt, HireDate, DepartmentID)
VALUES (1, 'Andy', 'Wong', '345 South Street', '(603) 555-6880', '2001-01-15', 2),
	   (2, 'John', 'Wilson', '560 Broadway', '(518) 555-6690', '2017-03-19', 1),
       (3, 'Vivek', 'Pandey', '15 Mineral Drive', '(603) 555-4420', '2003-11-15', 3),
       (4, 'Nola', 'Davis', '15 Long Ave', '(478) 555-8822', '2016-03-23', 7),
       (5, 'Kathy', 'Cooper', '15 Hatter Drive', '(212) 555-9630', '2011-11-18', 8),
       (6, 'Tom', 'Harper', '64 Highland Street', '(212) 555-7755', '2010-04-11', 9);

SELECT * FROM Employee ORDER BY EmployeeID;

-- Q4
-- CREATING EQUIPMENT TABLE
CREATE TABLE Equipment (
	EquipmentID INTEGER NOT NULL PRIMARY KEY,
    EquipmentName VARCHAR(30) NOT NULL,
    EquipmentCostAmount DECIMAL(13,2)
);
INSERT INTO Equipment (EquipmentID, EquipmentName, EquipmentCostAmount)
VALUES (1, 'Notebook Computers', 814.99),
	   (2, 'Headsets', 34.99),
       (3, 'Computer Monitor', 155.55),
       (4, 'Multi-Function Printers', 179.99),
       (5, 'Projector or Big Screen TV', 250.00),
       (6, 'Servers', 799.99),
       (7, 'Internet Modem', 59.99),
       (8, 'Cell Phone', 185.55);
SELECT * FROM Equipment ORDER BY EquipmentID;

-- Q5
-- CREATING EMPLOYEE-EQUIPMENT JUNCTION TABLE 
CREATE TABLE EmployeeEquipment (
	EmployeeID INTEGER NOT NULL,
    EquipmentID INTEGER NOT NULL,
    PRIMARY KEY (EmployeeID, EquipmentID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);
INSERT INTO EmployeeEquipment (EmployeeID, EquipmentID)
VALUES (1,1),(2,1),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(5,1),(5,2),(5,3),(6,1),(6,3);
SELECT * FROM EmployeeEquipment;

-- Q6
-- CREATING TRAINING TABLE 
CREATE TABLE Training (
	TrainingID INTEGER NOT NULL PRIMARY KEY,
    TrainingName VARCHAR(50) NOT NULL
);
INSERT INTO Training (TrainingID, TrainingName)
VALUES(1,'COVID-19 Awareness and Protection Training'),
	  (2,'Code of Conduct Training'),
      (3,'Safety Training'),
      (4,'Intro to Python'),
      (5,'Machine Learning'),
      (6,'Microsoft Certifications'),
      (7,'Security and Privacy'),
      (8,'Product Knowledge'),
      (9,'Sales Skills'),
      (10,'Employee Relations'),
      (11,'Travel and Expense Management');
SELECT * FROM Training;

-- Q7
-- CREATING EMPLOYEE-TRAINING JUNCTION TABLE 
CREATE TABLE EmployeeTraining (
	EmployeeID INTEGER NOT NULL,
    TrainingID INTEGER NOT NULL,
    PRIMARY KEY (EmployeeID, TrainingID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID)
);
INSERT INTO EmployeeTraining (EmployeeID, TrainingID)
VALUES (1,2),(1,3),(2,2),(2,4),(2,5),(3,2),(3,6),(3,7),(4,2),(4,8),(4,9),(5,2),(5,10),(6,2),(6,11);
SELECT * FROM EmployeeTraining;
SHOW TABLES;

-- Q8
-- CREATING TRAINER TABLE 
CREATE TABLE Trainer (
	TrainerID INTEGER NOT NULL PRIMARY KEY,
    TrainingID INTEGER NOT NULL,
    FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID),
    TrainerFirstName VARCHAR(20) NOT NULL,
    TrainerLastName VARCHAR(20) 
);
INSERT INTO Trainer (TrainerID, TrainingID, TrainerFirstName, TrainerLastName)
VALUES(1, 1, 'James', 'Smith'), (2, 1, 'Johnny', 'Khor'),
	  (3, 2, 'Michael', 'Smith'), (4, 3, 'Maria', 'Garcia'),
	  (5, 4, 'John',NULL), (6, 4, 'Paul', 'Deitel'),
	  (7, 5, 'Mike', 'Taylor'), (8, 5, 'Avinash', 'Navlani'),
	  (9, 6, 'Robert', 'Smith'), (10, 7, 'Maria', 'Rodriguez'),
	  (11, 8, 'Mike', 'Donlon'), (12, 9, 'Kathy', 'Corby'),
	  (13, 10, 'Mary', 'Garcia'), (14, 10, 'Vanessa',NULL),
	  (15, 11, 'Jordon',NULL), (16, 11, 'Maria', 'Garcia');
      
SELECT * FROM Trainer ORDER BY TrainerID;

-- Q9
SELECT * FROM Trainer WHERE TrainerLastName is NULL;

-- Q10
SHOW TABLES;

-- Q11
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employee
WHERE HireDate > (SELECT HireDate FROM Employee WHERE FirstName = 'Vivek' AND LastName = 'Pandey');

-- Q12
SELECT Employee.FirstName, Employee.LastName, Training.TrainingName
FROM Employee
JOIN EmployeeTraining ON Employee.EmployeeID = EmployeeTraining.EmployeeID
JOIN Training ON EmployeeTraining.TrainingID = Training.TrainingID
WHERE Employee.FirstName = 'Tom' AND Employee.LastName = 'Harper'
ORDER BY Training.TrainingName;

-- Q13
SELECT Training.TrainingName, Trainer.TrainerFirstName, Trainer.TrainerLastName
FROM Training
LEFT JOIN Trainer ON Training.TrainingID = Trainer.TrainingID
ORDER BY Training.TrainingName, Trainer.TrainerFirstName, Trainer.TrainerLastName;

-- Q14
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employee
WHERE DepartmentID IN (
  SELECT DepartmentID
  FROM Department
  WHERE DepartmentNm IN ('Accounting and Finance', 'IT Support', 'Production')
);

-- Q15
SELECT Employee.EmployeeID, Employee.FirstName, Employee.LastName, Equipment.EquipmentName, Equipment.EquipmentCostAmount
FROM Employee
JOIN EmployeeEquipment ON Employee.EmployeeID = EmployeeEquipment.EmployeeID
JOIN Equipment ON EmployeeEquipment.EquipmentID = Equipment.EquipmentID
WHERE Employee.EmployeeID = 5
ORDER BY Employee.EmployeeID;

-- Q16
SELECT Training.TrainingID, Training.TrainingName, Trainer.TrainerID, Trainer.TrainerFirstName, Trainer.TrainerLastName
FROM Training
JOIN Trainer ON Training.TrainingID = Trainer.TrainingID
WHERE Trainer.TrainerLastName IS NULL
ORDER BY Training.TrainingID, Trainer.TrainerID;

-- Q17
SELECT DISTINCT Equipment.EquipmentID, Equipment.EquipmentName
FROM Employee
JOIN EmployeeEquipment ON Employee.EmployeeID = EmployeeEquipment.EmployeeID
JOIN Equipment ON EmployeeEquipment.EquipmentID = Equipment.EquipmentID
ORDER BY Equipment.EquipmentName;

-- Q18 
SELECT Employee.FirstName, Employee.LastName, 
       Training.TrainingName, Trainer.TrainerFirstName, Trainer.TrainerLastName
FROM Employee JOIN EmployeeTraining ON Employee.EmployeeID = EmployeeTraining.EmployeeID
JOIN Training ON EmployeeTraining.TrainingID = Training.TrainingID
JOIN Trainer ON Training.TrainingID = Trainer.TrainingID
ORDER BY Training.TrainingName, Trainer.TrainerFirstName;

-- Q19
SELECT Employee.EmployeeID, Employee.FirstName, Employee.LastName, 
    Employee.DepartmentID, Department.DepartmentNm 
    AS DepartmentName, Equipment.EquipmentID, Equipment.EquipmentName
FROM Employee JOIN Department ON Employee.DepartmentID = Department.DepartmentID
LEFT JOIN EmployeeEquipment ON Employee.EmployeeID = EmployeeEquipment.EmployeeID
LEFT JOIN Equipment ON EmployeeEquipment.EquipmentID = Equipment.EquipmentID
ORDER BY Employee.EmployeeID, Employee.DepartmentID, Equipment.EquipmentID;

-- Q20
SELECT Employee.EmployeeID, Employee.FirstName, Employee.LastName, 
    Employee.DepartmentID, Department.DepartmentNm 
    AS DepartmentName, EmployeeTraining.TrainingID, Training.TrainingName
FROM Employee JOIN Department ON Employee.DepartmentID = Department.DepartmentID
LEFT JOIN EmployeeTraining ON Employee.EmployeeID = EmployeeTraining.EmployeeID
LEFT JOIN Training ON EmployeeTraining.TrainingID = Training.TrainingID
ORDER BY Employee.EmployeeID, Employee.DepartmentID, EmployeeTraining.TrainingID;


