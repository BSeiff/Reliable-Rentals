use CarRentalDB
go
drop table if exists ReliableRentals
go
create table dbo.ReliableRentals(
    ReliableRentalsId int not null identity primary key,
    CustomerFirstName varchar(25) not null constraint ck_ReliableRentals_customer_first_name_cannot_be_blank check(CustomerFirstName > ''),
    CustomerLastName varchar(25) not null constraint ck_ReliableRentals_customer_last_name_cannot_be_blank check(CustomerLastName > ''),
    CarCategory varchar(8) not null constraint ck_ReliableRentals_car_category_in_Compact_Midsize_Fullsize_Minivan_SUV check(CarCategory in('Compact', 'Midsize', 'Fullsize', 'Minivan', 'SUV')),
    CarMake varchar(20) not null constraint ck_ReliableRentals_car_make_cannot_be_blank check(CarMake > ''),
    CarModel varchar(20) not null constraint ck_ReliableRentals_car_model_cannot_be_blank check(CarModel > ''),
    LicensePlate varchar(15) not null constraint ck_ReliableRentals_license_plate_cannot_be_blank check(LicensePlate > ''),
    ReservationDate datetime not null constraint ck_ReliableRentals_reservation_date_cannot_be_more_than_2_weeks_in_advance check(datediff(ww,getdate(),ReservationDate) <= 2),
    ReturnDate date not null,
    ActualReturn datetime,
    PricePerDay decimal(5,2) not null constraint ck_ReliableRentals_price_must_be_between_30_and_500 check(PricePerDay between 30 and 500),
    MilesPerGallon decimal(5,2) not null constraint ck_ReliableRentals_miles_per_gallon_must_be_greater_than_0 check(MilesPerGallon > 0),
    Returned bit not null,
    constraint ck_ReliableRentals_return_date_must_be_after_and_no_more_than_a_month_after_reservation check(ReturnDate > ReservationDate and datediff(day,ReservationDate,ReturnDate) <= 30),
    constraint ck_ReliableRentals_actual_return_after_return_date check(ActualReturn >= ReturnDate),
    constraint ck_ReliableRentals_returned_must_be_true_if_ActualReturn_is_not_null_and_vice_versa check((ActualReturn is not null and Returned = 1) or (ActualReturn is null and Returned = 0)),
    constraint ck_ReliableRentals_times_must_be_durring_hours check(
        convert(time,ReservationDate) between case when datepart(dw,ReservationDate) between 2 and 6 then '8:30am' when datepart(dw,ReservationDate) = 1 then '9:45am' end 
            and case when datepart(dw,ReservationDate) between 2 and 5 then '9:00pm' when datepart(dw,ReservationDate) = 1 then '6:30pm' when datepart(dw,ReservationDate) = 6 then '1:00pm' end
        and convert(time,ActualReturn) between case when datepart(dw,ActualReturn) between 2 and 6 then '8:30am' when datepart(dw,ActualReturn) = 1 then '9:45am' end 
            and case when datepart(dw,ActualReturn) between 2 and 5 then '9:00pm' when datepart(dw,ActualReturn) = 1 then '6:30pm' when datepart(dw,ActualReturn) = 6 then '1:00pm' end
    ),
    CarCode as concat(substring(CarModel,1,3),substring(CarMake,1,3),right(LicensePlate,4)) persisted constraint u_ReliableRentals_CarCode unique,
    PriceFull as PricePerDay * (datediff(day,ReservationDate,ActualReturn) + case when datediff(minute,dateadd(day,datediff(day,ReservationDate,ActualReturn),ReservationDate),ActualReturn) >= 60 then 1 else 0 end)
)
go