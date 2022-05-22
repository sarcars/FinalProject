-- Creating tables for Final Project
CREATE TABLE Colleges_main (
     CollegeID Int NOT NULL,
     State Int Not NULL,
	 Enrolled_total Int NOT NULL,
	 Average_Tuition Int NOT NULL,
	 Applicants_Total Int NOT NULL,
	 Perc_Fresh_SAT_scores Int NOT NULL, 
 	 Perc_Fresh_ACT_scores Int NOT NULL,
	 Percent_admitted_total Int NOT NULL,
	 Instate_Price Int NOT NULL,	
	 Outstate_Price Int NOT NULL,	
	 Total_enrollment Int NOT NULL,	
	 FT_enrollment Int NOT NULL,	
	 PT_enrollment Int NOT NULL,	
	 Undergraduate_enrollment Int NOT NULL,	
	 FT_undergrad_enrollment	Int NOT NULL,
	 Pt_undergrad_enrollment	Int NOT NULL,
	 Perc_AmericanIndian_or_AlaskaNative_undergrad Int NOT NULL,	
	 Perc_Asian_undergrad	 Int NOT NULL,
	 Perc_BlackAfricanAmerican_undergrad	 Int NOT NULL,
	 Perc_HispanicLatino_undergrad Int NOT NULL,
	 Perc_NativeHawaiian_or_OtherPacificIslander_undergrad	Int NOT NULL,
	 Perc_White_undergrad	 Int NOT NULL,
	 Perc_Multiracial_undergrad	 Int NOT NULL,
	 Perc_RaceUnknown_undergrad Int NOT NULL,	
	 Perc_AsianNativeHawaiianPacificIslander_undergrad  Int NOT NULL,	
	 Perc_women_undergrad	 Int NOT NULL,
	 Gradrate_Bachelor_four_years  Int NOT NULL,	
	 Gradrate_Bachelor_five_years  Int NOT NULL,	
	 Gradrate_Bachelor_six_years	 Int NOT NULL,
	 Perc_Fresh_FinancialAid  Int NOT NULL,		
	 Private  Int NOT NULL,	
	 Public Int NOT NULL,	
	 Far_West_Region Int NOT NULL,	
	 Great_Lakes_Region	Int NOT NULL,
	 Mid_East_Region  Int NOT NULL,
	 New_England_Region	Int NOT Null,
	Plains_Region Int NOT NULL,
	 Rocky_Mountains_Region	Int NOT Null,
	 Southeast_Region Int NOT NULL,
	 Southwest_Region Int NOT NULL,	
	 US_Service_Schools_Region Int NOT NULL,	
	 PRIMARY KEY (CollegeID)
);
	

CREATE TABLE Colleges_ranked (
	Name Varchar NOT NULL,
	Top10Perc Int NOT NULL,
	Top25Perc Int NOT NULL,
	SFRatio Int NOT NULL,
	PRIMARY KEY (Name)
);


CREATE TABLE Cleaned_CU_w_Latlong (
	name Varchar NOT NULL,
	address Varchar NOT NULL,
	city Varchar NOT NULL,
	state Varchar NOT NULL,
	zip Varchar NOT NULL,
	latitude Varchar NOT NULL,
	longitude Varchar NOT NULL,
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