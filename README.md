# Hospital Operations & Data Quality Analysis

![Microsoft Excel](https://img.shields.io/badge/Microsoft%20Excel-217346?style=flat-square&logo=microsoftexcel&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white)
![Healthcare Analytics](https://img.shields.io/badge/Domain-Healthcare%20Analytics-0B84A5?style=flat-square)
![Project Status](https://img.shields.io/badge/Status-SQL%20Analysis%20In%20Progress-yellow?style=flat-square)

## Executive Summary

This portfolio project analyzes hospital operations, billing patterns, patient length of stay, and data quality using **Microsoft Excel** and **PostgreSQL**. I transformed a synthetic healthcare dataset into a validated, analysis-ready dataset; wrote SQL queries to answer operational and financial questions; and developed an interactive Excel dashboard to support decision-making.

The analysis covered **54,966 hospital records** and identified **106 billing records requiring review**, resulting in an overall data-quality pass rate of approximately **99.81%**.

### Recruiter Quick View

| Area | What I demonstrated |
|---|---|
| Business analysis | Converted hospital data into actionable operational and financial insights |
| Data preparation | Cleaned, standardized, and validated healthcare records in Excel |
| Data quality | Built rule-based checks for age, billing, room numbers, dates, missing data, and categories |
| SQL analysis | Used PostgreSQL for aggregation, validation, segmentation, and KPI analysis |
| Dashboarding | Created an interactive Excel dashboard with KPI cards, PivotCharts, and slicers |
| Communication | Translated analytical results into concise findings and business recommendations |

## Dashboard Preview

### Dashboard Overview

![Hospital Operations Dashboard Overview](images/dashboard-overview.png)

### Dashboard Details

![Hospital Operations Dashboard Details](images/dashboard-details.png)

## Business Objective

Hospital leaders need reliable information to monitor admission volume, patient length of stay, billing performance, medical-condition trends, and data-quality exceptions. This project was designed to answer the following questions:

- What are the key operational and billing KPIs?
- Which medical conditions account for the most admissions?
- Which conditions are associated with longer patient stays?
- How are elective, emergency, and urgent admissions distributed?
- How does billing vary across insurance providers and medical conditions?
- Which records fail important data-quality rules and require review?

## Key Results

| KPI | Result |
|---|---:|
| Total records analyzed | 54,966 |
| Hospitals represented | 39,876 |
| Doctors represented | 40,341 |
| Insurance providers | 5 |
| Average patient age | 51.54 years |
| Average length of stay | 15.51 days |
| Average billing amount | $25,492.40 |
| Total billing amount | $1.40 billion |
| Data-quality pass rate | 99.81% |
| Billing records requiring review | 106 |

## Key Findings

- **Arthritis recorded the most admissions**, with 9,218 cases, while asthma recorded the fewest, with 9,095.
- Admission volume was distributed relatively evenly across the six medical conditions.
- **Asthma had the longest average stay**, at approximately 15.68 days.
- **Elective admissions were the largest admission category**, representing 18,473 records, or 33.61% of all admissions.
- Elective, emergency, and urgent admissions each accounted for approximately one-third of the dataset.
- **Obesity had the highest average valid billing amount**, at approximately $25,859.22.
- **Cancer had the lowest average valid billing amount**, at approximately $25,205.92.
- Test results were nearly evenly distributed across abnormal, inconclusive, and normal outcomes.
- No invalid ages, admission/discharge date sequences, or lengths of stay were found.
- The quality audit identified **106 invalid billing records** for further investigation.

## Analytical Workflow

### 1. Data Cleaning and Preparation — Excel

- Removed duplicate records.
- Checked required fields for missing values.
- Standardized admission and discharge dates.
- Added month and year fields for time-based analysis.
- Calculated patient length of stay.
- Prepared structured data for dashboarding and SQL analysis.

### 2. Data-Quality Audit — Excel and SQL

I created validation checks for patient age, billing amount, room number, admission and discharge dates, missing required information, and accepted category values. I combined the results into an `Overall_Quality_Status` field with **Pass**, **Warning**, and **Needs Review** classifications.

### 3. Exploratory and Business Analysis — PostgreSQL

The SQL analysis included:

- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, and `HAVING`
- `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`
- `CASE WHEN` statements for conditional classifications
- Analysis by medical condition, admission type, insurer, hospital, and doctor
- Validation queries for billing amounts, ages, dates, and lengths of stay

### 4. Interactive Dashboard — Excel

The dashboard includes:

- Operational, financial, and data-quality KPI cards
- Admissions by medical condition and admission type
- Test-result distribution
- Billing analysis by insurance provider
- Average length of stay by condition
- Overall data-quality status
- Interactive slicers for focused analysis

## Business Recommendations

1. **Review the 106 billing exceptions** before using the affected records for reimbursement, forecasting, or financial reporting.
2. **Monitor length of stay by condition**, particularly asthma, to investigate possible operational or care-management drivers.
3. **Maintain automated data-quality checks** when new records are added so invalid billing and date entries are detected early.
4. **Use the dashboard for recurring operational reviews** to compare admissions, billing, test results, and patient-stay patterns.

## Tools and Skills

- **Microsoft Excel:** Data cleaning, formulas, PivotTables, PivotCharts, slicers, conditional formatting, and KPI design
- **PostgreSQL:** Data validation, aggregation, filtering, grouping, conditional logic, and business queries
- **Data Analytics:** Exploratory data analysis, data-quality auditing, KPI development, and insight generation
- **Business Communication:** Dashboard storytelling, executive findings, recommendations, and project documentation

## Repository Structure

```text
Hospital_operations_Analysis/
├── Hospital_operations_Analytics/   # Project files and analysis
├── images/
│   ├── dashboard-overview.png
│   └── dashboard-details.png
└── README.md
```

**Main Excel workbook:** `healthcare cleaned data.xlsx`

## How to Review the Project

1. Open the Excel workbook and navigate to the dashboard worksheet.
2. Use the slicers to filter by admission type, medical condition, or insurance provider.
3. Review the audit and summary worksheets to examine the supporting data-quality checks.
4. Open the SQL script to review the validation queries and business analysis.

## Project Status

- [x] Excel data cleaning and validation
- [x] Data-quality audit
- [x] Excel dashboard
- [x] PostgreSQL analysis script prepared
- [ ] PostgreSQL import and query execution
- [x] Business findings and recommendations
- [ ] Python exploratory analysis and visualization
- [ ] Power BI or Tableau dashboard

## Dataset and Privacy Note

This project uses **synthetic healthcare data** for educational and portfolio purposes. It does not contain real patient information or protected health information (PHI). The findings demonstrate analytical methods and should not be interpreted as clinical conclusions.

## Author

**Maheshwari Swamy**  
Aspiring Healthcare Data Analyst
