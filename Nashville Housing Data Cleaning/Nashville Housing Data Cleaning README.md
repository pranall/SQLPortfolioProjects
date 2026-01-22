# Nashville Housing Data Cleaning using SQL

## Overview

This project focuses on **cleaning, normalizing, and preparing the Nashville Housing dataset** using **SQL Server**.
The goal is to transform raw, inconsistent real-estate data into a **clean, analysis-ready table** by applying industry-standard SQL data cleaning techniques.

All transformations were performed directly in SQL using **SQL Server Management Studio (SSMS)**.

---

## Dataset

**Table:** `PortfolioProject.dbo.NashvilleHousing`

The dataset contains property transaction records including:

* Parcel identifiers
* Sale dates and prices
* Property and owner addresses
* Land and building values
* Vacancy indicators

---

## Problems Identified

The raw dataset had several data quality issues:

1. `SaleDate` stored as `datetime` with unnecessary time component
2. Missing `PropertyAddress` values for some records
3. Addresses stored as single strings instead of atomic fields
4. Inconsistent categorical values (`Y` / `N` instead of `Yes` / `No`)
5. Duplicate records across key business fields
6. Redundant columns remaining after cleaning
7. No enforced schema constraints (NULLs, uniqueness)

---

## Cleaning Steps Performed

### 1. Date Standardization

* Removed time component from `SaleDate`
* Converted column type from `datetime` → `date`
* Verified no residual non-midnight timestamps

**Techniques used**

* `CONVERT(date, …)`
* `ALTER TABLE … ALTER COLUMN`

---

### 2. Populate Missing Property Addresses

* Filled `NULL` `PropertyAddress` values using a **self-join** on `ParcelID`
* Ensured values were copied only from matching parcels

**Techniques used**

* Self-join
* `IS NULL` filtering
* Controlled `UPDATE … FROM`

---

### 3. Split Property Address into Atomic Columns

* Split `PropertyAddress` into:

  * `PropertySplitAddress`
  * `PropertySplitCity`

**Techniques used**

* `SUBSTRING`
* `CHARINDEX`
* Schema-safe `ALTER TABLE ADD`

---

### 4. Split Owner Address into Atomic Columns

* Split `OwnerAddress` into:

  * `OwnerSplitAddress`
  * `OwnerSplitCity`
  * `OwnerSplitState`

**Techniques used**

* `PARSENAME`
* `REPLACE`
* String normalization

---

### 5. Normalize Categorical Values

* Converted `SoldAsVacant` values:

  * `Y` → `Yes`
  * `N` → `No`

**Techniques used**

* `CASE WHEN`
* Idempotent updates

---

### 6. Remove Duplicate Records

* Identified duplicates using business logic:

  * `ParcelID`
  * `PropertyAddress`
  * `SalePrice`
  * `SaleDate`
  * `LegalReference`
* Removed duplicates while retaining one canonical record

**Techniques used**

* `ROW_NUMBER() OVER (PARTITION BY …)`
* CTE-based deletion

---

### 7. Remove Redundant Columns

Dropped columns no longer needed after normalization:

* `OwnerAddress`
* `PropertyAddress`
* `TaxDistrict`
* Temporary derived columns

---

## Schema Enforcement & Optimization

### Constraints

* Enforced `NOT NULL` on critical columns:

  * `ParcelID`
  * `SaleDate`
  * `SalePrice`
* Added `UNIQUE` constraint on `UniqueID`

### Indexes

Created indexes to support common query patterns:

* `ParcelID`
* `SaleDate`
* `SalePrice`

---

## Final Outcome

* Clean, normalized dataset
* Atomic columns suitable for analysis
* No duplicate records
* Enforced schema integrity
* Performance-aware indexing

The final table is **ready for analytics, visualization, or downstream modeling**.

---

## SQL Concepts Demonstrated

* Data type normalization
* Self-joins for data imputation
* String parsing and transformation
* Window functions (`ROW_NUMBER`)
* Deduplication strategies
* Schema evolution with safety checks
* Constraint enforcement
* Index design

---

## Tools Used

* SQL Server
* SQL Server Management Studio (SSMS)

---

## Notes

This project emphasizes **data correctness, reproducibility, and schema discipline**, not just query execution.
All steps were executed incrementally with validation at each stage.
