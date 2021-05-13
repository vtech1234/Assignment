/*-------------------------------------------------------------------------------------------------------
21) List all the largest orders for October 3, for each salesperson.*/
 select * from salespeople where SNUM IN (select SNUM from customer GROUP BY SNUM HAVING COUNT(*));

/*-------------------------------------------------------------------------------------------------------
22) Find all customers located in cities where Serres has customers.
    here i query with subquery in this task where i had to take city from salespeople where salespeople anme is serres .*/ 
select * from customer where CITY=(select CITY FROM salespeople where salespeople.SNAME='Serres');
/*-------------------------------------------------------------------------------------------------------
23) Select all customers with a rating above 200.
    select * from customer where RATING>200;
/*-------------------------------------------------------------------------------------------------------
24) Count the number of salespeople currently having orders in the orders table.
    here i count salespeople who have order in order table . Join is used for denirmalization.
    */   
    select COUNT(*) from salespeople JOIN orders where orders.SNUM=salespeople.SNUM;

    select salespeople.SNUM from salespeople JOIN orders where orders.SNUM=salespeople.SNUM GROUP BY orders.snum ;

/*-------------------------------------------------------------------------------------------------------------------
26) Find salespeople who have multiple customers.
    here i applied both approches join and subquery . I explored this and got that join is more essential then subquery 
    because join works like single query and subquery according to inner queries.*/

    select salespeople.SNUM from customer,salespeople where customer.SNUM=salespeople.SNUM GROUP BY customer.SNUM  HAVING COUNT(*)>1 ;
    select * from salespeople where SNUM IN (select SNUM from customer GROUP BY SNUM HAVING COUNT(*)>1); 
/*--------------------------------------------------------------------------------------------------------------------
27) Find salespeople with customers located in their own cities. 
    Here I used inner join fro the task . I retrieved data from customer and salespeople where city of a salespeople and his customer is same .
    fror this i provide two velidatin city and thier id. */ 

   SELECT salespeople.SNAME , customer.CNAME , salespeople.CITY from customer 
   INNER JOIN salespeople WHERE salespeople.CITY = customer.CITY AND  salespeople.SNUM = customer.SNUM;
/*--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
28) Find all salespeople whose name starts with ‘P’ and fourth character is ‘I'.
    To do this task i refere first LIKE and  REGEXP operator which are used to search in a perticuler string match with the single key word 
     and a specific idex. */
     SELECT * from salespeople WHERE SNAME LIKE 'P__L';
/*----------------------------------------------------------------------------------------------------------------------------------
29) Write a query that uses a subquery to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
   Here i got the customer number from customer where customer name is Cisneros using subquery and use this value to get orders from order table.*/

   SELECT * FROM orders where CNUM = (select CNUM from customer where CNAME='Cisneros' ); 
/*-----------------------------------------------------------------------------------------------------------------------------------
30) Find the largest orders for Serres and Rifkin.
    i used aggregation function for max amount from order table . LIKE is used to match same things from the specific columns.*/

    SELECT salespeople.SNAME, MAX(ATM) from orders INNER JOIN salespeople where salespeople.SNUM=orders.SNUM AND  SNAME LIKE  'Serres' OR 'Rifkin' GROUP BY salespeople.SNUM;
/*------------------------------------------------------------------------------------------------------------------------------------

31) Sort the salespeople table in the following order: snum, sname, commission, city.
*/

 ALTER TABLE salespeople MODIFY COMM int(20)  ALTER CITY ;
 select SNUM ,SNAME , COMM ,CITY FROM salespeople;
/*---------------------------------------------------------------------------------------------------------------------------------------
32) Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.


select * from customer where CNAME LIKE 'A%' OR 'G%';

/*-----------------------------------------------------------------------------------------------------------------------------------------

33) Select all the possible combinations of customers you can assign.

here i use the new concept of alias of customer so that  all the possible combinations of customers can be assign.

*/
select a.CNAME,b.CNAME from customer a, customer b where a.SNUM= b.SNUM;
/*------------------------------------------------------------------------------------------------------------------------------------
34) Select all orders that are greater than the average for October 4. 
    here i got my result set with aggregation function and subquery . i got avarage by aggregation function .*/
    select * from orders where ATM>(select avg(ATM) from orders where ODATE='1990-04-10');
/*------------------------------------------------------------------------------------------------------------------------------------
35) Write a select command using correlated subquery that selects the names and numbers of all customers with ratings equal to the maximum
for their city.
 here i got my result set with aggregation function and subquery . i got avarage by aggregation function .
*/
select CNUM, CNAME,RATING from customer where RATING>=(select avg(RATING) from customer);
/*-------------------------------------------------------------------------------------------------------------------------------------
36) Write a query that totals the orders for each day and places the results in descending order.
    here i write a query for getting the total of atm date wise and order them into date wise.*/

    select SUM(ATM) AS TOTAL , ODATE from orders GROUP BY ODATE  DESC;
/*---------------------------------------------------------------------------------------------------------------------------------------
37) Write a select command that produces the rating followed by the name of each customer in SanJose.
  */ 
   select * from customer where CITY='Sanjose';
/*----------------------------------------------------------------------------------------------------------------------------------------
38) Find all orders with amounts smaller than any amount for a customer in SanJose.

---------------------------------------------------------------------------------------------------------------------------------------------
39) Find all orders with above average amounts for their customers.
   HERE i retrieved data from the orders table where amount is above then the customer of sanjose.*/
select * from orders JOIN customer where customer.CNUM=orders.CNUM AND ATM>(select AVG(ATM) from orders);
/*------------------------------------------------------------------------------------------------------------------------------------------
40) Write a query that selects the highest rating in each city.


   select CNAME ,CITY,MAX(RATING) from customer GROUP BY CITY;
-------------------------------------------------------------------------------------------------------------------------------------------
























