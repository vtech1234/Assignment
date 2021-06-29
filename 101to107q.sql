/*101) Which customers have above average orders?*/
 select * from orders where ATM > (select AVG(ATM) from orders);
/*======================================================================================================================================================
102) Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.*/
 select salespeople.SNUM, salespeople.SNAME, SUM(orders.ATM) AS total from salespeople JOIN customer ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM = orders.CNUM GROUP BY salespeople.SNUM LIMIT 2;
/*======================================================================================================================================================
103) Give names and numbers of all salespersons that have more than one customer?*/
 select SNUM ,SNAME from salespeople WHERE SNUM IN (select SNUM from customer GROUP BY SNUM HAVING COUNT(SNUM)>1);
/*======================================================================================================================================================
104) Select all salespeople by name and number who have customers in their city whom they don’t service.*/
select SNUM ,SNAME from salespeople WHERE SNUM NOT IN (select SNUM from customer GROUP BY SNUM );
/*======================================================================================================================================================
105) Does the total amount in orders by customer in Rome and London, exceed the commission paid to salesperson in London, and New York by
more than 5 times?
/*======================================================================================================================================================
106) Which are the date, order number, amt and city for each salesperson (by name) for themaximum order he has obtained?*/
select orders.ODATE ,orders.ONUM , MAX(orders.ATM) AS MAXATM ,salespeople.CITY from  salespeople JOIN customer ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM = orders.CNUM group by orders.SNUM;
/*======================================================================================================================================================
107) Which salesperson is having lowest commission? */
 select * from salespeople HAVING MIN(COMM);
/*======================================================================================================================================================*/
















