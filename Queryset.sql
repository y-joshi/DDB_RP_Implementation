/**
 Q1. count number of Records according to AQI level of Ozone
 Good AQI level    0 to 49
 Average AQI level    50 to 149
 POOR AQI level  150+
 **/
/*** FOR FULL SCAN ***/
SELECT *
FROM (
        SELECT COUNT(*) AS GOOD_AQI_COUNT
        FROM POLLUTION AS P
        WHERE P.OZONE <= 49
    ) AS GOOD_AQI,
    (
        SELECT COUNT(*) AS AVG_AQI_COUNT
        FROM POLLUTION AS P
        WHERE P.OZONE >= 50
            AND P.OZONE <= 149
    ) AS AVG_AQI,
    (
        SELECT COUNT(*) AS POOR_AQI_COUNT
        FROM POLLUTION AS P
        WHERE P.OZONE >= 150
    ) AS POOR_AQI;
/*** PATTERN Query **/

SELECT *
FROM (
        SELECT (CG1 + CG2 + CG3) AS GOOD_AQI_COUNT
        FROM (
                SELECT SUM(COUNT) AS CG1
                FROM GOOD_SUMMARY_LOC_1
            ) AS GSL1,
            (
                SELECT SUM(COUNT) AS CG2
                FROM GOOD_SUMMARY_LOC_2
            ) AS GSL2,
            (
                SELECT SUM(COUNT) AS CG3
                FROM GOOD_SUMMARY_LOC_3
            ) AS GSL3
    ) AS GOOD,
    (
        SELECT (CG1 + CG2 + CG3) AS AVERAGE_AQI_COUNT
        FROM (
                SELECT SUM(COUNT) AS CG1
                FROM AVERAGE_SUMMARY_LOC_1
            ) AS GSL1,
            (
                SELECT SUM(COUNT) AS CG2
                FROM AVERAGE_SUMMARY_LOC_2
            ) AS GSL2,
            (
                SELECT SUM(COUNT) AS CG3
                FROM AVERAGE_SUMMARY_LOC_3
            ) AS GSL3
    ) AS AVERAGE,
    (
        SELECT (CG1 + CG2 + CG3) AS POOR_AQI_COUNT
        FROM (
                SELECT SUM(COUNT) AS CG1
                FROM POOR_SUMMARY_LOC_1
            ) AS GSL1,
            (
                SELECT SUM(COUNT) AS CG2
                FROM POOR_SUMMARY_LOC_2
            ) AS GSL2,
            (
                SELECT SUM(COUNT) AS CG3
                FROM POOR_SUMMARY_LOC_3
            ) AS GSL3
    ) AS POOR;

/*Q2* classify record in good,avearge or poor AQI from the give timestamp and location
 *FULL SCAN**/
SET SEARCH_PATH TO "CITYPULSE_S1";
SELECT CONCAT(
        'AQI LEVEL Is :' || (
            SELECT CASE
                    WHEN OZONE <= 49 THEN 'GOOD'
                    WHEN OZONE > 49
                    AND OZONE <= 149 THEN 'AVERAGE'
                    ELSE 'POOR'
                END AS "Good"
        )
    ) as RESULT
FROM POLLUTION
WHERE TIMESTAMP = '2014-08-14 03:50:00'
    AND LONGITUDE = '10.11659'
    AND LATITUDE = '56.225796';
/**PATTERN QUERY**/
SELECT CONCAT(
        'AQI LEVEL Is :' || (
            SELECT CASE
                    WHEN EXISTS (
                        SELECT *
                        FROM GOOD_SUMMARY_LOC_1
                        WHERE S_TIMESTAMP = '2014-08-14 03:50:00'
                            AND LONGITUDE = '10.11659'
                            AND LATITUDE = '56.225796'
                    ) THEN 'GOOD'
                    WHEN EXISTS (
                        SELECT *
                        FROM GOOD_SUMMARY_LOC_2
                        WHERE S_TIMESTAMP = '2014-08-14 03:50:00'
                            AND LONGITUDE = '10.11659'
                            AND LATITUDE = '56.225796'
                    ) THEN 'GOOD'
                    WHEN EXISTS (
                        SELECT *
                        FROM GOOD_SUMMARY_LOC_3
                        WHERE S_TIMESTAMP = '2014-08-14 03:50:00'
                            AND LONGITUDE = '10.11659'
                            AND LATITUDE = '56.225796'
                    ) THEN 'GOOD'
                    WHEN EXISTS (
                        SELECT *
                        FROM AVERAGE_SUMMARY_LOC_1
                        WHERE S_TIMESTAMP = '2014-08-14 03:50:00'
                            AND LONGITUDE = '10.11659'
                            AND LATITUDE = '56.225796'
                    ) THEN 'AVERAGE'
                    WHEN EXISTS (
                        SELECT *
                        FROM AVERAGE_SUMMARY_LOC_2
                        WHERE S_TIMESTAMP = '2014-08-14 03:50:00'
                            AND LONGITUDE = '10.11659'
                            AND LATITUDE = '56.225796'
                    ) THEN 'AVERAGE'
                    WHEN EXISTS (
                        SELECT *
                        FROM AVERAGE_SUMMARY_LOC_3
                        WHERE S_TIMESTAMP = '2014-08-14 03:50:00'
                            AND LONGITUDE = '10.11659'
                            AND LATITUDE = '56.225796'
                    ) THEN 'AVERAGE'
                    ELSE 'POOR'
                END AS "RES"
        )
    ) as RESULT;
/*** 
 Q3 Give the average of GOOD AQI level for the given timestamp range AT given location
 ***/
SET SEARCH_PATH TO "CITYPULSE_S1";
SELECT AVG(OZONE)
FROM POLLUTION AS P
WHERE P.TIMESTAMP BETWEEN '2014-08-05 19:40:00' AND '2014-08-07 06:35:00'
    AND OZONE <= 49
    AND LONGITUDE = '10.209219'
    AND LATITUDE = '56.172436';
/** pattern Query **/
SELECT average AS AVG2
FROM GOOD_SUMMARY_LOC_2
WHERE S_TIMESTAMP = '2014-08-05 19:40:00'
    AND E_TIMESTAMP = '2014-08-07 06:35:00'
    AND LONGITUDE = '10.209219'
    AND LATITUDE = '56.172436';
/*** 
 Q4 Give the average of AVEARAGE AQI level for the given timestamp range AT given location
 ***/
SET SEARCH_PATH TO "CITYPULSE_S1";
SELECT AVG(OZONE)
FROM POLLUTION AS P
WHERE P.TIMESTAMP BETWEEN '2014-08-25 03:15:00' AND '2014-08-28 03:10:00'
    AND OZONE >= 50
    AND OZONE <= 149
    AND LONGITUDE = '10.153643'
    AND LATITUDE = '56.110287';
/** pattern Query **/
SELECT average
FROM AVERAGE_SUMMARY_LOC_3
WHERE S_TIMESTAMP = '2014-08-25 03:15:00'
    AND E_TIMESTAMP = '2014-08-28 03:10:00'
    AND LONGITUDE = '10.153643'
    AND LATITUDE = '56.110287';
/*** 
 Q5 Give the average of POOR AQI value for the given timestamp range AT given location
 ***/
SET SEARCH_PATH TO "CITYPULSE_S1";
SELECT AVG(OZONE)
FROM POLLUTION AS P
WHERE P.TIMESTAMP BETWEEN '2014-08-28 02:50:00' AND '2014-08-30 04:25:00'
    AND OZONE > 149
    AND LONGITUDE = '10.20706'
    AND LATITUDE = '56.168167';
	
SELECT average AS AVG2
FROM POOR_SUMMARY_LOC_2
WHERE S_TIMESTAMP = '2014-08-28 02:50:00'
    AND E_TIMESTAMP = '2014-08-30 04:25:00'
    AND LONGITUDE = '10.20706'
    AND LATITUDE = '56.168167';