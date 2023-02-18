# Weather-Forecasting-Analysis
### About the project:
Weather prediction is one of the most certainly required information in all over the regions It involves collecting global meteorological surface and upper-air observations, preparing global surface and upper air pressure, temperature, moisture, and wind analyses at frequent time intervals based upon these observations we predict some data for upcoming days weather conditions.
<br><br>
📊This project is divided into two modules:

> 1️⃣ Data Preprocessing and Analysis

> 2️⃣ Data Visualization



📌Technology and Tools used in project: 

> Python (Numpy and Pandas) 

> Excel 

> SQL (MySQL) 

> PowerBI (For Visualization) 

## Module 1:

The tasks to be performed for cleaning the data set are given below:

Subtask 1: Correct years for given data set

Subtask 2: removal of duplicate rows and duplicate Columns

Subtask 3: fix a few labels in the given data set

Subtask 4: Encoding data into suitable format

The dataset we used in this project was populated using a scraping technique, the encoding method may be different we prefer UTF-8 encoding as it is majorly used in all the database servers. To do so, perform the below tasks:


1. In the menu bar of excel, select option data. Then select from text/CSV and choose the file in which you made changes using excel

2. The default file origin will be UTF -8. Keep all the field as it is and select load

3. Save the file as CSV(comma-delimited) file.

4. Import the file into your SQL database (Analyze the dataset with respect to your database system and then change it, if necessary).

### **Go through the datasets for a perfect understanding:**

Since you have analyzed the complete data set accurately, Let's answer the following requirements to proceed further for a better understanding

1. Give the count of the minimum number of days for the time when temperature reduced

2. Find the temperature as Cold / hot by using the case and avg of values of the given data set

3. Can you check for all 4 consecutive days when the temperature was below 30 Fahrenheit

4. Can you find the maximum number of days for which temperature dropped

5. Can you find the average humidity average from the dataset (NOTE:should contain the following clauses: group by, order by, date )

6. Use the GROUP BY clause on the Date column and make a query to fetch details for average windspeed ( which is now windspeed done in task 3 )

7. Please add the data in the dataset for 2034 and 2035 as well as forecast predictions for these years (NOTE:data consistency and uniformity should be maintained )

8. If the maximum gust speed increases from 55mph, fetch the details for the next 4 days

9. Find the number of days when the temperature went below 0 degrees Celsius

10. Create another table with a “Foreign key” relation with the existing given data set.


## Module 2: Visualizing data using Power BI

Given below are the requirements, create a dashboard consisting of mentioned visuals.

1. Design a dashboard of your choice and imagination with attractive wallpapers and design visuals

2. The dashboard must consist of basic power bi visuals like stacked bar charts, cards, line charts, pie charts, etc.

3. You can use any visual capable of representing the given dataset.

4. Columns having numeric data types are to be majorly used in visuals

5. Include the Weather dataset and the data table you created in the above task ( question 10 ).


## Guidelines and submission steps are mentioned below:

For module 1, you must submit 4 files as mentioned below in the submission tab after every module.

-  A Text file consisting of the solutions to each SQL requirement.

- .py file used for cleaning the dataset

- Cleaned .csv file of playstore_apps dataset

- Cleaned .csv file of playstore_reviews dataset

- *create a zip file of all 4 files and then submit in the submission tab.

- A Youtube video link that consists of a screen-recorded solution of the query. (Run the query and display its solution).

### **For module 2, you have to submit:**

- A power bi file (.pbix)

- A Youtube video link consists of a screen-recorded solution of the designed dashboard.
