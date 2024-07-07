-- GRUPO EQUIS: GABRIEL CHANG Y ERNESTO ALANIZ - UAM
USE ChinookLandingGrupoX;

--Borrar las tablas si ya existen, una por una
-- Son 11 tablas en total, del modelo/schema de Chinook original

--ALBUM
-- equivalente a "drop table if exists"
IF OBJECT_ID('album', 'U') IS NOT NULL
	DROP TABLE album

-- aqui, aun no existe la tabla "album" en la BD donde van a caer los datos
Select * 
into Album 					-- crea una tabla nueva (en staging) basada en el result set de la consulta
from ChinookProd.dbo.Album	--tabla en BD origen (producción)

--ARTIST
IF OBJECT_ID('artist', 'U') IS NOT NULL
	drop table artist

Select * 
into Artist
from ChinookProd.dbo.Artist

--CUSTOMER
IF OBJECT_ID('customer', 'U') IS NOT NULL
	drop table customer

Select * 
into Customer
from ChinookProd.dbo.Customer

--EMPLOYEE
IF OBJECT_ID('employee', 'U') IS NOT NULL
	drop table employee

Select * 
into Employee
from ChinookProd.dbo.Employee

--GENRE
IF OBJECT_ID('genre', 'U') IS NOT NULL
	drop table genre

Select * 
into Genre
from ChinookProd.dbo.Genre

--INVOICE
IF OBJECT_ID('invoice', 'U') IS NOT NULL
	drop table invoice

Select * 
into Invoice
from ChinookProd.dbo.Invoice

--INVOICELINE
IF OBJECT_ID('invoiceline', 'U') IS NOT NULL
	drop table invoiceLine

Select * 
into InvoiceLine
from ChinookProd.dbo.InvoiceLine

--MEDIATYPE
IF OBJECT_ID('MediaType', 'U') IS NOT NULL
	drop table MediaType

Select * 
into MediaType
from ChinookProd.dbo.MediaType

--Playlist
IF OBJECT_ID('Playlist', 'U') IS NOT NULL
	drop table Playlist

Select * 
into Playlist
from ChinookProd.dbo.Playlist

--Track
IF OBJECT_ID('Track', 'U') IS NOT NULL
	drop table Track

Select * 
into Track
from ChinookProd.dbo.Track

--PlaylistTrack
IF OBJECT_ID('PlaylistTrack', 'U') IS NOT NULL
	drop table PlaylistTrack

Select * 
into PlaylistTrack
from ChinookProd.dbo.PlaylistTrack
