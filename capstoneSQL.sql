--Create an SQL table for AxisBank_customer and perform below activities:
--1.  Add the below mentioned attribute and add records for 20 customers: customer_id, customerName, credit_limit, applicable, cvv, expiry_date, kyc_status.
--(customer_id int,customerName varchar(20),credit_limit int,applicable varchar(20),cvv int,expiri_date date)
--2.  Write the query below: Get the all data for the customer which has KYC status verified?
--3.  Calculate the balance who is not done with KYC.
--4.  What is the top 5th balance customer of having the highest bank balance?
--5.  Calculate the number of customers whose credit card/debit card is going to expire within 3 months.
--6.  Retrieve the name of the customer who has lowest account balance amount 


--1.  Add the below mentioned attribute and add records for 20 customers: customer_id, customerName, credit_limit, applicable, cvv, expiry_date, kyc_status.
--(customer_id int,customerName varchar(20),credit_limit int,applicable varchar(20),cvv int,expiri_date date)

create table Testtaiatans_5b( 
Customer_id int primary key,
CustomerName varchar(50),
Credit_limit int,
Applicable BIT,
CVV int,
Expiry_date date,
kyc_status varchar(25),
Balance DECIMAL(10,2)
);


--inserting values
INSERT INTO Testtaiatans_5b (customer_id, CustomerName, Credit_limit, Applicable, CVV, Expiry_date, kyc_status, Balance) VALUES
(1, 'Javed Mee raz mohammad', 45000.00, 1, 777, '2025-12-31', 'Verified', 20000.00),
(2, 'Madhuri Vuppala', 35000.00, 1, 123, '2024-11-25', 'Verified', 25000.00),
(3, 'Uday Kiran', 500000.00, 1, 890, '2025-12-30', 'Verified', 200000.00),
(4, 'Vishal Singh', 25000.00, 0, 987, '2024-06-15', 'Pending', 32000.00),
(5, 'Rohit Jain', 65000.00, 1, 132, '2025-11-05', 'Verified', 40000.00),
(6, 'Suyog Waghere', 32000.00, 0, 999, '2025-01-11', 'Pending', 20000.00),
(7, 'Sourabh Desai', 35000.00, 1, 090, '2025-02-10', 'Pending', 20000.01),
(8, 'Anjana Krishna', 20000.00, 1, 091, '2024-12-20', 'Verified', 18000.00),
(9, 'Swapnil Duparte', 30000.00, 0, 061, '2025-11-30', 'Pending', 35000.00),
(10, 'Rutuja Jejurkar', 50000.00, 0, 901, '2023-12-15', 'Verified', 15000.95),
(11, 'Vamshi K', 40000.00, 1, 457, '2024-12-01', 'Verified', 30000.00),
(12, 'Naveen', 45000.00, 1, 101, '2025-11-11', 'Verified', 25000.00),
(13, 'Harish', 55000.00, 0, 151, '2026-05-13', 'Pending', 50000.00),
(14, 'Naresh', 40000.00, 0, 271, '2027-03-20', 'Verified', 100000.00),
(15, 'Charan Tej', 300000.00, 0, 501, '2026-11-01', 'Pending', 250000.00),
(16, 'Vishnu Vardhan', 35000.00, 0, 147, '2026-11-15', 'Verified', 20000.00),
(17, 'Rakesh A', 40000.00, 1, 187, '2023-08-20', 'Pending', 85000.00),
(18, 'Suraj K', 50000.00, 1, 009, '2024-12-20', 'Verified', 22000.00),
(19, 'Chandra', 70000.00, 1, 199, '2025-05-08', 'Pending', 50000.00),
(20, 'Venkateshwar G', 100000.00, 0, 292, '2025-01-10', 'Pending', 63000.00);



--retriving complete table

select * from Testtaiatans_5b;

--2.  Write the query below: Get the all data for the customer which has KYC status verified?

select * from Testtaiatans_5b where kyc_status='verified';

--3.  Calculate the balance who is not done with KYC.

select sum(Balance) as sumofPendingkycBalance from Testtaiatans_5b where kyc_status='pending';


--4.  What is the top 5th balance customer of having the highest bank balance?

select * from Testtaiatans_5b 
order by Balance desc
OFFSET 4 row fetch next 1 rows only;


--5.  Calculate the number of customers whose credit card/debit card is going to expire within 3 months.

select count(*) as nocardexpiresin3months from Testtaiatans_5b
where Expiry_date between GETDATE() and DATEADD(MONTH,3,GETDATE());


--6.  Retrieve the name of the customer who has lowest account balance amount

select CustomerName
from Testtaiatans_5b
where Balance=(select min(Balance) from Testtaiatans_5b);


--select top 1 * from Testtaiatans_5b order by balance asc 




