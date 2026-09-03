# Hospital Operations and Data Quality Analysis

![Microsoft Excel](https://img.shields.io/badge/Microsoft%20Excel-217346?style=flat-square&logo=microsoftexcel&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white)
![Data Analytics](https://img.shields.io/badge/Data%20Analytics-Healthcare-0B84A5?style=flat-square)

## Project Overview

This project analyzes a synthetic hospital dataset to help hospital leaders understand patient admissions, medical conditions, length of stay, billing patterns, test results, and data quality. I cleaned and validated the data in Microsoft Excel, built an interactive Excel dashboard, and used PostgreSQL to answer operational and financial business questions.

The project demonstrates an end-to-end analytics workflow:

**Raw healthcare data → Excel cleaning and validation → PostgreSQL analysis → Interactive dashboard → Business insights**

## Business Questions

- How many patient records, hospitals, doctors, and insurance providers are represented?
- Which medical conditions have the most admissions?
- What is the average length of stay by medical condition?
- How are elective, emergency, and urgent admissions distributed?
- How do billing totals vary across insurance providers?
- What percentage of records pass the defined data-quality checks?
- How are normal, abnormal, and inconclusive test results distributed?

## Dashboard Preview

> Add the two dashboard screenshots to an `images` folder in the GitHub repository using the filenames below.

![Hospital Operations Dashboard Overview](images/dashboard-overview.png)

![Hospital Operations Dashboard Details](images/dashboard-details.png)

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Total records | 54,966 |
| Total hospitals | 39,876 |
| Total doctors | 40,341 |
| Insurance providers | 5 |
| Average length of stay | 15.51 days |
| Average billing amount | $25,492.40 |
| Total billing amount | $1.40 billion |
| Data-quality pass rate | 99.81% |

## Key Findings

- Arthritis had the most admissions with **9,218 records**, closely followed by diabetes with **9,216**.
- Asthma had the fewest admissions with **9,095 records**, but the longest average stay at approximately **15.68 days**.
- Medical-condition volumes were distributed relatively evenly across the six conditions.
- Elective admissions were the largest category with **18,473 admissions (33.61%)**; emergency and urgent admissions were also close to one-third each.
- Test results were almost evenly divided among abnormal, inconclusive, and normal outcomes.
- The five insurance providers produced similar total billing amounts, with no single provider dominating the dataset.
- **99.81%** of records passed the data-quality rules; **106 billing records** required review.

## Data Cleaning and Quality Checks

The following validation steps were completed before analysis:

- Checked and removed duplicate records.
- Checked for missing values in important fields.
- Standardized date formats.
- Confirmed that discharge dates were not earlier than admission dates.
- Calculated patient length of stay.
- Validated patient ages and room numbers.
- Flagged invalid or negative billing amounts.
- Validated important category values.
- Created an `Overall_Quality_Status` field to classify records as **Pass**, **Warning**, or **Needs Review**.
- Added month and year fields for time-based analysis.

## Excel Dashboard Features

- KPI cards for operational, financial, and data-quality measures.
- PivotTables and PivotCharts for medical conditions, admission types, insurance providers, test results, and length of stay.
- Slicers for interactive filtering by admission type, medical condition, and insurance provider.
- A data-quality status chart for monitoring records that require attention.

## SQL Analysis

PostgreSQL was used to validate the cleaned dataset and answer business questions with:

- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, and `HAVING`
- Aggregate functions such as `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`
- Conditional logic with `CASE WHEN`
- Data-quality checks for invalid billing, ages, dates, and lengths of stay
- Analysis by medical condition, admission type, insurance provider, hospital, and doctor

## Tools and Skills

- **Microsoft Excel:** data cleaning, formulas, PivotTables, PivotCharts, slicers, conditional formatting, and dashboard design
- **PostgreSQL:** querying, aggregation, validation, and business analysis
- **GitHub:** project documentation and version control
- **Analytical skills:** data-quality auditing, KPI development, exploratory analysis, and insight communication

## Repository Structure

```text
hospital-operations-data-quality-analysis/
├── data/
│   ├── raw/
│   └── cleaned/
├── excel/
│   └── hospital_operations_analysis.xlsx
├── sql/
│   └── hospital_operations_analysis.sql
├── images/
│   ├── dashboard-overview.png
│   └── dashboard-details.png
└── README.md
```

## How to Explore the Project

1. Download the Excel workbook from the `excel` folder.
2. Open the dashboard sheet in Microsoft Excel.
3. Use the slicers to filter the dashboard by admission type, medical condition, or insurance provider.
4. Review the SQL file to see the queries used to validate the data and produce the findings.

## Project Status

- [x] Excel data cleaning and validation
- [x] Excel KPI dashboard
- [x] PostgreSQL analysis
- [x] Business findings and documentation
- [ ] Python exploratory analysis and visualization
- [ ] Power BI or Tableau dashboard

## Data Note

This portfolio project uses synthetic healthcare data for educational and analytical purposes. It does not contain real patient information or protected health information (PHI).

## Author

**Maheshwari Swamy**  
Aspiring Healthcare Data Analyst

