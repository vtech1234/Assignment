/*61) Write a SELECT command that produces the order number, amount, and the date from rows in the order table.*/
select ONUM,ATM,ODATE from orders;
/*=======================================================================================================================================================
62) Count the number of non NULL rating fields in the Customers table (including repeats).*/
select COUNT(*) from customer where RATING NOT LIKE NULL;
/*======================================================================================================================================================
63) Write a query that gives the names of both the salesperson and the customer for each order after the order number.*/
select salespeople.SNAME , customer.CNAME, orders.ONUM from customer  JOIN salespeople ON customer.SNUM = salespeople.SNUM JOIN orders  ON customer.CNUM=orders.CNUM ;
/*======================================================================================================================================================
64) List the commissions of all salespeople servicing customers in London.*/
 select salespeople.SNAME, salespeople.CITY, salespeople.COMM from salespeople JOIN customer where salespeople.CITY= 'London' AND salespeople.SNUM=customer.SNUM GROUP BY salespeople.SNUM;
/*======================================================================================================================================================
65) Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.

/*====================================================================================================================================================
66) Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.*/
select SNAME , CITY from salespeople where EXISTS ( select CITY from customer where customer.CITY=salespeople.CITY AND customer.SNUM=salespeople.SNUM ) ;
/*======================================================================================================================================================
67) Write a query that selects all customers serviced by Peel or Motika. (Hint: The snum field relates the 2 tables to one another.)*/
select customer.CNAME,customer.CITY from customer JOIN salespeople where customer.SNUM=salespeople.SNUM AND (salespeople.SNAME = 'Peel' OR salespeople.SNAME= 'Motika');
/*=====================================================================================================================================================
68) Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should
be counted only once.)*/
select salespeople.SNAME,count(DISTINCT salespeople.SNAME),orders.ODATE from salespeople JOIN customer ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM=orders.CNUM GROUP BY orders.ODATE;
/*======================================================================================================================================================
69) Find all orders attributed to salespeople who live in London.*/
select salespeople.SNAME,salespeople.CITY,orders.ONUM from customer JOIN  salespeople ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM=orders.CNUM AND salespeople.CITY='London' ;
/*=======================================================================================================================================================
70) Find all orders by customers not located in the same cities as their salespeople.*/
select customer.CNAME, customer.CITY , salespeople.SNAME from customer INNER JOIN salespeople WHERE salespeople.SNUM = customer.SNUM AND salespeople.CITY != customer.CITY;
/*======================================================================================================================================================
71) Find all salespeople who have customers with more than one current order.
 error*/ select s.SNAME,d.countn from  salespeople s, (select count(c.ONUM) as countn from customer a, salespeople b,orders c where a.SNUM=b.SNUM AND a.CNUM=c.CNUM GROUP BY b.SNAME) d WHERE s.SNAME=d.SNAME AND countn>1 ;
/*======================================================================================================================================================
72) Write a query that extracts from the customer’s table every customer assigned to a salesperson, who is currently having at least one another
customer(besides the customer being selected) with orders in the Orders Table.
PENNDING */ select salespeople.SNAME , customer.CNAME from customer INNER JOIN salespeople ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM = orders.CNUM  GROUP BY salespeople.SNAME;
/*======================================================================================================================================================
73) Write a query on the customer’s table that will find the highest rating in each city. Put the output in this form: for the city (city), the highest
rating is (rating).*/
select CITY ,MAX(RATING) AS RATING from customer GROUP BY CITY;
/*=======================================================================================================================================================
74) Write a query that will produce the snum values of all salespeople with orders, having amt greater than 1000 in the Orders Table(without
repeats).*/
Select SNUM  ,SUM(ATM) AS Total from orders WHERE ATM>1000 GROUP BY SNUM;
/*======================================================================================================================================================
75) Write a query that lists customers in a descending order of rating. Output the rating field first, followed by the customer’s names and numbers.*/
 select RATING ,CNAME,CNUM from customer ORDER BY RATING DESC;
/*=======================================================================================================================================================
76) Find the average commission for salespeople in London.*/
select AVG(COMM) AS COMMS FROM salespeople WHERE CITY='London';
/*======================================================================================================================================================
77) Find all orders credited to the same salesperson who services Hoffman.(cnum 2001).*/
select salespeople.SNAME,customer.CNAME, orders.ONUM from customer INNER JOIN salespeople ON salespeople.SNUM=customer.SNUM JOIN orders ON customer.CNUM=orders.CNUM AND customer.CNUM=2001;
/*======================================================================================================================================================
78) Find all salespeople whose commission is in between 0.10 and 0.12(both inclusive).*/
select * from salespeople WHERE COMM BETWEEN 10 AND 12;
/*======================================================================================================================================================
79) Write a query that will give you the names and cities of all salespeople in London with a commission above 0.10.*/
select SNAME , CITY FROM salespeople WHERE CITY='London' AND C
/*======================================================================================================================================================
80) Write a query that selects each customer’s smallest order.*/

select customer.CNAME ,MIN(orders.ATM) from orders INNER join customer where customer.CNUM = orders.CNUM GROUP BY orders.CNUM ;

/*======================================================================================================================================================*/