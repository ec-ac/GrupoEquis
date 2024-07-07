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