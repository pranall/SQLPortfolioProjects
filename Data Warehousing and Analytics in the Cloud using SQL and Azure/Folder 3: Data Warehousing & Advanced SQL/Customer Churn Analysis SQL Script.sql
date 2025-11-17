-- Q1
CREATE DATABASE Customer;
SHOW DATABASES;

-- Q2
USE Customer;
CREATE TABLE CustomerChurn_Stage(
	CustomerID INTEGER NOT NULL PRIMARY KEY,
    Surname VARCHAR(30) NOT NULL,
    CreditScore INTEGER,
    Geography VARCHAR(30),
    Gender VARCHAR(10),
    Age INTEGER,
    Balance DECIMAL(10,2),
    Exited TINYINT(1)
);
    
CREATE TABLE CustomerChurn (
	CustomerID INTEGER NOT NULL PRIMARY KEY,
    Surname VARCHAR(30) NOT NULL,
    CreditScore INTEGER,
    Geography VARCHAR(30),
    Gender VARCHAR(10),
    Age INTEGER,
    Balance DECIMAL(10,2),
    Exited TINYINT(1),
    SourceSystemNm NVARCHAR(20) NOT NULL,
    CreateAgentID NVARCHAR(20) NOT NULL,
    CreateDtm DATETIME NOT NULL,
    ChangeAgentID NVARCHAR(20) NOT NULL,
    ChangeDtm DATETIME NOT NULL
);    

-- Q3
SELECT * FROM CustomerChurn_stage ORDER BY CustomerID;

-- Q4
DELIMITER $$
CREATE PROCEDURE PrCustomerChurn()
 -- Replace this with actual database name, Customer and table name (with prefix Pr) that you use
BEGIN

	-- **************************************************************************************************************

	DECLARE VarCurrentTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
	DECLARE VarSourceRowCount, VarTargetRowCount, VarThresholdNbr INTEGER DEFAULT 0;
	DECLARE VarTinyIntVal TINYINT;

	-- **************************************************************************************************************

	SELECT COUNT(*)
	INTO VarSourceRowCount
	FROM CustomerChurn_Stage; -- Replace this with actual database name and table name (e.g., CustomerChurn_Stage) that you use.

	SELECT COUNT(*)
	INTO VarTargetRowCount
	FROM CustomerChurn; -- Replace this with actual database name and table name (e.g., CustomerChurn) that you use.

	-- (TargetCount * 20%)
	SELECT CAST((VarTargetRowCount * .2) AS UNSIGNED INTEGER)
	INTO VarThresholdNbr
	FROM DUAL; -- The DUMMY is system table which might vary from database to database. For your database, you need to figure out.

	-- ***********************************
	-- Fail the Stored Proc if the Source Row Count is less than the Threshold Number (i.e., 20% of the Target Table row count).
	-- This ensures that the Target table is not refreshed with incomplete set of Source Data

	IF VarSourceRowCount < VarThresholdNbr THEN

		SELECT -129
		INTO VarTinyIntVal
		FROM DUAL;

	END IF;

	-- **************************************************************************************************************
	-- DELETE target table rows which are no longer available in source database table.

	DELETE
	FROM CustomerChurn AS TrgtTbl
	WHERE EXISTS
	(
		SELECT *
		FROM
		( SELECT TT.CustomerID FROM CustomerChurn AS TT  -- Example table name: CustomerChurn
			LEFT OUTER JOIN
			CustomerChurn_Stage AS ST  -- Example table name: CustomerChurn_Stage
			ON TT.CustomerID = ST.CustomerID
			WHERE ST.CustomerID IS NULL
			) AS SrcTbl
		WHERE TrgtTbl.CustomerID = SrcTbl.CustomerID
	);

	-- **************************UPDATE ROWS THAT CHANGED IN SOURCE******************************************
	-- Update the rows for which new version of rows have arrived as part of delta/incremental feed (i.e., change to non-key values).

	UPDATE CustomerChurn AS TrgtTbl
	INNER JOIN
	CustomerChurn_Stage AS SrcTbl
	ON  TrgtTbl.CustomerID = SrcTbl.CustomerID
	SET TrgtTbl.Surname = SrcTbl.Surname,
		TrgtTbl.CreditScore = SrcTbl.CreditScore,
		TrgtTbl.Geography = SrcTbl.Geography,
        TrgtTbl.Gender = SrcTbl.Gender,
		TrgtTbl.Age = SrcTbl.Age,
		TrgtTbl.Balance = SrcTbl.Balance,
        TrgtTbl.Exited = SrcTbl.Exited,
		TrgtTbl.ChangeDtm = VarCurrentTimestamp
	WHERE (
		 COALESCE(TrgtTbl.CustomerID, 0) <> COALESCE(SrcTbl.CustomerID, 0)
	   OR  COALESCE(TrgtTbl.Surname,'*') <> COALESCE(SrcTbl.Surname,'*')
	   OR COALESCE(TrgtTbl.CreditScore,999) <> COALESCE(SrcTbl.CreditScore,999) 
	   OR COALESCE(TrgtTbl.Geography,'*') <> COALESCE(SrcTbl.Geography,'*') 
	   OR COALESCE(TrgtTbl.Gender,'*') <> COALESCE(SrcTbl.Gender,'*') 
	   OR COALESCE(TrgtTbl.Age,999) <> COALESCE(SrcTbl.Age,999) 
	   OR COALESCE(TrgtTbl.Balance,999999.99) <> COALESCE(SrcTbl.Balance,999999.99) 
	   OR COALESCE(TrgtTbl.Exited,9) <> COALESCE(SrcTbl.Exited,9) 
	  );

	-- ****************************INSERT BRAND NEW ROWS INTO TARGET****************************************
	-- Identify brand new rows in source table and load into target table.

	INSERT INTO CustomerChurn
	(CustomerID, Surname, CreditScore, Geography, Gender, Age, Balance, Exited
		,SourceSystemNm -- Non-Primary Key
		,CreateAgentId -- Non-Primary Key
		,CreateDtm -- Non-Primary Key
		,ChangeAgentId -- Non-Primary Key
		,ChangeDtm -- Non-Primary Key
	)
	SELECT 
	SrcTbl.CustomerID, SrcTbl.Surname ,SrcTbl.CreditScore, 
	SrcTbl.Geography, SrcTbl.Gender, SrcTbl.Age, SrcTbl.Balance, SrcTbl.Exited,
	'Kaggle-CSV' AS SourceSystemNm,
	current_user() AS CreateAgentId,
	VarCurrentTimestamp AS CreateDtm,
	current_user() AS ChangeAgentId,
	VarCurrentTimestamp AS ChangeDtm
	
    FROM CustomerChurn_Stage AS SrcTbl
	INNER JOIN
	(
		SELECT ST.CustomerID
		FROM CustomerChurn_Stage AS ST
		LEFT OUTER JOIN
		CustomerChurn AS TT
		ON ST.CustomerID = TT.CustomerID
		WHERE TT.CustomerID IS NULL
	) AS ChgdNew
	ON  SrcTbl.CustomerID = ChgdNew.CustomerID;

	-- **************************************************************************************************************

END $$
DELIMITER ;

-- Q5
SET SQL_SAFE_UPDATES = 0;
CALL Customer.PrCustomerChurn();
SELECT * FROM CustomerChurn ORDER BY CustomerID;

-- Q6    
CREATE TABLE CustomerChurn_Version1 LIKE CustomerChurn;
INSERT INTO CustomerChurn_Version1 
SELECT * FROM CustomerChurn;
SELECT COUNT(*) FROM CustomerChurn_Version1;	
SELECT * FROM CustomerChurn_Version1 ORDER BY CustomerID;
TRUNCATE TABLE CustomerChurn_Stage;
SELECT COUNT(*) FROM CustomerChurn_Stage;
SELECT * FROM CustomerChurn_Stage ORDER BY CustomerID;

-- Q7
CALL PrCustomerChurn();
SELECT COUNT(*) FROM CustomerChurn_Version1;
SELECT COUNT(*) FROM CustomerChurn;
SELECT * FROM CustomerChurn;
SELECT * FROM CustomerChurn_Version1
WHERE CustomerID NOT IN (SELECT CustomerID FROM CustomerChurn);

-- Q8
SELECT * FROM CustomerChurn CC
JOIN CustomerChurn_Version1 CC_V1
ON CC.CustomerID = CC_V1.CustomerID
WHERE 
	(CC.Surname, CC.CreditScore, CC.Geography, CC.Gender, CC.Age, CC.Balance, CC.Exited)
    <>
    (CC_V1.Surname, CC_V1.CreditScore, CC_V1.Geography, CC_V1.Gender, CC_V1.Age, CC_V1.Balance, CC_V1.Exited)
ORDER BY CC.CustomerID;


-- Q9
SELECT * 
FROM CustomerChurn CC
LEFT JOIN CustomerChurn_Version1 CC_V1 ON CC.CustomerID = CC_V1.CustomerID
WHERE CC_V1.CustomerID IS NULL
ORDER BY CC.CustomerID;
