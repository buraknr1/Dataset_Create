    CREATE TABLE TeratogenPregnancyOutcomes (
        teratogen_id INT NOT NULL,
        outcome_id INT NOT NULL,
        PRIMARY KEY (teratogen_id, outcome_id),
        FOREIGN KEY (teratogen_id) REFERENCES OtherTeratogens(teratogen_id) ON DELETE CASCADE,
        FOREIGN KEY (outcome_id) REFERENCES PregnancyOutcomes(outcome_id) ON DELETE CASCADE
    );

    CREATE TABLE RadiationPregnancyOutcomes (
        radiation_id INT NOT NULL,
        outcome_id INT NOT NULL,
        PRIMARY KEY (radiation_id, outcome_id),
        FOREIGN KEY (radiation_id) REFERENCES Radiations(radiation_id) ON DELETE CASCADE,
        FOREIGN KEY (outcome_id) REFERENCES PregnancyOutcomes(outcome_id) ON DELETE CASCADE
    );

    CREATE TABLE DrugPregnancyOutcomes (
        drug_id INT NOT NULL,
        outcome_id INT NOT NULL,
        PRIMARY KEY (drug_id, outcome_id),
        FOREIGN KEY (drug_id) REFERENCES Drugs(drug_id) ON DELETE CASCADE,
        FOREIGN KEY (outcome_id) REFERENCES PregnancyOutcomes(outcome_id) ON DELETE CASCADE
    );

    CREATE TABLE PregnancyOutcomes (
        outcome_id INT AUTO_INCREMENT PRIMARY KEY,
        patient_id INT UNIQUE NOT NULL,
        usg_signs TEXT,
        pregnancy_outcome VARCHAR(100) NOT NULL,
        anomalies BOOLEAN DEFAULT FALSE,
        specific_anomalies TEXT,
        FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE
    );

    CREATE TABLE OtherTeratogens (
        teratogen_id INT AUTO_INCREMENT PRIMARY KEY,
        patient_id INT NOT NULL,
        teratogen_name VARCHAR(100) NOT NULL,
        FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE
    );


    CREATE TABLE Radiations (
        radiation_id INT AUTO_INCREMENT PRIMARY KEY,
        patient_id INT NOT NULL,
        radiation_type VARCHAR(100) NOT NULL,
        radiation_dose FLOAT,
        FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE
    );


    CREATE TABLE Drugs (
        drug_id INT AUTO_INCREMENT PRIMARY KEY,
        patient_id INT NOT NULL,
        drug_name VARCHAR(100) NOT NULL,
        dose VARCHAR(50),
        initiation_date DATE,
        cessation_date DATE,
        number_of_days_used INT,
        FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE
    );


    CREATE TABLE Patients (
        patient_id INT AUTO_INCREMENT PRIMARY KEY,
        doctor_id INT,
        name VARCHAR(100) NOT NULL,
        age INT NOT NULL,
        gender ENUM('Male', 'Female') NOT NULL,
        consanguineous_marriage BOOLEAN DEFAULT FALSE,
        FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE SET NULL
    );


    CREATE TABLE Doctors (
        doctor_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        specialization VARCHAR(100),
        email VARCHAR(100) UNIQUE,
        phone_number VARCHAR(15) UNIQUE
    );

