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