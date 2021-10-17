SELECT name, COUNT(singer_id) c FROM Singer_style ss 
	JOIN Styles s ON ss.style_id = s.id
	GROUP BY name
	ORDER BY c DESC;
	

SELECT COUNT(song_name) FROM Albums a 
	JOIN Tracks t ON a.id = t.album_id
	WHERE year in (2019, 2020);


SELECT title, ROUND(AVG(duration), 2) av FROM Albums a 
	JOIN Tracks t ON a.id = t.album_id
	GROUP BY a.title
	ORDER BY av DESC;


SELECT name FROM Singers 
	WHERE name NOT IN (SELECT name FROM Albums a 
	JOIN Singer_album sa ON a.id = sa.album_id
	JOIN Singers s ON sa.singer_id = s.id
	WHERE year = 2020);


SELECT c.name FROM Collections c
	JOIN Collection_tracks ct ON c.id = ct.collection_id
	JOIN Tracks t ON ct.track_id = t.id
	JOIN Albums a ON t.album_id = a.id
	JOIN Singer_album sa ON a.id = sa.album_id
	JOIN Singers s ON sa.singer_id = s.id
	WHERE s.name = 'Ariana Grande';


SELECT title FROM Albums a 
	JOIN Singer_album sa ON a.id = sa.album_id
	JOIN Singers s ON sa.singer_id = s.id
	WHERE s.name IN (SELECT name FROM Singers s
	JOIN Singer_style ss ON s.id = ss.singer_id
	GROUP BY name
	HAVING COUNT(style_id) > 1
	ORDER BY COUNT(style_id) DESC);
	

SELECT song_name FROM Tracks t
	LEFT JOIN Collection_tracks ct ON t.id = ct.track_id
	WHERE ct.track_id IS NULL;


SELECT name FROM Tracks t 
	JOIN Albums a ON t.album_id = a.id
	JOIN Singer_album sa ON a.id = sa.album_id
	JOIN Singers s ON sa.singer_id = s.id
	WHERE t.duration = (SELECT MIN(duration) FROM Tracks) 
	ORDER BY t.duration;


SELECT title FROM Albums a 
	JOIN Tracks t ON a.id = t.album_id
	GROUP BY a.id
	HAVING COUNT(song_name) = (SELECT COUNT(song_name) c FROM Albums a
	JOIN Tracks t ON a.id = t.album_id
	GROUP BY a.id
	ORDER BY c
	LIMIT 1);