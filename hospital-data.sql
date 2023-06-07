USE hospital;

INSERT INTO Physician VALUES('9198794834', '321 Ell St', 1, 'John', 1000, 'Cardiology');
INSERT INTO Physician VALUES('9193293233', '879 Bell St', 2, 'Bill', 1001, 'Peidatrics');
INSERT INTO Physician VALUES('2321236576', '31 Tree Rd', 3, 'Doug', 1002, 'Radiology');
INSERT INTO Physician VALUES('2330820309', '782 Wegdewood St', 4, 'Amy', 10003, 'Meidicene');
INSERT INTO Physician VALUES('7959483949', '902 Neuse St', 5, 'Stephanie', 1004, 'Oncology');

INSERT INTO Instruction Values(1, 600, 'Put IV in');
INSERT INTO Instruction Values(2, 700, 'Take blood pressure');
INSERT INTO Instruction Values(3, 240,'Give medicene');
INSERT INTO Instruction Values(4, 820, 'Take pulse');
INSERT INTO Instruction Values(5, 800, 'Prep for surgery');

INSERT INTO Nurse Values('2326574354','325 Billing Rd', 5, 'Trish', 2001);
INSERT INTO Nurse Values('5467980945','23 Magnolia Rd', 3, 'Barb', 2000);
INSERT INTO Nurse Values('2332453231','873 Albo St', 2, 'Scarlett', 2005);
INSERT INTO Nurse Values('1246463435','32 Apple Rd', 4, 'Adam', 2004);
INSERT INTO Nurse Values('5754756853','92 Till Rd', 1, 'Johnny', 2003);
INSERT INTO Nurse Values('2342323442','32 Albo St', 6, 'Jenny', 2006);

INSERT INTO Patient Values('686 Treeboro Rd',1, 'Mike','2873782323');
INSERT INTO Patient Values('3 Billane Lane',2,'Billy','2342423423');
INSERT INTO Patient Values('23 Air Rd',3,'Mallory','4534323215');
INSERT INTO Patient Values('21 Sike Lane',5,'Sam','2376424523');
INSERT INTO Patient Values('87 Chery Rd',4,'Vallory','9785452035');


INSERT INTO Medication Values('Alphanda',200);
INSERT INTO Medication Values('Sanderata',350);
INSERT INTO Medication Values('Ibeuprofen',490);
INSERT INTO Medication Values('Abiteral',500);
INSERT INTO Medication Values('Neliatas',100);

INSERT INTO Health_Record Values('Sick',"Has the flu",5,2001, "flue",'2023-04-23');
INSERT INTO Health_Record Values('Recovery',"Recovering from surgery",4,2002, "cancer",'2023-01-17');
INSERT INTO Health_Record Values('Entering',"Prepping for surgery",3,2003,"none",'2023-05-19');
INSERT INTO Health_Record Values('Extiting',"Leaving hospital at 2:00",2,2004,"measles",'2021-04-07');
INSERT INTO Health_Record Values('Surgery',"In brain surgery",3,2005,"none",'2022-04-23');

INSERT INTO Invoice Values('2021-06-11',1000,501,4);
INSERT INTO Invoice Values('2022-06-11',3000,502,5);
INSERT INTO Invoice Values('2020-07-12',2200,503,3);
INSERT INTO Invoice Values('2019-09-29',3200,504,1);
INSERT INTO Invoice Values('2016-10-09',15000,505,2);
INSERT INTO Invoice Values('2017-12-09',3100,506,2);
INSERT INTO Invoice Values('2020-12-11',4230,507,3);
INSERT INTO Invoice Values('2022-11-01',3000,508,4);


INSERT INTO Care_Recorded Values('2021-06-11', 401,'Take prescription twice a day', 5,3,1);
INSERT INTO Care_Recorded Values('2022-07-12', 402,'Ice 30 minutes a day', 3,2,4);
INSERT INTO Care_Recorded Values('2023-01-21', 403,'Apply gel persisitently', 4,1,5);
INSERT INTO Care_Recorded Values('2022-06-22', 404,'Rest and elevate right foot', 1,5,2);
INSERT INTO Care_Recorded Values('2019-09-29', 405,'Take it easy and get adequate rest', 2,4,3);
INSERT INTO Care_Recorded Values('2020-09-29', 406,'DO theapy 20 minutes a day', 2,6,3);


INSERT INTO Payment Values ('2022-02-28',600,4);
INSERT INTO Payment Values('2021-08-02',950,5);
INSERT INTO Payment Values('2023-05-17',1050,3);
INSERT INTO Payment Values('2019-11-16',400,1);
INSERT INTO Payment Values('2020-10-18',350,2);
INSERT INTO Payment Values('2023-05-17',400,5);
INSERT INTO Payment Values('2019-11-16',360,1);
INSERT INTO Payment Values('2020-10-18',6700,3);


INSERT INTO Room Values(1, 401, 4, 500);
INSERT INTO Room Values(4, 402, 5, 600);
INSERT INTO Room Values(5, 403, 4, 550);
INSERT INTO Room Values(2, 404, 3, 400);
INSERT INTO Room Values(3, 405, 6, 550);

