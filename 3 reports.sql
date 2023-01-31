use CarRentalDB
go

-- 1a. Show me: which manufacturer has the best mileage on average?
select r.CarMake, AvgMilage = cast(avg(r.MilesPerGallon) as decimal(4,2))
from ReliableRentals r
group by r.CarMake
order by AvgMilage desc

--  b. What is the average mpg per car category?
select r.CarCategory, AvgMilage = cast(avg(r.MilesPerGallon) as decimal(4,2))
from ReliableRentals r
group by r.CarCategory
order by AvgMilage desc

-- 2. We'd like to know, what is the average length of reservations per model?
select r.CarModel, AvgReservationLength = avg(datediff(day,r.ReservationDate,r.ReturnDate))
from ReliableRentals r
group by r.CarModel
order by AvgReservationLength desc

-- 3. In order to keep tabs on everything, it's important that each car has a unique code consisting of the first 3 letters of the model, 
-- followed by the first 3 letters of the make of the car, and the last 4 digits on the license plate.

-- SM I added a computed column
select r.CarCode
from ReliableRentals r

-- 4. Which hour of the day do most people pick up their reservation?
select HourOfPickup = datepart(hour,r.ReservationDate), NumPeople = count(*)
from ReliableRentals r
group by datepart(hour,r.ReservationDate)
order by NumPeople desc

-- 5. What day of the week is the most popular for renting cars?
select HourOfPickup = datename(dw,r.ReservationDate), NumPeople = count(*)
from ReliableRentals r
group by datename(dw,r.ReservationDate)
order by NumPeople desc

-- 6. There is a one hour grace period between time rented and time returned. 
--     Show me those who returned the car more than one hour after they reserved it and had to pay for another day of rental.
-- SM This code might look too complicated. What I'm doing is:
-- In order to get the diff in hour/minute I first need to look at same day (otherwise it will give me the amount of hours for 5 days etc). So I add the diff in days to ReservationDate
-- Then using that new datetime I'm calculating the diff in minutes.
select *
from ReliableRentals r
where datediff(minute,dateadd(day,datediff(day,ReservationDate,ActualReturn),ReservationDate),ActualReturn) >= 60