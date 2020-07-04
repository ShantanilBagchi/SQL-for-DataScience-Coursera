--Q1) Using a subquery, find the names of all the tracks for the
-- album "Californication".

SELECT 
      Albums.AlbumId,
      Title,
      Artistid,
      Name
      
FROM Albums INNER JOIN Tracks
ON Albums.Albumid=Tracks.Albumid

WHERE Title='Californication';
    
------------------------------------------------------------------------------------
-- Q2) Find the total number of invoices for each customer along 
-- with the customer's full name, city and email.

SELECT 
      COUNT(Invoices.CustomerId) AS invoices,
      InvoiceId,
      FirstName,
      LastName,
      City,
      Email
      
FROM Invoices LEFT JOIN Customers
ON Invoices.CustomerId=Customers.CustomerId

GROUP BY Invoices.CustomerId;

------------------------------------------------------------------------------------
-- Q3) Retrieve the track name, album, artist, and trackID for 
-- all the albums.

SELECT 
      Albums.AlbumId,
      TrackId,
      Title,
      Artistid,
      Name
      
FROM Albums INNER JOIN Tracks
ON Albums.Albumid=Tracks.Albumid;

------------------------------------------------------------------------------------
-- Q4) Retrieve a list with the managers last name, and the last 
-- name of the employees who report to him or her.

SELECT 
      M.LastName AS Manager, 
      E.LastName AS Employee
      
FROM Employees E INNER JOIN Employees M 
ON E.ReportsTo = M.EmployeeID;

------------------------------------------------------------------------------------
-- Q5) Find the name and ID of the artists who do not have albums.

SELECT 
      Artists.ArtistId,
      AlbumId,
      Title,
      Name
      
FROM Artists LEFT JOIN Albums
ON Albums.ArtistId=Artists.ArtistId

WHERE Title IS NULL;

------------------------------------------------------------------------------------
-- Q6) Use a UNION to create a list of all the employee's & 
-- customer's first names and last names ordered by the last
-- name in descending order.

SELECT 
       FirstName,
       LastName
FROM Employees

UNION

SELECT 
       FirstName,
       LastName
       
FROM Customers
ORDER BY LastName DESC;

------------------------------------------------------------------------------------
-- Q7) See if there are any customers who have a different city
-- listed in their billing city versus their customer city.

SELECT 
      Invoices.CustomerId,      
      FirstName,
      LastName,
      City,
      BillingCity
      
FROM Invoices LEFT JOIN Customers
ON Invoices.CustomerId=Customers.CustomerId

WHERE City!=BillingCity;
