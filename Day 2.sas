/****Task 1: You want analyse the frequency of top 100 songs by release month. However, you first want to create a cleaner dataset to work with:*/
/*1. Filter your input data set for release_date_precision = "day".*/
Data album.filter;
	SET album.master_track_album;
	where release_date_precision = "day";
run;

/*2. Remove the variables uri, href and list_id.*/
Data album.filter;
	SET album.master_track_album;
	where release_date_precision = "day";
	drop uri href list_id;
run;

/*3. As there is no release month variable on the data, you need to create it using the release_date variable. Call this new column release_month.*/
Data album.filter;
	SET album.master_track_album;
	release_month = scan(release_date, 2);
	where release_date_precision = "day";
	drop uri href list_id;
run;


/****Task 2: You now want to analyse what month, over the 2014-2018 period, has the least number of observations in our dataset.*/
PROC Freq data=album.filter;
	Tables release_month;
run;

PROC SGPLOT data=album.filter;
	vbar release_month;
run;


/**** Task 3:You now want to group your analysis by year the albumn was released and analysis the amount of albums in each half of each year (group first 6 months and last 6 months together).*/
/*1. First you want to dedup your data set on album_id and year (i.e. you want to remove multiple occurrences of the same album_id-year combination from your data set).*/
Proc Sort data=album.filter
			out=album.sort nodupkey;
	by album_id year;
run;
			
/*2. Build off your code used for the previous step (or use alternate methods if you 
prefer), incorporating the year variable to group the data.*/

Proc format;
	value $grp 01-06 = "H1"
			  07-12	= "H2";
run;
		
PROC FREQ data=album.filter;
	tables release_month;
	format release_month $grp.;
	by year;
run;

