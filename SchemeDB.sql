CREATE TABLE genre (
	genre_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"Name" varchar NOT NULL, -- Название жанра
	CONSTRAINT genre_pk PRIMARY KEY (genre_id)
);
COMMENT ON TABLE "HomeWork".genre IS 'Жанры';
COMMENT ON COLUMN "HomeWork".genre."Name" IS 'Название жанра';


CREATE TABLE author (
	author_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"Name" varchar NOT NULL, -- Исполнитель
	CONSTRAINT author_pk PRIMARY KEY (author_id)
);
COMMENT ON TABLE "HomeWork".author IS 'Исполнители';
COMMENT ON COLUMN "HomeWork".author."Name" IS 'Исполнитель';


CREATE TABLE album (
	album_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"Name" varchar NOT NULL, -- Название альбома
	"Year" date NOT NULL, -- Год выпуска
	CONSTRAINT album_pk PRIMARY KEY (album_id)
);
COMMENT ON TABLE "HomeWork".album IS 'Альбомы';
COMMENT ON COLUMN "HomeWork".album."Name" IS 'Название альбома';
COMMENT ON COLUMN "HomeWork".album."Year" IS 'Год выпуска';


CREATE TABLE album_mix (
	album_mix_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"Name" varchar NOT NULL, -- Название сборника
	"Year" date NOT NULL, -- Год выпуска
	CONSTRAINT album_mix_pk PRIMARY KEY (album_mix_id)
);
COMMENT ON TABLE "HomeWork".album_mix IS 'Сборники';
COMMENT ON COLUMN "HomeWork".album_mix."Name" IS 'Название сборника';
COMMENT ON COLUMN "HomeWork".album_mix."Year" IS 'Год выпуска';


CREATE TABLE genre_author (
	genre_id int4 NOT NULL,
	author_id int4 NOT NULL,
	CONSTRAINT genre_author_fk FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT genre_author_fk_1 FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE "HomeWork".genre_author IS 'Жанры автора';


CREATE TABLE album_author (
	author_id int4 NOT NULL,
	album_id int4 NOT NULL,
	CONSTRAINT album_author_fk FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT album_author_fk_1 FOREIGN KEY (album_id) REFERENCES album(album_id) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE "HomeWork".album_author IS 'Авторы альбомов';


CREATE TABLE song (
	song_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"Name" varchar NOT NULL, -- Название трека
	duration time NOT NULL, -- Продолжительность трека
	album_id int4 NOT NULL, -- Альбом
	CONSTRAINT song_pk PRIMARY KEY (song_id),
	CONSTRAINT song_fk FOREIGN KEY (album_id) REFERENCES album(album_id) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE "HomeWork".song IS 'Треки';
COMMENT ON COLUMN "HomeWork".song."Name" IS 'Название трека';
COMMENT ON COLUMN "HomeWork".song.duration IS 'Продолжительность трека';
COMMENT ON COLUMN "HomeWork".song.album_id IS 'Альбом';


CREATE TABLE album_mix_songs (
	album_mix_id int4 NOT NULL,
	song_id int4 NOT NULL,
	CONSTRAINT album_mix_songs_fk FOREIGN KEY (album_mix_id) REFERENCES album_mix(album_mix_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT album_mix_songs_fk_1 FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE "HomeWork".album_mix_songs IS 'Песни сборников';