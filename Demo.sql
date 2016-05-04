#Get Ratings
SELECT Medicine.Generic, IFNULL(ROUND(AVG(Reviews.Rating), 2), 0) AS Rating FROM Medicine LEFT OUTER JOIN Reviews ON Medicine.Generic = Reviews.Generic GROUP BY Generic;

#List brand names for Symptom
SELECT Generic, Medicine.Brand FROM Medicine WHERE Medicine.Generic IN (SELECT Generic from Symptoms WHERE Symptom = 'asthma');

#Show top rated generic for symptom
SELECT IFNULL(ROUND(AVG(Reviews.Rating), 2), 0) AS Rating, Medicine.Generic FROM Medicine LEFT OUTER JOIN Reviews ON Medicine.Generic = Reviews.Generic WHERE Medicine.Generic IN (SELECT Generic from Symptoms WHERE Symptom = 'antibiotic') GROUP BY Generic ORDER BY Rating DESC limit 1;

#Show Side effects of medication
SELECT Side_Effect FROM SideEffects WHERE Generic = 'Acetaminophen';

#Show side effects of medication for symptoms
SELECT Generic, Side_Effect FROM SideEffects WHERE Generic in (select Generic from Symptoms where Symptom = 'asthma');

#Create Client User
INSERT INTO Clients VALUES ('Demo', 'User', 'dUser', 'D3mo');

#Display created user
SELECT * FROM Clients WHERE User_Name = 'dUser';

#Delete Client User
DELETE FROM Clients WHERE User_Name = 'dUser'; 

#Write review
INSERT INTO Reviews VALUES ('lHill', 'Demo review!', 'Diazepam', '9');

#Create Admin User
INSERT INTO Admins VALUES ('Admin', 'Istrator', 'dAdmin', 'Ad1n', 'Demo Address');

SELECT * FROM Admins WHERE User_Name = 'dAdmin';

SELECT * FROM Reviews;