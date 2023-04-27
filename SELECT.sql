-- Название и год выхода альбомов, вышедших в 2018 году
select a."Name" as album_name, a."Year" as album_year
from album a
where a."Year" >= '01.01.2018' and a."Year" <= '31.12.2018';


-- Название и продолжительность самого длительного трека 
select s."Name" as song_name, s.duration 
from song s 
where s.duration = (select max(duration) from song);


-- Название треков, продолжительность которых не менее 3,5 минут
select s."Name" as song_name 
from song s 
where s.duration > 210;


-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
select am."Name" as album_mix_name
from album_mix am 
where am."Year" >= '01.01.2018' and am."Year" <= '31.12.2020';


-- Исполнители, чьё имя состоит из одного слова
select a."Name" as author_name 
from author a 
where a."Name" not like '% %';


-- Название треков, которые содержат слово «мой» или «my»
select s."Name" as song_name 
from song s 
where lower(s."Name") like '%my%' or s."Name" like '%мой%';