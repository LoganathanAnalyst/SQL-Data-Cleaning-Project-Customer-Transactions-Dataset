-- Hi all, I am Loganathan.
-- This project is focused on Data Cleaning using SQL on a Customer Transactions dataset.
-- The database contains a single table `CustomerTransaction` with details such as
-- customer information, purchase amount, transaction status, email, and payment methods.
--
-- In this project, I performed several important data-cleaning operations including:
-- handling missing values, removing duplicate records, fixing email formats,
-- standardizing payment method names, removing invalid transactions,
-- correcting negative amounts, and formatting customer names consistently.
--
-- Each cleaning step is written clearly and sequentially, making this project
-- very useful for beginners and data analysts who want to understand how SQL
-- can be used for real-world data preprocessing and quality improvement.

-- STEP :1
-- CREATE A DATABASE 
CREATE DATABASE customerDB;
use customerDB;

-- STEP 2 create TABLE 
CREATE TABLE CustomerTransaction(
TransactionID INT primary key ,
CustomerName varchar(100),
Email varchar(100),
Phonenumber Varchar(20),
PurchaseAmount decimal(10,2),
PurchaseDate date,
PurchaseMethod varchar(50),
Status varchar(50) );

-- insert data

-- STEP 3 
select * from CustomerTransaction;

-- FILL Missing Email Address with a customername 
SET sql_safe_updates =0;

UPDATE CustomerTransaction
SET email = "unknown@example.com"
WHERE email = ""; -- null values replaced

-- identify and remove the Duplicate PHONE NUMBER Records

DELETE FROM CustomerTransaction
WHERE  TransactionID not IN 
(SELECT * FROM 
              ( SELECT min(TransactionID) 
                        From CustomerTransaction GROUP BY Phonenumber) as Temp);


-- FIX THE EMAIL FORMATS

UPDATE  CustomerTransaction
SET email =concat(email,".com")
Where email not like "%.com";

-- standardize payment method name 
UPDATE  CustomerTransaction
SET PurchaseMethod= "Credit Card"
where purchaseMethod like "%card%";

-- Remove the failed transcation 

DELETE  FROM  CustomerTransaction
WHERE Status ="failed";

-- Replace negative purchase amount with null 

UPDATE  CustomerTransaction
set PurchaseAmount = null
Where PurchaseAmount<0;

-- Captlize the First letter in Customer Nma

update CustomerTransaction
Set customerName = concat (upper(left(CustomerName,1)),lower(substring(customername,2)));


Select * from CustomerTransaction;

-- This concludes the Customer Data Cleaning SQL project.
--
-- Key cleaning operations performed:
-- 1. Filled missing email values with a default placeholder.
-- 2. Removed duplicate records based on phone numbers.
-- 3. Corrected email formats and ensured standardization.
-- 4. Standardized purchase method names for consistency.
-- 5. Removed all failed transactions from the dataset.
-- 6. Replaced negative purchase amounts with NULL values.
-- 7. Capitalized customer names in a clean, uniform format.
--
-- Through these steps, the dataset is now clean, structured, and ready
-- for further analysis, reporting, or visualization.
--
-- Thank you for reviewing my SQL data cleaning project.
-- Feedback and suggestions to enhance the process are always welcome.
-- Happy Learning! 🙂