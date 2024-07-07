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