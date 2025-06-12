#  Crowdfunding Dashboard Project

##  Overview

Crowdfunding is a way of raising money where many people contribute small amounts to support a project, idea, or business. This is usually done online.

**Types of Crowdfunding:**
- **Reward-based**: Backers receive rewards.
- **Equity-based**: Backers get shares or equity.
- **Donation-based**: No return expected.
- **Loan-based**: Money is repaid with interest.

---

##  Tools Used
- Microsoft Excel  
- Power BI  
- Tableau  
- MySQL  

---

##  Data & Cleaning Process

**Data Sources:**  
4 Excel files: `category`, `location`, `creator`, `project`

**Data Cleaning Steps (using Power Query):**
- Imported all files
- Removed duplicates
- Sorted and cleaned columns
- Formatted dates and text properly

---

##  Data Modeling

![data modelling](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/modelingp.png)

---

##  Key Insights

- **Total Projects**: 366,000  
- **Total Backers**: 366,000  
- **Total Amount Raised**: $16,041M  
- **Average Project Duration**: 79 days  
- **Projects by Outcome**: 169

---

##  Excel Dashboard

**Steps:**
- Created a calendar table using date/time functions.
- Applied formulas like `SUM`, `COUNT`, `AVERAGE`, `SUMIF`, and `IF`.
- Built KPIs and charts for analysis.

## Excel Dashboard Image:

![Excel dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardE.png)

---

##  Power BI Dashboard

**Steps:**
- Imported Excel files into Power BI using Power Query.
- Used DAX functions: `COUNT`, `SUM`, `DIVIDE`, etc.
- Converted epoch dates to readable dates.
- Created calculated columns and custom KPIs.
- Designed interactive visuals and dashboards.

##  Power Bi Dashboard Image:

![powerbi dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardp.png)

---

##  Tableau Dashboard

**Steps:**
- Converted all CSV files to Excel.
- Imported all data into Tableau.
- Built relationships between data sources.
- Created measures using LOD expressions.
- Developed interactive dashboards.

## Tableau dashboard Image:

![tableau dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardT.png)
---

##  SQL Analysis (MySQL)

**Functions Used:**
- `FROM_UNIXTIME()`, `DATE()`, `YEAR()`, `MONTHNAME()`, `QUARTER()`
- `WEEKDAY()`, `DAYNAME()`, `CASE`, `CONCAT()`
- `COUNT()`, `DISTINCT`, `SUM()`, `ROUND()`, `AVG()`, `DATEDIFF()`
- `GROUP BY`, `ORDER BY`, `WHERE`, subqueries

**Epoch time and date change into human readable time and date**
- SELECT 
  projectid, state, name, country, creator_id, location_id, category_id,
  DATE(FROM_UNIXTIME(created_at)) AS created_at_converted,
  DATE(FROM_UNIXTIME(deadline)) AS deadline_converted,
  DATE(FROM_UNIXTIME(updated_at)) AS updated_at_converted,
  DATE(FROM_UNIXTIME(state_changed_at)) AS state_changed_at_converted,
  DATE(FROM_UNIXTIME(launched_at)) AS launched_at_converted,
  FROM_UNIXTIME(deadline) - FROM_UNIXTIME(created_at) AS average_days,
  goal * static_usd_rate AS goal_usd
FROM projects
ORDER BY projectid ASC;

![powerbi dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardp.png)

**Use epoch date to create calender table**
- SELECT DISTINCT
  DATE(FROM_UNIXTIME(created_at)) AS dates,
  YEAR(FROM_UNIXTIME(created_at)) AS year,
  MONTH(FROM_UNIXTIME(created_at)) AS month_number,
  MONTHNAME(FROM_UNIXTIME(created_at)) AS month_name,
  QUARTER(FROM_UNIXTIME(created_at)) AS quarter_number,
  CONCAT(YEAR(FROM_UNIXTIME(created_at)), ' - ', MONTHNAME(FROM_UNIXTIME(created_at))) AS year_month,
  DAYOFWEEK(FROM_UNIXTIME(created_at)) AS weekday_status,
  DAYNAME(FROM_UNIXTIME(created_at)) AS day_name,
  CONCAT('fiscal_quarter-', QUARTER(FROM_UNIXTIME(created_at))) AS fiscal_quarter,
  CONCAT('fiscal_month-', MONTH(FROM_UNIXTIME(created_at))) AS fiscal_month
FROM projects
ORDER BY dates ASC;

![powerbi dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardp.png)

**Total number of projects**
- SELECT COUNT(projectid) AS total_projects FROM projects;

![powerbi dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardp.png)

**By location**
- SELECT COUNT(location_id) AS total_by_location FROM projects;

![powerbi dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardp.png)

**By category**
- SELECT COUNT(DISTINCT category_id) AS total_by_category FROM projects;

![powerbi dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardp.png)

**Projects per year**
- SELECT YEAR(FROM_UNIXTIME(created_at)) AS year, COUNT(*) AS total FROM projects GROUP BY year;

![powerbi dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardp.png)

**Projects per month**
- SELECT MONTH(FROM_UNIXTIME(created_at)) AS month, COUNT(*) AS total FROM projects GROUP BY month;

![powerbi dashboard](https://github.com/Tyaswanth9/Crowd-funding-project/blob/myself/dashboardp.png)


---

##  Conclusion

- A high percentage of projects were successful overall.
- **2015** had the highest total amount raised.
- The **average duration** of projects was reduced in 2015.
- **Film & Video** was the top successful category every year.
- **Design** was the second-most successful.
- Failed projects slightly outnumbered successful ones in most years.

---

##  Reflection

During this project, I improved my skills in:
- Excel: Formulas, dashboards, calendar tables
- Power BI: DAX, Power Query, data modeling, interactive visuals
- Tableau: LOD expressions, data connections, dashboards
- MySQL: Querying, filtering, data aggregation

This project helped me understand end-to-end data handling and dashboard creation.

---

**Note: This code is provided for reference only - do not for use , copy , modify , or distributions, or reproduction.**
