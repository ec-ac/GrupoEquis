-- GRUPO EQUIS: GABRIEL CHANG Y ERNESTO ALANIZ - UAM
USE ChinookLandingGrupoX;

--Borrar las tablas si ya existen, una por una
-- Son 11 tablas en total, del modelo/schema de Chinook original
DROP TABLE IF EXISTS [Album];
DROP TABLE IF EXISTS [Artist];
DROP TABLE IF EXISTS [Genre];
DROP TABLE IF EXISTS [Invoice];
DROP TABLE IF EXISTS [InvoiceLine];
DROP TABLE IF EXISTS [MediaType];
DROP TABLE IF EXISTS [Playlist];
DROP TABLE IF EXISTS [PlaylistTrack];
DROP TABLE IF EXISTS [Track];
DROP TABLE IF EXISTS [Customer];
DROP TABLE IF EXISTS [Employee];

--Crear las tablas (excluyendo relaciones, llaves foráneas, índices, etc. POR AHORA)
CREATE TABLE [Artist]
(
    [ArtistId] INTEGER NOT NULL,
    [Name] NVARCHAR(120)
);

CREATE TABLE [Album]
(
    [AlbumId] INTEGER NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [ArtistId] INTEGER NOT NULL
);

CREATE TABLE [Employee]
(
    [EmployeeId] INTEGER NOT NULL,
    [LastName] NVARCHAR(20) NOT NULL,
    [FirstName] NVARCHAR(20) NOT NULL,
    [Title] NVARCHAR(30),
    [ReportsTo] INTEGER,
    [BirthDate] DATETIME,
    [HireDate] DATETIME,
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60)
);

CREATE TABLE [Customer]
(
    [CustomerId] INTEGER NOT NULL,
    [FirstName] NVARCHAR(40) NOT NULL,
    [LastName] NVARCHAR(20) NOT NULL,
    [Company] NVARCHAR(80),
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60) NOT NULL,
    [SupportRepId] INTEGER
);

CREATE TABLE [Genre]
(
    [GenreId] INTEGER NOT NULL,
    [Name] NVARCHAR(120)
);

CREATE TABLE [Invoice]
(
    [InvoiceId] INTEGER NOT NULL,
    [CustomerId] INTEGER NOT NULL,
    [InvoiceDate] DATETIME NOT NULL,
    [BillingAddress] NVARCHAR(70),
    [BillingCity] NVARCHAR(40),
    [BillingState] NVARCHAR(40),
    [BillingCountry] NVARCHAR(40),
    [BillingPostalCode] NVARCHAR(10),
    [Total] NUMERIC(10,2) NOT NULL
);

CREATE TABLE [MediaType]
(
    [MediaTypeId] INTEGER NOT NULL,
    [Name] NVARCHAR(120)
);

CREATE TABLE [Playlist]
(
    [PlaylistId] INTEGER NOT NULL,
    [Name] NVARCHAR(120)
);

CREATE TABLE [Track]
(
    [TrackId] INTEGER NOT NULL,
    [Name] NVARCHAR(200) NOT NULL,
    [AlbumId] INTEGER,
    [MediaTypeId] INTEGER NOT NULL,
    [GenreId] INTEGER,
    [Composer] NVARCHAR(220),
    [Milliseconds] INTEGER NOT NULL,
    [Bytes] INTEGER,
    [UnitPrice] NUMERIC(10,2) NOT NULL
);

CREATE TABLE [PlaylistTrack]
(
    [PlaylistId] INTEGER NOT NULL,
    [TrackId] INTEGER NOT NULL
);

CREATE TABLE [InvoiceLine]
(
    [InvoiceLineId] INTEGER NOT NULL,
    [InvoiceId] INTEGER NOT NULL,
    [TrackId] INTEGER NOT NULL,
    [UnitPrice] NUMERIC(10,2) NOT NULL,
    [Quantity] INTEGER NOT NULL
);