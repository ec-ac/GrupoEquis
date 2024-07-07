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