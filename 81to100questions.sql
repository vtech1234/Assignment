/*81) Write a query that selects the first customer in alphabetical order whose name begins with ‘G’*/ 
 select CNAME from customer where CNAME REGEXP '^G';
/*======================================================================================================================================================
82) Write a query that counts the number of different non NULL city values in the customers table.*/
select count(CITY) AS TOTALCITY FROM customer where CITY IS NOT NULL;
/*======================================================================================================================================================
83) Find the average amount from the Orders Table.
select AVG(ATM) from orders;
/*======================================================================================================================================================
84) Find all customers who are not located in SanJose and whose rating is above 200.*/
select * from customer where CITY !='Sanjose' AND RATING>200;
/*======================================================================================================================================================
85) Give a simpler way to write this query.SELECT snum, sname, city, comm FROM salespeople WHERE (comm > + 0.12 OR comm < 0.14);*/
SELECT snum, sname, city, comm FROM salespeople WHERE COMM BETWEEN 12 AND 14;
/*======================================================================================================================================================
86) Which salespersons attend to customers not in the city they have been assigned to?*/
select salespeople.SNAME ,salespeople.CITY , customer.CNAME ,customer.CITY from customer JOIN salespeople WHERE salespeople.SNUM =customer.SNUM AND salespeople.CITY!=customer.CITY;
/*=====================================================================================================================================================
87) Which salespeople get commission greater than 0.11 are serving customers rated less than 250?*/
select salespeople.SNAME, salespeople.COMM,customer.RATING from customer JOIN salespeople where salespeople.COMM>11 AND customer.RATING<250 GROUP BY salespeople.SNUM;
/*======================================================================================================================================================
88) Which salespeople have been assigned to the same city but get different commission percentages?*/
select * from salespeople where CITY= (select CITY from salespeople GROUP BY CITY HAVING count(*)>1);
/*======================================================================================================================================================
89) Which salesperson has earned the maximum commission?*/
 select SNUM,SNAME ,COMM from salespeople where COMM =(select MAX(COMM) from salespeople);
/*======================================================================================================================================================
90) Does the customer who has placed the maximum number of orders have the maximum rating?
/*======================================================================================================================================================
91) List all customers in descending order of customer rating.*/
select * from customer ORDER BY RATING DESC;
/*======================================================================================================================================================
92) On which days has Hoffman placed orders?*/
 select customer.CNAME , orders.ODATE from orders join customer where customer.CNAME='Haffman' GROUP BY orders.ODATE;
/*======================================================================================================================================================
93) Which salesmen have no orders between 10/03/1990 and 10/05/1990?*/
select salespeople.SNAME , orders.ODATE from salespeople JOIN customer ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM = orders.CNUM AND ODATE NOT BETWEEN '1990-03-10' AND '1990-05-10';
/*======================================================================================================================================================
94) How many salespersons have succeeded in getting orders?*/
select salespeople.SNAME from salespeople JOIN customer ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM = orders.CNUM GROUP BY salespeople.SNAME;
/*======================================================================================================================================================
95) How many customers have placed orders?*/
select salespeople.SNAME from salespeople JOIN customer ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM = orders.CNUM GROUP BY salespeople.SNAME;
/*======================================================================================================================================================
96) On which date has each salesman booked an order of maximum value?*/
select salespeople.SNAME,orders.ODATE, MAX(orders.ATM) AS atm from salespeople JOIN customer ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM = orders.CNUM GROUP BY salespeople.SNUM  ;
/*======================================================================================================================================================
97) Who is the most successful salesperson?*/
select salespeople.SNAME ,SUM(orders.ATM) from salespeople JOIN customer ON salespeople.SNUM = customer.SNUM JOIN orders ON customer.CNUM = orders.CNUM  GROUP BY salespeople.SNUM;
/*======================================================================================================================================================
98) Which customers have the same rating?*/
 select CNAME, RATING from customer ORDER BY RATING DESC;
/*======================================================================================================================================================
99) Find all orders greater than the average for October 4th.*/
 select * from orders where ATM >(select AVG(ATM) from orders where ODATE='1990-04-10');
/*======================================================================================================================================================
100) List all customers with ratings above Grass’s average.*/
 select * from customer WHERE RATING > (select RATING from customer where CNAME = 'Grass');
/*=======================================================================================================================================================*/




















