
-- 1. ���������� ������������ � ������ �����
SELECT Genre_ID, COUNT(*) FROM GenresMusicians
GROUP BY Genre_ID
ORDER BY COUNT(*) DESC;

-- 2. ���������� ������, �������� � ������� 2019-2020 �����
select COUNT(*) from Albums A
inner join Tracks T
on A.id = T.album_id
where year between 2019 and 2020
;

-- 3. ������� ����������������� ������ �� ������� �������
SELECT A.name, AVG(T.duration) FROM Albums A
INNER JOIN Tracks T
ON A.id = T.album_id
GROUP BY A.name
ORDER BY A.name --� ���������� ������� 
;


-- �������-�����-������������
SELECT A.name, T.name, T.duration  FROM Albums A
INNER JOIN Tracks T
ON A.id = T.album_id
GROUP BY A.name, T.name, T.duration
ORDER BY A.name --� ���������� ������� 
;


-- 4.��� �����������, ������� �� ��������� ������� � 2020 ����;
--SELECT *  FROM musicians msc
SELECT *  FROM musicians msc
WHERE id NOT IN 
	(SELECT msc.id  FROM musicians msc -- ������ id ���������� ����������� ������� � 2020
	INNER JOIN albumsmusicians am ON msc.id  = am.musican_id 
	INNER JOIN albums a ON am.album_id  = a.id 
	WHERE a.year = 2020)
;



-- 5. �������� ���������, � ������� ������������ ���������� ����������� (�������� ����)
SELECT M.name  FROM miscellanies M
INNER JOIN tracksmiscellanies tm ON M.id = tm.miscellany_id 
INNER JOIN tracks t ON tm.track_id  = t.id 
INNER JOIN albums a ON t.album_id  = a.id
INNER JOIN albumsmusicians am ON a.id  = am.album_id 
INNER JOIN musicians msc ON am.musican_id = msc.id
WHERE msc.name = 'Metallica'
;

-- 6. �������� ��������, � ������� ������������ ����������� ����� 1 �����; 
--SELECT *  FROM albums A 
SELECT A.name, COUNT(g.id)  FROM albums A 
INNER JOIN albumsmusicians am ON a.id  = am.album_id 
INNER JOIN musicians msc ON am.musican_id = msc.id
INNER JOIN genresmusicians gm ON msc.id = gm.musican_id 
INNER JOIN genres g ON gm.genre_id = g.id 
GROUP BY A.name
HAVING COUNT(g.id) > 1
ORDER BY COUNT(g.id) DESC, A.name --������� �� ���������� ������, ����� �� ��������
;

--�����������-����
SELECT msc.name, G.name  FROM musicians msc
INNER JOIN genresmusicians gm ON msc.id = gm.musican_id 
INNER JOIN genres g ON gm.genre_id = g.id 
GROUP BY msc.name, G.name
ORDER BY msc.name, G.name
;

-- 7. ������������ ������, ������� �� ������ � ��������;
--SELECT * FROM tracks T
SELECT T.name  FROM tracks T
LEFT JOIN tracksmiscellanies tm ON T.id = tm.track_id 
WHERE tm.id IS NULL
;

--8. �����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������);.id
SELECT msc.name, t.name, t.duration  FROM musicians msc
	INNER JOIN albumsmusicians am ON msc.id  = am.musican_id 
	INNER JOIN albums a ON am.album_id  = a.id
	INNER JOIN tracks t  ON t.album_id = a.id
	WHERE t.id IN 
		(SELECT id FROM tracks --������ id ������, � ������� ������������ ����� �����������
		WHERE duration = (SELECT  min(duration) from tracks	))
;

--9. �������� ��������, ���������� ���������� ���������� ������.
SELECT a.name  FROM albums a
INNER JOIN tracks t ON t.album_id = a.id
GROUP BY a.id
HAVING COUNT(*) = 
		(SELECT min(cnt) --����������� ��������
		FROM (SELECT a.id, COUNT(*) as cnt FROM albums a --���������� ������ � ��������
		INNER JOIN tracks t ON t.album_id = a.id
		GROUP BY a.id) min_t)
ORDER BY a.name
	;

-- ������� - ���������� ������

SELECT a.name, COUNT(*) as cnt FROM albums a --���������� ������ � ��������
		INNER JOIN tracks t ON t.album_id = a.id
		GROUP BY a.id
		ORDER BY COUNT(*), a.name

	

