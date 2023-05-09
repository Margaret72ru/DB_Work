INSERT INTO genre ("Name") VALUES
	 ('Рок'),
	 ('Регги'),
	 ('Кантри'),
	 ('Поп-музыка'),
	 ('Блюз'),
	 ('Джас'),
	 ('Шансон'),
	 ('Романс'),
	 ('Диско');

INSERT INTO author ("Name") VALUES
	 ('Михайл Круг'),
	 ('Taylor Swift'),
	 ('Бо Диддли'),
	 ('Леонид Утесов'),
	 ('Боб Марли'),
	 ('Фрэнк Синатра'),
	 ('Queen'),
	 ('Led Zeppelin'),
	 ('Billie Eilish'),
	 ('Ariana Grande');

INSERT INTO album ("Name","Year") VALUES
	 ('Taylor Swift','2006-01-01'),
	 ('Happier Than Ever','2021-01-01'),
	 ('Positions','2020-01-01'),
	 ('Sweetener','2018-01-01'),
	 ('Led Zeppelin','1969-01-01'),
	 ('Led Zeppelin II','1969-01-01'),
	 ('Led Zeppelin III','1970-01-01'),
	 ('Led Zeppelin IV','1971-01-01'),
	 ('Избранное','2002-01-01');

INSERT INTO album_mix ("Name","Year") VALUES
	 ('Summer','2020-01-01'),
	 ('Spring','2021-01-01'),
	 ('Winter','2022-01-01'),
	 ('Autumn','2018-01-01'),
	 ('Compilation I','2020-01-01'),
	 ('Compilation II','2021-01-01'),
	 ('Compilation III','2022-01-01'),
	 ('Compilation IV','2023-01-01');

INSERT INTO song ("Name",duration,album_id) VALUES
	 ('A Place in This World',202,1),
	 ('Cold as You',241,1),
	 ('The Outside',207,1),
	 ('My Future',210,2),
	 ('Oxytocin',151,2),
	 ('Sweetener',208,4),
	 ('No Tears Left to Cry',205,4),
	 ('My Hair',158,3),
	 ('Nasty',200,3),
	 ('Positions',172,3),
	 ('Black Dog',294,8),
	 ('Rock and Roll',220,8),
	 ('You Shook Me',388,5),
	 ('Black Mountain Side',124,5),
	 ('Dazed and Confused',388,5),
	 ('Кольщик',200,9);

INSERT INTO genre_author (genre_id,author_id) VALUES
	 (1,7),
	 (1,8),
	 (2,5),
	 (3,2),
	 (5,3),
	 (7,1),
	 (8,4),
	 (1,9),
	 (4,8);

INSERT INTO album_author (author_id,album_id) VALUES
	 (2,1),
	 (9,2),
	 (10,3),
	 (10,4),
	 (8,5),
	 (8,6),
	 (8,7),
	 (8,8),
	 (1,9);

INSERT INTO album_mix_songs (album_mix_id,song_id) VALUES
	 (1,1),
	 (1,15),
	 (2,2),
	 (2,14),
	 (3,3),
	 (3,13),
	 (4,4),
	 (4,12),
	 (5,5),
	 (5,11),
	 (6,6),
	 (6,10),
	 (7,7),
	 (7,9),
	 (8,8);
