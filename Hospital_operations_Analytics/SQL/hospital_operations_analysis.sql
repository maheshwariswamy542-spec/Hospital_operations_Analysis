/*
Hospital Operations & Data Quality Analysis
Author: Maheshwari Swamy
Database: PostgreSQL

Run CREATE DATABASE while connected to the default postgres database.
Then reconnect to hospital_operations before running the remaining statements.
*/

CREATE DATABASE hospital_operations;

-- SQL Shell (psql) command: connect to the new project database.
\connect hospital_operations

-- The remaining statements now run inside hospital_operations.
DROP TABLE IF EXISTS hospital_records;

CREATE TABLE hospital_records (
    record_id BIGSERIAL PRIMARY KEY,
    patient_name TEXT,
    age INTEGER,
    gender VARCHAR(20),
    blood_type VARCHAR(10),
    medical_condition VARCHAR(100),
    admission_date DATE,
    doctor TEXT,
    hospital TEXT,
    insurance_provider VARCHAR(100),
    billing_amount NUMERIC(12, 2),
    room_number INTEGER,
    admission_type VARCHAR(30),
    discharge_date DATE,
    medication VARCHAR(100),
    test_results VARCHAR(30),
    age_check VARCHAR(20),
    billing_check VARCHAR(20),
    room_check VARCHAR(20),
    date_check VARCHAR(20),
    missing_data_check VARCHAR(20),
    category_check VARCHAR(20),
    length_of_stay INTEGER,
    overall_quality_status VARCHAR(30)
);

/*
Import option A — SQL Shell (psql)
Replace the path below with the full Windows path to healthcare_cleaned_data.csv.
Use forward slashes, for example C:/Users/YourName/Downloads/healthcare_cleaned_data.csv

\copy hospital_records(patient_name, age, gender, blood_type, medical_condition,
admission_date, doctor, hospital, insurance_provider, billing_amount, room_number,
admission_type, discharge_date, medication, test_results, age_check, billing_check,
room_check, date_check, missing_data_check, category_check, length_of_stay,
overall_quality_status)
FROM 'C:/Users/YourName/Downloads/healthcare_cleaned_data.csv'
WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

Import option B — pgAdmin
Right-click hospital_records > Import/Export Data > Import.
Select the CSV file, enable Header, choose CSV format, and use comma as delimiter.
*/

-- 01. Confirm the imported row count. Expected result: 54,966.
SELECT COUNT(*) AS total_records
FROM hospital_records;

-- 02. Preview the imported data.
SELECT *
FROM hospital_records
LIMIT 10;

-- 03. Overall operational and financial KPIs.
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT hospital) AS total_hospitals,
    COUNT(DISTINCT doctor) AS total_doctors,
    COUNT(DISTINCT insurance_provider) AS total_insurers,
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(length_of_stay), 2) AS average_length_of_stay,
    ROUND(AVG(billing_amount) FILTER (WHERE billing_check = 'Pass'), 2)
        AS average_valid_billing,
    ROUND(SUM(billing_amount) FILTER (WHERE billing_check = 'Pass'), 2)
        AS total_valid_billing
FROM hospital_records;

-- 04. Missing-value audit for required fields.
SELECT
    COUNT(*) FILTER (WHERE patient_name IS NULL OR BTRIM(patient_name) = '') AS missing_patient_name,
    COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,
    COUNT(*) FILTER (WHERE admission_date IS NULL) AS missing_admission_date,
    COUNT(*) FILTER (WHERE discharge_date IS NULL) AS missing_discharge_date,
    COUNT(*) FILTER (WHERE billing_amount IS NULL) AS missing_billing_amount,
    COUNT(*) FILTER (WHERE medical_condition IS NULL OR BTRIM(medical_condition) = '') AS missing_condition
FROM hospital_records;

-- 05. Data-quality status distribution and percentage.
SELECT
    overall_quality_status,
    COUNT(*) AS record_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM hospital_records
GROUP BY overall_quality_status
ORDER BY record_count DESC;

-- 06. Count records failing each validation rule.
SELECT
    COUNT(*) FILTER (WHERE age_check <> 'Pass') AS age_issues,
    COUNT(*) FILTER (WHERE billing_check <> 'Pass') AS billing_issues,
    COUNT(*) FILTER (WHERE room_check <> 'Pass') AS room_issues,
    COUNT(*) FILTER (WHERE date_check <> 'Pass') AS date_issues,
    COUNT(*) FILTER (WHERE missing_data_check <> 'Pass') AS missing_data_issues,
    COUNT(*) FILTER (WHERE category_check <> 'Pass') AS category_issues
FROM hospital_records;

-- 07. Display billing records requiring review.
SELECT
    record_id,
    patient_name,
    hospital,
    insurance_provider,
    billing_amount,
    billing_check,
    overall_quality_status
FROM hospital_records
WHERE billing_check = 'Review'
ORDER BY billing_amount;

-- 08. Independently validate invalid billing amounts.
SELECT COUNT(*) AS invalid_billing_records
FROM hospital_records
WHERE billing_amount IS NULL OR billing_amount <= 0;

-- 09. Independently validate patient ages.
SELECT COUNT(*) AS invalid_age_records
FROM hospital_records
WHERE age IS NULL OR age < 0 OR age > 120;

-- 10. Independently validate admission and discharge dates.
SELECT COUNT(*) AS invalid_date_records
FROM hospital_records
WHERE admission_date IS NULL
   OR discharge_date IS NULL
   OR discharge_date < admission_date;

-- 11. Independently validate calculated length of stay.
SELECT COUNT(*) AS invalid_length_of_stay_records
FROM hospital_records
WHERE length_of_stay IS NULL
   OR length_of_stay < 0
   OR length_of_stay <> (discharge_date - admission_date);

-- 12. Admissions by medical condition.
SELECT
    medical_condition,
    COUNT(*) AS admissions,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM hospital_records
GROUP BY medical_condition
ORDER BY admissions DESC;

-- 13. Average length of stay by medical condition.
SELECT
    medical_condition,
    COUNT(*) AS admissions,
    ROUND(AVG(length_of_stay), 2) AS average_length_of_stay
FROM hospital_records
GROUP BY medical_condition
ORDER BY average_length_of_stay DESC;

-- 14. Admissions by admission type.
SELECT
    admission_type,
    COUNT(*) AS admissions,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM hospital_records
GROUP BY admission_type
ORDER BY admissions DESC;

-- 15. Valid billing by medical condition.
SELECT
    medical_condition,
    COUNT(*) FILTER (WHERE billing_check = 'Pass') AS valid_records,
    ROUND(AVG(billing_amount) FILTER (WHERE billing_check = 'Pass'), 2)
        AS average_valid_billing,
    ROUND(SUM(billing_amount) FILTER (WHERE billing_check = 'Pass'), 2)
        AS total_valid_billing
FROM hospital_records
GROUP BY medical_condition
ORDER BY average_valid_billing DESC;

-- 16. Valid billing by insurance provider.
SELECT
    insurance_provider,
    COUNT(*) FILTER (WHERE billing_check = 'Pass') AS valid_records,
    ROUND(AVG(billing_amount) FILTER (WHERE billing_check = 'Pass'), 2)
        AS average_valid_billing,
    ROUND(SUM(billing_amount) FILTER (WHERE billing_check = 'Pass'), 2)
        AS total_valid_billing
FROM hospital_records
GROUP BY insurance_provider
ORDER BY total_valid_billing DESC;

-- 17. Test-result distribution.
SELECT
    test_results,
    COUNT(*) AS result_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM hospital_records
GROUP BY test_results
ORDER BY result_count DESC;

-- 18. Monthly admission trend.
SELECT
    DATE_TRUNC('month', admission_date)::DATE AS admission_month,
    COUNT(*) AS admissions
FROM hospital_records
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY admission_month;

-- 19. Yearly admission trend.
SELECT
    EXTRACT(YEAR FROM admission_date)::INTEGER AS admission_year,
    COUNT(*) AS admissions
FROM hospital_records
GROUP BY EXTRACT(YEAR FROM admission_date)
ORDER BY admission_year;

-- 20. Top 10 hospitals by number of admissions.
SELECT
    hospital,
    COUNT(*) AS admissions,
    ROUND(AVG(length_of_stay), 2) AS average_length_of_stay,
    ROUND(SUM(billing_amount) FILTER (WHERE billing_check = 'Pass'), 2)
        AS total_valid_billing
FROM hospital_records
GROUP BY hospital
ORDER BY admissions DESC, hospital
LIMIT 10;

-- 21. Top 10 doctors by caseload.
SELECT
    doctor,
    COUNT(*) AS patient_records,
    ROUND(AVG(length_of_stay), 2) AS average_length_of_stay
FROM hospital_records
GROUP BY doctor
ORDER BY patient_records DESC, doctor
LIMIT 10;

-- 22. Average length of stay by admission type.
SELECT
    admission_type,
    COUNT(*) AS admissions,
    ROUND(AVG(length_of_stay), 2) AS average_length_of_stay
FROM hospital_records
GROUP BY admission_type
ORDER BY average_length_of_stay DESC;

-- 23. Patient age-band analysis.
SELECT
    CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 35 THEN '18-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        WHEN age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+'
    END AS age_group,
    COUNT(*) AS patient_records,
    ROUND(AVG(length_of_stay), 2) AS average_length_of_stay,
    ROUND(AVG(billing_amount) FILTER (WHERE billing_check = 'Pass'), 2)
        AS average_valid_billing
FROM hospital_records
GROUP BY age_group
ORDER BY MIN(age);

-- 24. Records with unusually high valid billing amounts.
WITH billing_stats AS (
    SELECT AVG(billing_amount) AS mean_billing,
           STDDEV_POP(billing_amount) AS billing_stddev
    FROM hospital_records
    WHERE billing_check = 'Pass'
)
SELECT
    h.record_id,
    h.patient_name,
    h.hospital,
    h.medical_condition,
    h.billing_amount
FROM hospital_records AS h
CROSS JOIN billing_stats AS s
WHERE h.billing_check = 'Pass'
  AND h.billing_amount > s.mean_billing + (2 * s.billing_stddev)
ORDER BY h.billing_amount DESC;

-- 25. Possible duplicate records across the original business fields.
SELECT
    patient_name,
    age,
    admission_date,
    doctor,
    hospital,
    billing_amount,
    COUNT(*) AS duplicate_count
FROM hospital_records
GROUP BY patient_name, age, admission_date, doctor, hospital, billing_amount
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- Optional indexes for faster analysis.
CREATE INDEX IF NOT EXISTS idx_hospital_records_admission_date
    ON hospital_records(admission_date);
CREATE INDEX IF NOT EXISTS idx_hospital_records_condition
    ON hospital_records(medical_condition);
CREATE INDEX IF NOT EXISTS idx_hospital_records_insurer
    ON hospital_records(insurance_provider);
CREATE INDEX IF NOT EXISTS idx_hospital_records_quality
    ON hospital_records(overall_quality_status);
