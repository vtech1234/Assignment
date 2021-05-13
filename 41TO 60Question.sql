/*41) Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100.00.*/

/*===================================================================================================================================
42)Count the customers with ratings above SanJose’s average.*/

select count(*) from customer where RATING > (select AVG(RATING) from customer WHERE CITY = 'Sanjose');
/*======================================================================================================================================
43) Find all salespeople that are located in either Barcelona or London.*/
select * from salespeople where CITY = 'Barcelona' OR 'London';
/*======================================================================================================================================
44) Find all salespeople with only one customer.*/
select a.SNUM ,a.SNAME from salespeople a, (select SNUM , count(*) as countt from customer GROUP BY SNUM HAVING countt=1) b where a.SNUM=b.SNUM;
/*======================================================================================================================================
45) Write a query that joins the Customer table to itself to find all pairs or customers served by a single salesperson.

=======================================================================================================================================*/
/*46) Write a query that will give you all orders for more than $1000.00*/
 select * from orders where ATM>1000;
/*=======================================================================================================================================
47) Write a query that lists each order number followed by the name of the customer who made that order.*/
 select customer.CNUM, orders.ONUM from orders INNER JOIN customer where customer.CNUM=orders.CNUM;
/*=======================================================================================================================================
48) Write a query that selects all the customers whose ratings are equal to or greater than ANY(in the SQL sense) of ‘Serres’.*/
SELECT * FROM customer WHERE RATING >=( select MAX(RATING) from customer JOIN salespeople where customer.SNUM = 
salespeople.SNUM AND salespeople.SNAME ='Serres'GROUP BY customer.SNUM);
/*=======================================================================================================================================
49) Write two queries that will produce all orders taken on October 3 or October 4.*/
select * from orders where ODATE = '1990-03-10' OR ODATE= '1990-04-10';
/*=======================================================================================================================================
50) Find only those customers whose ratings are higher than every customer in Rome.*/
select * from customer where RATING>(select MAX(RATING) from customer where CITY='Rome');
/*=======================================================================================================================================
51) Write a query on the Customers table whose output will exclude all customers with a rating<= 100.00, unless they are located in Rome.*/
select * from customer Where (RATING<=100 AND CITY='Rome') OR RATING>100;
/*=======================================================================================================================================
52) Find all rows from the customer’s table for which the salesperson number is 1001.*/
 Select * from customer Where SNUM=1001;
/*=======================================================================================================================================
53) Find the total amount in orders for each salesperson where their total of amounts are greater than the amount of the largest order in the table.*/
select * from (select SUM(ATM) AS ATM from orders GROUP BY SNUM) a where a.ATM>(select MAX(ATM) from orders );
/*=======================================================================================================================================
54) Write a query that selects all orders save those with zeroes or NULL in the amount file.*/
select * from orders where ATM LIKE NULL OR ATM=0.00;
select * from orders ;
/*=======================================================================================================================================
55) Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a
rating of less than 200.*/
select salespeople.SNAME , customer.CNAME,customer.RATING from customer JOIN salespeople where salespeople.SNUM=customer.SNUM AND RATING < 200 ORDER BY salespeople.SNAME ;
/*=======================================================================================================================================
56) Find all salespeople name and commission.*/
select SNAME , COMM from salespeople;

/*========================================================================================================================================
57) Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s cnum
rather than his rating, so that it would still be usable if his rating is changed.*/

SELECT CNAME , CITY FROM customer where RATING=(select RATING from customer where CNAME='Haffman');
/*============================================================================================================================================
58) Find all salespeople for whom there are customers that follow them in alphabetical order.*/
select salespeople.SNAME , customer.CNAME from customer INNER JOIN salespeople WHERE salespeople.SNUM=customer.SNUM ORDER BY salespeople.SNAME;

/*============================================================================================================================================
59) Write a query that produces the names and ratings of all customers who have average orders.*/

/*============================================================================================================================================
60) Find the SUM of all Amounts from the orders table.*/
select SUM(ATM) AS Total from orders;
/*============================================================================================================================================*/











