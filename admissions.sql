/*



*/

-- Query to make the different values of the Measure Name column into their own columns along with their value.

SELECT calendar_year, facility,
	MAX(measure_values) FILTER (WHERE measure_name = 'Inpatient Days') AS Inpatient_Days,
	MAX(measure_values) FILTER (WHERE measure_name = 'Average Length of Stay') AS Average_Length_of_Stay,
	MAX(measure_values) FILTER (WHERE measure_name = 'Admissions') AS Admissions
FROM harris_admissions
GROUP BY calendar_year, facility
ORDER BY calendar_year, facility;

-- Query that adds up all admissions in each year and groups them by year.
SELECT calendar_year,
	SUM(CASE WHEN measure_name = 'Admissions' THEN measure_values END) AS Admissions
FROM harris_admissions
GROUP BY calendar_year;