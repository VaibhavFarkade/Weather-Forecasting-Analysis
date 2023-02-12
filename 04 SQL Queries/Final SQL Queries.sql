DROP TABLE IF EXISTS weather_data;
CREATE TABLE weather_data (
  `Date` DATE,
  `Temperature` FLOAT,
  `Average humidity (%)` FLOAT,
  `Average dewpoint (°F)` FLOAT,
  `Average barometer (in)` FLOAT,
  `Average windspeed (mph)` FLOAT,
  `Average gustspeed (mph)` FLOAT,
  `Average direction (°deg)` FLOAT,
  `Rainfall for month (in)` FLOAT,
  `Rainfall for year (in)` FLOAT,
  `Maximum temperature (°F)` FLOAT,
  `Minimum temperature (°F)` FLOAT,
  `Maximum humidity (%)` FLOAT,
  `Minimum humidity (%)` FLOAT,
  `Maximum pressure` FLOAT,
  `Minimum pressure` FLOAT,
  `Maximum windspeed (mph)` FLOAT,
  `Maximum gust speed (mph)` FLOAT,
  `Maximum heat index (°F)` FLOAT,
  `diff_pressure` FLOAT
);

SELECT * FROM weather_data;

---------------------------------------------------------------------------------------------------------------------------------------

-- Give the count of the minimum number of days for the time when temperature reduced
WITH cte AS (
SELECT `Date`, `Minimum temperature (°F)` as temperature,
LAG(`Minimum temperature (°F)`) OVER (ORDER BY `Date`) AS prev_temp
FROM weather_data
)
SELECT COUNT(`Date`)
FROM cte
WHERE temperature < prev_temp;

---------------------------------------------------------------------------------------------------------------------------------------

-- Find the temperature as Cold / hot by using the case and avg of values of the given data set
SELECT `Date`,
CASE 
  WHEN (`Temperature` > (SELECT AVG(`Temperature`) FROM weather_data)) THEN 'hot' 
  ELSE 'cold' 
END AS "Cold/hot"
FROM weather_data;

---------------------------------------------------------------------------------------------------------------------------------------

-- Can you check for all 4 consecutive days when the temperature was below 30 Fahrenheit
WITH cte AS (
  SELECT Date,  `Minimum temperature (°F)`, 
         ROW_NUMBER() OVER (ORDER BY Date) AS row_num
  FROM weather_data
)
SELECT MIN(Date) AS start_date, MAX(Date) AS end_date
FROM (
  SELECT 
    date, `Minimum temperature (°F)`, row_num,
    SUM(CASE WHEN `Minimum temperature (°F)` < 30 THEN 1 ELSE 0 END) 
      OVER (ORDER BY row_num ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS count_below_30
  FROM cte
) t
WHERE count_below_30 = 4;

---------------------------------------------------------------------------------------------------------------------------------------

-- Can you find the maximum number of days for which temperature dropped
WITH temperatures AS (
  SELECT date, `Temperature`, 
         LAG(`Temperature`) OVER (ORDER BY date) AS prev_temp,
         ROW_NUMBER() OVER (ORDER BY date) AS row_num
  FROM weather_data
), drops AS (
  SELECT date, `Temperature`, prev_temp, row_num,
         SUM(CASE WHEN `Temperature` < prev_temp THEN 1 ELSE 0 END) 
           OVER (ORDER BY row_num ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS count_drops
  FROM temperatures
)
SELECT MAX(count_drops)
FROM drops;

---------------------------------------------------------------------------------------------------------------------------------------

-- Find the average of average humidity from the dataset
SELECT Date, ROUND(AVG(`Average humidity (%)`), 2) AS "Average_Humidity"
FROM weather_data
GROUP BY Date
ORDER BY Date;

---------------------------------------------------------------------------------------------------------------------------------------

-- If the maximum gust speed increases from 55mph, fetch the details for the next 4 days
WITH wind AS (
SELECT Date, `Maximum gust speed (mph)`,
LAG(`Maximum gust speed (mph)`) OVER (ORDER BY Date) AS prev_max_gust_speed,
ROW_NUMBER() OVER (ORDER BY Date) AS row_num
FROM weather_data
)
SELECT Date, `Maximum gust speed (mph)`
FROM wind
WHERE `Maximum gust speed (mph)` > 55
AND prev_max_gust_speed <= 55
AND row_num <= 4;

-- There are non such entries

-- Find the number of days when the temperature went below 0 degrees Celsius
SELECT COUNT(Date) AS "Number_of_Days_with_Minimum_Temperature_Below_Zero"
FROM weather_data
WHERE `Minimum temperature (°F)` < 0;
