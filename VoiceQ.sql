use chinook

select* from Album
select * from track
select* from invoiceLine
select* from invoice
select* from playlist
select* from playlisttrack
select* from Customer
select * from playlisttrack
select * from playlist
select * from Album

------------What is the total revenue of the company?-------------------

select sum(Total) as TotalRevenue
from invoice
-----------What is the monthly revenue trend over time?------------------------

select format(invoiceDate, 'yyyy-MM') as month , sum(total) as Revenue
from invoice
group by format(invoiceDate, 'yyyy-MM')
order by month

------------What are the top 5 invoices with the highest value?------------

select top 5 invoiceid ,invoicedate , total 
from invoice
order by total desc

----------- What is the average invoice value?-------
select avg(total) as avgtotal
from invoice
 -----------------What is the total revenue by country?------

 select sum(i.total)  total , c.country 
 from  invoice i 
 join customer c
 on i.Customerid = c.Customerid
 group by  c.country 
 order by total

---------Who are the top 10 customers by total spending?------------

select top 10 c.customerid , c.FirstName + '' + c.Lastname  as customer_name , sum(i.Total) as total
From Customer c
join invoice  i
on c.customerid = i.customerid
group by c.customerid , c.FirstName , c.Lastname
order by total

------------What is the average spending per customer?-----------------

SELECT AVG(CustomerTotal) AS AvgCustomerSpending
FROM (
    SELECT c.CustomerId, SUM(i.Total) AS CustomerTotal
    FROM Customer c
    JOIN Invoice i 
    ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId
) AS SubQuery;

------------How many customers are there in each country? ---------------------

select country , count(customerid ) as number_OF_customers
from customer
group by country
order by number_OF_customers desc 


--------------Which customer has the highest number of invoices (purchases)?-------------
select top 1 c.Customerid , c.Firstname + ' '+ c.lastname , count(i.invoiceid) as count
from customer c
join invoice i
ON c.CustomerId = i.CustomerId
group by c.Customerid , c.Firstname , c.lastname 

----------------What are the top 10 tracks (songs) by revenue?
Select top 10 t.trackid , t.name , Sum( i.unitprice * i.quantity) as Revenue
 From track t
 Join invoiceline i
 On t.trackid = i.trackid
 Group by  t.trackid , t.name
 Order by Revenue DESC
------------------What are the top 5 albums by revenue? ------------------
Select Top 5 al.albumid ,al.title, Sum( i.unitprice * i.quantity) AS Revenue
From  invoiceLine i 
Join Track t on t.Trackid = i.Trackid
Join Album al on al.Albumid = t.albumid
group by al.albumid ,al.title
order by Revenue DESC











