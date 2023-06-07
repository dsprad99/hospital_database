USE hospital;
/*Query 1*/
SELECT name
FROM Physician
WHERE physician_id > 3;

/*Query 2*/
SELECT room_number, Room.fee
FROM Room
WHERE room_number>= 403 AND Room.fee>500;

/*Query 3*/
SELECT Health_Record.status, Health_Record.patient_id, Health_Record.date_published
FROM Health_Record
ORDER BY 
Health_Record.date_published DESC;

/*Query 4*/
SELECT Invoice.patient_id, COUNT(*) AS total_invoices, SUM(amount) as payment_amount
FROM Invoice
GROUP BY patient_id;

/*Query 5*/
SELECT AVG(sumInvoiceFees) AS invoice_average_fee
FROM (
  SELECT SUM(amount) AS sumInvoiceFees
  FROM Invoice
  GROUP BY patient_id
) AS invoice_average_fee;

/*Query 6*/
SELECT DISTINCT name, amount AS medication_price
FROM Medication
WHERE amount = (SELECT MIN(amount) FROM Medication) OR amount = (SELECT MAX(amount) FROM Medication);

/*Query 7*/
SELECT Patient.name, Invoice.invoice_id
FROM Patient 
JOIN Invoice ON
Patient.patient_id = Invoice.patient_id;

/*Query 8*/
SELECT DISTINCT Patient.name AS Name, Health_Record.description AS Description, Care_Recorded.instructions as CareRecorded
FROM Patient
JOIN Health_Record ON Patient.patient_id = Health_Record.patient_id
JOIN Care_Recorded ON Patient.patient_id = Care_Recorded.patient_id;

/*Query 9*/
SELECT Patient.patient_id, Patient.name
FROM Patient
WHERE Patient.patient_id NOT IN (
	SELECT Patient.patient_id
	FROM Patient 
	JOIN Health_Record 
	ON Patient.patient_id = Health_Record.patient_id
	WHERE Health_Record.health_record_id >=2
);

/*Query 10*/
SELECT Patient.name, Room.room_number
FROM Patient JOIN Room
on Patient.patient_id = Room.patient_id
ORDER BY room_number; 

/*Query 11*/
SELECT Physician.name, Physician.address
FROM Physician
WHERE physician_id IN (
  SELECT physician_id
  FROM Care_Recorded
  WHERE room_number >402
);

/*Query 12*/
SELECT Patient.name AS Name, Room.room_number AS Room_Number, Room.fee AS Price
FROM Patient
JOIN Room ON Patient.patient_id = Room.patient_id
WHERE Room.room_number NOT IN (
  SELECT Care_Recorded.room_number
  FROM Care_Recorded
  WHERE Care_Recorded.physician_id%2=0
) ORDER BY Room.room_number;

/*Query 13*/
SELECT DISTINCT Patient.name, Health_Record.description, Health_Record.date_published
FROM Patient 
JOIN Health_Record ON
Patient.patient_id = Health_Record.patient_id
ORDER BY Health_Record.date_published;

/*Query 14*/
SELECT DISTINCT *
FROM Care_Recorded JOIN Nurse
ON Care_Recorded.nurse_id = Nurse.nurse_id
WHERE Nurse.address LIKE '%albo%';

/*Query 15*/
SELECT Physician.name, Physician.field_of_expertise
FROM Physician
WHERE Physician.physician_id IN (
  SELECT Care_Recorded.physician_id
  FROM Care_Recorded
  WHERE Care_Recorded.room_number = 401 OR Care_Recorded.room_number = 403
);

/*Query 16*/
SELECT Patient.name,Patient.total_payment_amount, Patient.total_invoice_amount
FROM Patient;

/*View 1*/
CREATE VIEW HeartPhysician AS
SELECT name
FROM Physician
WHERE field_of_expertise = 'Cardiology';

SELECT *
FROM HeartPhysician;

/*View 2*/
CREATE VIEW HealthRecordByPatient AS
SELECT DISTINCT Patient.name, Health_Record.description
FROM Health_Record JOIN Patient
ON Health_Record.patient_id = Patient.patient_id;

SELECT * 
FROM HealthRecordByPatient;

/*View 3*/
CREATE VIEW RoomOccupiedByPatient AS
SELECT Room.room_number, Patient.name
FROM Patient JOIN Room
ON Patient.patient_id = Room.patient_id
ORDER BY Room.room_number;

SELECT *
FROM RoomOccupiedByPatient;

/*Transaction 1*/
START TRANSACTION;
INSERT INTO Medication VALUES ('Zynamphoba', 800);
COMMIT;


/*Transaction 2*/
START TRANSACTION;
INSERT INTO NURSE VALUES ('9198372321', '34 Townsend Dr', 10, 'Bigs', 411);
SELECT * 
FROM Nurse;
ROLLBACK;
