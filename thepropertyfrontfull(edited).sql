SET foreign_key_checks = 0;
create table Uploads(type varchar(20),path varchar(150),mesage varchar(200), price varchar(20), user varchar(30));
create Table Users(username varchar(10) primary key, email varchar(20), gender char, dob varchar(12), ph varchar(10), password varchar(64));
create table Buyer(User_id varchar(20) primary key, DOB date, gender varchar(6), Uname varchar(20), Phno varchar(10));
create table Seller(User_id varchar(20) primary key, DOB date, gender varchar(6), Uname varchar(20), Phno varchar(10));
create table Property(Property_id varchar(10) primary key,Seller_id varchar(20),Buyer_id varchar(20),ptype varchar(10), Area_size int, price int,Status varchar(10),Prop_num varchar(10),Prop_name varchar(20),Area_name varchar(20),City varchar(20),pstate varchar(20),Pin char(6),foreign key(Buyer_id) references Buyer(User_id),foreign key(Seller_id) references Seller(User_id) on delete cascade);
create table Features(Features_id varchar(10) primary key, Decription varchar(100), Feature_name varchar(20));
create table Apartments(Property_id varchar(10),Area int, No_of_rooms int,Floo_r int,Facing varchar(10),foreign key(Property_id) references Property(Property_id));
create table Plots(Property_id varchar(10), Area int, Type varchar(20),Facing varchar(10),foreign key(Property_id) references Property(Property_id));
create table Commercials(Property_id varchar(10), Carpet_Area int, No_of_floors int,foreign key(Property_id) references Property(Property_id));
create table Villas(Property_id varchar(10), No_of_rooms int,Area int,Floors int,Facing varchar(10),foreign key(Property_id) references Property(Property_id));
create table Has_feature(property_id varchar(10),features_id varchar(10),foreign key(property_id) references Property(Property_id),foreign key(features_id) references Features(Features_id));

insert into Buyer values('B0001','1998/07/27','Male','Sandhya','9632493226');
insert into Buyer values('B0002','1998/10/18','Male','Aayush','9632493116');
insert into Buyer values('B0003','1997/05/13','Male','Ganesh','9632497896');
insert into Buyer values('B0004','1996/01/05','Female','Prajakta','9789493226');
insert into Buyer values('B0005','1999/02/26','Female','Ithi','9632445226');
insert into Buyer values('B0006','1995/02/27','Male','Rama','9632478226');
insert into Buyer values('B0007','1992/12/07','Female','Sowjanya','9637823226');
insert into Buyer values('B0008','1990/09/17','Female','Kalima','9634193226');
insert into Buyer values('B0009','1995/03/30','Male','Borat','9677793226');
insert into Buyer values('B0010','1991/05/29','Female','Disha','9487993226');


insert into Seller values('S0001','1998/06/25','Male','Suresh','9854567891');
insert into Seller values('S0002','1992/10/22','Male','Ramesh','9754544891');
insert into Seller values('S0003','1991/01/08','Female','Suraksha','9834567891');
insert into Seller values('S0004','1995/07/18','Female','Vaishnavi','9514567891');
insert into Seller values('S0005','1997/02/10','Male','Kiran','9534587891');
insert into Seller values('S0006','1998/12/14','Female','Chandni','9874567891');
insert into Seller values('S0007','1990/05/29','Female','Sunidhi','9854557891');
insert into Seller values('S0008','1994/03/15','Male','Sugun','9434554891');
insert into Seller values('S0009','1990/02/09','Female','Shravya','9734567891');
insert into Seller values('S0010','1999/01/11','Male','Bhargav','9534568891');

insert into Property values('AP0001','S0001','B0010','Apartment',1350,5500000,'Sold','121','Mahabaleshwara','Banashankari','Bengaluru','Karnataka','560082');
insert into Property values('AP0002','S0002',NULL,'Apartment',3500,7500000,'Available','12','AGSLayout','Uttarahalli','Bengaluru','Karnataka','560062');
insert into Property values('AP0003','S0003',NULL,'Apartment',7550,6500000,'Available','21','Classique','Nagarabhavi','Bengaluru','Karnataka','560072');
insert into Property values('AP0004','S0004','B0001','Apartment',6050,5500000,'Sold','11','DreamVilla','Kanakapura','Bengaluru','Karnataka','560152');
insert into Property values('AP0005','S0005',NULL,'Apartment',8050,8500000,'Available','200','Swarga','Mathikere','Bengaluru','Karnataka','560079');
insert into Property values('AP0006','S0006','B0002','Apartment',5550,12500000,'Sold','11','Elpadre','Basavangudi','Bengaluru','Karnataka','560055');
insert into Property values('AP0007','S0007','B0003','Apartment',6550,3500000,'Sold','325','AKLayout','Belandoor','Bengaluru','Karnataka','560015');
insert into Property values('AP0008','S0008',NULL,'Apartment',4550,10000000,'Available','300','Nammane','Marthahalli','Bengaluru','Karnataka','560044');
insert into Property values('AP0009','S0009','B0004','Apartment',5550,4000000,'Sold','555','Sambhrama','Dwarkanagar','Bengaluru','Karnataka','560557');
insert into Property values('AP0010','S0001',NULL,'Apartment',7750,7000000,'Available','751','KempegowdaLayout','RRNagar','Bengaluru','Karnataka','560774');
insert into Property values('PL0001','S0002','B0004','Plot',1350,4000000,'Sold','655','Sambhra','Banashankari','Bengaluru','Karnataka','560085');
insert into Property values('PL0002','S0003','B0006','Plot',9050,9000000,'Sold','755','Salarpuria','Sarjapur','Bengaluru','Karnataka','560035');
insert into Property values('PL0003','S0004',NULL,'Plot',7550,7500000,'Available','855','Purva','Bellandur','Bengaluru','Karnataka','560036');
insert into Property values('PL0004','S0005','B0008','Plot',6550,7100000,'Sold','955','Raheja','Kora','Bengaluru','Karnataka','560034');
insert into Property values('PL0005','S0006',NULL,'Plot',4580,4210000,'Available','754','Rainbow Residency','Sarjapur','Bengaluru','Karnataka','560035');
insert into Property values('PL0006','S0007','B0010','Plot',7720,7830000,'Sold','744','Palm Medows','Whitefield','Bengaluru','Karnataka','560066');
insert into Property values('PL0007','S0008','B0009','Plot',8850,8710000,'Sold','854','Shantineketan','Brigade','Bengaluru','Karnataka','560068');
insert into Property values('PL0008','S0009',NULL,'Plot',4520,4040000,'Available','757','Vasundhra','Banashankari','Bengaluru','Karnataka','560085');
insert into Property values('PL0009','S0010','B0005','Plot',4440,4300000,'Sold','652','Mantri','Domlur','Bengaluru','Karnataka','560033');
insert into Property values('PL0010','S0010','B0007','Plot',7740,7380000,'Sold','459','Suncity','Iblur','Bengaluru','Karnataka','560087');
insert into Property values('VI0001','S0001','B0002','Villa',1950,1600000,'Sold','352','Golden Gate','Whitefield','Bengaluru','Karnataka','560066');
insert into Property values('VI0002','S0002',NULL,'Villa',2950,2650000,'Available','359','Palm Medows','Whitefield','Bengaluru','Karnataka','560066');
insert into Property values('VI0003','S0003','B0009','Villa',1000,1040000,'Sold','357','Golden Gate','Whitefield','Bengaluru','Karnataka','560066');
insert into Property values('VI0004','S0004','B0007','Villa',4000,4200000,'Sold','290','Aishwarya','Sarjapur','Bengaluru','Karnataka','560035');
insert into Property values('VI0005','S0005',NULL,'Villa',3000,3720000,'Available','152','Ashok','Hoskotte','Bengaluru','Karnataka','562114');
insert into Property values('VI0006','S0006','B0004','Villa',1000,1042000,'Sold','007','Nammane','Marathahalli','Bengaluru','Karnataka','560044');
insert into Property values('VI0007','S0007','B0001','Villa',4050,4340000,'Sold','876','KempegowdaLayout','RRNagar','Bengaluru','Karnataka','560774');
insert into Property values('VI0008','S0008',NULL,'Villa',1000,1020000,'Available','297','Sambhra','Banashankari','Bengaluru','Karnataka','560085');
insert into Property values('VI0009','S0009','B0006','Villa',3000,3820000,'Sold','333','Golden Gate','Whitefield','Bengaluru','Karnataka','560066');
insert into Property values('VI0010','S0010','B0009','Villa',2000,2005000,'Sold','545','Madhura','Domlur','Bengaluru','Karnataka','560033');







insert into Apartments values('AP0001',1350,3,6,'West');
insert into Apartments values('AP0002',3500,6,4,'North');
insert into Apartments values('AP0003',7550,4,2,'West');
insert into Apartments values('AP0004',6050,2,7,'East');
insert into Apartments values('AP0005',8050,6,5,'South');
insert into Apartments values('AP0006',5550,4,1,'East');
insert into Apartments values('AP0007',6550,2,4,'North');
insert into Apartments values('AP0008',4550,5,5,'South');
insert into Apartments values('AP0009',5550,3,7,'East');
insert into Apartments values('AP0010',7750,1,1,'West');



insert into Plots values ('PL0001',1350,'Corner','East');
insert into Plots values ('PL0002',9050,'Roadside','West');
insert into Plots values ('PL0003',7550,'Remote','North');
insert into Plots values ('PL0004',6550,'Countryside','South');
insert into Plots values ('PL0005',4580,'Corner','East');
insert into Plots values ('PL0006','7720','Roadside','South');
insert into Plots values ('PL0007',8850,'Remote','North');
insert into Plots values ('PL0008',4520,'Corner','East');
insert into Plots values ('PL0009',4440,'Roadside','West');
insert into Plots values ('PL0010',7740,'Countryside','South');


insert into Commercials values('CO0001',5000,3);
insert into Commercials values('CO0002',7000,4);
insert into Commercials values('CO0003',4500,3);
insert into Commercials values('CO0004',7450,2);
insert into Commercials values('CO0005',1000,1);
insert into Commercials values('CO0006',8230,4);
insert into Commercials values('CO0007',4578,2);
insert into Commercials values('CO0008',7500,4);
insert into Commercials values('CO0009',1200,1);
insert into Commercials values('CO0010',7500,5);

insert into Villas values ('VI0001',4,1950,2,'East');
insert into Villas values ('VI0002',5,2950,3,'West');
insert into Villas values ('VI0003',3,1000,1,'North');
insert into Villas values ('VI0004',6,4000,4,'South');
insert into Villas values ('VI0005',4,3000,3,'West');
insert into Villas values ('VI0006',2,1000,2,'South');
insert into Villas values ('VI0007',5,4050,6,'North');
insert into Villas values ('VI0008',1,1000,1,'West');
insert into Villas values ('VI0009',4,3000,3,'East');
insert into Villas values ('VI0010',3,2000,2,'South');

insert into Features values('F0001','1000 Sqft gym','Gym');
insert into Features values('F0002','200 Sqft rooftop','rooftop');
insert into Features values('F0003','500 Sqft swimming pool','swimming pool');
insert into Features values('F0004','800 Sqft football ground','football ground');
insert into Features values('F0005','600 Sqft Lawn','Lawn');
insert into Features values('F0006','2000 Sqft Club House','Club House');
insert into Features values('F0007','500 Sqft room','Laundry Room');
insert into Features values('F0008','1000 Sqft Center','Business Center');
insert into Features values('F0009','2000 Sqft Center','Childcare Center');

insert into Has_feature values('AP0001','F0001');
insert into Has_feature values('AP0001','F0002');
insert into Has_feature values('AP0001','F0004');
insert into Has_feature values('AP0002','F0006');
insert into Has_feature values('AP0002','F0005');
insert into Has_feature values('AP0002','F0001');
insert into Has_feature values('AP0002','F0001');
insert into Has_feature values('AP0003','F0002');
insert into Has_feature values('AP0003','F0003');
insert into Has_feature values('AP0003','F0006');
insert into Has_feature values('AP0004','F0005');
insert into Has_feature values('AP0004','F0001');
insert into Has_feature values('AP0004','F0002');
insert into Has_feature values('AP0005','F0003');
insert into Has_feature values('AP0005','F0006');
insert into Has_feature values('AP0006','F0001');
insert into Has_feature values('AP0006','F0002');
insert into Has_feature values('AP0007','F0001');
insert into Has_feature values('AP0007','F0003');
insert into Has_feature values('AP0008','F0006');
insert into Has_feature values('AP0008','F0005');
insert into Has_feature values('AP0009','F0001');
insert into Has_feature values('AP0009','F0002');
insert into Has_feature values('AP0010','F0003');
insert into Has_feature values('AP0010','F0006');

insert into Has_feature values('PL0001','F0005');
insert into Has_feature values('PL0001','F0008');
insert into Has_feature values('PL0002','F0009');
insert into Has_feature values('PL0002','F0005');
insert into Has_feature values('PL0003','F0008');
insert into Has_feature values('PL0003','F0005');
insert into Has_feature values('PL0004','F0009');
insert into Has_feature values('PL0004','F0005');
insert into Has_feature values('PL0005','F0008');
insert into Has_feature values('PL0005','F0005');
insert into Has_feature values('PL0006','F0009');
insert into Has_feature values('PL0006','F0005');
insert into Has_feature values('PL0007','F0008');
insert into Has_feature values('PL0007','F0005');
insert into Has_feature values('PL0008','F0009');
insert into Has_feature values('PL0008','F0005');
insert into Has_feature values('PL0009','F0008');
insert into Has_feature values('PL0009','F0005');
insert into Has_feature values('PL0010','F0009');
insert into Has_feature values('PL0010','F0005');

insert into Has_feature values('VI0001','F0005');
insert into Has_feature values('VI0001','F0008');
insert into Has_feature values('VI0002','F0009');
insert into Has_feature values('VI0002','F0005');
insert into Has_feature values('VI0003','F0008');
insert into Has_feature values('VI0003','F0005');
insert into Has_feature values('VI0004','F0009');
insert into Has_feature values('VI0004','F0005');
insert into Has_feature values('VI0005','F0008');
insert into Has_feature values('VI0005','F0005');
insert into Has_feature values('VI0006','F0009');
insert into Has_feature values('VI0006','F0005');
insert into Has_feature values('VI0007','F0008');
insert into Has_feature values('VI0007','F0005');
insert into Has_feature values('VI0008','F0009');
insert into Has_feature values('VI0008','F0005');
insert into Has_feature values('VI0009','F0008');
insert into Has_feature values('VI0009','F0005');
insert into Has_feature values('VI0010','F0009');
insert into Has_feature values('VI0010','F0003');
insert into Has_feature values('VI0001','F0003');
insert into Has_feature values('VI0003','F0003');
insert into Has_feature values('VI0005','F0003');
insert into Has_feature values('VI0007','F0003');
insert into Has_feature values('VI0009','F0003');





/*sellers who sells property in Banashankari
select Uname from seller,property where User_id=Seller_id and area_name='Banashankari'; 
/*buyers who have bought 3bhk apartment
select Uname from Buyer,property,apartments where Buyer_id=User_id and property.property_id=apartments.property_id and No_of_rooms=3;
/*no.of properties sold in Kempegowda Layout
select count(*) from property where Prop_name='KempegowdaLayout' and status='Sold';*/

