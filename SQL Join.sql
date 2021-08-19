select * from products;
select * from categories;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.name as ProductName, c.name as CategoryName
from products as p
inner join categories as c on p.CategoryID = c.CategoryID
where c.name = 'computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.name, p.price, r.Rating
 from products as p
left join reviews as r on p.ProductID = r.ProductID
 Where R.rating = 5
 order by name, price;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName,e.LastName, Sum(s.quantity) as total
from sales as s inner join employees as e on e.EmployeeID = s.EmployeeID
Group by e.EmployeeID
order by total desc
limit 2;




/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.name, categories.name
from categories 
right join departments on departments.DepartmentID = categories.DepartmentID
where categories.name = 'games' or categories.name = 'appliances';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name as ProductName, Sum(s.quantity) as 'Total Sold', Sum(s.quantity*s.PricePerUnit) as 'Total Price'
from sales as s inner join products as p on p.ProductID=s.ProductID
where name = "Eagles: Hotel California";
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select * from products where products.Name = 'Visio Tv';

select p.name as ProductName, r.Reviewer , r.rating, r.comment
from reviews as r 
inner join products as p on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating=1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID, e.FirstName, E.LastName, p.Name, sum(s.quantity) as 'Total Sold'
from sales as s
inner join employees as e on s.EmployeeID = e.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID;

