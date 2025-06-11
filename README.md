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

*Insert your data model image here*

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

*Insert Excel dashboard screenshot here*

---

##  Power BI Dashboard

**Steps:**
- Imported Excel files into Power BI using Power Query.
- Used DAX functions: `COUNT`, `SUM`, `DIVIDE`, etc.
- Converted epoch dates to readable dates.
- Created calculated columns and custom KPIs.
- Designed interactive visuals and dashboards.

*Insert Power BI dashboard screenshot here*

---

##  Tableau Dashboard

**Steps:**
- Converted all CSV files to Excel.
- Imported all data into Tableau.
- Built relationships between data sources.
- Created measures using LOD expressions.
- Developed interactive dashboards.

## dashboard ##


---

##  SQL Analysis (MySQL)

**Functions Used:**
- `FROM_UNIXTIME()`, `DATE()`, `YEAR()`, `MONTHNAME()`, `QUARTER()`
- `WEEKDAY()`, `DAYNAME()`, `CASE`, `CONCAT()`
- `COUNT()`, `DISTINCT`, `SUM()`, `ROUND()`, `AVG()`, `DATEDIFF()`
- `GROUP BY`, `ORDER BY`, `WHERE`, subqueries

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

##  Screenshots & Files

- 📁 Excel Dashboard – *[add image or link]*
- 📁 Power BI Dashboard – *[add image or link]*
- 📁 Tableau Dashboard – *[add image or link]*
- 📁 Data Model – *[add image or link]*

## Note: This code is provided for  reference only ** not for use , modification , distributions, or reproduction**.
