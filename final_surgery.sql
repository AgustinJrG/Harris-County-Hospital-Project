/*

	Columns from the original CSV data source.
	
	-- hhs region
	-- county text
	-- facility text
	-- measure name text
	-- measure value text
	-- year int

	Different values under the Measure Name column

	-- Outpatient surgical operations 
	-- Number of operating rooms 
	-- Inpatient surgical operations 
*/

-- Query to create harris_surgery table
CREATE TABLE harris_surgery(

	Hhs_Region text,
	County text,
	Facility text,
	Measure_Name text,
	Measure_Value int,
	Calendar_Year int
	

);


-- Query that is makes a table that can be saved as a CSV
-- Turns the different values of Measure_Name Column into their own column along with the value associated with it.

SELECT calendar_year, facility,
	MAX(measure_value) FILTER (WHERE measure_name = 'Outpatient surgical operations') AS Outpatient_Surgical_Operations,
	MAX(measure_value) FILTER (WHERE measure_name = 'Number of operating rooms') AS Number_Of_Operating_Rooms,
	MAX(measure_value) FILTER (WHERE measure_name = 'Inpatient surgical operations') AS Inpatient_Surgical_Operations

FROM harris_surgery
GROUP BY calendar_year, facility
ORDER BY calendar_year, facility;

