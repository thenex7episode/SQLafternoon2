-- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES -- JOIN TABLES

-- 1
SELECT *
FROM Invoice i
JOIN InvoiceLine il ON il.invoiceId = i.invoiceId
WHERE il.UnitPrice > 0.99;

-- 2
SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId;

-- 3
SELECT c.FirstName, c.LastName, e.FirstName, e.LastName
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId;

-- 4
SELECT al.Title, ar.Name
FROM Album al
JOIN Artist ar ON al.ArtistId = ar.ArtistId;

-- 5
SELECT pt.TrackId
FROM PlaylistTrack pt
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name = 'Music';

-- 6
SELECT t.Name
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5;

-- 7
Select t.name, p.name
From Track t
Join PlaylistTrack pt ON t.TrackId = pt.TrackId
Join Playlist p ON pt.PlaylistId = p.PlaylistId;

-- 8
Select t.Name, a.Title
From Track t
Join Album a ON t.AlbumId = a.AlbumId
Join Genre g ON g.GenreId = t.GenreId
Where g.Name = "Alternative";

-- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES -- NESTED QUERIES

-- 1
Select * 
From Invoice
Where InvoiceId IN (Select InvoiceID From InvoiceLine Where UnitPrice > 0.99)

-- 2
Select * 
From PlaylistTrack
Where PlaylistId IN (Select PlaylistId from Playlist Where Name = "Music" )

-- 3
Select Name
From Track
Where TrackId IN (Select TrackId From PlaylistTrack Where PlaylistId = 5)

-- 4
Select * 
From Track
Where GenreId IN (Select GenreID From Genre Where Name = "Comedy")

-- 5
Select * 
From Track
Where AlbumID IN (Select AlbumId From Album Where Title = "Fireball")

-- 6
Select * 
From Track
Where AlbumId IN (Select AlbumId From Album Where ArtistId IN(
Select ArtistId From Artist Where Name = "Queen"))

-- UPDATING ROWS 

-- 1
Update Customer
Set Fax = null
Where Fax IS NOT null

-- 2
Update Customer 
Set Company = "Self"
Where Company IS null

-- 3
Update Customer 
Set LastName = "Thompson"
Where FirstName = "Julia" AND LastName = "Barnett"

-- 4
Update Customer
Set SupportRepId = 4
Where Email = "luisrojas@yahoo.cl"

-- 5
Update Track
Set Composer = "The darkness around us"
Where GenreId IN (Select GenreId From Genre Where Name = "Metal") 
AND Composer IS null

-- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY -- GROUP BY 

-- 1
Select Count(*), g.Name
From Track t
Join Genre g ON t.GenreId = g.GenreID
Group By g.Name

-- 2
Select Count(*), g.Name
From Track t
Join Genre g On g.GenreId = t.GenreId
Where g.Name = "Pop" OR g.Name = "Rock"
Group By g.Name

-- 3
Select Count(*), ar.Name
From Artist ar
Join Album al ON ar.ArtistId = al.ArtistId
Group By al.ArtistId

-- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT -- USE DISTINCT

-- 1
Select Distinct Composer
From Track

-- 2
Select BillingPostalCode
From Invoice

-- 3
Select Distinct Company
From Customer

-- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS -- DELETE ROWS    

-- 1
Delete From practice_delete Where Type = "bronze";

-- 2
Delete From practice_delete Where Type = "silver";

-- 3
Delete From practice_delete Where Value = 150;

