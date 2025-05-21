-- total patients
SELECT * 
FROM patient_records;

--no. of unique medical conditions treated
SELECT COUNT(DISTINCT medical_condition) 
FROM patient_records;

--average age of patients for each medical condition
SELECT medical_condition, ROUND(AVG(age),2)
FROM patient_records
GROUP BY medical_condition;

--count of patients by gender and blood type
SELECT gender, COUNT(*)
FROM patient_records
GROUP BY gender;

SELECT blood_type, COUNT(*)
FROM patient_records
GROUP BY blood_type;

--top 5 most common medical conditions
SELECT medical_condition, COUNT(medical_condition) 
FROM patient_records
GROUP BY medical_condition
LIMIT 5;

--average and maximum billing amount by medical condition
SELECT medical_condition, AVG(billing_amount), MAX(billing_amount)
FROM patient_records
GROUP BY medical_condition;

--total billing amount covered by each insurance provider
SELECT insurance_provider, SUM(billing_amount)
FROM patient_records
GROUP BY insurance_provider;

--length of stay (in days) for each patient
SELECT name, date_of_admission, discharge_date,
	discharge_date - date_of_admission AS length_of_stay
FROM patient_records;

--average length of stay grouped by admission type
SELECT admission_type, ROUND(AVG(discharge_date - date_of_admission),2)
FROM patient_records
GROUP BY admission_type;

--number of admissions per month
SELECT DATE_TRUNC('month', date_of_admission) AS admission_month,
	COUNT(*) AS total_admissions
FROM patient_records
WHERE date_of_admission IS NOT NULL
GROUP BY admission_month
ORDER BY admission_month;

--month with the highest number of emergency admissions
SELECT DATE_TRUNC('month', date_of_admission) AS admission_month,
	COUNT(*) AS emergency_admissions
FROM patient_records
WHERE admission_type = 'Emergency'
	AND date_of_admission IS NOT NULL
GROUP BY admission_month
ORDER BY emergency_admissions  DESC
LIMIT 1;

--monthly trend of average billing amount
SELECT DATE_TRUNC('month', date_of_admission) AS admission_month,
	AVG(billing_amount)
FROM patient_records
WHERE date_of_admission IS NOT NULL
GROUP BY admission_month
ORDER BY AVG(billing_amount);

--test result distribution by medication
SELECT test_results, COUNT(test_results)
FROM patient_records
GROUP BY test_results;

--normal effect by drug
SELECT medication, COUNT(test_results) AS normal_results
FROM patient_records
WHERE test_results = 'Normal' 
GROUP BY medication;

--abnormal effect by drug
SELECT medication, COUNT(test_results) AS abnormal_results
FROM patient_records
WHERE test_results = 'Abnormal' 
GROUP BY medication;

--distribution by gender
SELECT gender, COUNT(*)
FROM patient_records
GROUP BY gender;

--distribution by blood type
SELECT blood_type, COUNT(*)
FROM patient_records
GROUP BY blood_type;

