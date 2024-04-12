
---Assignment 3{2024 SQL class}
--About the dataset:
/*You work for a data analytics company, and your client is a food delivery platform similar to Jomato.
--They have provided you with a dataset containing information about various restaurants in a city. 
--Your task is to analyze this dataset using SQL queries to extract valuable insights and generate reports for your client.*/
--Tasks to be performed:
---1.Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.
select * from jomato

select RestaurantName,[RestaurantType],[CuisinesType],Tablebooking from jomato
where tableBooking!=0

create procedure Getrestaurant
as
select RestaurantName,[RestaurantType],[CuisinesType] from jomato
 where tableBooking!=0;
 go

 exec Getrestaurant
/*2.Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.*/

select * from jomato
where cuisinestype='cafe'

begin transaction
update jomato
set cuisinestype='cafeteria'
where cuisinestype='cafe'
/* select * from jomato */
rollback
--3.Generate a row number column and find the top 5 areas with the highest rating of restaurants.
select count(area) as Rownumber from jomato &&&&&&

select top 5 * from jomato order by rating desc
--4.Use the while loop to display the 1 to 50.  

Declare 
@count int
set @count = 1
while @count <= 50
begin
	Print @count
	set @count = @count + 1
end


---5.Write a query to Create a Top rating view to store the generated top 5 highest rating ofrestaurants.
select top 5 * from jomato order by rating desc
select top 5 restaurantname,no_of_rating from jomato order by Rating desc

---6.Create a trigger that give an message whenever a new record is inserted.ignment 5 n 6------------
ddl-> create drop alter
dml-> insert update delete

create trigger Tr_new_record
on Jomato
after insert
as 
begin
	Print 'A new record has  been inserted into the table'
end
------
select * from Jomato

----check after inserting the new data
insert into jomato (Orderid,RestaurantName,RestaurantType,Rating,No_of_rating,averagecost, OnlineOrder,TableBooking,CuisinesType,area, LocalAddress ,delivery_time) 
 values(12345,' CCD', 'Cafe', 4.5, 25, 400, 1,0 , 'Cafe', 'Chennai', 'Velachery', 42)

 select * from jomato where OrderId = 5000
 select top 5 * from Jomato
 --syntax---
create trigger tr_name
on database/on table_name
for action
as
begin

statements/task

end


magic  tables inserted deleted

select 'jomato' as table_name,* from jomato

------another method------
create or alter trigger tr_printmsg
on jomato
for insert,delete
as
begin

print('new record as been inserted in the table jomato')
select 'inserted' as table_name,* from inserted
select 'deleted' as table_name,* from deleted
end

insert into jomato([OrderId]) values (5001)

delete from jomato where orderid=5001


----------------cte-----------
with CTE as 
(
select *,row_number() over(partition by rating)from jomato)
delete from cte where row_num>1
)

SELECT customer_name, 
       CAST(DAY(order_date) AS VARCHAR(2)) + '/' + 
       CAST(MONTH(order_date) AS VARCHAR(2)) + '/' + 
       CAST(YEAR(order_date) AS VARCHAR(4)) AS new_orderdate
FROM your_table_name
WHERE YEAR(order_date) = 2023;

SELECT book_id, publication_year 
FROM (
    SELECT * 
    FROM books
) AS t
ORDER BY publication_year DESC, book_id ASC;
