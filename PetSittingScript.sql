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
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)  
);

INSERT INTO PetOwner (OwnerID, Name, Address, Phone, Email) VALUES
(1, 'John Doe', '123 Main St, NY', '555-1234', 'john.doe@email.com'),
(2, 'Jane Smith', '456 Elm St, CA', '555-5678', 'jane.smith@email.com');

INSERT INTO Sitter (SitterID, Name, Phone, Email, Experience) VALUES
(1, 'Alice Johnson', '555-1111', 'alice.j@email.com', '5 years'),
(2, 'Benjamin Bobert', '555-2222', 'bob.b@email.com', '3 years');

INSERT INTO Pet (PetID, Name, Type, Breed, Age, MedicalConditions, OwnerID) VALUES
(1, 'Buddy', 'Dog', 'Labrador', 3, 'None', 1),
(2, 'Whiskers', 'Cat', 'Siamese', 2, 'Asthma', 1),
(3, 'Charlie', 'Dog', 'Beagle', 4, 'None', 2);

INSERT INTO Booking (BookingID, StartDate, EndDate, ServiceType, Cost, OwnerID, SitterID) VALUES
(1, '2024-03-10', '2024-03-15', 'Overnight Stay', 150.00, 1, 1),
(2, '2024-04-01', '2024-04-03', 'Dog Walking', 30.00, 1, 2),
(3, '2024-05-10', '2024-05-12', 'Pet Sitting', 75.00, 2, 1);

INSERT INTO Payment (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 1, '2024-03-09', 150.00, 'Credit Card'),
(2, 2, '2024-04-01', 30.00, 'Cash'),
(3, 3, '2024-05-09', 75.00, 'PayPal');