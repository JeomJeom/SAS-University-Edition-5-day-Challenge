/*Task 1*/
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=DAY5.H_100_ENRICHED;
	hbox tempo / category=Year;
	xaxis grid;
run;

ods graphics / reset;

/*Task 2*/
proc template;
	define statgraph SASStudio.Pie;
		begingraph;
		layout region;
		piechart category=primary_genre / stat=pct;
		endlayout;
		endgraph;
	end;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgrender template=SASStudio.Pie 
		data=DAY5.H_100_ENRICHED (where=(year=2015));
run;

ods graphics / reset;

/*Task 3*/
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=DAY5.H_100_ENRICHED;
	vbar Year / response=instrumentalness datalabel stat=mean;
	yaxis grid;
run;

ods graphics / reset;