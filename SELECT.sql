
-- 1. количество исполнителей в каждом жанре
SELECT Genre_ID, COUNT(*) FROM GenresMusicians
GROUP BY Genre_ID
ORDER BY COUNT(*) DESC;

-- 2. количество треков, вошедших в альбомы 2019-2020 годов
select COUNT(*) from Albums A
inner join Tracks T
on A.id = T.album_id
where year between 2019 and 2020
;

-- 3. средняя продолжительность треков по каждому альбому
SELECT A.name, AVG(T.duration) FROM Albums A
INNER JOIN Tracks T
ON A.id = T.album_id
GROUP BY A.name
ORDER BY A.name --в алфавитном порядке 
;


-- Альбомы-треки-длительность
SELECT A.name, T.name, T.duration  FROM Albums A
INNER JOIN Tracks T
ON A.id = T.album_id
GROUP BY A.name, T.name, T.duration
ORDER BY A.name --в алфавитном порядке 
;


-- 4.все исполнители, которые не выпустили альбомы в 2020 году;
--SELECT *  FROM musicians msc
SELECT *  FROM musicians msc
WHERE id NOT IN 
	(SELECT msc.id  FROM musicians msc -- список id музыкантов ВЫПУСТИВШИХ альбомы в 2020
	INNER JOIN albumsmusicians am ON msc.id  = am.musican_id 
	INNER JOIN albums a ON am.album_id  = a.id 
	WHERE a.year = 2020)
;



-- 5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT M.name  FROM miscellanies M
INNER JOIN tracksmiscellanies tm ON M.id = tm.miscellany_id 
INNER JOIN tracks t ON tm.track_id  = t.id 
INNER JOIN albums a ON t.album_id  = a.id
INNER JOIN albumsmusicians am ON a.id  = am.album_id 
INNER JOIN musicians msc ON am.musican_id = msc.id
WHERE msc.name = 'Metallica'
;

-- 6. название альбомов, в которых присутствуют исполнители более 1 жанра; 
--SELECT *  FROM albums A 
SELECT A.name, COUNT(g.id)  FROM albums A 
INNER JOIN albumsmusicians am ON a.id  = am.album_id 
INNER JOIN musicians msc ON am.musican_id = msc.id
INNER JOIN genresmusicians gm ON msc.id = gm.musican_id 
INNER JOIN genres g ON gm.genre_id = g.id 
GROUP BY A.name
HAVING COUNT(g.id) > 1
ORDER BY COUNT(g.id) DESC, A.name --сначала по количеству жанров, потом по алфавиту
;

--исполнитель-жанр
SELECT msc.name, G.name  FROM musicians msc
INNER JOIN genresmusicians gm ON msc.id = gm.musican_id 
INNER JOIN genres g ON gm.genre_id = g.id 
GROUP BY msc.name, G.name
ORDER BY msc.name, G.name
;

-- 7. наименование треков, которые не входят в сборники;
--SELECT * FROM tracks T
SELECT T.name  FROM tracks T
LEFT JOIN tracksmiscellanies tm ON T.id = tm.track_id 
WHERE tm.id IS NULL
;

--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);.id
SELECT msc.name, t.name, t.duration  FROM musicians msc
	INNER JOIN albumsmusicians am ON msc.id  = am.musican_id 
	INNER JOIN albums a ON am.album_id  = a.id
	INNER JOIN tracks t  ON t.album_id = a.id
	WHERE t.id IN 
		(SELECT id FROM tracks --список id треков, у которых длительность равна минимальной
		WHERE duration = (SELECT  min(duration) from tracks	))
;

--9. название альбомов, содержащих наименьшее количество треков.
SELECT a.name  FROM albums a
INNER JOIN tracks t ON t.album_id = a.id
GROUP BY a.id
HAVING COUNT(*) = 
		(SELECT min(cnt) --определение минимума
		FROM (SELECT a.id, COUNT(*) as cnt FROM albums a --количество треков в альбомах
		INNER JOIN tracks t ON t.album_id = a.id
		GROUP BY a.id) min_t)
ORDER BY a.name
	;

-- Альбомы - количество треков

SELECT a.name, COUNT(*) as cnt FROM albums a --количество треков в альбомах
		INNER JOIN tracks t ON t.album_id = a.id
		GROUP BY a.id
		ORDER BY COUNT(*), a.name

	

