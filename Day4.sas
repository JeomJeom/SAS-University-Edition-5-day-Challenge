/*Task 1*/
proc sql noprint;
	create table day4.H_100_ENRICHED as 
	select a.*, 
		b.list_id,b.artist_id, b.genres1 as Primary_Genre, b.genres2 as Secondary_Genre,
		m.track_id,m.danceability, m.energy, m.speechiness, m.acousticness, m.instrumentalness, m.liveness, m.valence,m.tempo
		from DAY4.ITEMS_TRACK_CLEANED as a, 
			DAY4.ARTIST_INFO_DEDUPED as b, 
			DAY4.master_ft_audio_features as m
		where a.list_id=b.list_id and a.track_id=m.track_id ;
quit;


/*Task 2*/
PROC SQL; 
	SELECT count(Primary_Genre), Primary_genre
	FROM DAY4.H_100_ENRICHED
	group by primary_genre
	order by 1 desc;
QUIT;

PROC SQL; 
	SELECT  year, avg(liveness)
	FROM DAY4.H_100_ENRICHED
	group by year
	order by 2 desc;
QUIT;

PROC SQL; 
	SELECT Primary_Genre, avg(acousticness)
	FROM DAY4.H_100_ENRICHED
	group by primary_genre
	order by 2 asc;
QUIT;

PROC SQL; 
	SELECT song, instrumentalness, danceability
	FROM DAY4.H_100_ENRICHED
	where instrumentalness > 0.75 and danceability >0.75;
QUIT;


PROC SQL; 
	SELECT year,Avg(danceability) as d, Avg(energy) as e, Avg(speechiness) as s, Avg(acousticness)as a, 
	Avg(instrumentalness)as i, Avg(liveness) as l, Avg(valence) as v,Avg(tempo) as t
	FROM DAY4.H_100_ENRICHED
	group by year
	order by 1 asc;
QUIT;