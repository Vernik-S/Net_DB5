delete from genresmusicians;
delete from albumsmusicians;
delete from tracksmiscellanies;
delete from tracks;

delete from musicians;

--CREATE SEQUENCE seq;



INSERT INTO musicians 
	VALUES
	(default , 'Metallica'),
	(default, 'Britney Spears'),
	(default, 'Offpsring'),
	(default, 'Avril Lavigne'),
	(default, 'Apocalyptica'),
	(default, 'Linkin Park'),
	(default, 'Oasis'),
	(default, 'M Krug');

ALTER SEQUENCE seq RESTART 1;
UPDATE musicians  SET id=nextval('seq');



delete from genres;


INSERT INTO genres 
	VALUES
	(default, 'Rock'),
	(default, 'Pop'),
	(default, 'Punk'),
	(default, 'Rap'),
	(default, 'Shanson'),
	(default, 'Classic'),
	(default, 'Extra');

ALTER SEQUENCE seq RESTART 1;
UPDATE genres  SET id=nextval('seq');



INSERT INTO genresmusicians 
	VALUES
	(default, 1, 1),
	(default, 5, 1),
	(default, 2, 2),
	(default, 1, 3),
	(default, 3, 3),
	(default, 3, 4),
	(default, 2, 4),
	(default, 1, 5),
	(default, 6, 5),
	(default, 1, 6),
	(default, 1, 7),
	(default, 2, 7),
	(default, 5, 8),
	(default, 7, 1);

ALTER SEQUENCE seq RESTART 1;
UPDATE genresmusicians   SET id=nextval('seq');

delete from albums;

INSERT INTO albums  
	VALUES
	(default, 'Death Magnetic', 2008),
	(default, 'Blackout', 2007),
	(default, 'Days Go By', 2012),
	(default, 'Avril Lavigne', 2013),
	(default, 'Shadowmaker', 2020),
	(default, 'Hybrid Theory', 2000),
	(default, 'Dig Out Your Soul', 2018),
	(default, 'Jigan-lemon', 1994),
	(default, 'Cult', 2000);


ALTER SEQUENCE seq RESTART 1;
UPDATE albums    SET id=nextval('seq');


INSERT INTO albumsmusicians
	VALUES
	(default, 1, 1),
	(default, 2, 2),
	(default, 3, 3),
	(default, 4, 4),
	(default, 5, 5),
	(default, 6, 6),
	(default, 7, 7),
	(default, 9, 5),
	(default, 8, 8);
	
ALTER SEQUENCE seq RESTART 1;
UPDATE albumsmusicians    SET id=nextval('seq');


INSERT INTO tracks
	VALUES
	(default, 'Papercut', 185, 6),
	(default, 'One Step Closer', 156, 6),
	(default, 'With You', 203, 6),
	(default, 'Points of Authority', 200, 6),
	(default, 'Crawling', 240, 6),
	(default, 'Run Away', 184, 6),
	(default, 'By Myself', 190, 6),
	(default, 'In the End', 216, 6),
	(default, 'A place to my head', 185, 6),
	(default, 'Forgotten', 195, 6),
	(default, 'Cure for the Itch', 157, 6),
	(default, 'Pushing Me Away', 192, 6),
	(default, 'That Was Your Life', 428, 1),
	(default, 'Gimme More', 251, 2),
	(default, 'The Future Is Now', 249, 3),
	(default, 'My favourite track', 249, 8),
	(default, 'Мой любимый трек', 249, 8),
	(default, 'Shadowmaker', 456, 5),
	(default, 'Hole in My Soul', 246, 5),
	(default, 'Some Short Track', 156, 8);

ALTER SEQUENCE seq RESTART 1;
UPDATE tracks   SET id=nextval('seq');



delete from miscellanies ;

INSERT INTO miscellanies
	VALUES
	(default, 'Linkin Park etc 2014', 2014),
	(default, 'Metallica+Krug', 2015),
	(default, 'Metallica+Britney', 2016),
	(default, 'Linkin Park etc 2017', 2017),
	(default, 'Linkin Park etc 2018', 2018),
	(default, 'Linkin Park etc 2019', 2019),
	(default, 'Linkin Park etc 2020', 2020),
	(default, 'Linkin Park etc 2021', 2021),
	(default, 'Linkin Park etc 2022', 2022);

ALTER SEQUENCE seq RESTART 1;
UPDATE miscellanies   SET id=nextval('seq');



INSERT INTO tracksmiscellanies
	VALUES
	(default , 1, 1),
	(default , 2, 1),
	(default , 3, 1),
	(default , 4, 1),
	(default , 5, 1),
	(default , 6, 1),
	(default , 7, 1),
	(default , 8, 1),
	(default , 9, 1),
	(default , 10, 1),
	(default , 11, 1),
	(default , 12, 1),
	(default , 13, 1),
	(default , 14, 1),
	(default , 15, 1),
	(default , 13, 2),
	(default , 16, 2),
	(default , 13, 3),
	(default , 2, 3);


ALTER SEQUENCE seq RESTART 1;
UPDATE tracksmiscellanies  SET id=nextval('seq');




