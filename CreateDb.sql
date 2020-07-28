DROP DATABASE IF EXISTS Crime;
CREATE DATABASE Crime;
USE Crime;

CREATE TABLE Crime(
	State			varchar(20),
	Region			varchar(2),
	Acronym			varchar(2),
	DeathPenalty		boolean,
	YearAbrogation	 	int(4),
	Month			int(2),
	Quarter			int(1),
	Year			int(4),
	NumberMurders		int(2),
	NumberSentences		int(2)
);

CREATE TABLE dim_State
(
    ID_State			int(4) NOT NULL PRIMARY KEY,
    DeathPenalty		boolean,
    Region 			varchar(2),
    State 			varchar(20)
);


CREATE TABLE dim_Year
(
    ID_Year 			int(4) NOT NULL PRIMARY KEY,
    Year 			int(2),
    Quarter 			int(1),
    Month 			int(4)
);


 
CREATE TABLE fact_Murders
(
    	ID_Murder 		int NOT NULL primary key,
	ID_State		int(4),
	ID_Year			int(4),
	NumberMurders		int(6),
	NumberSentences		int(6),
    FOREIGN KEY (ID_State) REFERENCES dim_State(ID_State),
    FOREIGN KEY (ID_Year)   REFERENCES dim_Year(ID_Year)
);


