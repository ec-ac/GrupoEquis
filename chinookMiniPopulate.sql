-- Poblar MediaType
INSERT INTO MediaType (MediaTypeId, Name) VALUES
(1, 'MPEG audio file'),
(2, 'Protected AAC audio file'),
(3, 'Protected MPEG-4 video file'),
(4, 'Purchased AAC audio file'),
(5, 'AAC audio file');

-- Poblar Genre
INSERT INTO Genre (GenreId, Name) VALUES
(1, 'Rock'),
(2, 'Jazz'),
(3, 'Metal'),
(4, 'Alternative & Punk'),
(5, 'Rock And Roll'),
(6, 'Blues'),
(7, 'Latin'),
(8, 'Reggae'),
(9, 'Pop'),
(10, 'Classical');

-- Poblar Artist
INSERT INTO Artist (ArtistId, Name) VALUES
(1, 'AC/DC'),
(2, 'Accept'),
(3, 'Aerosmith'),
(4, 'Alanis Morissette'),
(5, 'Alice In Chains'),
(6, 'Antônio Carlos Jobim'),
(7, 'Apocalyptica'),
(8, 'Audioslave'),
(9, 'Backstreet Boys'),
(10, 'Billy Cobham');

-- Poblar Album
INSERT INTO Album (AlbumId, Title, ArtistId) VALUES
(1, 'For Those About To Rock We Salute You', 1),
(2, 'Balls to the Wall', 2),
(3, 'Big Ones', 3),
(4, 'Jagged Little Pill', 4),
(5, 'Facelift', 5),
(6, 'Warner 25 Anos', 6),
(7, 'Plays Metallica By Four Cellos', 7),
(8, 'Audioslave', 8),
(9, 'Millennium', 9),
(10, 'Total Eclipse', 10);

-- Poblar Track
INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1, 'For Those About To Rock (We Salute You)', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 343719, 11170334, 0.99),
(2, 'Put The Finger On You', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205662, 6713451, 0.99),
(3, 'Lets Get It Up', 1, 2, 1, 'Angus Young, Malcolm Young, Brian Johnson', 233926, 7636561, 0.99),
(4, 'Inject The Venom', 1, 2, 1, 'Angus Young, Malcolm Young, Brian Johnson', 210834, 6852860, 0.99),
(5, 'Balls to the Wall', 2, 1, 3, 'Accept', 342562, 11134235, 0.99),
(6, 'Big Ones', 3, 2, 1, 'Aerosmith', 250000, 8000000, 0.99),
(7, 'You Oughta Know', 4, 3, 4, 'Alanis Morissette', 300000, 10000000, 0.99),
(8, 'Man In The Box', 5, 1, 1, 'Alice In Chains', 309622, 10117790, 0.99),
(9, 'Girl From Ipanema', 6, 2, 7, 'Antônio Carlos Jobim', 276033, 8945703, 0.99),
(10, 'Enter Sandman', 7, 1, 1, 'Metallica', 331741, 10912826, 0.99);

-- Poblar Customer
INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES
(1, 'Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3),
(2, 'Leonie', 'Köhler', null, 'Theodor-Heuss-Straße 34', 'Stuttgart', null, 'Germany', '70174', '+49 0711 2842222', null, 'leonek@surfeu.de', 5),
(3, 'François', 'Tremblay', null, '1498 rue Bélanger', 'Montréal', 'QC', 'Canada', 'H2G 1A7', '+1 (514) 721-4711', null, 'ftremblay@gmail.com', 3),
(4, 'Bjørn', 'Hansen', null, 'Ullevålsveien 14', 'Oslo', null, 'Norway', '0171', '+47 22 44 22 22', null, 'bjorn.hansen@yahoo.no', 4),
(5, 'František', 'Wichterlová', 'JetBrains s.r.o.', 'Klanova 9/506', 'Prague', null, 'Czech Republic', '14700', '+420 2 4172 5555', '+420 2 4172 5555', 'frantisekw@jetbrains.com', 4),
(6, 'Helena', 'Holý', null, 'Rilska 3174/6', 'Prague', null, 'Czech Republic', '13000', '+420 2 4172 5555', null, 'hholý@gmail.com', 4),
(7, 'Astrid', 'Gruber', null, 'Rotenturmstraße 4, 1010 Innere Stadt', 'Vienne', null, 'Austria', '1010', '+43 1 5134505', null, 'astrid.gruber@apple.at', 3),
(8, 'Daan', 'Peeters', null, 'Grétrystraat 63', 'Brussels', null, 'Belgium', '1000', '+32 2 219 0303', null, 'daan_peeters@apple.be', 4),
(9, 'Kara', 'Nielsen', null, 'Sønder Boulevard 51', 'Copenhagen', null, 'Denmark', '1720', '+45 35 55 35 55', null, 'kara.nielsen@jubii.dk', 5),
(10, 'Eduardo', 'Martins', 'Woodstock Discos', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'SP', 'Brazil', '01007-010', '+55 (11) 3033-5444', null, 'eduardo.martins@woodstock.com.br', 4);

-- Poblar Employee
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES
(1, 'Adams', 'Andrew', 'General Manager', NULL, NULL, NULL, '11120 Jasper Ave NW', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-9482', 'andrew@chinookcorp.com'),
(2, 'Edwards', 'Nancy', 'Sales Manager', 1, NULL, NULL, '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3443', '+1 (403) 262-3443', 'nancy@chinookcorp.com'),
(3, 'Peacock', 'Jane', 'Sales Support Agent', 2, NULL, NULL, '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com'),
(4, 'Park', 'Margaret', 'Sales Support Agent', 2, NULL, NULL, '683 10 Ave SW', 'Calgary', 'AB', 'Canada', 'T2R 0B6', '+1 (403) 262-3443', '+1 (403) 262-6712', 'margaret@chinookcorp.com'),
(5, 'Johnson', 'Steve', 'Sales Support Agent', 2, NULL, NULL, '682 10 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5G4', '+1 (403) 262-3443', '+1 (403) 262-6712', 'steve@chinookcorp.com'),
(6, 'Mitchell', 'Michael', 'IT Manager', 1, NULL, NULL, '438 King St', 'Sydney', 'NSW', 'Australia', '2000', '+61 (02) 9266 5648', '+61 (02) 9266 5649', 'michael@chinookcorp.com'),
(7, 'King', 'Robert', 'IT Staff', 6, NULL, NULL, '590 Collins St', 'Melbourne', 'Victoria', 'Australia', '3000', '+61 (03) 9520 4555', '+61 (03) 9520 4556', 'robert@chinookcorp.com'),
(8, 'Callahan', 'Laura', 'IT Staff', 6, NULL, NULL, '333 George St', 'Sydney', 'NSW', 'Australia', '2000', '+61 (02) 9266 5648', '+61 (02) 9266 5649', 'laura@chinookcorp.com'),
(9, 'Bell', 'Keith', 'IT Staff', 6, NULL, NULL, '200 Elizabeth St', 'Sydney', 'NSW', 'Australia', '2000', '+61 (02) 8265 5788', '+61 (02) 8265 5789', 'keith@chinookcorp.com'),
(10, 'Jones', 'Rachel', 'Finance Staff', 1, NULL, NULL, '57 Wood St', 'Darwin', 'NT', 'Australia', '0800', '+61 (08) 8981 5635', '+61 (08) 8981 5636', 'rachel@chinookcorp.com');


-- Poblar Invoice
INSERT INTO Invoice (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES
(1, 1, '2024-05-01 00:00:00', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', 3.96),
(2, 2, '2024-05-02 00:00:00', 'Theodor-Heuss-Straße 34', 'Stuttgart', null, 'Germany', '70174', 13.86),
(3, 3, '2024-05-03 00:00:00', '1498 rue Bélanger', 'Montréal', 'QC', 'Canada', 'H2G 1A7', 1.98),
(4, 4, '2024-05-04 00:00:00', 'Ullevålsveien 14', 'Oslo', null, 'Norway', '0171', 5.94),
(5, 5, '2024-05-05 00:00:00', 'Klanova 9/506', 'Prague', null, 'Czech Republic', '14700', 8.91),
(6, 6, '2024-05-06 00:00:00', 'Rilska 3174/6', 'Prague', null, 'Czech Republic', '13000', 13.86),
(7, 7, '2024-05-07 00:00:00', 'Rotenturmstraße 4, 1010 Innere Stadt', 'Vienne', null, 'Austria', '1010', 1.98),
(8, 8, '2024-05-08 00:00:00', 'Grétrystraat 63', 'Brussels', null, 'Belgium', '1000', 5.94),
(9, 9, '2024-05-09 00:00:00', 'Sønder Boulevard 51', 'Copenhagen', null, 'Denmark', '1720', 8.91),
(10, 10, '2024-05-10 00:00:00', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'SP', 'Brazil', '01007-010', 13.86);

-- Poblar InvoiceLine
INSERT INTO InvoiceLine (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1, 1, 1, 0.99, 1),
(2, 1, 2, 0.99, 1),
(3, 1, 3, 0.99, 1),
(4, 1, 4, 0.99, 1),
(5, 2, 5, 0.99, 1),
(6, 2, 6, 0.99, 1),
(7, 2, 7, 0.99, 1),
(8, 2, 8, 0.99, 1),
(9, 2, 9, 0.99, 1),
(10, 2, 10, 0.99, 1),
(11, 3, 1, 0.99, 1),
(12, 3, 2, 0.99, 1),
(13, 4, 3, 0.99, 1),
(14, 4, 4, 0.99, 1),
(15, 4, 5, 0.99, 1),
(16, 5, 6, 0.99, 1),
(17, 5, 7, 0.99, 1),
(18, 5, 8, 0.99, 1),
(19, 6, 9, 0.99, 1),
(20, 6, 10, 0.99, 1),
(21, 7, 1, 0.99, 1),
(22, 7, 2, 0.99, 1),
(23, 8, 3, 0.99, 1),
(24, 8, 4, 0.99, 1),
(25, 9, 5, 0.99, 1),
(26, 9, 6, 0.99, 1),
(27, 10, 7, 0.99, 1),
(28, 10, 8, 0.99, 1),
(29, 10, 9, 0.99, 1),
(30, 10, 10, 0.99, 1);

