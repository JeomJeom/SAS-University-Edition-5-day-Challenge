/****** Task1: You want analyse the summary statistics for the number of streams of the top song in New Zealand.
1. Filter your input data set for region = 'nz' and position=1.*/

DATA songs.songs_filter;
	SET songs.songs_complete;
	WHERE region = 'nz' and position=1;
RUN;

/*2. Compute the mean of the streams variable for this summarized data set.*/
PROC  MEANS Data= songs.songs_filter;
	Var Streams;
run;

/*Question 1: What is the mean, to the nearest integer, 
of the number of streams for the top song in New Zealand?*/
/*Ans: 59894.99 */

/****** Task 2: You now want to analyse data for a specific song, Mr. Brightside, to analyse the trends of this songs in within Australia.*/
/*1. Filter the songs_complete data set for Track_Name = “Mr. Brightside” and region = “au” (note the period after Mr)*/
data songs.song_filter2;
	SET songs.songs_complete;
	where Track_Name = 'Mr. Brightside' and region = 'au';
run;
	
/*2. Compute the median of the number of streams for the song Mr. Brightside over the period which we have data*/
PROC UNIVARIATE data=songs.song_filter2;
	var streams;
Run;

/*Question 2: What is the median of the number of streams the song Mr. Brightside in Australia?*/
/*Ans: 26403.00*/

/******* Task 3: You want to further analyse the song Mr. Brightside and its number of streams in Australia. Specifically, you want to determine on what day in our data set did it have the most streams.*/

proc SQL;
	select *
	from songs.song_filter2
	where streams = (select max(streams) from songs.song_filter2);
run;

/*Question 3: On what day in our dataset did Mr. Brightside get the most streams in Australia and how many streams did it get? Write your answer for the date in format dd/mm/yyyy.*/
/*Ans: it is on 2017-12-31*/

