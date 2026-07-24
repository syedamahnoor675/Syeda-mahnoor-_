create database fitness_club;
use fitness_club;

CREATE TABLE member (
    first_name VARCHAR(20),
    middle_name VARCHAR(20),
    last_name VARCHAR(10),
    member_id INT PRIMARY KEY,
    email VARCHAR(50), 
    phone_no BIGINT,   
    address VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

INSERT INTO member (first_name, middle_name, last_name, member_id, email, phone_no, address, age, gender) VALUES
('sadia', 'fatima', 'malik', 1, 'sadia@gmail.com', 3012344689, 'china chowk', 25, 'female'),
('Ali', 'shahzad', 'butt', 2, 'ali@gmail.com', 39876543112, 'shuhab pura', 33, 'Male'),
('Syeda', 'Mahnoor', 'gillani', 3, 'Mahnoor@gmail.com', 3245678900, 'Sialkot', 20, 'female'),
('Maryam', 'ali', 'shah', 4, 'maryam@gmail.com', 3126789045, 'Daska', 23, 'female'),
('Muneeb', 'Raza', 'Gouri', 5, 'muneeb@gmail.com', 3247892476, 'model town', 40, 'Male');

SELECT * FROM member;

-- 2. Create Trainers table
CREATE TABLE Trainers (
    first_name VARCHAR(20),
    middle_name VARCHAR(20),
    last_name VARCHAR(10),
    Trainer_id INT PRIMARY KEY,
    email VARCHAR(50),
    phone_no VARCHAR(20),
    address VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    experience_years INT
);

INSERT INTO Trainers (first_name, middle_name, last_name, Trainer_id, email, phone_no, address, age, gender, experience_years) VALUES
('Zeeshan', 'ali', 'butt', 101, 'zeeshan@gmail.com', '03456779890', 'Lahore', 40, 'Male', 2),
('muhammad', 'raza', 'khan', 102, 'raza@gmail.com', '032567899112', 'Sialkot', 35, 'Male', 3),
('Syeda', 'Fiza', 'fatima', 103, 'fiza12@gmail.com', '0385467899990', 'Daska', 25, 'Female', 9);

SELECT * FROM Trainers;

-- 3. Create Attendance table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    session_date DATE,
    check_in TIME,
    check_out TIME,
    status VARCHAR(20),
    remarks VARCHAR(100),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

INSERT INTO Attendance (member_id, session_date, check_in, check_out, status, remarks) VALUES
(1, '2026-07-01', '08:00:00', '09:00:00', 'Present', 'sadia attended morning session'),
(2, '2026-07-01', '08:15:00', '09:15:00', 'Present', 'Ali arrived late'),
(3, '2026-07-01', NULL, NULL, 'Absent', 'Mahnoor was absent'),
(4, '2026-07-01', '09:00:00', '10:00:00', 'Present', 'Maryam completed workout'),
(5, '2026-07-01', '10:00:00', '11:00:00', 'Present', 'Muneeb attended regularly');

SELECT * FROM Attendance;

-- 4. Create Enrollment table
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    plan_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

INSERT INTO Enrollment (member_id, plan_name, start_date, end_date, amount, status) VALUES
(1, 'Monthly', '2026-07-01', '2026-07-31', 5000.00, 'Active'),
(2, 'Quarterly', '2026-07-01', '2026-09-30', 13500.00, 'Active'),
(3, 'Monthly', '2026-06-15', '2026-07-15', 5000.00, 'Expired'),
(4, 'Annual', '2026-01-01', '2026-12-31', 50000.00, 'Active'),
(5, 'Monthly', '2026-07-05', '2026-08-04', 5000.00, 'Active');

SELECT * FROM Enrollment;

-- 5. Create Equipment table
CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    purchase_date DATE,
    quantity INT,
    status VARCHAR(20)
);

INSERT INTO Equipment (equipment_name, category, brand, purchase_date, quantity, status) VALUES
('Treadmill', 'Cardio', 'Life Fitness', '2025-01-10', 4, 'Available'),
('Exercise Bike', 'Cardio', 'Johnson', '2025-02-15', 3, 'Available'),
('Dumbbell Set', 'Strength', 'Body Solid', '2025-03-20', 20, 'Available'),
('Bench Press', 'Strength', 'Impulse', '2025-04-05', 2, 'In Use'),
('Cable Machine', 'Strength', 'Matrix', '2025-05-12', 2, 'Maintenance');

SELECT * FROM Equipment;

-- 6. Create Exercise_Types table
CREATE TABLE Exercise_Types (
    ex_type_id INT PRIMARY KEY AUTO_INCREMENT,
    ex_name VARCHAR(100) NOT NULL,          
    description TEXT                       
);

INSERT INTO Exercise_Types (ex_name, description) VALUES 
('Cardio', 'Exercises like running, cycling, and swimming to improve heart health.'),
('Weightlifting', 'Strength training using free weights or machines to build muscle.'),
('Yoga', 'Flexibility and mental relaxation through stretching and breathing.'),
('HIIT', 'High-Intensity Interval Training for fast calorie burning.'),
('Zumba', 'Dance-based aerobic workout for full body fitness.');

SELECT * FROM Exercise_Types;

-- 7. Create Client_Health_Report table
CREATE TABLE Client_Health_Report (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,                                                   
    report_date DATE NOT NULL,                      
    weight_kg DECIMAL(5,2),                         
    height_cm DECIMAL(5,2),                          
    blood_pressure VARCHAR(20),                     
    fitness_level VARCHAR(50),                     
    medical_notes TEXT,                             
    FOREIGN KEY (member_id) REFERENCES member(member_id) 
);

INSERT INTO Client_Health_Report (member_id, report_date, weight_kg, height_cm, blood_pressure, fitness_level, medical_notes) VALUES 
(1, '2026-07-01', 75.5, 175.0, '120/80', 'Beginner', 'No medical issues, general fitness goal.'),
(2, '2026-07-01', 82.0, 180.2, '130/85', 'Intermediate', 'Slight lower back stiffness.'),
(3, '2026-07-02', 60.2, 162.5, '115/75', 'Beginner', 'Wants to improve stamina and flexibility.'),
(4, '2026-07-02', 65.0, 168.0, '120/80', 'Advanced', 'Regular athlete, tracking muscle mass.'),
(5, '2026-07-03', 90.1, 178.5, '135/88', 'Beginner', 'Recovering from a minor ankle sprain 3 months ago.');

SELECT * FROM Client_Health_Report;

-- 8. Create Payment table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    member_id INT,
    enrollment_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollment(enrollment_id)
);

INSERT INTO Payment (payment_id, member_id, enrollment_id, payment_date, amount, payment_method, transaction_id, status) VALUES
(1, 1, 1, '2026-07-01', 5000.00, 'Cash', 'TXN1001', 'Completed'),
(2, 2, 2, '2026-07-02', 6500.00, 'Debit Card', 'TXN1002', 'Completed'),
(3, 3, 3, '2026-07-03', 4500.00, 'Bank Transfer', 'TXN1003', 'Pending'),
(4, 4, 4, '2026-07-04', 7000.00, 'Credit Card', 'TXN1004', 'Completed'),
(5, 5, 5, '2026-07-05', 5500.00, 'Cash', 'TXN1005', 'Completed');

SELECT * FROM Payment;

-- 9. Create Workout_Session table
CREATE TABLE Workout_Session (
    session_id        INT PRIMARY KEY AUTO_INCREMENT, 
    Trainer_id        INT,                     
    member_id           INT,            
    session_date        DATE,
    session_time        TIME,
    session_type        VARCHAR(100),
    duration_minutes    INT CHECK (duration_minutes > 0),
    notes               VARCHAR(200),
    FOREIGN KEY (Trainer_id) REFERENCES Trainers(Trainer_id),
    FOREIGN KEY (member_id)  REFERENCES member(member_id)
);

INSERT INTO Workout_Session (Trainer_id, member_id, session_date, session_time, session_type, duration_minutes, notes) VALUES
(101, 1, '2026-07-01', '09:00:00', 'Strength', 60, 'Focused on upper body'),
(102, 2, '2026-07-01', '10:30:00', 'Yoga',     50, 'Flexibility and breathing'),
(103, 3, '2026-07-02', '17:00:00', 'Strength', 55, 'Leg day'),
(103, 4, '2026-07-03', '00:10:10', 'Strength', 100, 'Push ups'),
(102, 5, '2026-07-07', '01:11:30', 'Strength', 100, 'Bicep curls');
select * from Workout_Session;
CREATE TABLE Supplements
(
    supplement_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    supplement_name VARCHAR(100),
    brand VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    description VARCHAR(255)
);
INSERT INTO Supplements
(member_id, supplement_name, brand, category, price, stock_quantity, description)
VALUES
(1, 'Whey Protein Gold', 'Optimum Nutrition', 'Protein', 6500.00, 40, 'Post-workout muscle recovery'),
(2, 'Creatine Monohydrate', 'MuscleTech', 'Performance', 2200.00, 60, 'Strength and power output'),
(3, 'Mass Gainer', 'MuscleTech', 'All', 1200.00, 100, 'Daily micronutrient support'),
(4, 'Multivitamin Daily', 'HealthPlus', 'Vitamin', 1200.00, 100, 'Daily micronutrient support'),
(5, 'Omega-3 Fish Oil', 'HealthPlus', 'Lipids', 1200.00, 100, 'Monthly based');
select * from Supplements;
-- to show unique values--
select distinct member_id,middle_name from member;
select distinct Trainer_id,experience_years,middle_name from Trainers;
select * from member
where member_id='1';
select * from Trainers 
where trainer_id='102';
select * from Workout_Session
where duration_minutes<60;
select * from Workout_Session
where duration_minutes>60;
select * from  Client_Health_Report
where weight_kg>=75;
select * from Payment 
where member_id>=1;
-- <>
select * from member
where member_id!=1;
-- order by
select * from member
order by middle_name;
select first_name,middle_name,last_name
from member
order by first_name;
select * from  Trainers order by address;
select * from Equipment order by category;
select * from Supplements order by price desc;
select * from Supplements order by price asc;
-- And operator
select member_id,first_name
from member
where member_id>1 and first_name='ali';
update Attendance
set  attendance_id=201
where  attendance_id='1' ;
update Attendance
set  attendance_id=202
where  attendance_id='2' ;
update Attendance
set  attendance_id=203
where  attendance_id='3' ;
update Attendance
set  attendance_id=204
where  attendance_id='4' ;
update Attendance
set  attendance_id=205
where  attendance_id='5' ;
-- joins --
select first_name,middle_name,age,gender,attendance_id,remarks
from member
 join Attendance
on member.member_id=Attendance.member_id;
select first_name,middle_name,age,gender,report_date, weight_kg, height_cm, blood_pressure, fitness_level, medical_notes
from member
inner join Client_Health_Report
on member.member_id=Client_Health_Report.member_id;
-- left join --
select first_name,middle_name,last_name,age,gender
from member
left join Client_Health_Report
on member.member_id=Client_Health_Report.member_id; 
select first_name,middle_name,last_name,age,gender,report_date, weight_kg, height_cm, blood_pressure, fitness_level, medical_notes
from member
right join Client_Health_Report
on member.member_id=Client_Health_Report.member_id; 
-- cross join --
select first_name,middle_name,last_name,age,gender,report_date
from member
cross join Client_Health_Report;
-- self join --
SELECT 
    t1.first_name AS "Trainer Name",
    t2.first_name AS "Supervisor Name"
FROM Trainers t1
JOIN Trainers t2 
ON t1.supervisor_id = t2.Trainer_id;
       ALTER TABLE Trainers ADD COLUMN supervisor_id INT;
UPDATE Trainers SET supervisor_id = 101 WHERE Trainer_id = 102;
UPDATE Trainers SET supervisor_id = 101 WHERE Trainer_id = 103;
-- min aggregate
 select min(member_id)
 from member
 where member_id<=5;
 -- max aggeregate
 select max(member_id)
 from member 
 where member_id>1;
 select count(trainer_id)
 from Trainers;
 select avg(amount)
 from Payment;
 
drop database if exists fitness_club;
DROP TABLE IF EXISTS Workout_Session;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Client_Health_Report;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Exercise_Types;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Trainers;
DROP TABLE IF EXISTS member;
Drop table if exists Supplements;