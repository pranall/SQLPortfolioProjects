SELECT TOP (1000) [UniqueID ]
      ,[ParcelID]
      ,[LandUse]
      ,[PropertyAddress]
      ,[SaleDate]
      ,[SalePrice]
      ,[LegalReference]
      ,[SoldAsVacant]
      ,[OwnerName]
      ,[OwnerAddress]
      ,[Acreage]
      ,[TaxDistrict]
      ,[LandValue]
      ,[BuildingValue]
      ,[TotalValue]
      ,[YearBuilt]
      ,[Bedrooms]
      ,[FullBath]
      ,[HalfBath]
  FROM [PortfolioProject].[dbo].[NashvilleHousing]


  -- Cleaning Data in SQL Queries
SELECT *
FROM PortfolioProject.dbo.NashvilleHousing


-- Standardize Date Format
-- Gives time at the end which is not useful
SELECT SaleDate
FROM PortfolioProject.dbo.NashvilleHousing


-- Query to remove time from the end
SELECT SaleDate, CONVERT(Date,SaleDate)
FROM PortfolioProject.dbo.NashvilleHousing

Update NashvilleHousing
SET SaleDate = CONVERT(Date,SaleDate)

SELECT TOP 20 SaleDate
FROM PortfolioProject.dbo.NashvilleHousing
WHERE CAST(SaleDate AS time) <> '00:00:00.000';

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ALTER COLUMN SaleDate date;

USE PortfolioProject;
GO
EXEC sp_help 'dbo.NashvilleHousing';

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD SaleDate_Clean date;

UPDATE PortfolioProject.dbo.NashvilleHousing
SET SaleDate_Clean = CAST(SaleDate AS date);

-- Step 2. Populate missing PropertyAddress
-- Goal: Fill PropertyAddress where it is NULL by copying it from another row with the same ParcelID.

-- Query 2.1: This relies on the fact that the same parcel appears multiple times, and at least one row has the address.

SELECT
    ParcelID,
    PropertyAddress
FROM PortfolioProject.dbo.NashvilleHousing
WHERE PropertyAddress IS NULL
ORDER BY ParcelID;

-- Query 2.2 Verify the self-join logic
SELECT
    a.ParcelID,
    a.PropertyAddress AS MissingAddress,
    b.PropertyAddress AS ExistingAddress
FROM PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
    ON a.ParcelID = b.ParcelID
   AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL;

-- Query 2.3 Perform the update
UPDATE a
SET a.PropertyAddress = b.PropertyAddress
FROM PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
    ON a.ParcelID = b.ParcelID
   AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL;

-- Query 2.4 Validate result
SELECT COUNT(*) AS RemainingNullAddresses
FROM PortfolioProject.dbo.NashvilleHousing
WHERE PropertyAddress IS NULL;


----------------------------------------------------------------------------------------------------------------


-- Step 3: Split PropertyAddress into Address and City
-- Goal is to convert "123 MAIN ST, NASHVILLE" into: PropertySplitAddress, PropertySplitCity

-- Query 3.1 Validate the split logic
SELECT
    PropertyAddress,
    SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1) AS PropertySplitAddress,
    SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) AS PropertySplitCity
FROM PortfolioProject.dbo.NashvilleHousing
WHERE PropertyAddress IS NOT NULL;

-- Query 3.2 Add split columns
IF COL_LENGTH('dbo.NashvilleHousing', 'PropertySplitAddress') IS NULL
ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD PropertySplitAddress nvarchar(255);

IF COL_LENGTH('dbo.NashvilleHousing', 'PropertySplitCity') IS NULL
ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD PropertySplitCity nvarchar(255);

-- Query 3.3 Populate PropertySplitAddress

UPDATE PortfolioProject.dbo.NashvilleHousing
SET PropertySplitAddress =
    SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1)
WHERE PropertyAddress IS NOT NULL;

-- Query 3.4 Populate PropertySplitCity
UPDATE PortfolioProject.dbo.NashvilleHousing
SET PropertySplitCity =
    SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))
WHERE PropertyAddress IS NOT NULL;

-- Query 3.5 Validate Result
SELECT TOP 20
    PropertyAddress,
    PropertySplitAddress,
    PropertySplitCity
FROM PortfolioProject.dbo.NashvilleHousing;


----------------------------------------------------------------------------------------------------------------------



-- STEP 4 Split OwnerAddress into Address, City, State

-- Query 4.1 Validate split logic
SELECT
    OwnerAddress,
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3) AS OwnerSplitAddress,
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2) AS OwnerSplitCity,
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1) AS OwnerSplitState
FROM PortfolioProject.dbo.NashvilleHousing
WHERE OwnerAddress IS NOT NULL;

-- Query 4.2 Add split columns
IF COL_LENGTH('dbo.NashvilleHousing', 'OwnerSplitAddress') IS NULL
ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD OwnerSplitAddress nvarchar(255);

IF COL_LENGTH('dbo.NashvilleHousing', 'OwnerSplitCity') IS NULL
ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD OwnerSplitCity nvarchar(255);

IF COL_LENGTH('dbo.NashvilleHousing', 'OwnerSplitState') IS NULL
ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD OwnerSplitState nvarchar(255);

-- Query 4.3 Populate OwnerSplitAddress
UPDATE PortfolioProject.dbo.NashvilleHousing
SET OwnerSplitAddress =
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)
WHERE OwnerAddress IS NOT NULL;

-- Query 4.4 Populate OwnerSplitCity
UPDATE PortfolioProject.dbo.NashvilleHousing
SET OwnerSplitCity =
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)
WHERE OwnerAddress IS NOT NULL;

-- Query 4.5 Populate OwnerSplitState
UPDATE PortfolioProject.dbo.NashvilleHousing
SET OwnerSplitState =
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
WHERE OwnerAddress IS NOT NULL;

-- Query 4.6 Validate Result
SELECT TOP 20
    OwnerAddress,
    OwnerSplitAddress,
    OwnerSplitCity,
    OwnerSplitState
FROM PortfolioProject.dbo.NashvilleHousing;


----------------------------------------------------------------------------------------------------------------------------

-- STEP 5 — Normalize SoldAsVacant (Y/N → Yes/No)
-- Goal: Replace inconsistent categorical values with explicit labels.

-- Query 5.1 Inspect current values
SELECT
    SoldAsVacant,
    COUNT(*) AS CountPerValue
FROM PortfolioProject.dbo.NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY CountPerValue;

-- Query 5.2 Preview normalization logic
SELECT
    SoldAsVacant,
    CASE
        WHEN SoldAsVacant = 'Y' THEN 'Yes'
        WHEN SoldAsVacant = 'N' THEN 'No'
        ELSE SoldAsVacant
    END AS NormalizedValue
FROM PortfolioProject.dbo.NashvilleHousing;

-- Query 5.3 Apply update
UPDATE PortfolioProject.dbo.NashvilleHousing
SET SoldAsVacant = CASE
    WHEN SoldAsVacant = 'Y' THEN 'Yes'
    WHEN SoldAsVacant = 'N' THEN 'No'
    ELSE SoldAsVacant
END;

-- Query 5.4 Validate result
SELECT
    SoldAsVacant,
    COUNT(*) AS CountPerValue
FROM PortfolioProject.dbo.NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY CountPerValue;


------------------------------------------------------------------------------------------------------------------------


-- STEP 6: Identify and remove duplicate records
-- Goal: Detect duplicate rows based on business keys and remove the extras while keeping one canonical row.

-- Query 6.1 Identify duplicates
WITH RowNumCTE AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY
                ParcelID,
                PropertyAddress,
                SalePrice,
                SaleDate,
                LegalReference
            ORDER BY [UniqueID ]
        ) AS row_num
    FROM PortfolioProject.dbo.NashvilleHousing
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1
ORDER BY ParcelID;

-- Query 6.2 Delete duplicates
WITH RowNumCTE AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY
                ParcelID,
                PropertyAddress,
                SalePrice,
                SaleDate,
                LegalReference
            ORDER BY [UniqueID ]
        ) AS row_num
    FROM PortfolioProject.dbo.NashvilleHousing
)
DELETE
FROM RowNumCTE
WHERE row_num > 1;

-- Query 6.3 Validate deletion
WITH RowNumCTE AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY
                ParcelID,
                PropertyAddress,
                SalePrice,
                SaleDate,
                LegalReference
            ORDER BY [UniqueID ]
        ) AS row_num
    FROM PortfolioProject.dbo.NashvilleHousing
)
SELECT COUNT(*) AS RemainingDuplicates
FROM RowNumCTE
WHERE row_num > 1;


-------------------------------------------------------------------------------------------------------------------------


-- STEP 7 — Drop unused / redundant columns
-- Goal: Remove columns that are no longer needed after cleaning and normalization.

-- Query 7.1 Final schema check
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'NashvilleHousing'
ORDER BY COLUMN_NAME;

-- Query 7.2 Drop Redundant Columns
ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN
    OwnerAddress,
    PropertyAddress,
    TaxDistrict,
    SaleDate_Clean;

-------------------------------------------------------------------------------------------------------------------------

-- STEP 8 — Final data integrity checks

-- Query 8.1 To make sure that cleaning did not silently corrupt data.
SELECT COUNT(*) AS TotalRows
FROM PortfolioProject.dbo.NashvilleHousing;

-- Query 8.2 Null checks on critical columns
SELECT
    SUM(CASE WHEN ParcelID IS NULL THEN 1 ELSE 0 END) AS ParcelID_Nulls,
    SUM(CASE WHEN SaleDate IS NULL THEN 1 ELSE 0 END) AS SaleDate_Nulls,
    SUM(CASE WHEN SalePrice IS NULL THEN 1 ELSE 0 END) AS SalePrice_Nulls
FROM PortfolioProject.dbo.NashvilleHousing;

-- Query 8.3 Categorical validation
SELECT DISTINCT SoldAsVacant
FROM PortfolioProject.dbo.NashvilleHousing;

-- Query 8.4 Address split validation
SELECT TOP 20
    PropertySplitAddress,
    PropertySplitCity,
    OwnerSplitAddress,
    OwnerSplitCity,
    OwnerSplitState
FROM PortfolioProject.dbo.NashvilleHousing;

---------------------------------------------------------------------------------------------------------

-- Canonical way to check NULL counts
SELECT
    SUM(CASE WHEN ParcelID IS NULL THEN 1 ELSE 0 END)      AS ParcelID_NullCount,
    SUM(CASE WHEN SaleDate IS NULL THEN 1 ELSE 0 END)      AS SaleDate_NullCount,
    SUM(CASE WHEN SalePrice IS NULL THEN 1 ELSE 0 END)     AS SalePrice_NullCount,
    SUM(CASE WHEN PropertySplitAddress IS NULL THEN 1 ELSE 0 END) AS PropertyAddress_NullCount,
    SUM(CASE WHEN PropertySplitCity IS NULL THEN 1 ELSE 0 END)    AS PropertyCity_NullCount
FROM PortfolioProject.dbo.NashvilleHousing;

---------------------------------------------------------------------------------------------------------------


-- STEP 9 — Enforce schema constraints 
-- Formalizing assumptions that are already true in the data.

-- Query 9.1 Enforce NOT NULL on core columns
-- Only doing this for columns where NULLs make no business sense

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ALTER COLUMN ParcelID nvarchar(255) NOT NULL;

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ALTER COLUMN SaleDate date NOT NULL;

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ALTER COLUMN SalePrice money NOT NULL;

-- Query 9.2 Enforce uniqueness (logical key) checking if [UniqueID ] is truly unique:

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
ADD CONSTRAINT UQ_NashvilleHousing_UniqueID UNIQUE ([UniqueID ]);


--------------------------------------------------------------------------------------------------


-- STEP 10 — Add minimal performance indexes

CREATE INDEX IX_NashvilleHousing_ParcelID
ON PortfolioProject.dbo.NashvilleHousing (ParcelID);

CREATE INDEX IX_NashvilleHousing_SaleDate
ON PortfolioProject.dbo.NashvilleHousing (SaleDate);

-- Optional (if doing price analysis later):
CREATE INDEX IX_NashvilleHousing_SalePrice
ON PortfolioProject.dbo.NashvilleHousing (SalePrice);

