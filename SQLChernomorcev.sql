use TableReservation;

CREATE TABLE USERS(
User_id int identity(1,1),
Login varchar (255),
Name varchar (255),
PhoneNumber varchar (255),
Primary key(User_id),
)
CREATE TABLE PAYMENT(
Payment_id int identity(1,1),
PaymentNumber varchar (255),
PaymentStatus varchar (255),
)
CREATE TABLE DEPOSIT(
Deposit_id int identity (1,1),
User_id int foreign key references USERS(User_id),
CountDeposit varchar(255),
Payment_id int foreign key references PAYMENT(Payment_id),
Primary key(Deposit_id)
)
CREATE TABLE PLACE(
Place_id int identity (1,1),
Hall varchar (255),
Countseats int,
Zone varchar(255),
TableNumber varchar (255)
Primary key(Place_id)
)
CREATE TABLE RESERVATION(
Table_id int identity (1,1),
User_id int foreign key references USERS(User_id),
Deposit_id int foreign key references DEPOSIT(Deposit_id),
Time datetime2,
Place_id int foreign key references Place(Place_id),
Primary key(Table_id)
)

insert into USERS(Login,Name,Last_Name,PhoneNumber) values ('aleksey_swager','Алексей','Петухов','89068904751')
insert into USERS(Login,Name,Last_Name,PhoneNumber) values ('Sonsonka','Софья','Павина','89505082931')
insert into USERS(Login,Name,Last_Name,PhoneNumber) values ('chernomorik','Марк','Черноморцев','89995557771')
insert into USERS(Login,Name,Last_Name,PhoneNumber) values ('enot','Илья','Сизов','89456821192')
insert into USERS(Login,Name,Last_Name,PhoneNumber) values ('user1','Валерий','Александров','89866023102')
insert into USERS(Login,Name,Last_Name,PhoneNumber) values ('user2','Оксана','Елизарова','89784328805')
insert into USERS(Login,Name,Last_Name,PhoneNumber) values ('PrettyG','Иван','Агеев','89868079956')
insert into USERS(Login,Name,Last_Name,PhoneNumber) values ('programmist','Олег','Иванов','89774850993')

insert into PAYMENT(PaymentNumber,PaymentStatus) values ('1001','complete')
insert into PAYMENT(PaymentNumber,PaymentStatus) values ('1002','complete')
insert into PAYMENT(PaymentNumber,PaymentStatus) values ('1003','complete')
insert into PAYMENT(PaymentNumber,PaymentStatus) values ('1004','error')
insert into PAYMENT(PaymentNumber,PaymentStatus) values ('1005','complete')
insert into PAYMENT(PaymentNumber,PaymentStatus) values ('1006','complete')
insert into PAYMENT(PaymentNumber,PaymentStatus) values ('1007','error')
insert into PAYMENT(PaymentNumber,PaymentStatus) values ('1008','complete')

insert into DEPOSIT(User_id,CountDeposit,Payment_id) values (1,'2000',1)
insert into DEPOSIT(User_id,CountDeposit,Payment_id) values (3,'3000',2)
insert into DEPOSIT(User_id,CountDeposit,Payment_id) values (2,'10000',3)
insert into DEPOSIT(User_id,CountDeposit,Payment_id) values (5,'2000',4)
insert into DEPOSIT(User_id,CountDeposit,Payment_id) values (6,'5000',5)
insert into DEPOSIT(User_id,CountDeposit,Payment_id) values (4,'2000',6)
insert into DEPOSIT(User_id,CountDeposit,Payment_id) values (7,'1000',7)
insert into DEPOSIT(User_id,CountDeposit,Payment_id) values (8,'4000',8)

insert into PLACE(Hall,Countseats,Zone,TableNumber) values ('Retro',2,'Central','13')
insert into PLACE(Hall,Countseats,Zone,TableNumber) values ('Retro',2,'Private','1')
insert into PLACE(Hall,Countseats,Zone,TableNumber) values ('Fans',10,'Bar','None')
insert into PLACE(Hall,Countseats,Zone,TableNumber) values ('Retro',4,'Private','3')
insert into PLACE(Hall,Countseats,Zone,TableNumber) values ('Fans',1,'Central','24')
insert into PLACE(Hall,Countseats,Zone,TableNumber) values ('Fans',3,'Bar','None')
insert into PLACE(Hall,Countseats,Zone,TableNumber) values ('Retro',2,'Central','2')
insert into PLACE(Hall,Countseats,Zone,TableNumber) values ('Retro',1,'Central','1')

insert into RESERVATION(User_id,Deposit_id,Place_id,Time) values (1,1,1,'2022-12-14 12:00:00')
insert into RESERVATION(User_id,Deposit_id,Place_id,Time) values (3,2,2,'2022-12-13 12:30:00')
insert into RESERVATION(User_id,Deposit_id,Place_id,Time) values (2,3,3,'2022-12-15 01:00:00')
insert into RESERVATION(User_id,Deposit_id,Place_id,Time) values (5,4,4,'2022-12-16 19:30:00')
insert into RESERVATION(User_id,Deposit_id,Place_id,Time) values (6,5,5,'2022-12-14 10:00:00')
insert into RESERVATION(User_id,Deposit_id,Place_id,Time) values (4,6,6,'2022-12-13 18:00:00')
insert into RESERVATION(User_id,Deposit_id,Place_id,Time) values (7,7,7,'2022-12-17 21:40:00')
insert into RESERVATION(User_id,Deposit_id,Place_id,Time) values (8,8,8,'2022-12-20 13:00:00')

DELETE FROM PLACE WHERE Place_id >= 9;

select *from USERS
select *from PAYMENT
select *from DEPOSIT
select *from PLACE
select *from RESERVATION


select Name,Last_name,CountDeposit,Hall,TableNumber from USERS,RESERVATION,PLACE,DEPOSIT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and Hall ='Retro'


select Name,Last_name,Login,Hall,Zone,TableNumber from USERS,RESERVATION,PLACE,DEPOSIT,PAYMENT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and DEPOSIT.Deposit_id = PAYMENT.Payment_id
and Zone = 'Private'


select Name,Last_name,Login,Hall,Zone,CountSeats,TableNumber from USERS,RESERVATION,PLACE,DEPOSIT,PAYMENT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and DEPOSIT.Deposit_id = PAYMENT.Payment_id
and Zone = 'Private'
and Countseats > 2


select Name,Last_name,CountDeposit, PaymentNumber,PaymentStatus from USERS,RESERVATION,PLACE,DEPOSIT,PAYMENT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and DEPOSIT.Deposit_id = PAYMENT.Payment_id
and CountDeposit>2000;


select Name,Last_name,CountDeposit, PaymentNumber,PaymentStatus from USERS,RESERVATION,PLACE,DEPOSIT,PAYMENT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and DEPOSIT.Deposit_id = PAYMENT.Payment_id
and PaymentStatus = 'error';


select Name,Last_name,Countseats from USERS,RESERVATION,PLACE,DEPOSIT,PAYMENT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and DEPOSIT.Deposit_id = PAYMENT.Payment_id
and Countseats > 3;


select Name,Last_name,Hall,Zone,Countseats,Time from USERS,RESERVATION,PLACE,DEPOSIT,PAYMENT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and DEPOSIT.Deposit_id = PAYMENT.Payment_id
and Time > '2022-12-14'


select Name,Last_name,Login,Hall,Zone,CountSeats,TableNumber,Time from USERS,RESERVATION,PLACE,DEPOSIT,PAYMENT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and DEPOSIT.Deposit_id = PAYMENT.Payment_id
and TableNumber = '1'


select Name,Last_name,Login,Hall,Zone,CountSeats,TableNumber,Time,PaymentNumber,PaymentStatus,CountDeposit from USERS,RESERVATION,PLACE,DEPOSIT,PAYMENT
where USERS.User_id = DEPOSIT.Deposit_id
and USERS.User_id = RESERVATION.Table_id
and RESERVATION.Table_id = PLACE.Place_id
and DEPOSIT.Deposit_id = PAYMENT.Payment_id
and PaymentStatus = 'complete'
and CountDeposit < 3000


select Name,Last_name,login,PhoneNumber from USERS order by Name asc

select Name,Last_name,login,PhoneNumber from USERS order by Last_Name desc

select Name,Last_name,login,PhoneNumber from USERS order by Login asc
