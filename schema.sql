-- Creating tables for Final Project
CREATE TABLE Colleges_main (
     CollegeID Int NOT NULL,
     State Int Not NULL,
	 Applicants_total varchar NOT Null,
	 Enrolled_total varchar NOT NULL,
	 Perc_Fresh_SAT_Scores varchar NOT NULL, 
 	 Perc_Fresh_ACT_Scores varchar NOT NULL,
	 Instate_Price numeric NOT NULL,	
	 Outstate_Price numeric NOT NULL,	
	 Total_enrollment varchar NOT NULL,	
	 FT_enrollment numeric NOT NULL,	
	 PT_enrollment numeric NOT NULL,	
	 Undergraduate_enrollment numeric NOT NULL,	
	 FT_undergrad_enrollment	numeric NOT NULL,
	 Pt_undergrad_enrollment	numeric NOT NULL,
	 Perc_AmericanIndian_or_AlaskaNative_undergrad float NOT NULL,	
	 Perc_Asian_undergrad varchar NOT NULL,
	 Perc_BlackAfricanAmerican_Undergrad varchar NOT NULL,
	 Perc_HispanicLatino_undergrad varchar NOT NULL,
	 Perc_NativeHawaiian_or_OtherPacificIslander_undergrad varchar NOT NULL,
	 Perc_White_undergrad varchar NOT NULL,
	 Perc_Multiracial_undergrad	varchar NOT NULL,
	 Perc_RaceUnknown_undergrad varchar NOT NULL,	
	 Perc_NonresidentAlien_undergrad varchar NOT NULL,
	 Perc_AsianNativeHawaiianPacificIslander_undergrad varchar NOT NULL,	
	 Perc_women_undergrad varchar NOT NULL,
	 Gradrate_Bachelor_four_years varchar NOT NULL,	
	 Gradrate_Bachelor_five_years varchar NOT NULL,	
	 Gradrate_Bachelor_six_years varchar NOT NULL,
	 Perc_Fresh_FinancialAid varchar NOT NULL,		
	 Private varchar NOT NULL,	
	 Public varchar NOT NULL,	
	 Far_West_Region varchar NOT NULL,	
	 Great_Lakes_Region	varchar NOT NULL,
	 Mid_East_Region  varchar NOT NULL,
	 New_England_Region	varchar NOT Null,
	Plains_Region varchar NOT NULL,
	 Rocky_Mountains_Region	varchar NOT Null,
	 Southeast_Region varchar NOT NULL,
	 Southwest_Region varchar NOT NULL,	
	 US_Service_Schools_Region varchar NOT NULL,	
	 average_tuition varchar NOT NULL, 
	 PRIMARY KEY (CollegeID)
);
	

CREATE TABLE Colleges_ranked (
	Name Varchar NOT NULL,
	Top10Perc float NOT NULL,
	Top25Perc float NOT NULL,
	SFRatio float NOT NULL,
	PRIMARY KEY (Name)
);


CREATE TABLE Cleaned_CU_w_Latlong (
	name Varchar NOT NULL,
	address Varchar NOT NULL,
	city Varchar NOT NULL,
	state Varchar NOT NULL,
	zip numeric NOT NULL,
	latitude Float NOT NULL,
	longitude Float NOT NULL,
	website Varchar NOT NULL,
	Primary Key (name)
);
	
CREATE TABLE School_states (
	Name Varchar NOT NULL,
	CollegeID Int NOT NULL,
	State_Abbreviation Varchar NOT NULL,
	State Varchar NOT NULL,
	Foreign Key (CollegeID) References Colleges_main (CollegeID)
);	

SELECT * FROM Colleges_main;
SELECT * FROM colleges_ranked;
SELECT * FROM Cleaned_CU_w_Latlong;
SELECT * FROM School_states;
