--1. Retrieve all successful bookings:
SELECT * FROM bookings 
WHERE "Booking_Status" = 'Success'

--2. Find the average ride distance for each vehicle type:
SELECT "Vehicle_Type", ROUND(AVG("Ride_Distance"),2) AS AVG_Ride_Distance
FROM bookings
GROUP BY 1

--3. Get the total number of cancelled rides by customers:
SELECT "Booking_Status", COUNT(*)
FROM bookings
WHERE "Booking_Status" = 'Canceled by Customer'
GROUP BY 1

--4. List the top 5 customers who booked the highest number of rides:
SELECT "Customer_ID", COUNT("Booking_ID") AS Total_Rides
FROM bookings
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 5

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) 
FROM bookings
WHERE "Booking_Status" = 'Canceled by Driver'
AND "Canceled_Rides_by_Driver" = 'Personal & Car related issue'

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX("Driver_Ratings"), MIN("Driver_Ratings")
FROM bookings
WHERE "Vehicle_Type" = 'Prime Sedan'

--7. Retrieve all rides where payment was made using UPI:
SELECT * 
FROM bookings
WHERE "Payment_Method" = 'UPI'

--8. Find the average customer rating per vehicle type:
SELECT "Vehicle_Type", ROUND(AVG(NULLIF("Customer_Rating",'NA')::numeric), 2) AS Avg_Rating
FROM bookings
GROUP BY "Vehicle_Type";

--9. Calculate the total booking value of rides completed successfully:
SELECT SUM("Booking_Value") AS total_successfull_rides
FROM bookings
WHERE "Booking_Status" ='Success'

--10. List all incomplete rides along with the reason:
SELECT "Booking_ID", "Incomplete_Rides_Reason"
FROM bookings
WHERE "Incomplete_Rides" = 'Yes'

