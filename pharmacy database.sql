CREATE DATABASE MedicalStore;
SHOW DATABASES;

USE MedicalStore;

CREATE TABLE Medicines (
    Medicine_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(50),
    Dosage VARCHAR(50),
    Treats_Disease VARCHAR(50),
    Symptoms VARCHAR(100)
);

SELECT * FROM Medicines;

INSERT INTO Medicines (Medicine_ID, Medicine_Name, Dosage, Treats_Disease, Symptoms)
VALUES
(2011, 'Dolo 650', '650 mg', 'Fever', 'High temperature, body pain'),
(2012, 'Augmentin', '625 mg', 'Bacterial Infection', 'Sore throat, fever, swelling'),
(2013, 'Glycomet', '500 mg', 'Diabetes', 'Frequent urination, increased thirst'),
(2014, 'Allegra', '120 mg', 'Allergy', 'Sneezing, itching, runny nose'),
(2015, 'Telma', '40 mg', 'Hypertension', 'High blood pressure, dizziness'),
(2016, 'Pantocid', '40 mg', 'Acidity', 'Heartburn, indigestion'),
(2017, 'Azee', '500 mg', 'Respiratory Infection', 'Cough, fever, sore throat'),
(2018, 'Combiflam', '400 mg', 'Pain Relief', 'Muscle pain, body pain'),
(2019, 'Rosuvas', '10 mg', 'High Cholesterol', 'High LDL cholesterol'),
(2020, 'Crocin', '500 mg', 'Fever', 'Headache, fever');

ALTER TABLE Medicines
RENAME COLUMN Treats_Disease TO Used_For;

ALTER TABLE Medicines
RENAME COLUMN Symptoms TO Symptoms_Occurs;

SELECT * FROM Medicines;

UPDATE Medicines
SET Used_For = 'Fever and Body Pain'
WHERE Medicine_ID = 2011;

UPDATE Medicines
SET Used_For = 'Bacterial and Throat Infection'
WHERE Medicine_ID = 2012;

SELECT * FROM Medicines;

SELECT Used_For, COUNT(*) AS Medicine_Count
FROM Medicines
GROUP BY Used_For;

SELECT Used_For, COUNT(*) AS Medicine_Count
FROM Medicines
GROUP BY Used_For
HAVING COUNT(*) >= 2;