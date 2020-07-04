-- Q1) Pull a list of customer ids with the customer’s full name, and address,
-- along with combining their city and country together. Be sure to make a
-- space in between these two and make it UPPER CASE.

SELECT CustomerId,
       FirstName||' '||LastName,
       Address,
       City||' '||Country
FROM Customers

------------------------------------------------------------------------------------
-- Q2) Create a new employee user id by combining the first 4 letter of the
-- employee’s first name with the first 2 letters of the employee’s last name. 
-- Make the new field lower case and pull each individual step to show your work.

SELECT 
      FirstName,
      LastName,
      LOWER(SUBSTR(FirstName,1,4)||SUBSTR(LastName,1,2)) AS UserId

FROM Employees;

------------------------------------------------------------------------------------
-- Q3) Show a list of employees who have worked for the company for 15 or more 
-- years using the current date function. Sort by lastname ascending.

SELECT 
      FirstName,
      LastName,
      (DATE('now')-HireDate) As YearWorked 
      
FROM Employees
WHERE YearWorked>=15
ORDER BY LastName; 

------------------------------------------------------------------------------------
-- Q4) Profiling the Customers table, answer the following question.

SELECT COUNT(*)
FROM Customers
WHERE _______ IS NULL

-- _________: FirstName, PostalCode, Company, Fax, Phone, Address

------------------------------------------------------------------------------------
-- Q5) Find the cities with the most customers and rank in descending order.

SELECT 
      COUNT(CustomerId) AS C,
      City
FROM Customers
GROUP BY City 
ORDER BY C DESC

------------------------------------------------------------------------------------
-- Q6) Create a new customer invoice id by combining a customer’s invoice id with
-- their first and last name while ordering your query in the following order:
-- firstname, lastname, and invoiceID.

SELECT FirstName||LastName||InvoiceId
FROM Customers INNER JOIN Invoices
ON Customers.CustomerId=Invoices.CustomerId
WHERE FirstName LIKE 'Astrid%';
