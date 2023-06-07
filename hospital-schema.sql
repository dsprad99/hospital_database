DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;


CREATE TABLE Physician (
	phone_number VARCHAR(20),
	address VARCHAR(150),
	physician_id INT PRIMARY KEY,
	name VARCHAR(255),
	certification_number INT,
	field_of_expertise VARCHAR(150)
);

CREATE TABLE Instruction (
  instruction_code INT PRIMARY KEY,
  fee VARCHAR(10),
  description VARCHAR(200)
);

CREATE TABLE Nurse (
  phone_number VARCHAR(15),
  address VARCHAR(100),
  nurse_id INT PRIMARY KEY,
  name VARCHAR(30),
  certification_number INT
);

CREATE TABLE Medication (
  name VARCHAR(50),
  amount INT
);

CREATE TABLE Patient (
  address VARCHAR(100),
  patient_id INT PRIMARY KEY,
  name VARCHAR(100),
  phone_number VARCHAR(20)
  );

CREATE TABLE Health_Record (
  status VARCHAR(200),
  description VARCHAR(200),
  patient_id INT,
  health_record_id INT,
  disease VARCHAR(150),
  date_published DATE,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Invoice (
  date_published DATE,
  amount VARCHAR(10),
  invoice_id INT PRIMARY KEY,
  patient_id INT,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);


CREATE TABLE Care_Recorded (
  date_published DATE,
  room_number INT,
  instructions VARCHAR(150),
  patient_id INT,
  nurse_id INT,
  physician_id INT,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
  FOREIGN KEY (nurse_id) REFERENCES Nurse(nurse_id),
  FOREIGN KEY (physician_id) REFERENCES Physician(physician_id)
);

CREATE TABLE Payment (
  date_made DATE,
  amount VARCHAR(10),
  patient_id INT,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Room (
  patient_id INT,
  room_number INT PRIMARY KEY,
  capacity INT,
  fee INT,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

ALTER TABLE Patient
ADD COLUMN total_invoice_amount VARCHAR(15);

ALTER TABLE Patient
ADD COLUMN total_payment_amount VARCHAR(15);

/*Trigger 1*/
DELIMITER $$
CREATE TRIGGER invoice_total_update
AFTER INSERT ON Invoice
FOR EACH ROW
BEGIN
    DECLARE total_amount VARCHAR(10);
    SELECT SUM(amount) INTO total_amount
    FROM Invoice
    WHERE patient_id = NEW.patient_id;
    UPDATE Patient
    SET total_invoice_amount = total_amount
    WHERE patient_id = NEW.patient_id;
END $$
DELIMITER ;

/*Trigger 2*/
DELIMITER $$
CREATE TRIGGER payment_total_update1
AFTER INSERT ON Payment
FOR EACH ROW
BEGIN
    DECLARE total_amount VARCHAR(10);
    SELECT SUM(amount) INTO total_amount
    FROM Payment
    WHERE patient_id = NEW.patient_id;
    UPDATE Patient
    SET total_payment_amount = total_amount
    WHERE patient_id = NEW.patient_id;
END $$
DELIMITER ;

/*Trigger 3*/
DELIMITER $$
	CREATE TRIGGER delete_patient_room
	AFTER DELETE ON Patient
	FOR EACH ROW
	BEGIN
		DELETE FROM Room
		WHERE patient_id = OLD.patient_id;
	END $$
DELIMITER ;

CREATE USER 'hospitalguestuser'@'localhost' IDENTIFIED BY 'dsp123';
GRANT SELECT ON hospital.* TO 'hospitalguestuser'@'localhost';
GRANT INSERT ON hospital.* TO 'hospitalguestuser'@'localhost';
GRANT CREATE VIEW ON hospital.* TO 'hospitalguestuser'@'localhost'; 
GRANT ALL PRIVILEGES ON hospital.* TO 'hospitalguestuser'@'localhost'; 

CREATE USER 'hospitalguestuser2'@'localhost' IDENTIFIED BY 'dsp123';
GRANT SELECT ON hospital.* TO 'hospitalguestuser2'@'localhost';
GRANT INSERT ON hospital.* TO 'hospitalguestuser2'@'localhost';
GRANT CREATE VIEW ON hospital.* TO 'hospitalguestuser2'@'localhost'; 
GRANT ALL PRIVILEGES ON hospital.* TO 'hospitalguestuser2'@'localhost'; 
