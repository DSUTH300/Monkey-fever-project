SELECT COUNT(*) AS total_no_countries FROM monkey_pox_cases_worldwide 
WHERE confirmed_cases != 0 ;

SELECT * FROM monkey_pox_cases_worldwide;

SELECT * FROM monkey_pox_cases_worldwide
WHERE confirmed_cases > 
(SELECT AVG(confirmed_cases) FROM monkey_pox_cases_worldwide)
ORDER BY confirmed_cases;

SELECT  suspected_cases,
monkey_pox_cases_worldwide.country,
(suspected_cases/confirmed_cases)  AS Ratio,
confirmed_cases 
FROM worldwide_case_detection_timeline
INNER JOIN monkey_pox_cases_worldwide
ON monkey_pox_cases_worldwide.country=worldwide_case_detection_timeline.country
WHERE gender = 'male' 
GROUP BY monkey_pox_cases_worldwide.country;

SELECT * FROM worldwide_case_detection_timeline; 

SELECT 
SUM (CASE
WHEN (hospitalised = 'Y') THEN 1
ELSE 0
END) AS total_hospitalised,
SUM (CASE
WHEN (isolated = 'Y') THEN 1
ELSE 0
END) AS total_isolated,
SUM (CASE
WHEN (travel_history = 'Y') THEN 1
ELSE 0
END) AS total_traveled
FROM worldwide_case_detection_timeline;

SELECT DISTINCT(symptoms) FROM worldwide_case_detection_timeline;


