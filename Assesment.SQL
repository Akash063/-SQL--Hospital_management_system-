CREATE DATABASE  hospital;
use hospital;

SELECT * FROM hospital_data;

-- 1) Write an SQL query to find the total number of patients across all hospitals.
SELECT sum(`Patients Count`) as Total_Patients
 from hospital_data ;
 
 -- 2) Retrieve the average count of doctors available in each hospital.
 SELECT  `ï»¿Hospital Name`AS Hospital_Name ,avg(`Doctors Count`) AS Avg_Doctor_Count
 FROM hospital_data
 group by `ï»¿Hospital Name` ;
 
 -- 3) Find the top 3  hospital department that have the highest number of patients.
 SELECT Department,sum(`Patients Count`) AS Highest_no_patient
 FROM hospital_data
 group by Department
 order by  Highest_no_patient Desc
 limit 3;
 
 -- 4) Identify the hospital that record the highest medical expenses.
 SELECT `ï»¿Hospital Name` as Hospital_name ,`Medical Expenses` FROM hospital_data
 order by `Medical Expenses` desc
 limit 1;
 
 -- 5)Calculate the average medical expenses per day for each hospital.
SELECT `ï»¿Hospital Name`as Hospital_name ,AVG(`Medical Expenses`) AS avg_daily_expense
FROM hospital_data
GROUP BY `ï»¿Hospital Name`;

-- 6) Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
 SELECT *, 
DATEDIFF(STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
         STR_TO_DATE(`Admission Date`, '%d-%m-%Y')) AS stay_days
FROM hospital_data
ORDER BY stay_days DESC
LIMIT 1;

-- 7) Count the total number of patients treated in each city.
SELECT Location, SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY Location;

-- 8) Calculate the average number of days patients spend in each department.
SELECT Department,
AVG(DATEDIFF(STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
             STR_TO_DATE(`Admission Date`, '%d-%m-%Y'))) AS avg_stay_days
FROM hospital_data
GROUP BY Department;

-- 9) Identify the Department with the Lowest Number of Patients
SELECT Department, SUM(`Patients Count`) AS Lowest_patients
FROM hospital_data
GROUP BY Department
ORDER BY Lowest_patients ASC
LIMIT 1;

-- 10) Group the data by month and calculate the total medical expenses for each month.
SELECT 
DATE_FORMAT(STR_TO_DATE(`Admission Date`, '%d-%m-%Y'), '%Y-%m') AS month,
SUM(`Medical Expenses`) AS total_expense
FROM hospital_data
GROUP BY month
ORDER BY month;
 
