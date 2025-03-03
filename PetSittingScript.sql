DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Pet;
DROP TABLE IF EXISTS Sitter;
DROP TABLE IF EXISTS PetOwner;


CREATE TABLE PetOwner (
    OwnerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address TEXT,
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Sitter (
    SitterID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Experience VARCHAR(50)
);

CREATE TABLE Pet (
    PetID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Type VARCHAR(30) NOT NULL, 
    Breed VARCHAR(50),
    Age INT,
    MedicalConditions TEXT,
    OwnerID INT NOT NULL,
    FOREIGN KEY (OwnerID) REFERENCES PetOwner(OwnerID)  
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    ServiceType VARCHAR(50) NOT NULL,
    Cost DECIMAL(10,2),
    OwnerID INT NOT NULL,
    SitterID INT,  
    FOREIGN KEY (OwnerID) REFERENCES PetOwner(OwnerID),
    FOREIGN KEY (SitterID) REFERENCES Sitter(SitterID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(50),  -- Example: Credit Card, Cash, etc.
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)  -- No ON DELETE
);