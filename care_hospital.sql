/*
	Different Columns found in the original csv data source
	
	-- county
	-- city
	-- hhs region int
	-- facility
	-- ownership
	-- metro status
	-- license type
	-- license bed type
	-- license beds
	-- year int


*/

-- Query to create the care_hospitals table

CREATE TABLE care_hospitals(
	County text,
	City text,
	Hhs_Region int,
	Facility text,
	Ownership text,
	Metro_Status text,
	License_Type text,
	License_Bed_Type text,
	License_Beds int,
	Calendar_Year int
);

-- Query to create a table that is able to be exported as a csv file.
-- Calculates the total beds for each category of Hospitals
-- Takes the different values found under the Ownership column along with the sum total of beds per ownership.
SELECT calendar_year,
	COUNT(DISTINCT(Facility)) AS Total_Hospitals,
	SUM(license_beds) AS total_license_beds,
	COUNT(CASE WHEN ownership = 'Public' THEN 1 END) AS Public_Hospitals,
	SUM(CASE WHEN ownership = 'Public' THEN License_Beds END) AS public_beds,
	COUNT(CASE WHEN ownership = 'For-Profit' THEN 1 END) AS Profit_Hospitals,
	SUM(CASE WHEN ownership = 'For-Profit' THEN License_Beds END) AS profit_beds,
	COUNT(CASE WHEN ownership = 'Non-Profit' THEN 1 END) AS NonProfit_Hospitals,
	SUM(CASE WHEN ownership = 'Non-Profit' THEN License_Beds END) AS non_profit_beds
FROM care_hospitals
GROUP BY calendar_year;
