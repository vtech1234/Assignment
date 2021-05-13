/*---------------------------------------------------------------------------------------------------
1) List all the columns of the Salespeople table.
Here ,I am running a siple query for retrieving all data from salespeople
table.*/

   SELECT * FROM salespeople;
/*----------------------------------------------------------------------------------------------------
2) List all customers with a rating 100.
  WHERE is use for the condition in the query so that data can be retrieve from 
  table customer on the validetion of rating.*/
 
   select * from customer where rating=100;
/*----------------------------------------------------------------------------------------------------
3) Find the largest order taken by each salesperson on each date.
   During query i was not getting my point , GROUP BY helps us to eliminate the duplicate values from 
   column and give us unique values.  */  

   select MAX(ATM) AS numbers,SNUM,ODATE from orders GROUP BY SNUM;

/*----------------------------------------------------------------------------------------------------
4) Arrange the Order table by descending customer number.
  SSQL provide us the facility of natural order on the highly prior column but If we want to change the 
  order . DESC provides us decending order. Here order is  orderd by onum.*/

    select * from orders order by ONUM DESC;

/*----------------------------------------------------------------------------------------------------
5) Find which salespeople currently have orders in the order table.
  Here i have to connect two table for my result set. so I used  join for this purpose . Join provides
  that data can be mapped from both the table with a condition which is done by common column. */  

   select salespeople.SNUM from salespeople right join orders on salespeople.SNUM =orders.SNUM;

   select SNUM  from orders GROUP BY SNUM;
/*----------------------------------------------------------------------------------------------------
6) List names of all customers matched with the salespeople serving them
  when i was dealing with this query .there is a problem for the result set because data retrieved from 
  both tables.*/
  
   select customer.CNUM,customer.CNAME,customer.CITY,customer.RATING,customer.SNUM from customer inner
 join salespeople on salespeople.SNUM = customer.SNUM;

/*-----------------------------------------------------------------------------------------------------
7) Find the names and numbers of all salespeople who have more than one customer.
   here i got some specific like query , this is very tricky query becaause here i have got to get data
   from customer but i was getting from salespeople that provided wrong result set. Most of the time we 
have to think that i can be tricky. */

 select count(*) AS COUNT ,c.SNUM,s.SNAME from customer c,salespeople s WHERE c.SNUM=s.SNUM GROUP BY c.SNUM ;
/*-----------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
8) Count the orders of each of the salespeople and output the results in descending order
   Here i use the aggregation function of SQL for getting the count of any perticular requirment . I did query 
whit three approches fro the same result . Join is more essential all of them. In second i use alias for denormalizatin 
of thables. In 3rd i used JOINS .*/   
   
 select COUNT(*) AS count ,SNUM from orders GROUP BY SNUM DESC ;

 select count(*) AS count , o.SNUM FROM orders o,customer c,salespeople s where o.SNUM=c.SNUM AND c.SNUM=s.SNUM GROUP BY SNUM DESC;

 select count(*) AS count , orders.SNUM FROM orders JOIN customer ON orders.SNUM=customer.SNUM JOIN salespeople ON customer.SNUM=salespeople.SNUM   GROUP BY SNUM DESC;
/*-----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
10) Match salespeople to customers according to what city they live in.
   Here i got new thing that is 'AS' which is change the column name during query exicution and set the name as required.
   Here i used three tables and i learnt that how to connect more then two table  and how to denormalization is performed.*/

   SELECT customer.CNAME AS customers,salespeople.SNAME AS Salespeople, salespeople.CITY FROM customer JOIN salespeople ON customer.CITY=salespeople.CITY;

/*------------------------------------------------------------------------------------------------------------
11) Find all the customers in SanJose who have a rating above 200.
    Here i explained the AND operator which is perform and operation between  two conditions.*/
    select * from customer where RATING>=200 AND CITY='SanJose';
/*------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
12) List the names and commissions of all salespeople in London.
    Data is retrieved from salespeople where city is London..*/
   select SNAME , COMM from salespeople where CITY='London';
/*------------------------------------------------------------------------------------------------------
13) List all the orders of Salesperson Motika from the orders table
    here I retrieved data from both the tables by using join. Here join works by defoult like inner join .
    data got on the basic of 'Motika' salespeople.*/

SELECT * FROM orders JOIN salespeople ON salespeople.SNAME='Motika';

SELECT * FROM customer JOIN salespeople ON salespeople.SNUM=customer.SNUM JOIN orders ON customer.CNUM=orders.CNUM AND SNAME='Motika';
/*------------------------------------------------------------------------------------------------------
14) Find all customers who booked orders on October 3.
    
    select * from orders where ODATE='1990-03-10';
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
15) Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was not at least 2000 above
the maximum Amount.
   Here i got the maximum amount from order table at any perticuler date which has higher amount then others.but i got all result 
   but i had to take more then 2000 and 2000 . I tried lots of operator for this which provided me only boolean value not actual value.
   
   so how can i done this task? */
select SUM(ATM) AS SUM ,ODATE FROM orders GROUP BY ODATE;

/*---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
16) Select all orders that had amounts that were greater than at least one of the orders from October 6.
    here i retrieved data whre date is 6 Oct in the order table.*/
     
select ONUM, MAX(ATM) AS Amount,ODATE,CNUM,SNUM FROM orders WHERE  ODATE='1990-06-10';

/*----------------------------------------------------------------------------------------------------------
18) Find all customers whose cnum is 1000 above the snum of Serres.
   Here i came to the new concept that is subquery . Subquery is nested query .we can write more then one query 
   in a single a query . I got that this concept works where we have to teke a single value from any specific
   table. Subquery also work like joins .here i retrieved data from customer where salespeople is Serres and i add 1000 
   to sarres id because customer id is in term of 2000. */

 select * from customer inner join salespeople where customer.CNUM=salespeople.SNUM+1000;

 select * from customer WHERE CNUM>(select SNUM from salespeople WHERE SNAME='Serres')+1000;

/*-------------------------------------------------------------------------------------------------------
20) Find the largest order taken by each salesperson on each date, eliminating those Maximum orders, which are less than 3000.

     Here i got the maximum amount from order table at any perticuler date which has higher amount then others. I filtered the value on
the be half of  eliminating those Maximum orders, which are less than 3000.*/

select SNUM, MAX(ATM) AS amount, ODATE  from orders Where ATM>3000 GROUP BY SNUM;
/*-------------------------------------------------------------------------------------------------------*/
