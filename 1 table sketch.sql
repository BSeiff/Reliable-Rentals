/*
    ReliableRentalsId int not null id pk
    CustomerFirstName varchar(25) not null not blank
    CustomerLastName varchar(25) not null not blank
    CarCategory varchar(8) not null in Compact, Midsize, Fullsize, Minivan, SUV
    CarMake varchar(20) not null not blank
    CarModel varchar(20) not null not blank
    LicensePlate varchar(15) not null not blank
    ReservationDate datetime not null  getdate(),ReservationDate <= 2 weeks
    ReturnDate date not null
    ActualReturn datetime
    PricePerDay decimal(5,2) not null between 30 and 500
    MilesPerGallon decimal(5,2) not null > 0
    Returned bit not null
    constraints
        ReturnDate > ReservationDate and datediff(day,ReservationDate,ReturnDate) <= 30
        ActualReturn >= ReturnDate
        (ActualReturn is not null and Returned = 1) or (ActualReturn is null and Returned = 0)
        convert(time,ReservationDate) between case when datepart(dw,ReservationDate) between 2 and 6 then '8:30am' when datepart(dw,ReservationDate) = 1 then '9:45am' end 
            and case when datepart(dw,ReservationDate) between 2 and 5 then '9:00pm' when datepart(dw,ReservationDate) = 1 then '6:30pm' when datepart(dw,ReservationDate) = 6 then '1:00pm' end
        and convert(time,ActualReturn) between case when datepart(dw,ActualReturn) between 2 and 6 then '8:30am' when datepart(dw,ActualReturn) = 1 then '9:45am' end 
            and case when datepart(dw,ActualReturn) between 2 and 5 then '9:00pm' when datepart(dw,ActualReturn) = 1 then '6:30pm' when datepart(dw,ActualReturn) = 6 then '1:00pm' end
    computed columns
        CarCode as concat(substring(CarModel,1,3),substring(CarMake,1,3),right(LicensePlate,4)) persisted unique
        PriceFull as PricePerDay * (datediff(day,ReservationDate,ActualReturn) + case when datediff(minute,dateadd(day,datediff(day,ReservationDate,ActualReturn),ReservationDate),ActualReturn) >= 60 then 1 else 0 end)

*/