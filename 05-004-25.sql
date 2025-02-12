create DATABASE hospital_management_system;

CREATE TABLE Patient (
    P_ID INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    sex CHAR(1),
    Mob_no VARCHAR(15),
    age INT,
    blood_group VARCHAR(5)
);


CREATE TABLE Employee (
    E_ID INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    sex CHAR(1),
    Mob_no VARCHAR(15),
    address VARCHAR(255),
    state VARCHAR(100),
    city VARCHAR(100),
    pin_no VARCHAR(10)
);


CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    E_ID INT,
    P_ID INT,
    Department VARCHAR(100),
    qualification VARCHAR(100),
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);


CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY,
    E_ID INT,
    P_ID INT,
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);


CREATE TABLE Room (
    R_ID INT PRIMARY KEY,
    Type VARCHAR(50),
    Capacity INT,
    Availability BOOLEAN,
    P_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);


CREATE TABLE Receptionist (
    R_ID INT,
    record_no INT,
    E_ID INT,
    PRIMARY KEY (R_ID, record_no),
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);


CREATE TABLE Test_Report (
    R_ID INT PRIMARY KEY,
    P_ID INT,
    Test_Type VARCHAR(100),
    Result VARCHAR(255),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);


CREATE TABLE Bill (
    B_ID INT PRIMARY KEY,
    P_ID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);


CREATE TABLE Records (
    Record_no INT PRIMARY KEY,
    App_no INT,
    P_ID INT,
    R_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (R_ID) REFERENCES Room(R_ID)
);


