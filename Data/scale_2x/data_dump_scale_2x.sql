SET SEARCH_PATH TO "CITYPULSE_S2";
CREATE TABLE POLLUTION (
    ozone INTEGER,
    particullate_matter INTEGER,
    carbon_monoxide INTEGER,
    sulfure_dioxide INTEGER,
    nitrogen_dioxide INTEGER,
    longitude REAL,
    latitude REAL,
    timestamp TIMESTAMP
);
COPY POLLUTION
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/fragments/scale_2x_data.csv' WITH (FORMAT CSV);


/**************** LOC 1 ********************/



CREATE TABLE GOOD_SUMMARY_LOC_1 (
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

CREATE TABLE AVERAGE_SUMMARY_LOC_1 (
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

CREATE TABLE POOR_SUMMARY_LOC_1(
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

COPY GOOD_SUMMARY_LOC_1
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/average_summaries_Fr_main_L1.csv' WITH (FORMAT CSV);

COPY AVERAGE_SUMMARY_LOC_1
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/average_summaries_Fr_main_L1.csv' WITH (FORMAT CSV);

COPY POOR_SUMMARY_LOC_1
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/poor_summaries_Fr_main_L1.csv' WITH (FORMAT CSV);

/**************** LOC 2 ********************/



CREATE TABLE GOOD_SUMMARY_LOC_2 (
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

CREATE TABLE AVERAGE_SUMMARY_LOC_2 (
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

CREATE TABLE POOR_SUMMARY_LOC_2(
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

COPY GOOD_SUMMARY_LOC_2
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/good_summaries_Fr_main_L2.csv' WITH (FORMAT CSV);

COPY AVERAGE_SUMMARY_LOC_2
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/average_summaries_Fr_main_L2.csv' WITH (FORMAT CSV);

COPY POOR_SUMMARY_LOC_2
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/poor_summaries_Fr_main_L2.csv' WITH (FORMAT CSV);

/**************** LOC 3 ********************/



CREATE TABLE GOOD_SUMMARY_LOC_3 (
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

CREATE TABLE AVERAGE_SUMMARY_LOC_3 (
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

CREATE TABLE POOR_SUMMARY_LOC_3(
    
    particullate_matter CHAR,
    carbon_monoxide CHAR,
    sulfure_dioxide CHAR,
    nitrogen_dioxide CHAR,
    s_timestamp TIMESTAMP,
    e_timestamp TIMESTAMP,
    count INTEGER,
    average REAL
);

COPY GOOD_SUMMARY_LOC_3
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/good_summaries_Fr_main_L3.csv' WITH (FORMAT CSV);

COPY AVERAGE_SUMMARY_LOC_3
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/average_summaries_Fr_main_L3.csv' WITH (FORMAT CSV);

COPY POOR_SUMMARY_LOC_3
FROM '/home/yash/repos/DDB_RP_Implementation/Data/scale_2x/summaries/poor_summaries_Fr_main_L3.csv' WITH (FORMAT CSV);