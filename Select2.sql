
-- Количество исполнителей в каждом жанре
select g."Name", count(ga.genre_id) from genre_author ga, genre g 
where ga.genre_id = g.genre_id
group by g."Name";


-- Количество треков, вошедших в альбомы 2019–2020 годов
select count(*) from song s, album a2  
where s.album_id = a2.album_id and a2."Year" >= '01.01.2019' and a2."Year" <= '31.12.2020';


-- Средняя продолжительность треков по каждому альбому
select a."Name", round(avg(duration)) from album a, song s
where s.album_id = a.album_id
group by a."Name";


-- Все исполнители, которые не выпустили альбомы в 2020 году
select distinct (a."Name")
from author a
left join album_author aa on aa.author_id = a.author_id
left join album al on al.album_id = aa.album_id
where (select aa.author_id  from album al, album_author aa where al.album_id = aa.album_id and al."Year" >= '01.01.2020' and al."Year" <= '31.12.2020') != a.author_id;


-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
select am."Name" from album_mix am
join album_mix_songs ams on ams.album_mix_id = am.album_mix_id
join song s on s.song_id = ams.song_id
join album al on al.album_id = s.album_id 
join album_author aa on aa.album_id = al.album_id 
join author a on a.author_id = aa.author_id 
where a."Name" = 'Led Zeppelin';


-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
select distinct(al."Name")
from album al
left join album_author aa on aa.album_id = al.album_id
left join author a on a.author_id = aa.author_id
left join genre_author ga on ga.author_id = aa.author_id
where ga.author_id = a.author_id and 
(select count(gga.genre_id) from genre_author gga where gga.author_id = ga.author_id group by gga.author_id) > 1;


-- Наименования треков, которые не входят в сборники
select s."Name" from song s
left join album_mix_songs ams on s.song_id = ams.song_id 
left join album_mix am on am.album_mix_id = ams.album_mix_id 
where am.album_mix_id is null;


-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
select a."Name" from author a 
join album_author aa on a.author_id = aa.author_id 
join album al on al.album_id = aa.album_id 
join song s on s.album_id = al.album_id 
where s.duration = (select min(s.duration) from song s);


-- Названия альбомов, содержащих наименьшее количество треков
select al."Name" 
from album al
join song s on s.album_id = al.album_id 
group by al."Name"
having count(*) = (
	select count(s.song_id) from song s
	group by s.song_id
	order by 1
	limit 1);
