# Hospital Operations & Data Quality Analysis

![Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=flat-square\&logo=microsoftexcel\&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=flat-square\&logo=microsoftsqlserver\&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square\&logo=python\&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat-square\&logo=pandas\&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat-square\&logo=scikitlearn\&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557C?style=flat-square)
![Healthcare Analytics](https://img.shields.io/badge/Domain-Healthcare_Analytics-0B84A5?style=flat-square)
![Status](https://img.shields.io/badge/Status-Complete-success?style=flat-square)

## Executive Summary

This portfolio project analyzes **54,966 cleaned hospital admission records** to evaluate operational activity, patient characteristics, billing performance, data quality, admission trends, high-cost cases, and potential long-stay patterns.

I created an end-to-end analytical workflow using **Microsoft Excel, SQL Server, Python, Pandas, Matplotlib, and scikit-learn**. The workflow preserves the original data, removes exact duplicates, validates critical fields, flags unreliable billing records, produces decision-ready visualizations, creates a rule-based operational review process, and evaluates a machine-learning experiment.

The original dataset contained **55,500 records**. During data preparation, **534 exact duplicates** were removed, leaving **54,966 cleaned records**. Another **106 zero or negative billing records** were flagged for review and excluded from valid financial calculations. This resulted in **54,860 valid billing records** and a **99.81% billing-quality pass rate**.

Python independently confirmed the major Excel and SQL findings. A rule-based screening process identified **1,908 high-attention records**, representing **3.47%** of admissions. A logistic-regression experiment was also developed to predict long hospital stays. The model produced a **ROC-AUC of 0.513**, demonstrating that the available synthetic features were not sufficient for reliable prediction.

## Key Results

- Analyzed **54,966 cleaned hospital admission records** across Excel, SQL Server, and Python.
- Identified **106 zero or negative billing records** for review and excluded them from valid financial calculations.
- Achieved approximately **99.81% billing-quality pass rate**.
- **Arthritis** recorded the highest admission volume with **9,218 admissions**.
- **Asthma** had the longest average length of stay at approximately **15.68 days**.
- **Obesity** had the highest average valid billing amount at approximately **$25,859**.
- Rule-based operational screening identified **1,908 high-attention records (3.47% of admissions)**.
- The exploratory long-stay model showed limited predictive performance, demonstrating that the available synthetic features were insufficient for reliable prediction.

> **Business takeaway:** The project shows how data-quality controls, operational analytics, and responsible exploratory modeling can turn hospital admission data into decision-support insights.

## Business Objective

The project was designed to answer the following questions:

* What is the total volume of hospital admissions?
* Which medical conditions occur most frequently?
* Which admission types account for the most activity?
* Which conditions are associated with longer hospital stays?
* How are admissions distributed across insurance providers?
* Which conditions and insurers have higher average valid billing?
* Which records contain billing or data-quality problems?
* How have admissions changed over time?
* Which months have the highest and lowest admission activity?
* Which patient age groups account for the most admissions?
* Which records may require additional operational review?
* Can information available around admission predict a long hospital stay?
* What data limitations affect hospital, doctor, and predictive analysis?

## Dataset

The synthetic dataset contains hospital admission records with:

* Patient age and gender
* Blood type
* Medical condition
* Admission and discharge dates
* Admission type
* Doctor and hospital
* Insurance provider
* Billing amount
* Room number
* Medication
* Test results
* Length of stay
* Data-quality validation fields

> **Privacy note:** This dataset is synthetic and does not contain real patient information or protected health information. The exported operational-review file excludes patient names, doctors, and hospital names.

## Analytical Workflow

```mermaid
flowchart TD
    A["Raw Healthcare Data"] --> B["Excel Cleaning and Validation"]
    B --> C["SQL Server Analysis"]
    C --> D["Python EDA and Visualization"]
    D --> E["Operational Screening"]
    E --> F["Machine-Learning Experiment"]
    F --> G["Model Evaluation and Governance"]
    G --> H["Executive Recommendations"]
```

## Tools and Skills Demonstrated

| Tool            | Work Completed                                                                                 |
| --------------- | ---------------------------------------------------------------------------------------------- |
| Microsoft Excel | Cleaning, validation rules, audit checks, pivot tables, KPI cards, dashboard, and slicers      |
| SQL Server      | Import validation, filtering, aggregation, reusable analytical view, and KPI reconciliation    |
| Python          | Data validation, exploratory analysis, feature engineering, operational screening, and exports |
| Pandas          | Filtering, grouping, aggregation, reshaping, quality checks, and summary tables                |
| Matplotlib      | Business charts, monthly trends, operational screening chart, and confusion matrix             |
| scikit-learn    | Train/test split, preprocessing pipeline, baseline model, logistic regression, and evaluation  |
| GitHub          | Version-controlled project documentation and portfolio presentation                            |
| Generative AI   | Coding assistance, debugging, documentation, and executive interpretation under human review   |

## Excel Analysis

Excel was used to create a transparent cleaning, validation, and reporting layer.

### Data Preparation

* Preserved the original dataset in a separate worksheet
* Removed **534 exact duplicate rows**
* Standardized field names
* Checked required fields for missing values
* Validated patient ages and room numbers
* Checked admission and discharge dates
* Calculated patient length of stay
* Validated admission-type categories
* Flagged zero and negative billing amounts
* Created an overall quality status
* Preserved unreliable records for auditing instead of overwriting them

### Data-Quality Fields

The cleaned workbook includes:

* `Age_Check`
* `Billing_Check`
* `Room_Check`
* `Date_Check`
* `Missing_Data_Check`
* `Category_Check`
* `Length_of_Stay`
* `Overall_Quality_Status`

### Excel Reporting

* Created a data-quality audit report
* Built pivot tables for conditions, admission types, insurers, length of stay, and test results
* Created patient age groups
* Developed KPI cards
* Added interactive slicers
* Built an interactive hospital-operations dashboard
* Reconciled dashboard metrics with the cleaned dataset

## SQL Server Analysis

The cleaned data was imported into the `Healthcare_Analytics` database as `dbo.Healthcare_Data`. SQL Server Management Studio was used to validate the import and perform data-quality and business analysis.

### SQL Techniques Demonstrated

* `SELECT`, `WHERE`, `CASE`, `GROUP BY`, and `ORDER BY`
* `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`
* Conditional aggregation
* Percentage calculations
* Window functions
* Date analysis with `YEAR()` and `MONTH()`
* Data-type validation with `TRY_CONVERT()`
* Top-N analysis
* Reusable analytical views

### Valid Billing View

The view `dbo.Valid_Healthcare_Data` excludes billing amounts less than or equal to zero from financial calculations while preserving the original records for audit purposes.

This prevents unreliable billing records from distorting:

* Total billing
* Average billing
* Condition-level billing
* Insurance-provider billing
* Other financial KPIs

## Python Analysis

Python was used to validate Excel and SQL results, perform exploratory analysis, create visualizations, engineer features, build an operational screening process, and evaluate a machine-learning experiment.

### Python Data Validation

The Python analysis confirmed:

* **54,966 cleaned rows**
* **23 original columns**
* No missing values
* No exact duplicates in the cleaned dataset
* Correct admission and discharge date types
* Correct numerical types for age, billing, room number, and length of stay
* **106 negative billing records**
* **54,860 valid billing records**
* **99.81% valid billing rate**

Column names were standardized into lowercase `snake_case` format.

Examples:

* `Billing _Amount` became `billing_amount`
* `Medical_ Condition` became `medical_condition`
* `Overall _quality _status` became `overall_quality_status`

### Python Exploratory Analysis

Python was used to analyze:

* Admissions by medical condition
* Average length of stay by condition
* Average valid billing by condition
* Admission-type distribution
* Monthly admission trends
* Admissions per calendar day
* Insurance-provider distribution
* Average valid billing by insurer
* Hospital-name fragmentation
* Data-quality status
* Age-group distribution
* Gender distribution
* Test-result distribution
* Numerical correlations
* High-cost billing records

### Python Visualizations

The notebook contains:

* Admissions by medical condition
* Average length of stay by condition
* Average valid billing by condition
* Admissions by admission type
* Monthly hospital admissions trend
* Corrected monthly trend excluding incomplete months
* Admissions by insurance provider
* Patient distribution by age group
* Operational attention-level distribution
* Long-stay model confusion matrix

## Key Performance Indicators

| KPI                               |            Result |
| --------------------------------- | ----------------: |
| Original records                  |            55,500 |
| Exact duplicates removed          |               534 |
| Cleaned records                   |            54,966 |
| Valid billing records             |            54,860 |
| Invalid billing records           |               106 |
| Billing-quality pass rate         |            99.81% |
| Average patient age               |       51.54 years |
| Patient age range                 |       13–89 years |
| Average length of stay            |        15.50 days |
| Average valid billing             |        $25,594.63 |
| Total valid billing               | $1,404,121,601.31 |
| Analysis period                   | May 2019–May 2024 |
| Complete-month average admissions | Approximately 917 |
| High-attention records            |             1,908 |
| High-attention rate               |             3.47% |

## Business Findings

### 1. Medical Conditions

Admissions were distributed relatively evenly across the six medical conditions.

| Medical Condition | Admissions |
| ----------------- | ---------: |
| Arthritis         |      9,218 |
| Diabetes          |      9,216 |
| Hypertension      |      9,151 |
| Obesity           |      9,146 |
| Cancer            |      9,140 |
| Asthma            |      9,095 |

Arthritis had the highest number of admissions, while Asthma had the lowest. The difference between them was only **123 admissions**.

### 2. Average Length of Stay

| Medical Condition | Average Stay |
| ----------------- | -----------: |
| Asthma            |   15.68 days |
| Arthritis         |   15.50 days |
| Cancer            |   15.50 days |
| Obesity           |   15.45 days |
| Hypertension      |   15.44 days |
| Diabetes          |   15.43 days |

Asthma had the longest average stay. However, the difference between the highest and lowest averages was only **0.25 days**, indicating limited variation.

### 3. Admission Types

| Admission Type | Admissions | Percentage |
| -------------- | ---------: | ---------: |
| Elective       |     18,473 |     33.61% |
| Urgent         |     18,391 |     33.46% |
| Emergency      |     18,102 |     32.93% |

All three admission types represented approximately one-third of total admissions.

### 4. Average Valid Billing by Medical Condition

| Medical Condition | Average Valid Billing |
| ----------------- | --------------------: |
| Obesity           |            $25,859.22 |
| Diabetes          |            $25,714.33 |
| Asthma            |            $25,685.39 |
| Hypertension      |            $25,559.84 |
| Arthritis         |            $25,542.90 |
| Cancer            |            $25,205.92 |

Obesity had the highest average valid billing, while Cancer had the lowest. The difference was **$653.30**.

### 5. Insurance-Provider Distribution

| Insurance Provider | Admissions | Percentage |
| ------------------ | ---------: | ---------: |
| Cigna              |     11,139 |     20.27% |
| Medicare           |     11,039 |     20.08% |
| UnitedHealthcare   |     11,014 |     20.04% |
| Blue Cross         |     10,952 |     19.93% |
| Aetna              |     10,822 |     19.69% |

Admissions were distributed almost evenly across the five insurance providers.

### 6. Average Valid Billing by Insurance Provider

| Insurance Provider | Average Valid Billing |
| ------------------ | --------------------: |
| Medicare           |            $25,678.09 |
| Blue Cross         |            $25,639.27 |
| Aetna              |            $25,615.26 |
| Cigna              |            $25,582.23 |
| UnitedHealthcare   |            $25,458.89 |

The difference between the highest and lowest insurer averages was only **$219.20**.

### 7. Test Results

| Test Result  | Records | Percentage |
| ------------ | ------: | ---------: |
| Abnormal     |  18,437 |     33.54% |
| Normal       |  18,331 |     33.35% |
| Inconclusive |  18,198 |     33.11% |

Test-result categories were distributed almost equally.

### 8. Gender Distribution

| Gender | Records | Percentage |
| ------ | ------: | ---------: |
| Male   |  27,496 |     50.02% |
| Female |  27,470 |     49.98% |

The gender distribution was almost exactly balanced.

### 9. Patient Age Groups

| Age Group | Patients | Percentage |
| --------- | -------: | ---------: |
| Under 18  |      116 |      0.21% |
| 18–34     |   13,485 |     24.53% |
| 35–49     |   12,154 |     22.11% |
| 50–64     |   12,288 |     22.36% |
| 65+       |   16,923 |     30.79% |

Patients aged 65 and older were the largest group.

### 10. Monthly Admission Trends

The admission dates range from **May 8, 2019 through May 7, 2024**, covering portions of 61 calendar months.

May 2019 and May 2024 were incomplete months. They were excluded from the corrected monthly comparison to prevent misleading decreases caused by partial data.

For complete months from June 2019 through April 2024:

* Average monthly admissions: approximately **917**
* Highest monthly total: **August 2020 — 1,003 admissions**
* Lowest monthly total: **February 2022 — 772 admissions**
* Highest adjusted daily rate: **August 2020 — 32.35 admissions per day**
* Lowest adjusted daily rate: **February 2022 — 27.57 admissions per day**

Adjusting for the number of days in each month confirmed that February 2022 remained the lowest-activity month.

### 11. Hospital-Name Fragmentation

The dataset contained **39,876 unique hospital names**. The ten most frequently recorded hospital names represented only **0.65%** of admissions.

Names such as `LLC Smith`, `Smith LLC`, `Ltd Smith`, and `Smith Ltd` indicate possible entity-standardization problems.

Hospital workload rankings should not be treated as reliable without:

* Standardized hospital names
* Verified hospital identifiers
* A hospital master-data table
* Entity-resolution rules

### 12. Correlation Analysis

The numerical relationships were all close to zero.

| Variables                         | Correlation |
| --------------------------------- | ----------: |
| Age and billing amount            |      -0.003 |
| Age and length of stay            |       0.008 |
| Billing amount and length of stay |      -0.005 |

The dataset does not show meaningful linear relationships among these variables. These results do not support causal conclusions.

## High-Cost Record Analysis

High-cost records were defined as valid billing amounts at or above the **95th percentile**.

* High-cost threshold: **$47,641.28**
* High-cost records: **2,743**
* Share of valid billing records: approximately **5%**

### High-Cost Rate by Condition

| Medical Condition | Valid Records | High-Cost Records | High-Cost Rate |
| ----------------- | ------------: | ----------------: | -------------: |
| Hypertension      |         9,131 |               474 |          5.19% |
| Asthma            |         9,077 |               462 |          5.09% |
| Arthritis         |         9,207 |               465 |          5.05% |
| Obesity           |         9,127 |               460 |          5.04% |
| Diabetes          |         9,197 |               463 |          5.03% |
| Cancer            |         9,121 |               419 |          4.59% |

Hypertension had the highest high-cost rate, while Cancer had the lowest. The difference was only **0.60 percentage points**, so it should be treated as a small variation.

## Operational Attention Screening

A transparent rule-based screening process was created to identify records that may require additional operational review.

One point was assigned for each condition:

* Emergency admission
* Abnormal test result
* Length of stay greater than 23 days
* Valid billing amount at or above $47,641.28

### Attention Categories

* **Low:** Score of 0
* **Medium:** Score of 1 or 2
* **High:** Score of 3 or 4

| Attention Level | Records | Percentage |
| --------------- | ------: | ---------: |
| Low             |  17,831 |     32.44% |
| Medium          |  35,227 |     64.09% |
| High            |   1,908 |      3.47% |

The **1,908 high-attention records** were exported to `Python/high_attention_records.csv`.

The exported file excludes patient names, doctors, and hospital names.

> This score is intended only for portfolio-based operational analysis. It is not a validated clinical-risk score and must not be used to make medical decisions.

## Machine-Learning Experiment

A balanced logistic-regression model was created to evaluate whether variables available around admission could predict a long hospital stay.

### Target Variable

A long stay was defined as more than **23 days**, based on the dataset’s 75th percentile.

* Not-long-stay records: **42,186**
* Long-stay records: **12,780**

### Model Features

The model used:

* Age
* Gender
* Blood type
* Medical condition
* Admission type
* Insurance provider

Billing amount and discharge date were excluded because they would not be reliably available at admission and could create data leakage.

### Train/Test Split

* Training records: **43,972**
* Testing records: **10,994**
* Training share: 80%
* Testing share: 20%
* Stratified split used to preserve the target distribution
* `random_state=42` used for reproducibility

### Models Evaluated

1. Majority-class baseline
2. Balanced logistic regression

### Model Results

| Model                        | Accuracy | Long-Stay Precision | Long-Stay Recall | Long-Stay F1 | ROC-AUC |
| ---------------------------- | -------: | ------------------: | ---------------: | -----------: | ------: |
| Majority-Class Baseline      |    0.768 |               0.000 |            0.000 |        0.000 |   0.500 |
| Balanced Logistic Regression |    0.506 |               0.240 |            0.518 |        0.328 |   0.513 |

### Confusion Matrix

| Actual / Predicted | Not Long Stay | Long Stay |
| ------------------ | ------------: | --------: |
| Not Long Stay      |         4,237 |     4,201 |
| Long Stay          |         1,232 |     1,324 |

The logistic-regression model:

* Correctly identified **1,324 long-stay cases**
* Missed **1,232 long-stay cases**
* Incorrectly flagged **4,201 not-long-stay cases**
* Produced a **ROC-AUC of 0.513**

### Model Decision

The model should **not be deployed**.

The available synthetic features contain very little predictive signal. The baseline’s higher accuracy was caused by class imbalance and did not represent useful predictive performance because it identified no long-stay cases.

A reliable future model would require variables such as:

* Diagnosis severity
* Comorbidities
* Prior hospital utilization
* Clinical procedures
* Laboratory measurements
* Staffing levels
* Bed availability
* Discharge barriers
* Social determinants of health
* Stable patient and admission identifiers

Retaining and documenting the unsuccessful experiment demonstrates responsible model evaluation. A weak model should be rejected rather than presented as successful.

## AI-Assisted Workflow and Governance

Generative AI was used as a coding and documentation assistant.

### AI-Assisted Tasks

* Drafting Python and SQL code
* Explaining code in beginner-friendly language
* Debugging code and warning messages
* Suggesting data-quality tests
* Structuring exploratory analysis
* Drafting visualization code
* Supporting feature-engineering ideas
* Drafting executive findings
* Organizing project documentation

### Human Responsibilities

* Validating formulas and calculations
* Confirming table and column names
* Running and testing every code block
* Comparing Python results with SQL and Excel
* Reviewing data-quality rules
* Checking for data leakage
* Evaluating model performance
* Rejecting the weak model
* Confirming business interpretations
* Approving final recommendations

Excel, SQL, and Python outputs remain the source of truth. AI-generated content was reviewed and validated before inclusion.

## Recommendations

### Data Quality

* Route zero and negative billing records to a billing-review queue.
* Calculate financial KPIs using validated billing records.
* Preserve invalid records for auditing rather than overwriting them.
* Automate checks for missing values, invalid dates, implausible ages, invalid room numbers, and category inconsistencies.
* Add unique `Admission_ID` and `Patient_ID` fields.
* Add stable `Hospital_ID` and `Doctor_ID` fields.
* Maintain hospital and doctor master-data tables.
* Apply standardized naming and entity-resolution rules.

### Hospital Operations

* Investigate factors contributing to lower admission activity in February 2022.
* Use daily admission rates when comparing months of different lengths.
* Monitor the 65+ population because it represents the largest patient group.
* Review high-attention records through an operational workflow.
* Investigate long stays using additional clinical and discharge-planning information.

### Predictive Analytics

* Do not deploy the current long-stay model.
* Collect stronger clinical and operational predictors.
* Establish a clinically meaningful target definition.
* Compare future models with simple baseline models.
* Evaluate precision, recall, F1-score, ROC-AUC, and operational impact.
* Require stakeholder review and validation before deployment.

## Dashboard Preview

### Hospital Operations Overview

![Hospital Operations Dashboard](images/dashboard-overview.png)

### Data Quality and Detailed Analysis

![Hospital Operations Details](images/dashboard-details.png)

## Repository Structure

```text
Hospital_operations_Analysis/
├── Hospital operations Analytics/
│   └── Excel, SQL, cleaned data, and supporting analysis files
├── Python/
│   ├── Hospital_Operations_Python.ipynb
│   ├── high_attention_records.csv
│   ├── model_evaluation.csv
│   └── README.md
├── images/
│   ├── dashboard-overview.png
│   └── dashboard-details.png
└── README.md
```

## Project Deliverables

* Cleaned Excel workbook
* Original and cleaned data layers
* Data-quality validation columns
* Data-quality audit report
* Interactive Excel KPI dashboard
* Cleaned CSV for SQL Server
* Complete SQL analysis script
* Reusable valid-billing SQL view
* SQL KPI summary
* Python exploratory-analysis notebook
* Python data-quality validation
* Python charts and monthly trend analysis
* De-identified high-attention review file
* Machine-learning experiment
* Model-evaluation CSV
* Confusion-matrix visualization
* Model-governance documentation
* Executive findings and recommendations
* Recruiter-ready GitHub documentation

## How to Reproduce the SQL Analysis

1. Open SQL Server Management Studio.
2. Create a database named `Healthcare_Analytics`.
3. Import the cleaned healthcare CSV as `dbo.Healthcare_Data`.
4. Open the SQL analysis script.
5. Run the queries in sequence.
6. Create the `dbo.Valid_Healthcare_Data` view.
7. Compare the results with the saved SQL KPI summary.

## How to Reproduce the Python Analysis

1. Install Python or Anaconda.
2. Open Jupyter Notebook.
3. Place the cleaned Excel workbook in the notebook’s working folder.
4. Open `Python/Hospital_Operations_Python.ipynb`.
5. Confirm the Excel filename in `pd.read_excel()` matches the local workbook.
6. Run the notebook cells in order.
7. Compare the Python KPIs with the Excel and SQL results.
8. Review `Python/high_attention_records.csv`.
9. Review `Python/model_evaluation.csv`.
10. Confirm that the machine-learning conclusion remains supported by the evaluation results.

## Project Status

* [x] Excel data cleaning and validation
* [x] Excel data-quality audit
* [x] Excel dashboard and KPI reporting
* [x] SQL Server database and data import
* [x] SQL data-quality analysis
* [x] SQL business analysis
* [x] Reusable valid-billing SQL view
* [x] Python exploratory analysis
* [x] Python data validation
* [x] Python visualizations
* [x] Monthly trend correction
* [x] High-cost record analysis
* [x] Operational attention screening
* [x] Train/test split
* [x] Machine-learning experiment
* [x] Baseline comparison
* [x] Model evaluation
* [x] Model-governance conclusion
* [x] Cross-tool validation
* [x] Executive recommendations
* [x] GitHub portfolio documentation

## Limitations

* The dataset is synthetic and should not be interpreted as a real clinical or financial benchmark.
* Stable patient and admission identifiers are unavailable.
* Reliable readmission analysis cannot be performed.
* The dataset contains 39,876 distinct hospital names, limiting provider-level analysis.
* Hospital and doctor names may contain inconsistent entity naming.
* Invalid billing records were flagged and excluded rather than overwritten.
* The dataset lacks diagnosis severity, comorbidities, procedures, prior utilization, staffing, and discharge-barrier information.
* Correlations among the primary numerical variables were close to zero.
* The long-stay model performed only slightly better than random guessing.
* The operational attention score is not clinically validated.
* No model or score in this project should be used for real patient-care decisions.

## Portfolio Summary

This project demonstrates an end-to-end analytics workflow combining data cleaning, quality controls, financial validation, SQL analysis, Python exploration, visualization, feature engineering, machine learning, governance, and executive communication.

It also demonstrates an important professional principle: analytical value does not come from forcing a positive result. The long-stay model was evaluated against a baseline, found to be unreliable, and rejected with clear recommendations for improving the underlying data.
