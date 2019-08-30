---Phase 1

------------No FK------------------Create table UserSecurityQuestions and insert values

create table UserSecurityQuestions
(
	UserSecurityQuestionID tinyint not null primary key identity(1,1),
	UserSecurityQuestion varchar(50) not null
)
insert into UserSecurityQuestions(UserSecurityQuestion)
	values('What`s your first pet name?')
insert into UserSecurityQuestions(UserSecurityQuestion)
	values('what`s your father`s middle name?')
insert into UserSecurityQuestions(UserSecurityQuestion)
	values('The city where your were born')
insert into UserSecurityQuestions(UserSecurityQuestion)
	values('What`s your mother`s middle name')
insert into UserSecurityQuestions(UserSecurityQuestion)
	values('What`s your plate number?')
insert into UserSecurityQuestions(UserSecurityQuestion)
	values ('Which city were you born?'),
	       ('Where ar you come from?');

select * from UserSecurityQuestions

------------No FK-----------------Create table AccountStatusType and insert values
create table AccountStatusType
(
AccountStatusTypeID tinyint not null primary key identity(1,1),
AccountStatusDescription varchar(30) not null
)

insert into [AccountStatusType](AccountStatusDescription) 
values ('Normal'),
('Card Lost / Stolen / Replaced'),
('120 Days Past Due'),
('30 Days Past Due'),
('Auto Inquiry'),
('Bank / Credit Card Inquiry'),
('Bankruptcy Discharged'),
('Card Over Limit'),
('Credit Line Reduced'),
('Deceased');
select * from AccountStatusType


----------------NO FK------------------Create table SavingInterestRates and insert values
create table SavingInterestRates
(
InterestSavingsRateID tinyint not null primary key identity(1,1),
InterestRateValue numeric(9,9) not null ,
InterestRateDescription varchar(20) null 
)

insert into [SavingInterestRates](InterestRateValue,InterestRateDescription) 
values 
(0.021,'Simple Interest Rate')
insert into [SavingInterestRates](InterestRateValue,InterestRateDescription)
values (0.032,'Compound Rate')
insert into [SavingInterestRates](InterestRateValue,InterestRateDescription)
values(0.038,'Prime Rate')
insert into [SavingInterestRates](InterestRateValue,InterestRateDescription)
values
(0.026,'Fixed Interest'),
(0.042,'Amortized Rates');

select * from SavingInterestRates


----------------No FK------------------Create table Employee  and insert values

create table Employee
(
EmployeeID integer not null primary key identity(1,1),
EmployeeFirstName varchar(25) not null,
EmployeeMiddleName char(1) null,
EmployeeLastName varchar(25) not null,
EmployeeisManager bit not null default 0
)


insert into [Employee](EmployeeFirstName,EmployeeLastName,EmployeeisManager )
values ('kai', 'qin', 1)

insert into [Employee](EmployeeFirstName,EmployeeLastName)
values ('tyris', 'jordan'),
('jim', 'carey'),
('si', 'jordan'),
('micheal', 'jordan'),
('cherry', 'lau'),
('ocean', 'yang'),
('ronaldo', 'cristiano'),
('messi', 'Leo'),
('ramos','sergio')

select * from Employee

---------------NO FK------------------Create table TransactionType and insert values
create table TransactionType
(
TransactionTypeID tinyint not null primary key identity(1,1),
TransactionTypeName char(10) not null,
TransactionTypeDescription  varchar(50) not null,
TransactionFeeAmount smallmoney not null
)

insert into [TransactionType](TransactionTypeName, TransactionTypeDescription, TransactionFeeAmount) 
values ('Payment', 'Charg', 143.33)
insert into [TransactionType](TransactionTypeName, TransactionTypeDescription, TransactionFeeAmount) 
values ('Refund', 'Returns the specified amount ', 444.22),
('Authoriz', 'Requests to charge a cardholder.',345),
('Credit', 'To submit a Credit transaction,', 53),
('cheque', 'personal cheque', 767.5)

select * from TransactionType


---------------NO FK------------------Create table LoginErrorLog and insert values
create table LoginErrorLog
(
ErrorLogID int not null primary key identity(1,1),
ErrorTime datetime not null default getdate(),
FailedTransactionXML XML null
)


insert into [LoginErrorLog](ErrorTime) 
values ('180612 10:34:09 AM'),
('180712 10:30:09 AM'),
('180413 12:34:09 AM'),
('190112 10:34:09 AM'),
('181202 10:34:09 AM'),
('180612 10:34:09 AM'),
('180112 08:34:09 AM'),
('180922 11:34:09 AM'),
('180114 12:14:09 AM'),
('180102 01:04:09 AM')

select * from LoginErrorLog

--------------No FK-----------------Create table AccountType and insert values
create table AccountType
(
AccountTypeID tinyint not null primary key identity(1,1),
AccountTypeDescription varchar(30) null
)

insert into [AccountType](AccountTypeDescription) 
values ('Saving'),
('Checking')
select * from AccountType

----------------NO FK------------------Create table FailedTransactionErrorType and insert values
create table FailedTransactionErrorType
(
FailedTransactionErrorTypeID tinyint not null primary key identity(1,1),
FailedTransactionDescription varchar(50) not null
)

insert into [FailedTransactionErrorType](FailedTransactionDescription) 
values ('User authentication failed.'),
('Invalid tender type'),
('Invalid transaction type'),
('Invalid amount format'),
('Invalid merchant information'),
('Cannot find the customer reference number'),
('Client time-out waiting for response'),
('Invalid expiration date')


select * from FailedTransactionErrorType


------------------No FK--------------------Create table UserLogins and insert values
Create table UserLogins
(
	UserLoginID smallint not null primary key identity(1,1),
	UserLogin char(15) not null ,
	UserPassword varchar(20) not null,
)
insert into UserLogins(UserLogin,UserPassword)
	values
	('tony','tony123'),
	('mike','mike123'),
	('jenny','jenny123'),
	('emma','emma123'),
	('peter','peter123'),
	('pan','pan123'),
	('john','john123'),
	('sara','sara123'),
	('leo','leo123'),
	('david','david123'),
	('haniko','haniko123')
	
select * from UserLogins



--------------1 FK------------------Create table FailedTransactionLog and insert values
create table FailedTransactionLog
(
FailedTransactionID int not null primary key identity(1,1),
FailedTransactionErrorTypeID_FK tinyint not null references [FailedTransactionErrorType](FailedTransactionErrorTypeID),
FailedTransactionErrorTime datetime not null default getdate(),
FailedTransactionXML XML null 
)
insert into [FailedTransactionLog](FailedTransactionErrorTypeID_FK) 
values (1),
(1),
(4),
(5),
(2),
(3),
(1),
(4),
(7),
(7)

select * from FailedTransactionLog





-----------2 FK--------------Create table UserSecurityAnsers and insert values
create table UserSecurityAnsers
(
	UserLoginId smallint not null primary key references UserLogins(UserLoginID),
	UserSecurityAnswer varchar(25) not null, 
	UserSecurityQuestionID tinyint not null references UserSecurityQuestions(UserSecurityQuestionID)
)
insert into UserSecurityAnsers(UserLoginId,UserSecurityAnswer,UserSecurityQuestionID)
values(1,'North York',1),
	  (2,'Mike',2),
	  (3,'Test',3),
	  (4,'GTA',4),
	  (5,'Markham',5),
	  (6,'Richmondhill',6),
	   (7,'Vancour',5);

	
select * from UserSecurityAnsers


----------3 FK----------------------\Create table Account and insert values
create table Account
(
AccountID int not null primary key identity(1,1),
CurrentBalance int not null,
AccountTypeID_FK tinyint not null references[AccountType](AccountTypeID),
AccountStatusTypeID_FK tinyint not null references[AccountStatusType](AccountStatusTypeID),
InterestSavingsRateID_FK tinyint not null references [SavingInterestRates](InterestSavingsRateID)
)


insert into [Account](CurrentBalance, AccountTypeID_FK, AccountStatusTypeID_FK, InterestSavingsRateID_FK) 
values (23213,1,1,1),
(31311,1,1,1),
(31232,2,2,3),
(6646,2,1,2),
(75675,1,4,3),
(6287,1,4,2),
(575484,1,1,1),
(8186,2,1,1),
(888,2,4,2),
(42342,1,5,5)
select * from Account

-------------2 FK After Account and TransactionLog----------------Create table Customer and insert values
create table Customer
(
CustomerID int not null primary key identity(1,1),
AccountID_FK int not null references[Account](AccountID),
CustomerAddress1 varchar(30) not null,
CustomerAddress2 varchar(30) null ,
CustomerFirstName varchar(30) not null,
CustomerMiddleName char(1) null,
CustomerLastName varchar(30) not null, 
City varchar(30) not null,
[State] char(2) not null,
ZipCode varchar(30) not null,
EmailAddress varchar(40) null,
HomePhone char(10) null,
CellPhone char(10) not null,
WorkPhone char(10) null,
SSN char(9) not null,
UserLoginID_FK smallint not null references UserLogins(UserLoginID) --smallint (-32000, 32000)
)


insert into [Customer](AccountID_FK,CustomerAddress1,CustomerFirstName, CustomerLastName, City, [State], ZipCode, EmailAddress, CellPhone,SSN,UserLoginID_FK)
values
(1,'34 aaaaa st,','lu','chen','toronto','ON','m5t0c3','v1rock@gmail.com','64788811','3345443',1),------UserLoginID_FK needs to be filled
(2,'35 bbbbb st,','isl','micheal','toronto','ON','m5t0k3','v2rock@gmail.com','64431110','6645543',2),
(3,'34 ccccc st,','lowe','li','toronto','ON','m4t0k3','v3rock@gmail.com','64788410','53344553',3),
(4,'14 ddddd st,','musa','musa','vancouver','BC','m5t0v3','v4rock@gmail.com','64786110','21244543',4),
(5,'25 aaaaa st,','jack','chen','toronto','ON','c5t0c3','v5rock@gmail.com','64789780','88445543',5),
(6,'355 aaaaa st,','jet','li','toronto','ON','l5t0c3','v6rock@gmail.com','64705110','05865543',6),
(7,'33 vvvv st,','isco','marcos','toronto','ON','j5t0c3','v7rock@gmail.com','64707510','04845543',7),
(8,'77 ssss st,','asensio','sergio','vancouver','BC','m5t0c3','v8rock@gmail.com','68027810','03655543',8),
(9,'43 lllll st,','abdual','sbudal','toronto','ON','m0v0c3','v9rock@gmail.com','64702730','3345543',9),
(10,'10 fffff st,','jason','wang','toronto','ON','v5t0f3','v10rock@gmail.com','64786510','33305543',10);

select * from Customer


-------------2 FK------------------------------Create table Customer-Account and insert values
create table Customer_Account
(
AccountID_FK int not null  references [Account](AccountID),
CustomerID_FK int not null references[Customer](CustomerID) 
)


insert into [Customer_Account](AccountID_FK , CustomerID_FK) 
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10)


select * from Customer_Account


------------2 FK AfterAccount--------------Create table Login_Account and insert values
create table Login_Account
(
	UserLoginID smallint not null references UserLogins(UserLoginID),
	AccountID int not null references Account(AccountID)
)
insert into Login_Account
Values 
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10);
select * from Login_Account

---------------1 FK AfterAccount------------------Create table OverDraftLog and insert values
create table OverDraftLog
(
AccountID_FK int not null primary key references[Account](AccountID),
OverdraftDate datetime not null default getdate(),
OverDraftAmount money not null,
OverDraftTransactionXML XML null 
)

insert into [OverDraftLog](AccountID_FK, OverDraftAmount, OverdraftDate) 
values (2,2434.5,'180612 10:34:09 AM'),
(3,3211.1,'180712 10:30:09 AM'),
(1,232.33,'180922 11:34:09 AM'),
(4,24.1,'180102 01:04:09 AM'),
(5,33.22,'180112 08:34:09 AM'),
(9,111.1,'180114 12:14:09 AM')

select * from OverDraftLog








---------------5 FK------------------Create table TransactionLog and insert values
create table TransactionLog
(
TransactionID int not null primary key identity(1,1),
TransactionDate datetime not null default getdate(),
TransactionTypeID_FK tinyint not null references[TransactionType](TransactionTypeID),
TransactionAmount money not null,
NewBalance money not null,
AccountID_FK int not null references[Account](AccountID),
CustomerID_FK int not null references[Customer](CustomerID), 
EmployeeID_FK integer not null references[Employee](EmployeeID),
UserLoginID_FK smallint not null references[UserLogins](UserLoginID)
)

insert into [TransactionLog](TransactionTypeID_FK, TransactionAmount, NewBalance, AccountID_FK, CustomerID_FK,  EmployeeID_FK, UserLoginID_FK) ---- UserLoginID_FK needs to be filled
values (1,500,23713,1,1,1,1 ),
(1,500,31811,2,2,2,2),
(1,1000,32232,3,3,2,3),
(3,1000,7646,4,4,5, 4),
(1,1000,76675,5,5,2,5),
(2,500,6787,6,6,4, 6),
(1,1000,575984,7,7,2,7 ),
(1,500,8686,8,8,1, 8),
(2,100,988,9,9,3,9),
(1,15,42357,10,10,7,10 )

select * from TransactionLog










---Phase 2

---1.	Create a view to get all customers with checking account from ON province. [Moderate]

create view [vw_1]
as
select AccountID_FK,CustomerAddress1,CustomerFirstName, CustomerLastName, City, [State], ZipCode, EmailAddress, CellPhone,SSN,UserLoginID_FK
from Customer
where [State]='ON' 

select* from [vw_1]



---2.	Create a view to get all customers with total account balance (including interest rate) greater than 5000. 
create view [vw_2]
as
select c.CustomerFirstName, c.CustomerLastName, InterestRateValue, sum(CurrentBalance) as total_balance
from SavingInterestRates s 
inner join Account a on a.InterestSavingsRateID_FK=s.InterestSavingsRateID
inner join Customer c on c.AccountID_FK=a.AccountID
group by c.CustomerFirstName, c.CustomerLastName, InterestRateValue
having sum(CurrentBalance)>5000

select* from vw_2


-----3.	Create a view to get counts of checking and savings accounts by customer. 

create view [vw_3]
as
select c.CustomerFirstName, c.CustomerLastName, AccountTypeDescription, count( AccountTypeDescription ) as accounttype_count 
from AccountType t
inner join Account a on a.AccountTypeID_FK=t.AccountTypeID
inner join Customer c on c.AccountID_FK=a.AccountID
where AccountTypeDescription like '%Saving%' or AccountTypeDescription like '%Check%'
group by c.CustomerFirstName, c.CustomerLastName, AccountTypeDescription


select * 
from vw_3


select count( AccountTypeDescription ) as Savingaccount_count 
from vw_3
where AccountTypeDescription = 'Saving'


select count( AccountTypeDescription ) as checkingaccount_count
from vw_3
where AccountTypeDescription like'%Check%'


----4.	Create a view to get any particular user¡¯s login and password using AccountId. 

create view [vw_4]
as
select a.AccountID, u.UserLogin, u.UserPassword
from UserLogins u
inner join Login_Account l on u.UserLoginID=l.UserLoginID
inner join Account a on l.AccountID= a.AccountID

select* from vw_4

--method 1
declare @accountid varchar(50) 
set @accountid=6  ---- you can insert any integer from 1 to 10 (total of 10 customers) after 'set @accountid= '
select* from vw_4
where  AccountID=@accountid



--method 2
alter procedure insert_accountid
@AccountID int
as
select* from vw_4
where  AccountID=@accountid
---- you can insert any integer from 1 to 10 after 'exec insert_accountid '. for example:
exec insert_accountid 2 
exec insert_accountid 6


---5.	Create a view to get all customers¡¯ overdraft amount. 
create view [vw_5]
as
select c.CustomerFirstName, c.CustomerLastName, o.OverDraftAmount
from OverDraftLog o
inner join Customer c on o.AccountID_FK= c.AccountID_FK

select* from vw_5

select SUM(OverDraftAmount) SUM_OverDraftAmount  from vw_5


---6.	Delete all error logs created in the last hour
begin tran-- add this line u can retrieve back after roll back
delete from LoginErrorLog
where ErrorTime> dateadd(HOUR,-1, getdate())
select*from LoginErrorLog

rollback tran -- retrieve data back
commit tran 




---7.	Write a query to remove SSN column from Customer table
begin tran
alter table Customer 
drop column SSN

select*from Customer

rollback tran
commit tran