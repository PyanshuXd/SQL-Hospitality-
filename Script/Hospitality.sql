CREATE DATABASE Hospitality;

CREATE TABLE Dept(
DeptId              INT PRIMARY KEY NOT NULL,
DeptName            VARCHAR(30),
Description         VARCHAR(100)
);

CREATE TABLE Room(
RoomID 			INT PRIMARY KEY,
DeptID			INT,
RoomType 		VARCHAR(50),
Price 			INT,
Status 			VARCHAR(20),

FOREIGN KEY (DeptID) REFERENCES Dept(DeptId)
);

CREATE TABLE Pharmacy(
PharmacyId          INT PRIMARY KEY NOT NULL,
Store_Name          VARCHAR(20),
Address       		VARCHAR(50),
City                VARCHAR(20),
Phone               INT,
Email               VARCHAR(30)
);

CREATE TABLE Patient(
PatientId           INT PRIMARY KEY NOT NULL,
RoomId              INT NOT NULL,
First_Name          VARCHAR(20),
Last_Name           VARCHAR(20),
Email               VARCHAR(20),
Phone               INT,
Address        		VARCHAR(20),
City                VARCHAR(20),
State               VARCHAR(20),
Allergies           VARCHAR(30),
ChronicDisease      VARCHAR(30),
PharmacyId         	INT NOT NULL,

FOREIGN KEY(PharmacyId) REFERENCES Pharmacy(PharmacyId),
FOREIGN KEY(RoomId) REFERENCES Room(RoomID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    CustomerID INT,
    Comments VARCHAR(200),
    Rating INT,
    FOREIGN KEY (CustomerID) REFERENCES Patient(PatientId)
);

CREATE TABLE Treatment_Details(
Treatment_Id     		INT PRIMARY KEY ,
Treatment_Name          VARCHAR(25),
Description            	VARCHAR(100),
Price                  	DECIMAL(10,2)
);

CREATE TABLE Treatment(
TreatmentId           INT PRIMARY KEY NOT NULL,
PatientId             INT,
TreatmentDetailsId    INT,
CurrentCondition      VARCHAR(100),
TreatmentDate         DATETIME,

FOREIGN KEY(PatientId) REFERENCES Patient(PatientId),
FOREIGN KEY(TreatmentDetailsId) REFERENCES Treatment_Details(Treatment_Id)
);

CREATE TABLE Payment(
PaymentNumber        INT PRIMARY KEY NOT NULL,
PatientId            INT,
TreatmentId          INT,
TotalAmountDue       DECIMAL(10,2),
DueDate              DATETIME,
AmountPaid           DECIMAL(10,2),

FOREIGN KEY(TreatmentId) REFERENCES Treatment(TreatmentId),
FOREIGN KEY(PatientId)   REFERENCES Patient(PatientId)
);

CREATE TABLE Perscription(
PerscriptionId      INT PRIMARY KEY NOT NULL,
Name                VARCHAR(20),
Description         VARCHAR(20),
SideEffects         VARCHAR(50)
);

CREATE TABLE Perscription_History(
PatientId           INT NOT NULL,
PerscriptionId      INT,
DatePerscribed      DATETIME,
Dosage              VARCHAR(50),
Frequency           VARCHAR(20),

FOREIGN KEY(PatientId)      REFERENCES Patient(PatientId),
FOREIGN KEY(PerscriptionId) REFERENCES Perscription(PerscriptionId)
);

CREATE TABLE Doctor(
DoctorId            INT PRIMARY KEY NOT NULL,
First_Name          VARCHAR(20),
Last_Name           VARCHAR(20),
Email               VARCHAR(20),
Phone               INT,
Address        		VARCHAR(20),
City                VARCHAR(10),
State               VARCHAR(20)
);

CREATE TABLE Appointment(
AppointmentID		INT PRIMARY KEY NOT NULL,
PatientId			INT,
Start_Date			DATETIME,
End_Date			DATETIME,
Examination_Room	INT,

FOREIGN KEY(PatientId) REFERENCES patient(PatientId),
FOREIGN KEY(Examination_Room) REFERENCES room(RoomID)
);

CREATE TABLE Nurse(
NurseId             INT PRIMARY KEY NOT NULL,
First_Name          VARCHAR(20),
Last_Name           VARCHAR(20),
Email               VARCHAR(20),
Phone               VARCHAR(20),
Address       		VARCHAR(20),
City                VARCHAR(20)
);

CREATE TABLE NurseWard(
DeptAssignmentId    INT PRIMARY KEY NOT NULL,
NurseId             INT,
DeptId              INT,
Shift               DATETIME,

FOREIGN KEY(NurseId) REFERENCES Nurse(NurseId),
FOREIGN KEY(DeptId) REFERENCES Dept(DeptId)
);

CREATE TABLE Speciality(
Speciality_Id        INT PRIMARY KEY NOT NULL,
Speciality_Name      VARCHAR(20),
Description         VARCHAR(100)
);

CREATE TABLE Doctor_Patient(
DoctorId            INT PRIMARY KEY NOT NULL,
PatientId           INT NOT NULL UNIQUE,
AppointmentDate     DATETIME,

FOREIGN KEY(DoctorId) REFERENCES Doctor(DoctorId),
FOREIGN KEY(PatientId) REFERENCES Patient(PatientId)
);

CREATE TABLE Doctor_Speciality(
Speciality_Id      INT PRIMARY KEY NOT NULL,
DoctorId           VARCHAR(20) UNIQUE,

FOREIGN KEY(Speciality_Id) REFERENCES Speciality(Speciality_Id)
);

INSERT INTO Dept VALUES
('1' , 'Dengue Department' , 'All patients having Dengue' ),
('2' , 'ICU Department' , 'All patients having serious problem'),
('3' , 'Heart Department' , 'All patients having Heart Problems'),
('4' , 'Test Department' , 'All patients will have blood test in TestWard'),
('5' , 'Surgical Department' , 'Patients will have surgery in surgical Ward'),
('6', 'Cardiology Department', 'For heart-related disorders'),
('7', 'Oncology Department', 'For cancer treatment'),
('8', 'Pediatrics Department', 'For medical care of children'),
('9', 'Maternity Department', 'For prenatal and postnatal care'),
('10', 'Psychiatric Department', 'For mental health and related disorders');

INSERT INTO Room VALUES
(011 , 'Suite', 250, 'Booked', 1 ),
(012 , 'General Ward', 150, 'Booked', 2 ),
(013 , 'Deluxe Room', 350, 'Booked', 3 ),
(014 , 'Intensive Care', 300, 'Booked', 4 ),
(015 , 'Private Room', 500, 'Vacant', 5 ),
(016 , 'PICU', 290, 'Booked', 6 ),
(017 , 'Super Deluxe', 500, 'Vacant', 7 ),
(018 , 'Maternity Unit', 150, 'Booked', 8),
(019 , 'Paediatric Ward', 200, 'Vacant', 9 ),
(020 , 'Semi-Private', 450, 'Booked', 10 );

INSERT INTO Pharmacy  VALUES
('021' , 'Apollo Pharmacy' , 'IT office' , 'Bangaluru' , 1800549875 , 'abc1@gmail.com'),
('022' , 'Medplus', 'General Post Office' , 'Indore'  , 1800987456 , 'bca2@gmail.com'),
('023' , 'Emami Frank Ross'  , 'Howrah' , 'Kolkata'   , 1800598732 , 'cba3@gmail.com'),
('024' , 'Fortis'       , 'Delivery Sector' , 'Pune' , 1800250064 , 'bac4@gmail.com'),
('025' , 'Guardian Pharmacy'    , 'Naihati', 'Kolkata' , 1800609080 , 'cab5@gmail.com'),
('026' , 'Himalaya Drug Company' , 'Kashmir Post office', 'Kashmir' , 1800354894  , 'fmn5@gmail.com'),
('027' , 'Medlife'    , 'HinduTown', 'Lucknow' , 1800302987  , 'xyz@gmail.com'),
('028' , 'Netmeds' , 'Saltlake Sector', 'Kolkata' , 1800258940  , 'def@gmail.com'),
('029' , '1MG' , 'Bandra', 'Mumbai'  , 1800357948  , 'faz@gmail.com'),
('030' , 'Pharmeasy' , 'Sharif', 'Patna' , 1800406890  , 'shah@gmail.com');

INSERT INTO Patient VALUES 
(100, 011, 'Manish', 'Malhotra', 'Manish@example.com', 123-456-7890, '123 Main St', 'Kolkata', 'WB', 'Asthma', 'High blood pressure', 021),
(200, 012, 'Pyanshu', 'Shaw', 'Pyanshu@example.com', 234-567-8901, '456 Oak St', 'Kolkata', 'WB', 'Diabetes', 'Anxiety', 022),
(300, 013, 'Bobby', 'Dutta', 'bobby@example.com', 345-678-9012, '789 Elm St', 'Bangaluru', 'KA', 'Arthritis', 'Depression', 023),
(400, 014, 'Abhishek', 'Shaw', 'Abhi@example.com', 456-789-0123, '234 Maple St', 'Noida', 'UP', 'Migraines', 'High cholesterol', 024),
(500, 015, 'Deep', 'Bhattacharjee', 'Deep@example.com', 567-890-1234, '567 Pine St', 'Pune', 'MH', 'Hypertension', 'GERD', 025),
(600, 016, 'Supratik', 'Ranjit', 'Sup@example.com', 678-901-2345, '890 Cedar St', 'Mumbai', 'MH', 'Eczema', 'Back pain', 026),
(700, 017, 'Anjan', 'Paul', 'Anjan@example.com', 789-012-3456, '123 Oak Ave', 'Kolkata', 'WB', 'Asthma', 'Depression', 027 ),
(800, 018, 'Suporno', 'Sarkar', 'Supornoa@example.com', 890-123-4567, '456 Elm Ave', 'Chennai', 'TN', 'Migraines', 'Anemia', 028),
(900, 019, 'Rajarshri', 'Singh', 'Raj@example.com', 901-234-5678, '789 Maple Ave', 'Indore', 'CH', 'High blood pressure', 'GERD', 029),
(1000, 020, 'Rishab', 'Mondal', 'Rishab@example.com', 012-345-6789, '234 Pine Ave', 'Delhi', 'HR', 'Arthritis', 'Depression', 030);

INSERT INTO Feedback VALUES 
(01, 100, 'Great service!', 5),
(02, 200, 'Staffs were helpful', 5),
(03, 300, 'Hygiene is good as per my personal experience', 4),
(04, 400, 'Worth it', 4),
(05, 500, 'No delay in room allocation and bed availability', 5),
(06, 600, 'My bed was broken from left side, please fix it.', 3),
(07, 700, 'Food & Accommodation Quality is not that worth the price', 2),
(08, 800, 'The billing process was clear and accurate', 5),
(09, 900, 'My doctor was lil late in arriving', 3),
(010, 1000, 'Impressed', 4);

INSERT INTO Treatment_Details VALUES 
(1, 'Teeth Cleaning', 'A basic teeth cleaning that includes removing plaque and tartar buildup', 75.00),
(2, 'Cavity Filling', 'Filling a cavity to prevent further tooth decay', 150.00),
(3, 'Root Canal', 'Removing infected tissue from inside a tooth', 800.00),
(4, 'Tooth Extraction', 'Removing a tooth that cannot be saved', 200.00),
(5, 'Teeth Whitening', 'A cosmetic treatment that removes stains and brightens teeth', 250.00),
(6, 'Dental Implant', 'A permanent solution for replacing missing teeth', 2000.00),
(7, 'Braces', 'A orthodontic treatment for correcting crooked teeth or a misaligned bite', 3500.00),
(8, 'Dentures', 'A removable appliance for replacing missing teeth', 1200.00),
(9, 'Gum Surgery', 'A surgical procedure for treating gum disease', 1500.00),
(10, 'Mouthguard', 'A device for protecting teeth during sports or grinding', 100.00);

INSERT INTO Treatment VALUES 
(1001, 100, 1, 'Good', '2022-03-15'),
(1002, 200, 2, 'Fair', '2022-03-16'),
(1003, 300, 3, 'Poor', '2022-03-17'),
(1004, 400, 4, 'Good', '2022-03-18'),
(1005, 500, 5, 'Fair', '2022-03-19'),
(1006, 600, 6, 'Poor', '2022-03-20'),
(1007, 700, 7, 'Good', '2022-03-21'),
(1008, 800, 8, 'Fair', '2022-03-22'),
(1009, 900, 9, 'Poor', '2022-03-23'),
(1010, 1000,10, 'Good', '2022-03-24');

INSERT INTO Payment VALUES
(101, 100, 1001, 75.00, '2022-04-15', 75.00, 'Due'),
(201, 200, 1002, 150.00, '2022-04-16', 75.00, 'Due'),
(301, 300, 1003, 0.00, '2022-04-17', 800.00, 'Cleared'),
(401, 400, 1004, 200.00, '2022-04-18', 150.00, 'Due'),
(501, 500, 1005, 0.00, '2022-04-19', 250.00, 'Cleared'),
(601, 600, 1006, 2000.00, '2022-04-20', 1000.00, 'Due'),
(701, 700, 1007, 0.00, '2022-04-21', 3500.00, 'Cleared'),
(801, 800, 1008, 1200.00, '2022-04-22', 600.00, 'Due'),
(901, 900, 1009, 0.00, '2022-04-23', 1500.00, 'Cleared'),
(1001,1000, 1010, 100.00, '2022-04-24', 100.00, 'Due');

INSERT INTO  Perscription VALUES
(111, 'Ibuprofen', 'Pain relief ', 'Upset stomach'),
(222, 'Amoxicillin', 'Antibiotic', 'Nausea, diarrhea'),
(333, 'Lisinopril', 'BP medication', 'Dizziness'),
(444, 'Metformin', 'Diabetes medication', 'Stomach pain'),
(555, 'Simvastatin', 'Cholesterol mdicat', 'Muscle pain'),
(666, 'Aspirin', 'Blood thinner', 'Stomach bleeding'),
(777, 'Albuterol', 'Asthma medication', 'Tremors'),
(888, 'Prednisone', 'Steroid', 'Weight gain'),
(999, 'Gabapentin', 'Seizure medication', 'Dizziness, drowsiness'),
(1010, 'Omeprazole', 'Acid medication', 'Headache');

INSERT INTO  Perscription_History VALUES
(100, 111, '2022-01-01', '10mg', 'Once daily'),
(200, 222, '2022-02-01', '20mg', 'Twice daily'),
(300, 333, '2022-01-15', '5mg', 'Once daily'),
(400, 444, '2022-02-15', '10mg', 'Twice daily'),
(500, 555, '2022-03-01', '15mg', 'Once daily'),
(600, 666, '2022-03-15', '30mg', 'Twice daily'),
(700, 777, '2022-04-01', '5mg', 'Once daily'),
(800, 888, '2022-05-01', '10mg', 'Twice daily'),
(900, 999, '2022-04-15', '20mg', 'Once daily'),
(1000,1010, '2022-05-15','40mg', 'Twice daily');

INSERT INTO Appointment VALUES
(001, 100, '2022-03-24', '2022-03-30', 11),
(002, 200, '2024-03-24', '2024-04-24', 12),
(003, 300, '2023-06-15', '2023-09-10', 13),
(004, 400, '2022-04-07', '2022-05-24', 14),
(005, 500, '2025-01-10', '2025-01-30', 15),
(006, 100, '2022-03-24', '2022-03-30', 16),
(007, 200, '2024-03-24', '2024-04-24', 17),
(008, 300, '2023-06-15', '2023-09-10', 18),
(009, 400, '2022-04-07', '2022-05-24', 19),
(0010, 500, '2025-01-10', '2025-01-30', 20);

INSERT INTO Doctor VALUES 
(1, 'Salman', 'Khan', 'salman@email.com', 555-123-4567, 'IT office' , 'Bangaluru', 'KA'),
(2, 'Shahrukh', 'Khan', 'shahrukh@email.com', 555-234-5678, '456 Oak Ave', 'Kolkata', 'WB'),
(3, 'Vikky', 'Kaushal', 'vikk@email.com', 555-345-6789, '789 Elm St', 'Pune', 'MH'),
(4, 'Amir', 'khan', 'amir@email.com', 555-456-7890, '234 Pine Ave', 'Gurugram', 'UP'),
(5, 'Siddhart', 'Malhotra', 'sidd@example.com', 555-567-8901, '567 Maple St', 'Punducherry', 'UT'),
(6, 'Varun', 'Dhawan', 'varun@gmail.com', 555-678-9012, '890 Cedar Ln', 'Dadar', 'MH'),
(7, 'Rajkumar', 'Rao', 'raj@rediffmail.com', 555-789-0123, '345 Elmwood Ave', 'Chandigarh', 'PB'),
(8, 'Allu', 'Arjun', 'Allu@email.com', 555-890-1234, '678 Oak Rd', 'Mumbai', 'MH'),
(9, 'Amitabh', 'Bacchan', 'Ami@example.com', 555-901-2345, '901 Pine St', 'Chennai', 'TN'),
(10, 'Ajay', 'Devgan', 'ajay@gmail.com', 555-012-3456, '234 Cedar Ave', 'Guwahati', 'AS');

INSERT INTO Nurse VALUES
(122, 'Sara', 'Ali', 'sara@email.com', '03432958', '123 Main St', 'Gurugram'),
(123, 'Rashmika', 'Mandana', 'ras@email.com', '5552345678', '456 Oak Ave', 'Kolkata'),
(124, 'Katrina', 'Kaif', 'kaif@email.com', '5553456789', '789 Elm St', 'Noida'),
(125, 'Nora', 'Fatehi', 'noor@email.com', '5554567890', '234 Pine Ave', 'Chennai'),
(126, 'Kiara', 'Advani', 'kiara@example.com', '5555678901', '567 Maple St', 'Pune'),
(127, 'Priyanka', 'Chopra', 'priya@gmail.com', '5556789012', '890 Cedar Ln', 'Patna'),
(128, 'Deepika', 'Padukone', 'deep@example.com', '5557890123', '345 Elmwood Ave', 'Bangaluru'),
(129, 'Jacqueline', 'Fernandez', 'jackie@email.com', '5558901234', '678 Oak Rd', 'Bangaluru'),
(130, 'Alia', 'Bhatt', 'alia@rediffmail.com', '5559012345', '901 Pine St', 'Delhi'),
(131, 'Kareena', 'Kapoor', 'kareena@rediffmail.com', '5550123456', '234 Cedar Ave', 'Kochi');

INSERT INTO NurseWard VALUES
(211, 122, 1, '20:02:27'),
(222, 123, 2, '21:02:18'),
(233, 124, 3, '20:02:10'),
(244, 125, 4, '20:02:2'),
(255, 126, 2, '20:02:17'),
(266, 127, 5, '20:02:17'),
(277, 128, 6, '20:02:20'),
(288, 129, 7, '20:02:19'),
(299, 130, 8, '20:02:5'),
(230, 131, 9, '20:02:20');

INSERT INTO Speciality VALUES
(311, 'Cardiology', 'Deals with heart disorders'),
(322, 'Oncology', 'Deals with cancer treatment'),
(333, 'Pediatrics', 'Deals with medical care of children'),
(344, 'Gynecology', 'Deals with medical care of female reproductive system'),
(355, 'Neurology', 'Deals with nervous system disorders'),
(366, 'Dermatology', 'Deals with skin and related disorders'),
(377, 'Orthopedics', 'Deals with bone and joint disorders'),
(388, 'Endocrinology', 'Deals with hormonal imbalances'),
(399, 'Urology', 'Deals with medical care of urinary tract system'),
(310, 'Psychiatry', 'Deals with mental health and related disorders');

INSERT INTO Doctor_Patient VALUES
(1, 100, '2023-04-13'),
(2, 200, '2023-04-14'),
(3, 300, '2023-04-15'),
(4, 400, '2023-04-16'),
(5, 500, '2023-04-17'),
(6, 600, '2023-04-18'),
(7, 700, '2023-04-19'),
(8, 800, '2023-04-20'),
(9, 900, '2023-04-21'),
(10, 1000, '2023-04-22');

INSERT INTO Doctor_Speciality VALUES
(311, 1),
(322, 2),
(333, 3),
(344, 4),
(355, 5),
(366, 6),
(377, 7),
(388, 8),
(399, 9),
(310, 10);

SELECT patient.First_Name, patient.Last_Name, room.RoomId
FROM patient
JOIN room ON patient.RoomId = room.RoomId LIMIT 5;

SELECT Treatment_Name, Description, Price
FROM Treatment_Details;

SELECT DeptName, Description FROM Dept;

SELECT Name, SideEffects FROM Perscription;

SELECT First_name, Last_name , CurrentCondition
FROM Patient p
INNER JOIN Treatment t
ON p.PatientId = t.PatientId;

SELECT Treatment_Name, TreatmentDate
FROM Treatment t
INNER JOIN treatment_details td
ON t.TreatmentDetailsId = td.Treatment_Id;

SELECT First_Name , Last_Name , TotalAmountDue, Status_
FROM Patient p
INNER JOIN Payment py
ON p.PatientId = py.PatientId;

SELECT * FROM Payment;

SELECT First_Name, Last_Name, Comments, Rating
FROM Patient p
INNER JOIN Feedback f
ON p.PatientId = f.CustomerID;

