#1. Total Number of Bookings Per Vehicle Type
SELECT Vehicle_Type, COUNT(*) AS Total_Bookings
FROM Bookings
GROUP BY Vehicle_Type
ORDER BY Total_Bookings DESC;

#2. Average Ride Distance & Booking Value Per Vehicle Type
SELECT Vehicle_Type, 
       ROUND(AVG(Ride_Distance), 2) AS Avg_Distance,
       ROUND(AVG(Booking_Value), 2) AS Avg_Booking_Value
FROM Bookings
GROUP BY Vehicle_Type;

#3. Top 5 Pickup Locations with the Highest Rides
SELECT Pickup_Location, COUNT(*) AS Total_Pickups
FROM Bookings
GROUP BY Pickup_Location
ORDER BY Total_Pickups DESC
LIMIT 5;

#4. Customer & Driver Cancellation Rate
SELECT 
    SUM(CASE WHEN Booking_Status = 'Canceled by Customer' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS Customer_Cancel_Rate,
    SUM(CASE WHEN Booking_Status = 'Canceled by Driver' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS Driver_Cancel_Rate
FROM Bookings;

# 5. Most Common Incomplete Ride Reasons
SELECT Incomplete_Rides_Reason, COUNT(*) AS Frequency
FROM Bookings
WHERE Incomplete_Rides_Reason IS NOT NULL
GROUP BY Incomplete_Rides_Reason
ORDER BY Frequency DESC;

# 6. Distribution of Payment Methods
SELECT Payment_Method, COUNT(*) AS Payment_Count
FROM Bookings
WHERE Payment_Method IS NOT NULL
GROUP BY Payment_Method
ORDER BY Payment_Count DESC;


# 7. Rank Customers by Total Spending (Window Function)
SELECT Customer_ID, SUM(Booking_Value) AS Total_Spending,
       RANK() OVER (ORDER BY SUM(Booking_Value) DESC) AS Ranking
FROM Bookings
GROUP BY Customer_ID
LIMIT 10;

#🔹 8. Peak Booking Hours
SELECT HOUR(Time) AS Booking_Hour, COUNT(*) AS Total_Bookings
FROM Bookings
GROUP BY Booking_Hour
ORDER BY Total_Bookings DESC;

# 9. Driver Ratings vs Ride Distance
SELECT Ride_Distance, ROUND(AVG(Driver_Ratings), 2) AS Avg_Driver_Rating
FROM Bookings
WHERE Driver_Ratings IS NOT NULL
GROUP BY Ride_Distance
ORDER BY Ride_Distance;

#10. Identify Repeat Customers
SELECT Customer_ID, COUNT(*) AS Total_Bookings
FROM Bookings
GROUP BY Customer_ID
HAVING COUNT(*) > 1
ORDER BY Total_Bookings DESC;


#EXTRA QUESTIONS
 #1. Retrieve all successful bookings:
 Create View Successful_Bookings As
 SELECT * FROM bookings
 WHERE Booking_Status = 'Success';
 
 #2. Find the average ride distance for each vehicle type:
 Create View ride_distance_for_each_vehicle As
 SELECT Vehicle_Type, AVG(Ride_Distance)
 as avg_distance FROM bookings
 GROUPBYVehicle_Type;
 
 #3. Get the total number of cancelled rides by customers:
 Create View cancelled_rides_by_customers As
 SELECT COUNT(*) FROM bookings
 WHERE Booking_Status = 'cancelled by Customer';
 
 #4. List the top 5 customers who booked the highest number of rides:
 Create View Top_5_Customers As
 SELECT Customer_ID, COUNT(Booking_ID) as total_rides
 FROM bookings
 GROUPBYCustomer_ID
 ORDER BY total_rides DESC LIMIT 5;
 
 #5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 Create View Rides_cancelled_by_Drivers_P_C_Issues As
 SELECT COUNT(*) FROM bookings
 WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';
 
 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Create View Max_Min_Driver_Rating As
 SELECT MAX(Driver_Ratings) as max_rating,
 MIN(Driver_Ratings) as min_rating
 FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
 
 #7. Retrieve all rides where payment was made using UPI:
 Create View UPI_Payment As
 SELECT * FROM bookings
 WHERE Payment_Method = 'UPI';

 #8. Find the average customer rating per vehicle type:
 Create View AVG_Cust_Rating As
 SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
 FROM bookings
 GROUP BY Vehicle_Type;
 
 #9. Calculate the total booking value of rides completed successfully:
 Create View total_successful_ride_value As
 SELECT SUM(Booking_Value) as total_successful_ride_value
 FROM bookings
 WHERE Booking_Status = 'Success';

 #10. List all incomplete rides along with the reason:
 Create View Incomplete_Rides_Reason As
 SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides = 'Yes';
 

 #1. Retrieve all successful bookings:
 Select * From Successful_Bookings; 
 
 #2. Find the average ride distance for each vehicle type:
 Select * from ride_distance_for_each_vehicle;
 
 #3. Get the total number of cancelled rides by customers:
 Select * from cancelled_rides_by_customers;
 
 #4. List the top 5 customers who booked the highest number of rides:
 Select * from Top_5_Customers;
 
  #5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 Select * from Rides_cancelled_by_Drivers_P_C_Issues;
 
 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Select * from Max_Min_Driver_Rating;
 
 #7. Retrieve all rides where payment was made using UPI:
 Select * from UPI_Payment;
 
 #8. Find the average customer rating per vehicle type:
 Select * from AVG_Cust_Rating;
 
 #9. Calculate the total booking value of rides completed successfully:
 Select * from total_successful_ride_value;
 
 #10. List all incomplete rides along with the reason:
 Select * from Incomplete_Rides_Reason; 

