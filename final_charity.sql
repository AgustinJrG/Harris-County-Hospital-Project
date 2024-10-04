/* 

	Columns found in the original CSV File:
	
	-- hhs region int
	-- county text
	-- facility text
	-- measure name
	-- measure value int
	-- year int

	Values under the Measure Name Column.

	-- Total Uncompensated Care
	-- Total Net Patient Revenue
	-- Total Gross Patient Revenue
	-- Total Charity Care Charges
	-- Total Bad Debt Charges

*/
CREATE TABLE harris_charity(

	Hhs_Region int,
	County text,
	Facility_Text text,
	Measure_Name text,
	Measure_Value int,
	Calendar_Year int
);


-- This query will seperate each distinct measure_name into its own column along with the measure_value associated with the column name.
-- Two columns will not be needed in this query and new table(csv file). HHS_Region and County.
SELECT calendar_year, facility_text,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Uncompensated Care') AS Total_Uncompensated_Care,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Net Patient Revenue') AS Total_Net_Patient_Revenue,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Gross Patient Revenue') AS Total_Gross_Patient_Revenue,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Charity Care Charges') AS Total_Charity_Care_Charges,
	MAX(measure_value) FILTER (WHERE measure_name = 'Total Bad Debt Charges') AS Total_Bad_Debt_Charges

FROM harris_charity
GROUP BY calendar_year, facility_text
ORDER BY calendar_year, facility_text;
	
	