-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;


-- Connect to the bank_homework databases
\c bank_homework


-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes
CREATE TABLE payments(
  id SERIAL PRIMARY KEY
  ,created_at timestamp
  ,amount NUMERIC
  ,payer_name TEXT NOT NULL
  ,recipient_name TEXT
  ,description TEXT

);

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode TEXT;

-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments(created_at,amount,payer_name,description,zipcode)
  VALUES(current_timestamp,1000,'Tom','Deposit',02201);
INSERT INTO payments(created_at,amount,payer_name,description,zipcode)
  VALUES(current_timestamp,1000,'Chris','Deposit',02201);
INSERT INTO payments(created_at,amount,payer_name,description,zipcode)
  VALUES(current_timestamp,1000,'Ryan','Deposit',02201);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,20,'Tom','Target','shopping',02201);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,20,'Tom','Target','shopping',02201);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,20,'Tom','Target','shopping',60061);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,20,'Tom','Target','shopping',60061);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,20,'Chris','Panera','shopping',60061);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,20,'Chris','Panera','shopping',60061);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,20,'Chris','Panera','shopping',60061);
  INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,20,'Chris','Panera','shopping',60061);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,12,'Chris','Metro','shopping',10007);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,12,'Ryan','Metro','shopping',10007);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,12,'Ryan','Metro','shopping',10007);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,12,'Ryan','Metro','shopping',10007);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,100,'Ryan','BestBuy','shopping',10007);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,50,'Ryan','BestBuy','shopping',10010);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,60,'Ryan','BestBuy','shopping',10010);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,description,zipcode)
  VALUES(current_timestamp,80,'Ryan','BestBuy','shopping',10010);
INSERT INTO payments(created_at,amount,payer_name,recipient_name,zipcode)
  VALUES(current_timestamp,10,'Ryan','Chipotle',10010);

-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments set amount = amount - 10 where id = 9;

-- Delete all payments with an amount under $2
DELETE FROM payments where amount < 2;

-- Select all entries from the payments table
select * from payments;

-- In a single query, output all payments ordered from the largest to the smallest
select * from payments order by amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name from payments;

-- In a single query, select all payments created in the past week

SELECT * from payments where DATE_PART('day', created_at) - DATE_PART('day', current_timestamp) <= 7;

-- In a single query, select all payments with a blank description
SELECT * from payments where description IS NULL;

-- In a single query, select all payments matching the name of one of the payers (choose any single one)

SELECT * from payments where payer_name = 'Ryan';

--MY MEMO
SELECT payer_name, AVG(amount) from payments group by payer_name;

