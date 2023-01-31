use CarRentalDB
go
delete ReliableRentals
go
insert ReliableRentals(CustomerFirstName,CustomerLastName,CarCategory,CarMake,CarModel,LicensePlate,ReservationDate,ReturnDate,ActualReturn,PricePerDay,MilesPerGallon,Returned)
select 'Simi', 'Gold', 'SUV', 'Nissan', 'Rogue', 'JYR 6821', '2017-09-29 10:30', '2017-10-04', '2017-10-04 15:57', 70, 31, 1
union select 'Manny', 'Perlstein', 'Midsize', 'Honda', 'Accord', '651-096', '2017-11-08 8:30', '2017-12-01', '2017-12-01 8:30', 72.35, 34, 1
union select 'Shmuel', 'Hirsch', 'Minivan', 'Toyota', 'Sienna', 'G56 MCG', '2017-12-28 11:00', '2018-01-02', '2018-01-02 17:53', 86, 36, 1
union select 'Perel', 'Goldstein', 'Midsize', 'Toyota', 'Camry', '5AR K56', '2018-05-02 16:50', '2018-05-03', '2018-05-03 15:39', 55.20,33, 1
union select 'Kalman', 'Klein', 'Midsize', 'Kia', 'Stinger', 'GRT 2576', '2018-05-31 19:30', '2018-06-03', '2018-06-03 18:23', 61.50, 27, 1 
union select 'Simcha', 'Fried', 'SUV', 'Ford', 'Edge', 'N54 KYF', '2018-06-05 9:00', '2018-06-10', '2018-06-10 9:45', 70.25, 25, 1 
union select 'Levi', 'Katz', 'Compact', 'Nissan', 'Versa', 'PRS 1264', '2018-08-08 13:25', '2018-08-10', '2018-08-10 12:19', 48.75, 36, 1
union select 'Sara', 'Miller', 'Midsize', 'Honda', 'Accord', '4LK G71', '2018-11-12 20:05', '2018-11-14', '2018-11-14 19:05', 81.30, 34, 1 
union select 'Leah', 'Baum', 'Midsize', 'Hyundai', 'Sonata', '521-984', '2018-12-14 8:45', '2018-12-20', '2018-12-20 8:45', 85.50, 33, 1
union select 'Baruch', 'Schwartz', 'Compact', 'Ford', 'Focus', '548-942', '2019-02-05 18:00', '2019-02-07', '2019-02-07 17:32', 66.20, 29, 1 
union select 'Tuvia', 'Diamond', 'SUV', 'Buick', 'Enclave', 'Z42 BXD', '2019-03-20 16:50', '2019-03-27', '2019-03-27 17:05', 49.99, 22, 1
union select 'Nachi', 'Weiss', 'Minivan', 'Kia', 'Carnival', 'HCD 5846', '2019-07-09 17:15', '2019-07-11', '2019-07-11 18:04', 85, 22, 1
union select 'Hudy', 'Stern', 'Compact', 'Toyota', 'Corolla', 'TGB 7533', '2019-09-01 15:20', '2019-09-03', '2019-09-03 16:31', 56.80, 36, 1 
union select 'Gali', 'Friedman', 'SUV', 'Kia', 'Telluride', '456-987', '2019-12-26 14:35', '2020-01-03', '2020-01-03 12:46', 90.20, 21, 1
union select 'Malka', 'Stein', 'Fullsize', 'Hyundai', 'Genesis', '8KJ DSR', '2019-12-29 10:55', '2020-01-06', '2020-01-06 9:45', 86.50, 31, 1
union select 'Yehuda', 'Marcus', 'SUV', 'Ford', 'Explorer', '268-359', '2020-03-09 17:35', '2020-03-11', '2020-03-11 17:42', 59.25, 24, 1
union select 'Yaakov', 'David', 'SUV', 'Chevrolet', 'Equinox', 'MJN 5848', '2020-10-11 13:30', '2020-10-13', '2020-10-13 16:30', 39.99, 29, 1
union select 'Yissachar', 'Roth', 'SUV', 'Dodge', 'Journey', 'S66 KYC', '2020-11-15 10:15', '2020-11-21', '2020-11-21 9:27', 42.30, 22, 1
union select 'Dina', 'Mandel', 'Compact', 'Honda', 'Civic', 'W49 BJP', '2021-01-01 8:50', '2021-01-05', '2021-01-05 9:30', 46, 34, 1
union select 'Rochel', 'Levine', 'Fullsize', 'Toyota', 'Avalon', 'JKL 9516', '2021-04-12 16:50', '2021-04-14', '2021-04-14 18:56', 50.25, 26, 1
union select 'Leah', 'Cohen', 'Compact', 'Ford', 'Focus', 'LXB 9992', '2021-08-06 11:50', '2021-08-12', '2021-08-12 15:03', 49.75, 29, 1
union select 'Yisrael', 'Levy', 'SUV', 'Kia', 'Sorento', '9ST HGT', '2021-10-31 11:40', '2021-11-01', '2021-11-01 12:37', 60, 37, 1
union select 'Shimon', 'Rubin', 'Fullsize', 'Dodge', 'Charger', '884-353', '2021-12-12 16:25', '2021-12-14', '2021-12-14 20:42', 67.80, 25, 1
union select 'Zalmy', 'Rosenberg', 'Fullsize', 'Nissan', 'Maxima', '256-922', '2022-01-31 8:35', '2022-02-01', '2022-02-01 10:05', 59.99, 25, 1
union select 'Sarah', 'Mintz', 'Compact', 'Nissan', 'Sentra', 'SWR 6643', '2022-04-29 9:35', '2022-05-04', '2022-05-04 10:00', 71.89, 35, 1
union select 'Raizy', 'Weissberg', 'Compact', 'Toyota', 'Corolla', 'CRT 2542', '2022-08-11 10:45', '2022-08-12', '2022-08-12 9:32', 57.65, 36, 1
union select 'Moishe', 'Wein', 'Minivan', 'Chrysler', 'Pacifica', '5GP DYX', '2022-12-22 9:10', '2022-12-27', null, 54.55, 24, 0
union select 'Gedalia', 'Rosen', 'Minivan', 'Honda', 'Odyssey', 'R45 B88', '2022-12-29 12:00', '2023-01-05', null, 98, 24, 0