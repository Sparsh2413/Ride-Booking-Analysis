# Ride Booking Data Analysis Project

## 📌 Project Title:
**Comprehensive Ride Booking Data Analysis**

## 📝 Description of the Dashboard:
This project involves analyzing a large dataset of ride bookings using MySQL, Python, MS Excel, and Power BI. The analysis covers booking trends, revenue insights, customer behavior, and cancellations.

## 📊 Key Insights & KPIs:
- **Total Ride Volume**: Trends over time.
- **Booking Status Breakdown**: Success vs. cancellations.
- **Revenue Breakdown**: By payment method and vehicle type.
- **Cancellation Analysis**: Reasons by customers and drivers.
- **Customer & Driver Ratings**: Trends and distributions.
- **Top Customers & Locations**: Most frequent users and hotspots.

## 📂 Files Included:
- `MySql.sql`: Deep dive into SQL-based data analysis.
- `EDA + Visualization -- Ridebookings Data (1).ipynb`: Exploratory Data Analysis with Python.
- `Bookings-100000-Rows-July.csv`: Cleaned and structured data.
- `ride_bookings.pbix`: Interactive Power BI dashboard.
- `README.md`: Documentation for project overview.

## 🛠 Data Analysis Process:

### 1️⃣ SQL Analysis
Performed in-depth analysis using SQL queries to extract insights from the dataset.

#### 🔹 SQL Queries Used:
(See detailed queries in `MySql.sql`)

#### 🔹 SQL Views for Easier Analysis:
```sql
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings WHERE Booking_Status = 'Success';
```
```sql
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance FROM bookings GROUP BY Vehicle_Type;
```
```sql
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS Total_Cancelled FROM bookings WHERE Booking_Status = 'Canceled by Customer';
```
```sql
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY Customer_ID ORDER BY total_rides DESC LIMIT 5;
```
```sql
CREATE VIEW Rides_cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) FROM bookings WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';
```
```sql
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
```
```sql
CREATE VIEW UPI_Payment AS
SELECT * FROM bookings WHERE Payment_Method = 'UPI';
```
```sql
CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM bookings GROUP BY Vehicle_Type;
```
```sql
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) as total_successful_ride_value FROM bookings WHERE Booking_Status = 'Success';
```
```sql
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides = 'Yes';
```

### 2️⃣ Python Data Analysis
Performed Exploratory Data Analysis (EDA) on the dataset using Python libraries like Pandas, Matplotlib, and Seaborn.

#### 🔹 Python Analysis Includes:
1. **Data Preprocessing**
   - Load dataset using Pandas.
   - Handle missing values and outliers.
   - Convert data types where necessary.

2. **Exploratory Data Analysis (EDA)**
   - Summary statistics (mean, median, mode, standard deviation).
   - Correlation analysis (Booking Value vs Distance, Ratings vs Distance).
   - Feature engineering (creating new insights like `Revenue per Distance`).

3. **Data Visualization**
   - Bar charts for top vehicle types and payment methods.
   - Line charts for ride booking trends over time.
   - Scatter plots for ride distance vs booking value.
   - Pie charts for cancellation breakdowns.

4. **Insights & Conclusion:**
   - **Customer Behavior Insights:**
     - Top customers contribute significantly to revenue. Implementing loyalty programs can increase retention.
     - Many users book only once. Discounts for first-time users can improve retention.
   - **Cancellation Analysis:**
     - Driver-side cancellations are higher than customer cancellations.
     - Common cancellation reasons include driver unavailability and high surge pricing.
   - **Revenue & Distance Trends:**
     - Premium vehicles generate more revenue per ride, but economy vehicles have a higher booking volume.
     - Some rides show pricing inconsistencies.
   - **Driver Performance Analysis:**
     - Luxury car drivers receive higher ratings, indicating better service quality.
     - Identifying and rewarding highly-rated drivers can improve service.
   - **Outlier Detection & Anomalies:**
     - Some rides have abnormally high prices for short distances, indicating potential billing issues.

📌 **Key Recommendations:**<br>
1️⃣ Implement loyalty discounts for repeat customers.<br>
2️⃣ Address driver-side cancellations by optimizing driver allocation.<br>
3️⃣ Improve fare consistency by analyzing and fixing outliers.<br>
4️⃣ Reward top-performing drivers to enhance service quality.<br>
5️⃣ Use fraud detection algorithms to prevent unusual billing discrepancies.<br>

### 3️⃣ Power BI Dashboard
Created an interactive dashboard for visualization using Power BI.

#### 🔹 Power BI Steps:
1. **Data Import & Cleaning**
   - Loaded cleaned Excel dataset into Power BI.
   - Removed duplicates and handled missing values.
   - Created relationships between tables where necessary.

2. **Measures & Calculations (DAX)**
   - Created **Total Revenue** measure using `SUM(Booking_Value)`.
   - Created **Cancellation Rate** calculated column for both customer and driver.
   - Created **Average Ride Distance** measure using `AVERAGE(Ride_Distance)`.

3. **Dashboard Visuals:**
   - **Total Revenue by Vehicle Type** → Bar chart.
   - **Cancellation Rate (Driver vs Customer)** → Pie chart.
   - **Top Customers by Spending** → Table.
   - **Booking Trends Over Time** → Line chart.
   - **Ride Distance Distribution** → Histogram.

🔹 **Check the Power BI Dashboard**: `ride_bookings.pbix`

## 🎯 Future Improvements:
- Include predictive modeling for ride demand.
- Enhance dashboard with real-time data.
- Automate data pipeline for daily updates.

This project provides an end-to-end ride booking data analysis with a structured approach using SQL, Python, and Power BI. 📊🚀

