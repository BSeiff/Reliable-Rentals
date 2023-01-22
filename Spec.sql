

/*
Hi, I operate a car rental service est 9/24/2017 and need something to keep track of what comes in and out and a few things in between. 
Lets see what you can do!

At Reliable Rentals, we need to keep tabs on what's currently available and which cars are out.
Our hours of operation are Monday - Thursday 8:30am to 9pm. Friday 8:30am - 1pm. Sunday 9:45am - 6:30pm.
The model, make, and license plate are of paramount importance. The reservation date, price per day, and total price are also must-haves.
The column for return date should always be filled in, while the return date shows wether the car was returned or not, obviously.
We'd also like a car category column. Main Car Categories: Compact, Midsize, Fullsize, Minivan, and SUV
If you could also calculate the total cost, it would be much appreciated. Make sure that only if the time returned is more than an hour after time reserved,
    should the customer be paying for another day of rental.

Questions:
Q:Do you have a minimum/maximum length of rental time?
A:The shortest amount of time one can rent for is one day. We allow up to 1 month max. (We aren't in the business of leasing cars)

Q:What are the lowest and highest prices for renting?
A:Prices constantly fluctuate between availability, supply and demand, and the season.
However, we believe the lowest ever rent/day is $30 while the highest will never surpass $500.

Q:Can reservations be made in advance?
A:Definitely, up to 2 weeks in advance, we have to know which cars available.

Q:Is it necessary to record the date and time of the reservation and return?
A:Yes. We like to know roughly the time the car will be picked up.
It's imperative to know when it's returned, since if it's later than the time it was picked up, the customer would be charged for another day of rental.
    A car that wasn't returned cannot have a time since clearly we don't know in advance the exact time it'll be returned.


Reports:
1a. Show me: which manufacturer has the best mileage on average?
 b. What is the average mpg per car category?
2. We'd like to know, what is the average length of reservations per model?
3. In order to keep tabs on everything, it's important that each car has a unique code consisting of the first 3 letters of the model, 
followed by the first 3 letters of the make of the car, and the last 4 digits on the license plate.
4. Which hour of the day do most people pick up their reservation?
5. What day of the week is the most popular for renting cars?
6. There is a one hour grace period between time rented and time returned. 
    Show me those who returned the car more than one hour after they reserved it and had to pay for another day of rental.

Sample Data
CustomerName, Category, CarMake, CarModel, LicensePlate, ReservationDate, ReturnDate, Price/Day, Miles/Gallon, Returned
Simi Gold, SUV, Nissan, Rogue, JYR 6821, 2017-09-29 10:30, 2017-10-04 15:57, 70, 31, Y
Manny Perlstein, Midsize, Honda, Accord, 651-096, 2017-11-08 8:30, 2017-12-01 8:30, 72.35, 34, Y
Shmuel Hirsch, Minivan, Toyota, Sienna, G56 MCG, 2017-12-28 11:00, 2018-01-02 17:53, 86, 36, Y
Perel Goldstein, Midsize, Toyota, Camry, 5AR K56, 2018-05-02 16:50, 2018-05-03 15:39, 55.20,33, Y
Kalman Klein, Midsize, Kia, Stinger, GRT 2576, 2018-05-31 19:30, 2018-06-03 18:23, 61.50, 27, Y 
Simcha Fried, SUV, Ford, Edge, N54 KYF, 25, 2018-06-05 9:00, 2018-06-10 9:45, 70.25, 25, Y 
Levi Katz, Compact, Nissan, Versa, PRS 1264, 2018-08-08 13:25, 2018-08-10 12:19, 48.75, 36, Y
Sara Miller, Midsize, Honda, Accord, 4LK G71, 2018-11-12 20:05, 2018-11-14 19:05, 81.30, 34, Y 
Leah Baum, Midsize, Hyundai, Sonata, 521-984, 2018-12-14 8:45, 2018-12-20 8:45, 85.50, 33, Y
Baruch Schwartz, Compact, Ford, Focus, 548-942, 2019-02-05 18:00, 2019-02-07 17:32, 66.20, 29, Y 
Tuvia Diamond, SUV, Buick, Enclave, Z42 BXD, 2019-03-20 16:50, 2019-03-27 17:05, 49.99, 22, Y
Nachi Weiss, Minivan, Kia, Carnival, HCD 5846, 2019-07-09 17:15, 2019-07-11 18:04, 85, 22, Y
Hudy Stern, Compact, Toyota, Corolla, TGB 7533, 2019-09-01 15:20, 2019-09-03 16:31, 56.80, 36, Y 
Gali Friedman, SUV, Kia, Telluride, 456-987, 2019-12-26 14:35, 2020-01-03 12:46, 90.20, 21, Y
Malka Stein, Fullsize, Hyundai, Genesis, 8KJ DSR, 2019-12-29 10:55, 2020-01-06 9:45, 86.50, 31, Y
Yehuda Marcus, SUV, Ford, Explorer, 268-359, 2020-03-09 17:35, 2020-03-11 17:42, 59.25, 24, Y
Yaakov David, SUV, Chevrolet, Equinox, MJN 5848, 2020-10-11 13:30, 2020-10-13 16:30, 39.99, 29, Y
Yissachar Roth, SUV, Dodge, Journey, S66 KYC, 2020-11-15 10:15, 2020-11-21 9:27, 42.30, 22, Y
Dina Mandel, Compact, Honda, Civic, W49 BJP, 2021-01-01 8:50, 2021-01-05 9:30, 46, 34, Y
Rochel Levine, Fullsize, Toyota, Avalon, JKL 9516, 2021-04-12 16:50, 2021-04-14 18:56, 50.25, 26, Y
Leah Cohen, Compact, Ford, Focus, LXB 9992, 2021-08-06 11:50, 2021-08-12 15:03, 49.75, 29, Y
Yisrael Levy, SUV, Kia, Sorento, 9ST HGT, 2021-10-31 11:40, 2021-11-01 12:37, 60, 37, Y
Shimon Rubin, Fullsize, Dodge, Charger, 884-353, 2021-12-12 16:25, 2021-12-14 20:42, 67.80, 25, Y
Zalmy Rosenberg, Fullsize, Nissan, Maxima, 256-922, 2022-01-31 8:35, 2022-02-01 10:05, 59.99, 25, Y
Sarah Mintz, Compact, Nissan, Sentra, SWR 6643, 2022-04-29 9:35, 2022-05-04 10:00, 71.89, 35, Y
Raizy Weissberg, Compact, Toyota, Corolla, CRT 2542, 2022-08-11 10:45, 2022-08-12 9:32, 57.65, 36, Y
Moishe Wein, Minivan, Chrysler, Pacifica, 5GP DYX, 2022-12-22 9:10, 2022-12-27, 54.55, 24, N
Gedalia Rosen, Minivan, Honda, Odyssey, R45 B88, 2022-12-29 12:00, 2023-01-05, 98, 24, N
*/

