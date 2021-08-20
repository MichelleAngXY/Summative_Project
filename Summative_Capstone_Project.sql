--select * from [dbo].[Transactions]
--SELECT DISTINCT Category from [dbo].[Transactions]
--SELECT DISTINCT SubCategory from [dbo].[Transactions]
--SELECT DISTINCT Store_Type from [dbo].[Transactions]

--primary key inserted by using table design and foreign key by database diagram
--select * from Category --use it in power BI
--select * from SubCategory --use it in power BI
--select * from Store --use it in power BI
--select * from Customer --use it in python, power BI
--select * from Trans_WID_Age --use it in power BI
--select * from Transactions_Age --use it in python

--predict table created in the database for python input
select * from [dbo].[Predict_Table]
--DELETE FROM [dbo].[Predict_Table]

--with id --Select * from Trans_WID
select Trans.Transaction_ID, Trans.Tran_Date, Trans.Cust_ID, Cat.Cat_Code as Category_Code, Subcat.Sub_Cat_Code as SubCategory_Code, Store.Store_ID, Trans.Qty, Trans.Price, Trans.Tax, Round(Trans.Total_Amt,2) as Total_Amt
from Transactions Trans
inner join Category Cat
on Trans.Category = Cat.Category
inner join SubCategory Subcat
on Trans.SubCategory = Subcat.Sub_Category
inner join Store 
on Trans.Store_type = Store.Store_Type;

--with name and age
select Trans.Transaction_ID, Trans.Tran_Date, Trans.Cust_ID, DATEDIFF(year,Cust.DOB,Trans.Tran_Date) AS [Age], Trans.Category, Trans.SubCategory, Trans.Store_Type, Trans.Qty, Trans.Price, Trans.Tax, Round(Trans.Total_Amt,2) as Total_Amt
from Transactions Trans
inner join Customer Cust
on Trans.Cust_ID= Cust.Customer_ID;

--with id and age
select Trans.Transaction_ID, Trans.Tran_Date, Trans.Cust_ID, DATEDIFF(year,Cust.DOB,Trans.Tran_Date) AS [Age], Cat.Cat_Code as Category_Code, Subcat.Sub_Cat_Code as SubCategory_Code, Store.Store_ID, Trans.Qty, Trans.Price, Trans.Tax, Round(Trans.Total_Amt,2) as Total_Amt
from Transactions Trans
inner join Customer Cust
on Trans.Cust_ID= Cust.Customer_ID
inner join Category Cat
on Trans.Category = Cat.Category
inner join SubCategory Subcat
on Trans.SubCategory = Subcat.Sub_Category
inner join Store 
on Trans.Store_type = Store.Store_Type;

