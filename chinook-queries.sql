-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT firstname, lastname, customerid, country FROM customer WHERE Country != 'USA'

-- Provide a query only showing the Customers from Brazil.
SELECT * FROM customer WHERE Country = 'Brazil'


-- Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT cust.FirstName || ' ' || LastName AS FullName, inv.InvoiceId, inv.InvoiceDate, inv.BillingCountry
FROM Invoice inv
JOIN Customer cust
ON cust.CustomerId = inv.CustomerId
WHERE cust.Country = 'Brazil'


-- Provide a query showing only the Employees who are Sales Agents.
SELECT * FROM Employee WHERE title = 'Sales Support Agent'

-- Provide a query showing a unique list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM Invoice

-- Provide a query showing the invoices of customers who are from Brazil.
SELECT * FROM invoice WHERE BillingCountry = 'Brazil'

-- Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT * FROM invoice WHERE BillingCountry = 'Brazil'

-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT i.Total AS InvTotal, c.FirstName, c.Country AS Country, c.SupportRepId
FROM Invoice i
JOIN Customer c ON c.CustomerId = i.InvoiceId
JOIN Employee e ON e.EmployeeId = c.SupportRepId

-- How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT invoicedate FROM Invoice WHERE invoicedate LIKE '%2009%'
SELECT SUM(total) FROM Invoice WHERE invoicedate LIKE '%2009%'
-- 2009 : 83 invoices : TOTAL 449.46
SELECT invoicedate FROM Invoice WHERE invoicedate LIKE '%2011%'
SELECT SUM(total) FROM Invoice WHERE invoicedate LIKE '%2011%'
-- 2011 : 83 invoices : TOTAL 469.58

-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(*) FROM InvoiceLine  WHERE invoiceid = '37'

-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT COUNT(*) FROM InvoiceLine GROUP BY invoiceid


-- Provide a query that includes the track name with each invoice line item.
SELECT t.name AS TrackName, il.*
FROM Track t
JOIN 	InvoiceLine il ON il.TrackId = t.TrackId


-- Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT t.Name AS TrackName, ar.Name AS Artist, il.*
FROM Track t
JOIN Album al ON al.AlbumId = t.AlbumId
JOIN Artist ar ON ar.ArtistId = al.ArtistId
JOIN InvoiceLine il ON il.TrackId = t.TrackId


-- Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT BillingCountry, COUNT(BillingCountry) AS InvoiceTotal
FROM Invoice
GROUP BY BillingCountry

-- Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.


-- Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.


-- Provide a query that shows all Invoices but includes the # of invoice line items.


-- Provide a query that shows total sales made by each sales agent.


-- Which sales agent made the most in sales in 2009?


-- Which sales agent made the most in sales in 2010?


-- Which sales agent made the most in sales over all?


-- Provide a query that shows the # of customers assigned to each sales agent.


-- Provide a query that shows the total sales per country. Which country's customers spent the most?


-- Provide a query that shows the most purchased track of 2013.


-- Provide a query that shows the top 5 most purchased tracks over all.


-- Provide a query that shows the top 3 best selling artists.


-- Provide a query that shows the most purchased Media Type.
