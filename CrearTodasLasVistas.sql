IF OBJECT_ID('DimCustomer', 'V') IS NOT NULL
	DROP VIEW [dbo].[DimCustomer]
GO

IF OBJECT_ID('DimEmployee', 'V') IS NOT NULL
	DROP VIEW [dbo].[DimEmployee]
GO

IF OBJECT_ID('DimTrack', 'V') IS NOT NULL
	DROP VIEW [dbo].[DimTrack]
GO

IF OBJECT_ID('FactMusicSale', 'V') IS NOT NULL
	DROP VIEW [dbo].[FactMusicSale]
GO

CREATE VIEW DimCustomer AS
	SELECT 
		c.CustomerId,
		c.FirstName + ' ' + c.LastName as name_customer,
		c.Company as company_customer,
		c.Address as address_customer,
		c.City as city_customer,
		c.State as state_customer,
		c.Country as country_customer,
		c.PostalCode as postal_code_customer,
		c.Phone as phone_customer,
		c.Fax as fax_customer,
		c.Email email_customer,
		e.EmployeeId AS support_rep
	FROM 
		Customer c
	JOIN 
		Employee e ON c.SupportRepId = e.EmployeeId;
GO

CREATE VIEW DimEmployee AS
	SELECT 
		e.EmployeeId AS id_employee,
		e.FirstName + ' ' + e.LastName AS name_employee,
		e.Title AS title_employee,
		e.Address AS address_employee,
		e.City AS city_customer,
		e.Country AS country_customer,
		e.PostalCode AS postalCode_customer,
		e.Phone AS phone_employee,
		e.Fax AS fax_employee,
		e.Email AS email_employee,
		m.EmployeeId AS manager
	FROM 
		Employee e
	LEFT JOIN 
		Employee m ON e.ReportsTo = m.EmployeeId;
GO

CREATE VIEW DimTrack AS
	SELECT 
		t.TrackId AS id_track,
		t.Name AS name_track,
		al.Title AS album_track,
		mt.MediaTypeId AS media_type,
		g.GenreId AS genre,
		p.PlaylistId AS playlist,
		a.ArtistId AS artist
	FROM 
		Track t
	INNER JOIN 
		Album al ON t.AlbumId = al.AlbumId
	INNER JOIN 
		MediaType mt ON t.MediaTypeId = mt.MediaTypeId
	INNER JOIN 
		Genre g ON t.GenreId = g.GenreId
	INNER JOIN 
		Album a ON al.ArtistId = a.ArtistId
	LEFT JOIN 
		PlaylistTrack pt ON t.TrackId = pt.TrackId
	LEFT JOIN 
		Playlist p ON pt.PlaylistId = p.PlaylistId
GO

CREATE VIEW FactMusicSale AS
	SELECT 
		i.InvoiceId AS sale_id,
		i.CustomerId AS sale_customer,
		c.SupportRepId as sale_employee,
		il.TrackId AS sale_track_id,
		i.Total AS sale_total,
		il.Quantity AS sale_quantity,
		i.InvoiceDate AS sale_date,
		il.UnitPrice AS sale_unitprice,
		i.BillingAddress AS sale_address,
		i.BillingCity AS sale_city,
		i.BillingCountry AS sale_country,
		i.BillingPostalCode AS sale_postalCode
	FROM 
		Invoice i
	LEFT JOIN 
		InvoiceLine il ON i.InvoiceId = il.InvoiceId
	LEFT JOIN
		Customer c on i.CustomerId = c.CustomerId
GO