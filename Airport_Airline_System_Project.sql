CREATE DATABASE AirportAirlineSystem;
USE AirportAirlineSystem;

-- Create Airline table
CREATE TABLE Airline (
    AirlineID INT PRIMARY KEY,
    AirLIneName VARCHAR(100),
    AirlineRating DECIMAL(2,1)
);
-- Create Country table
CREATE TABLE Country (
    countryID INT PRIMARY KEY,
    DepartureCountry VARCHAR(100),
    ArrivalCountry VARCHAR(100)
);

-- Create AirPort table
CREATE TABLE AirPort (
    AirportID INT PRIMARY KEY,
    airportName VARCHAR(100),
    location VARCHAR(100),
    noOfFlight INT,
    FK_countryID INT,
    timeZone VARCHAR(50),
    FOREIGN KEY (FK_countryID) REFERENCES Country(countryID)
);
-- Create Customer table
CREATE TABLE Customer (
    customerID INT PRIMARY KEY,
    Country VARCHAR(100),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    age INT,
    Cnic VARCHAR(20) UNIQUE,
    gender ENUM('Male', 'Female', 'Other'),
    Email VARCHAR(100),
    houseNo VARCHAR(50),
    city VARCHAR(100),
    Fk_AirlineID INT,
    FOREIGN KEY (Fk_AirlineID) REFERENCES Airline(AirlineID)
);
-- Create Customer_Contact table for multivalued contactNo

CREATE TABLE Customer_Contact (
    customerID INT,
    contactNo VARCHAR(15),
    PRIMARY KEY (customerID, contactNo),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);
-- Create Employee table
CREATE TABLE Employee (
    employeeID INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    cnic VARCHAR(20),
    category ENUM('Pilot', 'Crew', 'Ground Staff', 'Admin'),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    doj DATE,
    dob DATE,
    email VARCHAR(100),
    Salary DECIMAL(10,2),
    houseNo VARCHAR(50),
    city VARCHAR(100),
    country VARCHAR(100),
    promotion VARCHAR(100),
    Fk_airportID INT,
    FOREIGN KEY (Fk_airportID) REFERENCES AirPort(AirportID)
);

-- Create Employee_Contact table for multivalued contactNo
CREATE TABLE Employee_Contact (
    employeeID INT,
    contactNo VARCHAR(15),
    PRIMARY KEY (employeeID, contactNo),
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID)
);


-- Create City table
CREATE TABLE City (
    cityID INT PRIMARY KEY,
    cityName VARCHAR(100),
    ShortName VARCHAR(10),
    FK_countryID INT,
    FOREIGN KEY (FK_countryID) REFERENCES Country(countryID)
);





-- Create Aircraft table
CREATE TABLE Aircraft (
    aircraftID INT PRIMARY KEY,
    model VARCHAR(50),
    capacity INT,
    company VARCHAR(100),
    manufactureDate DATE,
    maintenanceStatus ENUM('Operational', 'Under Maintenance', 'Out of Service')
);

-- Create Flights table
CREATE TABLE Flights (
    flightID INT PRIMARY KEY,
    flightNo VARCHAR(20),
    availabalSeeats INT,
    typeOFSeat ENUM('Economy', 'Business', 'First Class'),
    Fk_aircraftID INT,
    Fk_airportID INT,
    route VARCHAR(100),
    Fk_airlineID INT,
    FOREIGN KEY (Fk_aircraftID) REFERENCES Aircraft(aircraftID),
    FOREIGN KEY (Fk_airportID) REFERENCES AirPort(AirportID),
    FOREIGN KEY (Fk_airlineID) REFERENCES Airline(AirlineID)
);

-- Create Booking table
CREATE TABLE Booking (
    bookingID INT PRIMARY KEY,
    destination VARCHAR(100),
    fromWhichCity VARCHAR(100),
    history TEXT,
    twoWayOrOneWay ENUM('One Way', 'Two Way'),
    dateOfDeparture DATE,
    days INT,
    returnDate DATE,
    discount DECIMAL(5,2),
    Fk_costumerID INT,
    Fk_flightID INT,
    seatNo VARCHAR(10),
    timeOFlight TIME,
    timeOFLanding TIME,
    dateToGo DATE,
    fare DECIMAL(10,2),
    FOREIGN KEY (Fk_costumerID) REFERENCES Customer(customerID),
    FOREIGN KEY (Fk_flightID) REFERENCES Flights(flightID)
);

-- Create Luggage table
CREATE TABLE Luggage (
    lugID INT PRIMARY KEY,
    weight DECIMAL(5,2),
    quantity INT,
    Fk_bookingID INT,
    FOREIGN KEY (Fk_bookingID) REFERENCES Booking(bookingID)
);


-- Create Payment table
CREATE TABLE Payment (
    paymentID INT PRIMARY KEY,
    Status ENUM('Paid', 'Pending', 'Failed'),
    Amount DECIMAL(10,2),
    Fk_bookingID INT,
    FOREIGN KEY (Fk_bookingID) REFERENCES Booking(bookingID)
);

-- Create Ticket table
CREATE TABLE Ticket (
    ticketID INT PRIMARY KEY,
    Fk_bookingID INT,
    FOREIGN KEY (Fk_bookingID) REFERENCES Booking(bookingID)
);

-- Create Pilot table
CREATE TABLE Pilot (
    lisenceNum VARCHAR(20) PRIMARY KEY,
    certificateDate DATE,
    FK_employeeID INT,
    FK_flightID INT,
    FOREIGN KEY (FK_employeeID) REFERENCES Employee(employeeID),
    FOREIGN KEY (FK_flightID) REFERENCES Flights(flightID)
);

-- Insert 60+ records into Country
INSERT INTO Country (countryID, DepartureCountry, ArrivalCountry) VALUES
(1, 'USA', 'USA'), (2, 'UK', 'UK'), (3, 'Canada', 'Canada'), (4, 'Australia', 'Australia'), 
(5, 'Germany', 'Germany'), (6, 'France', 'France'), (7, 'Japan', 'Japan'), (8, 'India', 'India'),
(9, 'Brazil', 'Brazil'), (10, 'China', 'China'), (11, 'Italy', 'Italy'), (12, 'Spain', 'Spain'),
(13, 'Mexico', 'Mexico'), (14, 'South Africa', 'South Africa'), (15, 'Russia', 'Russia'),
(16, 'South Korea', 'South Korea'), (17, 'Argentina', 'Argentina'), (18, 'Egypt', 'Egypt'),
(19, 'Thailand', 'Thailand'), (20, 'Turkey', 'Turkey'), (21, 'Nigeria', 'Nigeria'),
(22, 'Pakistan', 'Pakistan'), (23, 'Indonesia', 'Indonesia'), (24, 'Saudi Arabia', 'Saudi Arabia'),
(25, 'Netherlands', 'Netherlands'), (26, 'Sweden', 'Sweden'), (27, 'Switzerland', 'Switzerland'),
(28, 'Singapore', 'Singapore'), (29, 'Malaysia', 'Malaysia'), (30, 'Philippines', 'Philippines'),
(31, 'Vietnam', 'Vietnam'), (32, 'New Zealand', 'New Zealand'), (33, 'Chile', 'Chile'),
(34, 'Colombia', 'Colombia'), (35, 'Peru', 'Peru'), (36, 'Poland', 'Poland'),
(37, 'Portugal', 'Portugal'), (38, 'Greece', 'Greece'), (39, 'Ireland', 'Ireland'),
(40, 'Belgium', 'Belgium'), (41, 'Denmark', 'Denmark'), (42, 'Norway', 'Norway'),
(43, 'Finland', 'Finland'), (44, 'Austria', 'Austria'), (45, 'Hungary', 'Hungary'),
(46, 'Czech Republic', 'Czech Republic'), (47, 'Romania', 'Romania'), (48, 'Israel', 'Israel'),
(49, 'UAE', 'UAE'), (50, 'Qatar', 'Qatar'), (51, 'Kuwait', 'Kuwait'), (52, 'Oman', 'Oman'),
(53, 'Bahrain', 'Bahrain'), (54, 'Jordan', 'Jordan'), (55, 'Lebanon', 'Lebanon'),
(56, 'Morocco', 'Morocco'), (57, 'Algeria', 'Algeria'), (58, 'Tunisia', 'Tunisia'),
(59, 'Kenya', 'Kenya'), (60, 'Ghana', 'Ghana'), (61, 'Ethiopia', 'Ethiopia'),
(62, 'Sudan', 'Sudan'), (63, 'Uganda', 'Uganda'), (64, 'Zimbabwe', 'Zimbabwe');

-- Insert 60+ records into City
INSERT INTO City (cityID, cityName, ShortName, FK_countryID) VALUES
(1, 'New York', 'NYC', 1), (2, 'London', 'LON', 2), (3, 'Toronto', 'TOR', 3), (4, 'Sydney', 'SYD', 4),
(5, 'Berlin', 'BER', 5), (6, 'Paris', 'PAR', 6), (7, 'Tokyo', 'TOK', 7), (8, 'Mumbai', 'MUM', 8),
(9, 'Rio de Janeiro', 'RIO', 9), (10, 'Beijing', 'BEJ', 10), (11, 'Rome', 'ROM', 11), (12, 'Madrid', 'MAD', 12),
(13, 'Mexico City', 'MEX', 13), (14, 'Cape Town', 'CPT', 14), (15, 'Moscow', 'MOS', 15),
(16, 'Seoul', 'SEL', 16), (17, 'Buenos Aires', 'BUE', 17), (18, 'Cairo', 'CAI', 18),
(19, 'Bangkok', 'BKK', 19), (20, 'Istanbul', 'IST', 20), (21, 'Lagos', 'LOS', 21),
(22, 'Karachi', 'KHI', 22), (23, 'Jakarta', 'JAK', 23), (24, 'Riyadh', 'RUH', 24),
(25, 'Amsterdam', 'AMS', 25), (26, 'Stockholm', 'STO', 26), (27, 'Zurich', 'ZRH', 27),
(28, 'Singapore', 'SIN', 28), (29, 'Kuala Lumpur', 'KUL', 29), (30, 'Manila', 'MNL', 30),
(31, 'Hanoi', 'HAN', 31), (32, 'Auckland', 'AKL', 32), (33, 'Santiago', 'SCL', 33),
(34, 'Bogota', 'BOG', 34), (35, 'Lima', 'LIM', 35), (36, 'Warsaw', 'WAW', 36),
(37, 'Lisbon', 'LIS', 37), (38, 'Athens', 'ATH', 38), (39, 'Dublin', 'DUB', 39),
(40, 'Brussels', 'BRU', 40), (41, 'Copenhagen', 'CPH', 41), (42, 'Oslo', 'OSL', 42),
(43, 'Helsinki', 'HEL', 43), (44, 'Vienna', 'VIE', 44), (45, 'Budapest', 'BUD', 45),
(46, 'Prague', 'PRG', 46), (47, 'Bucharest', 'BUH', 47), (48, 'Tel Aviv', 'TLV', 48),
(49, 'Dubai', 'DXB', 49), (50, 'Doha', 'DOH', 50), (51, 'Kuwait City', 'KWI', 51),
(52, 'Muscat', 'MCT', 52), (53, 'Manama', 'BAH', 53), (54, 'Amman', 'AMM', 54),
(55, 'Beirut', 'BEY', 55), (56, 'Casablanca', 'CMN', 56), (57, 'Algiers', 'ALG', 57),
(58, 'Tunis', 'TUN', 58), (59, 'Nairobi', 'NHA', 59), (60, 'Accra', 'ACC', 60),
(61, 'Addis Ababa', 'ADD', 61), (62, 'Khartoum', 'KRT', 62), (63, 'Kampala', 'KLA', 63),
(64, 'Harare', 'HRE', 64);

-- Insert 60+ records into Airline
INSERT INTO Airline (AirlineID, AirLIneName, AirlineRating) VALUES
(1, 'Delta Airlines', 4.5), (2, 'British Airways', 4.2), (3, 'Air Canada', 4.0), (4, 'Qantas', 4.7),
(5, 'Lufthansa', 4.3), (6, 'Air France', 4.1), (7, 'Japan Airlines', 4.6), (8, 'Air India', 3.8),
(9, 'LATAM Airlines', 4.0), (10, 'China Southern', 4.2), (11, 'Alitalia', 3.9), (12, 'Iberia', 4.0),
(13, 'Aeromexico', 3.7), (14, 'South African Airways', 3.9), (15, 'Aeroflot', 4.0),
(16, 'Korean Air', 4.5), (17, 'Avianca', 4.1), (18, 'EgyptAir', 3.8), (19, 'Thai Airways', 4.3),
(20, 'Turkish Airlines', 4.4), (21, 'Ethiopian Airlines', 4.0), (22, 'Pakistan International', 3.7),
(23, 'Garuda Indonesia', 4.2), (24, 'Saudi Arabian Airlines', 4.0), (25, 'KLM', 4.3),
(26, 'Scandinavian Airlines', 4.1), (27, 'Swiss International', 4.6), (28, 'Singapore Airlines', 4.8),
(29, 'Malaysia Airlines', 4.2), (30, 'Philippine Airlines', 4.0), (31, 'Vietnam Airlines', 4.1),
(32, 'Air New Zealand', 4.7), (33, 'LATAM Chile', 4.0), (34, 'Avianca Colombia', 4.1),
(35, 'Copa Airlines', 4.0), (36, 'LOT Polish Airlines', 4.0), (37, 'TAP Portugal', 4.1),
(38, 'Aegean Airlines', 4.2), (39, 'Aer Lingus', 4.0), (40, 'Brussels Airlines', 4.0),
(41, 'SAS', 4.1), (42, 'Norwegian Air', 3.9), (43, 'Finnair', 4.2), (44, 'Austrian Airlines', 4.3),
(45, 'Wizz Air', 3.8), (46, 'Czech Airlines', 3.9), (47, 'Tarom', 3.8), (48, 'El Al', 4.1),
(49, 'Emirates', 4.7), (50, 'Qatar Airways', 4.8), (51, 'Kuwait Airways', 3.9),
(52, 'Oman Air', 4.2), (53, 'Bahrain Air', 4.0), (54, 'Royal Jordanian', 4.0),
(55, 'Middle East Airlines', 4.1), (56, 'Royal Air Maroc', 3.9), (57, 'Air Algerie', 3.8),
(58, 'Tunisair', 3.7), (59, 'Kenya Airways', 4.0), (60, 'Gulf Air', 4.1),
(61, 'Ethiopian Airlines', 4.0), (62, 'Sudan Airways', 3.6), (63, 'Uganda Airlines', 3.8),
(64, 'Zimbabwe Airways', 3.7);

-- Insert 60+ records into AirPort
INSERT INTO AirPort (AirportID, airportName, location, noOfFlight, FK_countryID, timeZone) VALUES
(1, 'JFK International', 'New York', 300, 1, 'EST'), (2, 'Heathrow', 'London', 400, 2, 'GMT'),
(3, 'Toronto Pearson', 'Toronto', 250, 3, 'EST'), (4, 'Sydney Kingsford', 'Sydney', 200, 4, 'AEST'),
(5, 'Berlin Brandenburg', 'Berlin', 180, 5, 'CET'), (6, 'Charles de Gaulle', 'Paris', 350, 6, 'CET'),
(7, 'Narita International', 'Tokyo', 280, 7, 'JST'), (8, 'Mumbai Chhatrapati', 'Mumbai', 220, 8, 'IST'),
(9, 'Galeão International', 'Rio de Janeiro', 150, 9, 'BRT'), (10, 'Beijing Capital', 'Beijing', 320, 10, 'CST'),
(11, 'Fiumicino', 'Rome', 200, 11, 'CET'), (12, 'Adolfo Suárez', 'Madrid', 190, 12, 'CET'),
(13, 'Mexico City International', 'Mexico City', 210, 13, 'CST'), (14, 'Cape Town International', 'Cape Town', 140, 14, 'SAST'),
(15, 'Sheremetyevo', 'Moscow', 200, 15, 'MSK'), (16, 'Incheon International', 'Seoul', 250, 16, 'KST'),
(17, 'Ezeiza International', 'Buenos Aires', 160, 17, 'ART'), (18, 'Cairo International', 'Cairo', 180, 18, 'EET'),
(19, 'Suvarnabhumi', 'Bangkok', 220, 19, 'ICT'), (20, 'Istanbul Airport', 'Istanbul', 300, 20, 'TRT'),
(21, 'Murtala Muhammed', 'Lagos', 140, 21, 'WAT'), (22, 'Jinnah International', 'Karachi', 150, 22, 'PKT'),
(23, 'Soekarno-Hatta', 'Jakarta', 200, 23, 'WIB'), (24, 'King Khalid', 'Riyadh', 180, 24, 'AST'),
(25, 'Schiphol', 'Amsterdam', 250, 25, 'CET'), (26, 'Arlanda', 'Stockholm', 160, 26, 'CET'),
(27, 'Zurich Airport', 'Zurich', 180, 27, 'CET'), (28, 'Changi Airport', 'Singapore', 300, 28, 'SGT'),
(29, 'Kuala Lumpur International', 'Kuala Lumpur', 200, 29, 'MYT'), (30, 'Ninoy Aquino', 'Manila', 180, 30, 'PHT'),
(31, 'Noi Bai International', 'Hanoi', 150, 31, 'ICT'), (32, 'Auckland Airport', 'Auckland', 140, 32, 'NZST'),
(33, 'Arturo Merino', 'Santiago', 130, 33, 'CLT'), (34, 'El Dorado', 'Bogota', 160, 34, 'COT'),
(35, 'Jorge Chávez', 'Lima', 140, 35, 'PET'), (36, 'Warsaw Chopin', 'Warsaw', 150, 36, 'CET'),
(37, 'Humberto Delgado', 'Lisbon', 140, 37, 'WET'), (38, 'Athens International', 'Athens', 130, 38, 'EET'),
(39, 'Dublin Airport', 'Dublin', 140, 39, 'IST'), (40, 'Brussels Airport', 'Brussels', 150, 40, 'CET'),
(41, 'Copenhagen Airport', 'Copenhagen', 140, 41, 'CET'), (42, 'Oslo Gardermoen', 'Oslo', 130, 42, 'CET'),
(43, 'Helsinki-Vantaa', 'Helsinki', 120, 43, 'EET'), (44, 'Vienna International', 'Vienna', 150, 44, 'CET'),
(45, 'Budapest Ferenc Liszt', 'Budapest', 120, 45, 'CET'), (46, 'Václav Havel', 'Prague', 130, 46, 'CET'),
(47, 'Henri Coandă', 'Bucharest', 120, 47, 'EET'), (48, 'Ben Gurion', 'Tel Aviv', 140, 48, 'IST'),
(49, 'Dubai International', 'Dubai', 300, 49, 'GST'), (50, 'Hamad International', 'Doha', 250, 50, 'AST'),
(51, 'Kuwait International', 'Kuwait City', 140, 51, 'AST'), (52, 'Muscat International', 'Muscat', 130, 52, 'GST'),
(53, 'Bahrain International', 'Manama', 120, 53, 'AST'), (54, 'Queen Alia', 'Amman', 130, 54, 'JST'),
(55, 'Beirut-Rafic Hariri', 'Beirut', 120, 55, 'EET'), (56, 'Mohammed V', 'Casablanca', 130, 56, 'WET'),
(57, 'Houari Boumediene', 'Algiers', 120, 57, 'CET'), (58, 'Tunis-Carthage', 'Tunis', 110, 58, 'CET'),
(59, 'Jomo Kenyatta', 'Nairobi', 130, 59, 'EAT'), (60, 'Kotoka International', 'Accra', 120, 60, 'GMT'),
(61, 'Bole International', 'Addis Ababa', 140, 61, 'EAT'), (62, 'Khartoum International', 'Khartoum', 110, 62, 'CAT'),
(63, 'Entebbe International', 'Kampala', 110, 63, 'EAT'), (64, 'Robert Gabriel', 'Harare', 100, 64, 'CAT');

-- TRUNCATE TABLE Customer;

-- Insert 60+ records into Customer
INSERT INTO Customer (customerID, Country, firstName, lastName, age, Cnic, gender, Email, houseNo, city, Fk_AirlineID) VALUES
(1, 'USA', 'John', 'Doe', 30, '1234567890123', 'Male', 'john.doe@email.com', '123 Main St', 'New York', 1),
(2, 'UK', 'Emma', 'Smith', 28, '9876543210987', 'Female', 'emma.smith@email.com', '45 High St', 'London', 2),
(3, 'Canada', 'Michael', 'Brown', 35, '4567891234565', 'Male', 'michael.brown@email.com', '78 Maple Ave', 'Toronto', 3),
(4, 'Australia', 'Sophie', 'Wilson', 25, '3216549871234', 'Female', 'sophie.wilson@email.com', '12 Beach Rd', 'Sydney', 4),
(5, 'Germany', 'Alexander', 'Müller', 40, '7891234567891', 'Male', 'alex.muller@email.com', '56 Goethe Str', 'Berlin', 5),
(6, 'France', 'Marie', 'Dupont', 32, '6547891234567', 'Female', 'marie.dupont@email.com', '23 Rue de Paris', 'Paris', 6),
(7, 'Japan', 'Hiroshi', 'Tanaka', 45, '12378954561234', 'Male', 'hiroshi.tanaka@email.com', '7 Sakura St', 'Tokyo', 7),
(8, 'India', 'Priya', 'Sharma', 29, '45612376894561', 'Female', 'priya.sharma@email.com', '89 MG Road', 'Mumbai', 8),
(9, 'Brazil', 'Lucas', 'Silva', 33, '78945617237894', 'Male', 'lucas.silva@email.com', '34 Copacabana', 'Rio de Janeiro', 9),
(10, 'China', 'Wei', 'Chen', 38, '12345678984567', 'Male', 'wei.chen@email.com', '45 Nanjing Rd', 'Beijing', 10),
(11, 'Italy', 'Giulia', 'Rossi', 27, '98712349567891', 'Female', 'giulia.rossi@email.com', '12 Via Roma', 'Rome', 11),
(12, 'Spain', 'Carlos', 'García', 42, '456721237894', 'Male', 'carlos.garcia@email.com', '67 Gran Via', 'Madrid', 12),
(13, 'Mexico', 'Sofia', 'Lopez', 31, '789123561234', 'Female', 'sofia.lopez@email.com', '45 Reforma', 'Mexico City', 13),
(14, 'South Africa', 'Thabo', 'Mkhize', 36, '12356894567891', 'Male', 'thabo.mkhize@email.com', '89 Long St', 'Cape Town', 14),
(15, 'Russia', 'Ivan', 'Petrov', 39, '4565537891234', 'Male', 'ivan.petrov@email.com', '34 Red Square', 'Moscow', 15),
(16, 'South Korea', 'Ji-hoon', 'Kim', 34, '78353561234567', 'Male', 'jihoon.kim@email.com', '56 Gangnam', 'Seoul', 16),
(17, 'Argentina', 'Santiago', 'Fernandez', 30, '1334567891234', 'Male', 'santiago.fernandez@email.com', '78 Palermo', 'Buenos Aires', 17),
(18, 'Egypt', 'Fatima', 'Hassan', 28, '9876565214567', 'Female', 'fatima.hassan@email.com', '12 Nile St', 'Cairo', 18),
(19, 'Thailand', 'Naree', 'Somsak', 26, '456691234567', 'Female', 'naree.somsak@email.com', '45 Sukhumvit', 'Bangkok', 19),
(20, 'Turkey', 'Ahmet', 'Yilmaz', 41, '1237834567891', 'Male', 'ahmet.yilmaz@email.com', '67 Taksim', 'Istanbul', 20),
(21, 'Nigeria', 'Chinedu', 'Okeke', 33, '78912334567891', 'Male', 'chinedu.okeke@email.com', '34 Victoria Island', 'Lagos', 21),
(22, 'Pakistan', 'Ayesha', 'Khan', 29, '4563437894567', 'Female', 'ayesha.khan@email.com', '89 Mall Road', 'Karachi', 22),
(23, 'Indonesia', 'Budi', 'Santoso', 37, '1254667894567', 'Male', 'budi.santoso@email.com', '56 Sudirman', 'Jakarta', 23),
(24, 'Saudi Arabia', 'Faisal', 'Al-Saud', 40, '78934261237894', 'Male', 'faisal.alsaud@email.com', '45 King Rd', 'Riyadh', 24),
(25, 'Netherlands', 'Lars', 'Visser', 32, '12378345561234', 'Male', 'lars.visser@email.com', '78 Dam Square', 'Amsterdam', 25),
(26, 'Sweden', 'Elsa', 'Larsson', 27, '4567891353894', 'Female', 'elsa.larsson@email.com', '34 Gamla Stan', 'Stockholm', 26),
(27, 'Switzerland', 'Hans', 'Schmid', 38, '98735434567891', 'Male', 'hans.schmid@email.com', '56 Bahnhofstrasse', 'Zurich', 27),
(28, 'Singapore', 'Wei Ling', 'Tan', 30, '1234357891234', 'Female', 'weiling.tan@email.com', '45 Orchard Rd', 'Singapore', 28),
(29, 'Malaysia', 'Ahmad', 'Rahim', 35, '7894351234567', 'Male', 'ahmad.rahim@email.com', '67 Petaling St', 'Kuala Lumpur', 29),
(30, 'Philippines', 'Maria', 'Santos', 28, '45345237891234', 'Female', 'maria.santos@email.com', '34 Makati Ave', 'Manila', 30),
(31, 'Vietnam', 'Nguyen', 'Tran', 33, '1237894567891', 'Male', 'nguyen.tran@email.com', '56 Ba Dinh', 'Hanoi', 31),
(32, 'New Zealand', 'James', 'Taylor', 29, '98734343217891', 'Male', 'james.taylor@email.com', '78 Queen St', 'Auckland', 32),
(33, 'Chile', 'Camila', 'Gonzalez', 31, '4563591234567', 'Female', 'camila.gonzalez@email.com', '45 Providencia', 'Santiago', 33),
(34, 'Colombia', 'Juan', 'Rodriguez', 36, '12345567894567', 'Male', 'juan.rodriguez@email.com', '67 Zona Rosa', 'Bogota', 34),
(35, 'Peru', 'Ana', 'Chavez', 27, '78912345543891', 'Female', 'ana.chavez@email.com', '34 Miraflores', 'Lima', 35),
(36, 'Poland', 'Katarzyna', 'Nowak', 30, '45634391237894', 'Female', 'katarzyna.nowak@email.com', '56 Krakowskie', 'Warsaw', 36),
(37, 'Portugal', 'Joao', 'Silva', 34, '12378935361234', 'Male', 'joao.silva@email.com', '78 Avenida', 'Lisbon', 37),
(38, 'Greece', 'Maria', 'Papadopoulos', 29, '93546543214567', 'Female', 'maria.papadopoulos@email.com', '45 Syntagma', 'Athens', 38),
(39, 'Ireland', 'Sean', 'Murphy', 37, '3461237894567', 'Male', 'sean.murphy@email.com', '67 Grafton St', 'Dublin', 39),
(40, 'Belgium', 'Sophie', 'Dubois', 31, '35494561237894', 'Female', 'sophie.dubois@email.com', '34 Grand Place', 'Brussels', 40),
(41, 'Denmark', 'Mads', 'Jensen', 35, '4534567891234', 'Male', 'mads.jensen@email.com', '56 Nyhavn', 'Copenhagen', 41),
(42, 'Norway', 'Ingrid', 'Larsen', 28, '9546543217891', 'Female', 'ingrid.larsen@email.com', '45 Karl Johans', 'Oslo', 42),
(43, 'Finland', 'Mika', 'Korhonen', 33, '45544891234567', 'Male', 'mika.korhonen@email.com', '78 Esplanadi', 'Helsinki', 43),
(44, 'Austria', 'Anna', 'Weber', 30, '1233494567891', 'Female', 'anna.weber@email.com', '56 Ringstrasse', 'Vienna', 44),
(45, 'Hungary', 'Tamas', 'Nagy', 36, '7876561234567', 'Male', 'tamas.nagy@email.com', '34 Vaci St', 'Budapest', 45),
(46, 'Czech Republic', 'Petra', 'Novakova', 29, '4351237891234', 'Female', 'petra.novakova@email.com', '67 Wenceslas Sq', 'Prague', 46),
(47, 'Romania', 'Andrei', 'Popescu', 34, '9876543511234', 'Male', 'andrei.popescu@email.com', '45 Calea Victoriei', 'Bucharest', 47),
(48, 'Israel', 'Yael', 'Levy', 31, '12345673434567', 'Female', 'yael.levy@email.com', '78 Rothschild Blvd', 'Tel Aviv', 48),
(49, 'UAE', 'Mohammed', 'Al-Maktoum', 38, '7341234567891', 'Male', 'mohammed.almaktoum@email.com', '56 Sheikh Zayed Rd', 'Dubai', 49),
(50, 'Qatar', 'Fatima', 'Al-Thani', 29, '4563491237894', 'Female', 'fatima.althani@email.com', '34 Corniche', 'Doha', 50),
(51, 'Kuwait', 'Khaled', 'Al-Sabah', 35, '1233594561234', 'Male', 'khaled.alsabah@email.com', '67 Gulf Rd', 'Kuwait City', 51),
(52, 'Oman', 'Aisha', 'Al-Busaidi', 30, '98765353214567', 'Female', 'aisha.albusaidi@email.com', '45 Al Alam', 'Muscat', 52),
(53, 'Bahrain', 'Salman', 'Al-Khalifa', 36, '4534237894567', 'Male', 'salman.alkhalifa@email.com', '78 Manama St', 'Manama', 53),
(54, 'Jordan', 'Lina', 'Hussein', 28, '7894563537894', 'Female', 'lina.hussein@email.com', '34 Rainbow St', 'Amman', 54),
(55, 'Lebanon', 'Ali', 'Harb', 33, '12345678913544', 'Male', 'ali.harb@email.com', '56 Hamra St', 'Beirut', 55),
(56, 'Morocco', 'Hassan', 'Bennani', 37, '98765432343891', 'Male', 'hassan.bennani@email.com', '45 Jemaa el-Fnaa', 'Casablanca', 56),
(57, 'Algeria', 'Nadia', 'Bouchard', 29, '4567891234567', 'Female', 'nadia.bouchard@email.com', '78 Didouche Mourad', 'Algiers', 57),
(58, 'Tunisia', 'Karim', 'Trabelsi', 34, '12378943437891', 'Male', 'karim.trabelsi@email.com', '56 Habib Bourguiba', 'Tunis', 58),
(59, 'Kenya', 'Grace', 'Wanjiku', 31, '7894561233567', 'Female', 'grace.wanjiku@email.com', '34 Kenyatta Ave', 'Nairobi', 59),
(60, 'Ghana', 'Kwame', 'Mensah', 35, '1234567835567', 'Male', 'kwame.mensah@email.com', '67 Oxford St', 'Accra', 60),
(61, 'Ethiopia', 'Abebe', 'Tadesse', 32, '9876565211234', 'Male', 'abebe.tadesse@email.com', '45 Bole Rd', 'Addis Ababa', 61),
(62, 'Sudan', 'Fatima', 'Osman', 30, '4567891347894', 'Female', 'fatima.osman@email.com', '78 Nile Ave', 'Khartoum', 62),
(63, 'Uganda', 'Joseph', 'Muwanga', 33, '1237856561234', 'Male', 'joseph.muwanga@email.com', '56 Jinja Rd', 'Kampala', 63),
(64, 'Zimbabwe', 'Tendai', 'Moyo', 29, '78945612356891', 'Female', 'tendai.moyo@email.com', '34 Samora Machel', 'Harare', 64);

-- Insert 60+ records into Customer_Contact
INSERT INTO Customer_Contact (customerID, contactNo) VALUES
(1, '+12025550123'), (1, '+12025550124'), (2, '+442071234567'), (2, '+442071234568'),
(3, '+14165550123'), (3, '+14165550124'), (4, '+61292501234'), (4, '+61292501235'),
(5, '+493012345678'), (5, '+493012345679'), (6, '+33123456789'), (6, '+33123456790'),
(7, '+81312345678'), (7, '+81312345679'), (8, '+912212345678'), (8, '+912212345679'),
(9, '+552112345678'), (9, '+552112345679'), (10, '+861012345678'), (10, '+861012345679'),
(11, '+390612345678'), (11, '+390612345679'), (12, '+349112345678'), (12, '+349112345679'),
(13, '+525512345678'), (13, '+525512345679'), (14, '+272112345678'), (14, '+272112345679'),
(15, '+749512345678'), (15, '+749512345679'), (16, '+82212345678'), (16, '+82212345679'),
(17, '+541112345678'), (17, '+541112345679'), (18, '+20212345678'), (18, '+20212345679'),
(19, '+66212345678'), (19, '+66212345679'), (20, '+90212345678'), (20, '+90212345679'),
(21, '+23412345678'), (21, '+23412345679'), (22, '+922112345678'), (22, '+922112345679'),
(23, '+622112345678'), (23, '+622112345679'), (24, '+966112345678'), (24, '+966112345679'),
(25, '+312012345678'), (25, '+312012345679'), (26, '+46812345678'), (26, '+46812345679'),
(27, '+414112345678'), (27, '+414112345679'), (28, '+65612345678'), (28, '+65612345679'),
(29, '+60312345678'), (29, '+60312345679'), (30, '+63212345678'), (30, '+63212345679'),
(31, '+842412345678'), (31, '+842412345679'), (32, '+64912345678'), (32, '+64912345679'),
(33, '+56212345678'), (33, '+56212345679'), (34, '+57112345678'), (34, '+57112345679'),
(35, '+51112345678'), (35, '+51112345679'), (36, '+482212345678'), (36, '+482212345679'),
(37, '+35112345678'), (37, '+35112345679'), (38, '+30212345678'), (38, '+30212345679'),
(39, '+35312345678'), (39, '+35312345679'), (40, '+32212345678'), (40, '+32212345679'),
(41, '+45212345678'), (41, '+45212345679'), (42, '+47212345678'), (42, '+47212345679'),
(43, '+35812345678'), (43, '+35812345679'), (44, '+43112345678'), (44, '+43112345679'),
(45, '+36112345678'), (45, '+36112345679'), (46, '+42012345678'), (46, '+42012345679'),
(47, '+40212345678'), (47, '+40212345679'), (48, '+97212345678'), (48, '+97212345679'),
(49, '+97112345678'), (49, '+97112345679'), (50, '+97412345678'), (50, '+97412345679'),
(51, '+96512345678'), (51, '+96512345679'), (52, '+96812345678'), (52, '+96812345679'),
(53, '+97312345678'), (53, '+97312345679'), (54, '+96212345678'), (54, '+96212345679'),
(55, '+96112345678'), (55, '+96112345679'), (56, '+21212345678'), (56, '+21212345679'),
(57, '+21312345678'), (57, '+21312345679'), (58, '+21612345678'), (58, '+21612345679'),
(59, '+25412345678'), (59, '+25412345679'), (60, '+23312345678'), (60, '+23312345679'),
(61, '+25112345678'), (61, '+25112345679'), (62, '+24912345678'), (62, '+24912345679'),
(63, '+25612345678'), (63, '+25612345679'), (64, '+26312345678'), (64, '+26312345679');

-- Insert 60+ records into Aircraft
INSERT INTO Aircraft (aircraftID, model, capacity, company, manufactureDate, maintenanceStatus) VALUES
(1, 'Boeing 737', 150, 'Boeing', '2015-03-10', 'Operational'), (2, 'Airbus A320', 180, 'Airbus', '2016-07-15', 'Operational'),
(3, 'Boeing 777', 300, 'Boeing', '2014-11-20', 'Under Maintenance'), (4, 'Airbus A350', 350, 'Airbus', '2018-02-25', 'Operational'),
(5, 'Boeing 787', 250, 'Boeing', '2017-09-10', 'Operational'), (6, 'Airbus A330', 280, 'Airbus', '2016-04-05', 'Operational'),
(7, 'Boeing 747', 400, 'Boeing', '2013-12-15', 'Under Maintenance'), (8, 'Airbus A380', 500, 'Airbus', '2019-01-20', 'Operational'),
(9, 'Embraer E175', 80, 'Embraer', '2020-03-10', 'Operational'), (10, 'Bombardier CRJ900', 90, 'Bombardier', '2018-06-15', 'Operational'),
(11, 'Boeing 737 MAX', 170, 'Boeing', '2021-05-20', 'Operational'), (12, 'Airbus A321', 200, 'Airbus', '2019-08-10', 'Operational'),
(13, 'Boeing 767', 240, 'Boeing', '2015-11-25', 'Under Maintenance'), (14, 'Airbus A340', 300, 'Airbus', '2014-07-15', 'Operational'),
(15, 'Boeing 757', 200, 'Boeing', '2016-03-20', 'Operational'), (16, 'Airbus A319', 140, 'Airbus', '2017-10-10', 'Operational'),
(17, 'Embraer E195', 120, 'Embraer', '2020-02-15', 'Operational'), (18, 'Bombardier Q400', 80, 'Bombardier', '2019-04-25', 'Operational'),
(19, 'Boeing 717', 130, 'Boeing', '2018-09-15', 'Operational'), (20, 'Airbus A220', 130, 'Airbus', '2021-03-10', 'Operational'),
(21, 'Boeing 737-800', 160, 'Boeing', '2017-06-20', 'Operational'), (22, 'Airbus A320neo', 180, 'Airbus', '2020-11-15', 'Operational'),
(23, 'Boeing 787-9', 270, 'Boeing', '2019-07-10', 'Operational'), (24, 'Airbus A330neo', 290, 'Airbus', '2021-01-25', 'Operational'),
(25, 'Boeing 777X', 350, 'Boeing', '2022-03-15', 'Operational'), (26, 'Airbus A350-1000', 400, 'Airbus', '2020-06-20', 'Operational'),
(27, 'Embraer E190', 100, 'Embraer', '2019-09-10', 'Operational'), (28, 'Bombardier CRJ700', 70, 'Bombardier', '2018-12-15', 'Operational'),
(29, 'Boeing 737-900', 180, 'Boeing', '2017-04-25', 'Operational'), (30, 'Airbus A321neo', 200, 'Airbus', '2021-08-10', 'Operational'),
(31, 'Boeing 747-8', 410, 'Boeing', '2016-05-20', 'Under Maintenance'), (32, 'Airbus A380-800', 520, 'Airbus', '2019-02-15', 'Operational'),
(33, 'Embraer E170', 70, 'Embraer', '2020-07-10', 'Operational'), (34, 'Bombardier CRJ1000', 100, 'Bombardier', '2018-10-20', 'Operational'),
(35, 'Boeing 767-300', 250, 'Boeing', '2016-11-15', 'Operational'), (36, 'Airbus A340-600', 320, 'Airbus', '2015-08-20', 'Operational'),
(37, 'Boeing 757-200', 190, 'Boeing', '2017-03-10', 'Operational'), (38, 'Airbus A319neo', 140, 'Airbus', '2020-04-25', 'Operational'),
(39, 'Embraer E195-E2', 130, 'Embraer', '2021-06-15', 'Operational'), (40, 'Bombardier Q300', 50, 'Bombardier', '2019-01-20', 'Operational'),
(41, 'Boeing 737-700', 140, 'Boeing', '2018-05-10', 'Operational'), (42, 'Airbus A320-200', 170, 'Airbus', '2019-11-15', 'Operational'),
(43, 'Boeing 787-8', 240, 'Boeing', '2020-02-20', 'Operational'), (44, 'Airbus A330-200', 260, 'Airbus', '2018-07-25', 'Operational'),
(45, 'Embraer E175-E2', 80, 'Embraer', '2021-09-10', 'Operational'), (46, 'Bombardier CRJ200', 50, 'Bombardier', '2017-12-15', 'Operational'),
(47, 'Boeing 737-600', 130, 'Boeing', '2016-06-20', 'Operational'), (48, 'Airbus A321-200', 190, 'Airbus', '2019-03-10', 'Operational'),
(49, 'Boeing 777-300', 330, 'Boeing', '2018-08-15', 'Operational'), (50, 'Airbus A350-900', 340, 'Airbus', '2020-05-20', 'Operational'),
(51, 'Embraer E190-E2', 110, 'Embraer', '2021-02-15', 'Operational'), (52, 'Bombardier Q200', 40, 'Bombardier', '2019-06-10', 'Operational'),
(53, 'Boeing 737-400', 150, 'Boeing', '2017-09-20', 'Operational'), (54, 'Airbus A320-100', 160, 'Airbus', '2018-04-25', 'Operational'),
(55, 'Boeing 767-200', 220, 'Boeing', '2016-12-10', 'Operational'), (56, 'Airbus A340-300', 280, 'Airbus', '2019-07-15', 'Operational'),
(57, 'Embraer E145', 50, 'Embraer', '2020-08-20', 'Operational'), (58, 'Bombardier CRJ500', 60, 'Bombardier', '2018-11-10', 'Operational'),
(59, 'Boeing 737-500', 140, 'Boeing', '2017-02-25', 'Operational'), (60, 'Airbus A330-300', 270, 'Airbus', '2019-05-20', 'Operational'),
(61, 'Boeing 777-200', 310, 'Boeing', '2018-01-15', 'Operational'), (62, 'Airbus A350-800', 320, 'Airbus', '2020-09-10', 'Operational'),
(63, 'Embraer E135', 40, 'Embraer', '2019-12-20', 'Operational'), (64, 'Bombardier Q100', 30, 'Bombardier', '2018-03-15', 'Operational');

-- Insert 60+ records into Flights
INSERT INTO Flights (flightID, flightNo, availabalSeeats, typeOFSeat, Fk_aircraftID, Fk_airportID, route, Fk_airlineID) VALUES
(1, 'DL123', 100, 'Economy', 1, 1, 'New York-London', 1), (2, 'BA456', 120, 'Business', 2, 2, 'London-Paris', 2),
(3, 'AC789', 80, 'Economy', 3, 3, 'Toronto-New York', 3), (4, 'QF101', 150, 'First Class', 4, 4, 'Sydney-Tokyo', 4),
(5, 'LH202', 90, 'Economy', 5, 5, 'Berlin-Madrid', 5), (6, 'AF303', 110, 'Business', 6, 6, 'Paris-Rome', 6),
(7, 'JL404', 130, 'First Class', 7, 7, 'Tokyo-Seoul', 7), (8, 'AI505', 100, 'Economy', 8, 8, 'Mumbai-Delhi', 8),
(9, 'LA606', 70, 'Economy', 9, 9, 'Rio-Buenos Aires', 9), (10, 'CZ707', 140, 'Business', 10, 10, 'Beijing-Shanghai', 10),
(11, 'AZ808', 90, 'Economy', 11, 11, 'Rome-Milan', 11), (12, 'IB909', 110, 'Business', 12, 12, 'Madrid-Barcelona', 12),
(13, 'AM010', 100, 'Economy', 13, 13, 'Mexico City-Cancun', 13), (14, 'SA111', 80, 'Economy', 14, 14, 'Cape Town-Johannesburg', 14),
(15, 'SU212', 120, 'Business', 15, 15, 'Moscow-St Petersburg', 15), (16, 'KE313', 130, 'First Class', 16, 16, 'Seoul-Bangkok', 16),
(17, 'AV414', 90, 'Economy', 17, 17, 'Buenos Aires-Santiago', 17), (18, 'MS515', 100, 'Economy', 18, 18, 'Cairo-Dubai', 18),
(19, 'TG616', 110, 'Business', 19, 19, 'Bangkok-Singapore', 19), (20, 'TK717', 140, 'First Class', 20, 20, 'Istanbul-Ankara', 20),
(21, 'ET818', 80, 'Economy', 21, 21, 'Lagos-Nairobi', 21), (22, 'PK919', 100, 'Economy', 22, 22, 'Karachi-Lahore', 22),
(23, 'GA020', 120, 'Business', 23, 23, 'Jakarta-Bali', 23), (24, 'SV121', 90, 'Economy', 24, 24, 'Riyadh-Jeddah', 24),
(25, 'KL222', 110, 'Business', 25, 25, 'Amsterdam-London', 25), (26, 'SK323', 100, 'Economy', 26, 26, 'Stockholm-Oslo', 26),
(27, 'LX424', 130, 'First Class', 27, 27, 'Zurich-Paris', 27), (28, 'SQ525', 150, 'First Class', 28, 28, 'Singapore-Kuala Lumpur', 28),
(29, 'MH626', 90, 'Economy', 29, 29, 'Kuala Lumpur-Jakarta', 29), (30, 'PR727', 100, 'Economy', 30, 30, 'Manila-Cebu', 30),
(31, 'VN828', 110, 'Business', 31, 31, 'Hanoi-Ho Chi Minh', 31), (32, 'NZ929', 120, 'Economy', 32, 32, 'Auckland-Wellington', 32),
(33, 'LA030', 80, 'Economy', 33, 33, 'Santiago-Lima', 33), (34, 'AV131', 100, 'Business', 34, 34, 'Bogota-Medellin', 34),
(35, 'CM232', 90, 'Economy', 35, 35, 'Lima-Panama City', 35), (36, 'LO333', 110, 'Business', 36, 36, 'Warsaw-Krakow', 36),
(37, 'TP434', 100, 'Economy', 37, 37, 'Lisbon-Porto', 37), (38, 'A335', 90, 'Economy', 38, 38, 'Athens-Thessaloniki', 38),
(39, 'EI536', 110, 'Business', 39, 39, 'Dublin-Cork', 39), (40, 'SN637', 100, 'Economy', 40, 40, 'Brussels-Antwerp', 40),
(41, 'SK738', 120, 'Business', 41, 41, 'Copenhagen-Aarhus', 41), (42, 'DY839', 90, 'Economy', 42, 42, 'Oslo-Bergen', 42),
(43, 'AY940', 100, 'Economy', 43, 43, 'Helsinki-Turku', 43), (44, 'OS041', 110, 'Business', 44, 44, 'Vienna-Salzburg', 44),
(45, 'W6442', 80, 'Economy', 45, 45, 'Budapest-Debrecen', 45), (46, 'OK543', 90, 'Economy', 46, 46, 'Prague-Brno', 46),
(47, 'RO644', 100, 'Business', 47, 47, 'Bucharest-Cluj', 47), (48, 'LY745', 110, 'Economy', 48, 48, 'Tel Aviv-Eilat', 48),
(49, 'EK846', 140, 'First Class', 49, 49, 'Dubai-Abu Dhabi', 49), (50, 'QR947', 150, 'First Class', 50, 50, 'Doha-Manama', 50),
(51, 'KU048', 90, 'Economy', 51, 51, 'Kuwait City-Dubai', 51), (52, 'WY149', 100, 'Business', 52, 52, 'Muscat-Salalah', 52),
(53, 'GF250', 110, 'Economy', 53, 53, 'Manama-Riyadh', 53), (54, 'RJ351', 90, 'Economy', 54, 54, 'Amman-Aqaba', 54),
(55, 'ME452', 100, 'Business', 55, 55, 'Beirut-Larnaca', 55), (56, 'AT553', 90, 'Economy', 56, 56, 'Casablanca-Marrakech', 56),
(57, 'AH654', 100, 'Economy', 57, 57, 'Algiers-Oran', 57), (58, 'TU755', 90, 'Economy', 58, 58, 'Tunis-Sfax', 58),
(59, 'KQ856', 110, 'Business', 59, 59, 'Nairobi-Mombasa', 59), (60, 'GF957', 100, 'Economy', 60, 60, 'Accra-Kumasi', 60),
(61, 'ET058', 120, 'Economy', 61, 61, 'Addis Ababa-Bahir Dar', 61), (62, 'SU159', 90, 'Economy', 62, 62, 'Khartoum-Juba', 62),
(63, 'UG260', 80, 'Economy', 63, 63, 'Kampala-Gulu', 63), (64, 'ZW361', 90, 'Economy', 64, 64, 'Harare-Bulawayo', 64);

INSERT INTO Booking (bookingID, destination, fromWhichCity, history, twoWayOrOneWay, dateOfDeparture, days, returnDate, discount, Fk_custumerIDB, Fk_flightID, seatNo, timeOFlight, timeOFLanding, dateToGo, fare) VALUES
(1, 'London', 'New York', 'Frequent flyer', 'Two Way', '2025-07-01', 7, '2025-07-08', 10.00, 1, 1, '12A', '08:00:00', '20:00:00', '2025-07-01', 500.00),
(2, 'Paris', 'London', 'First time', 'One Way', '2025-07-02', NULL, NULL, NULL, 2, 2, '15B', '09:00:00', '11:00:00', '2025-07-02', 200.00),
(3, 'New York', 'Toronto', 'Business trip', 'Two Way', '2025-07-03', 5, '2025-07-08', 5.00, 3, 3, '10C', '10:00:00', '12:00:00', '2025-07-03', 300.00),
(4, 'Tokyo', 'Sydney', 'Vacation', 'One Way', '2025-07-04', NULL, NULL, NULL, 4, 4, '20A', '11:00:00', '22:00:00', '2025-07-04', 800.00),
(5, 'Madrid', 'Berlin', 'Conference', 'Two Way', '2025-07-05', 3, '2025-07-08', 8.00, 5, 5, '14B', '12:00:00', '14:00:00', '2025-07-05', 250.00),
(6, 'Rome', 'Paris', 'Tourist', 'One Way', '2025-07-06', NULL, NULL, NULL, 6, 6, '16C', '13:00:00', '15:00:00', '2025-07-06', 220.00),
(7, 'Seoul', 'Tokyo', 'Business trip', 'Two Way', '2025-07-07', 4, '2025-07-11', 10.00, 7, 7, '18A', '14:00:00', '16:00:00', '2025-07-07', 350.00),
(8, 'Delhi', 'Mumbai', 'Family visit', 'One Way', '2025-07-08', NULL, NULL, NULL, 8, 8, '11B', '15:00:00', '17:00:00', '2025-07-08', 150.00),
(9, 'Buenos Aires', 'Rio de Janeiro', 'Vacation', 'Two Way', '2025-07-09', 6, '2025-07-15', 5.00, 9, 9, '13C', '16:00:00', '19:00:00', '2025-07-09', 400.00),
(10, 'Shanghai', 'Beijing', 'Conference', 'One Way', '2025-07-10', NULL, NULL, NULL, 10, 10, '19A', '17:00:00', '19:00:00', '2025-07-10', 200.00),
(11, 'Milan', 'Rome', 'Tourist', 'One Way', '2025-07-11', NULL, NULL, NULL, 11, 11, '12B', '08:00:00', '09:30:00', '2025-07-11', 180.00),
(12, 'Barcelona', 'Madrid', 'Business trip', 'Two Way', '2025-07-12', 3, '2025-07-15', 7.00, 12, 12, '15C', '09:00:00', '10:30:00', '2025-07-12', 250.00),
(13, 'Cancun', 'Mexico City', 'Vacation', 'One Way', '2025-07-13', NULL, NULL, NULL, 13, 13, '14A', '10:00:00', '12:30:00', '2025-07-13', 300.00),
(14, 'Johannesburg', 'Cape Town', 'Family visit', 'Two Way', '2025-07-14', 5, '2025-07-19', 5.00, 14, 14, '16B', '11:00:00', '13:00:00', '2025-07-14', 200.00),
(15, 'St Petersburg', 'Moscow', 'Business trip', 'One Way', '2025-07-15', NULL, NULL, NULL, 15, 15, '17C', '12:00:00', '13:30:00', '2025-07-15', 220.00),
(16, 'Bangkok', 'Seoul', 'Vacation', 'Two Way', '2025-07-16', 7, '2025-07-23', 10.00, 16, 16, '18A', '13:00:00', '18:00:00', '2025-07-16', 600.00),
(17, 'Santiago', 'Buenos Aires', 'Conference', 'One Way', '2025-07-17', NULL, NULL, NULL, 17, 17, '19B', '14:00:00', '16:00:00', '2025-07-17', 350.00),
(18, 'Dubai', 'Cairo', 'Tourist', 'Two Way', '2025-07-18', 4, '2025-07-22', 8.00, 18, 18, '20C', '15:00:00', '18:00:00', '2025-07-18', 500.00),
(19, 'Singapore', 'Bangkok', 'Business trip', 'One Way', '2025-07-19', NULL, NULL, NULL, 19, 19, '11A', '16:00:00', '18:00:00', '2025-07-19', 250.00),
(20, 'Ankara', 'Istanbul', 'Family visit', 'One Way', '2025-07-20', NULL, NULL, NULL, 20, 20, '12B', '17:00:00', '18:30:00', '2025-07-20', 200.00),
(21, 'Nairobi', 'Lagos', 'Vacation', 'Two Way', '2025-07-21', 6, '2025-07-27', 5.00, 21, 21, '13C', '08:00:00', '12:00:00', '2025-07-21', 400.00),
(22, 'Lahore', 'Karachi', 'Business trip', 'One Way', '2025-07-22', NULL, NULL, NULL, 22, 22, '14A', '09:00:00', '11:00:00', '2025-07-22', 150.00),
(23, 'Bali', 'Jakarta', 'Tourist', 'Two Way', '2025-07-23', 5, '2025-07-28', 7.00, 23, 23, '15B', '10:00:00', '12:00:00', '2025-07-23', 300.00),
(24, 'Jeddah', 'Riyadh', 'Family visit', 'One Way', '2025-07-24', NULL, NULL, NULL, 24, 24, '16C', '11:00:00', '13:00:00', '2025-07-24', 200.00),
(25, 'London', 'Amsterdam', 'Conference', 'Two Way', '2025-07-25', 3, '2025-07-28', 8.00, 25, 25, '17A', '12:00:00', '13:30:00', '2025-07-25', 250.00),
(26, 'Oslo', 'Stockholm', 'Business trip', 'One Way', '2025-07-26', NULL, NULL, NULL, 26, 26, '18B', '13:00:00', '14:00:00', '2025-07-26', 180.00),
(27, 'Paris', 'Zurich', 'Vacation', 'Two Way', '2025-07-27', 4, '2025-07-31', 10.00, 27, 27, '19C', '14:00:00', '15:30:00', '2025-07-27', 300.00),
(28, 'Kuala Lumpur', 'Singapore', 'Tourist', 'One Way', '2025-07-28', NULL, NULL, NULL, 28, 28, '20A', '15:00:00', '16:00:00', '2025-07-28', 200.00),
(29, 'Jakarta', 'Kuala Lumpur', 'Business trip', 'Two Way', '2025-07-29', 5, '2025-08-03', 5.00, 29, 29, '11B', '16:00:00', '18:00:00', '2025-07-29', 350.00),
(30, 'Cebu', 'Manila', 'Family visit', 'One Way', '2025-07-30', NULL, NULL, NULL, 30, 30, '12C', '17:00:00', '18:30:00', '2025-07-30', 150.00),
(31, 'Ho Chi Minh', 'Hanoi', 'Vacation', 'Two Way', '2025-07-31', 6, '2025-08-06', 7.00, 31, 31, '13A', '08:00:00', '10:00:00', '2025-07-31', 300.00),
(32, 'Wellington', 'Auckland', 'Conference', 'One Way', '2025-08-01', NULL, NULL, NULL, 32, 32, '14B', '09:00:00', '10:30:00', '2025-08-01', 200.00),
(33, 'Lima', 'Santiago', 'Tourist', 'Two Way', '2025-08-02', 4, '2025-08-06', 8.00, 33, 33, '15C', '10:00:00', '13:00:00', '2025-08-02', 400.00),
(34, 'Medellin', 'Bogota', 'Business trip', 'One Way', '2025-08-03', NULL, NULL, NULL, 34, 34, '16A', '11:00:00', '12:00:00', '2025-08-03', 150.00),
(35, 'Panama City', 'Lima', 'Vacation', 'Two Way', '2025-08-04', 5, '2025-08-09', 5.00, 35, 35, '17B', '12:00:00', '15:00:00', '2025-08-04', 350.00),
(36, 'Krakow', 'Warsaw', 'Family visit', 'One Way', '2025-08-05', NULL, NULL, NULL, 36, 36, '18C', '13:00:00', '14:00:00', '2025-08-05', 180.00),
(37, 'Porto', 'Lisbon', 'Tourist', 'Two Way', '2025-08-06', 3, '2025-08-09', 7.00, 37, 37, '19A', '14:00:00', '15:30:00', '2025-08-06', 200.00),
(38, 'Thessaloniki', 'Athens', 'Business trip', 'One Way', '2025-08-07', NULL, NULL, NULL, 38, 38, '20B', '15:00:00', '16:00:00', '2025-08-07', 150.00),
(39, 'Cork', 'Dublin', 'Vacation', 'Two Way', '2025-08-08', 4, '2025-08-12', 8.00, 39, 39, '11C', '16:00:00', '17:00:00', '2025-08-08', 200.00),
(40, 'Antwerp', 'Brussels', 'Conference', 'One Way', '2025-08-09', NULL, NULL, NULL, 40, 40, '12A', '17:00:00', '17:30:00', '2025-08-09', 100.00),
(41, 'Aarhus', 'Copenhagen', 'Family visit', 'Two Way', '2025-08-10', 3, '2025-08-13', 5.00, 41, 41, '13B', '08:00:00', '09:00:00', '2025-08-10', 150.00),
(42, 'Bergen', 'Oslo', 'Tourist', 'One Way', '2025-08-11', NULL, NULL, NULL, 42, 42, '14C', '09:00:00', '10:00:00', '2025-08-11', 180.00),
(43, 'Turku', 'Helsinki', 'Business trip', 'Two Way', '2025-08-12', 2, '2025-08-14', 7.00, 43, 43, '15A', '10:00:00', '11:00:00', '2025-08-12', 150.00),
(44, 'Salzburg', 'Vienna', 'Vacation', 'One Way', '2025-08-13', NULL, NULL, NULL, 44, 44, '16B', '11:00:00', '12:00:00', '2025-08-13', 150.00),
(45, 'Debrecen', 'Budapest', 'Conference', 'Two Way', '2025-08-14', 3, '2025-08-17', 5.00, 45, 45, '17C', '12:00:00', '13:00:00', '2025-08-14', 150.00),
(46, 'Brno', 'Prague', 'Family visit', 'One Way', '2025-08-15', NULL, NULL, NULL, 46, 46, '18A', '13:00:00', '14:00:00', '2025-08-15', 120.00),
(47, 'Cluj', 'Bucharest', 'Tourist', 'Two Way', '2025-08-16', 4, '2025-08-20', 8.00, 47, 47, '19B', '14:00:00', '15:30:00', '2025-08-16', 200.00),
(48, 'Eilat', 'Tel Aviv', 'Vacation', 'One Way', '2025-08-17', NULL, NULL, NULL, 48, 48, '20C', '15:00:00', '16:00:00', '2025-08-17', 150.00),
(49, 'Abu Dhabi', 'Dubai', 'Business trip', 'Two Way', '2025-08-18', 2, '2025-08-20', 10.00, 49, 49, '11A', '16:00:00', '17:00:00', '2025-08-18', 200.00),
(50, 'Manama', 'Doha', 'Conference', 'One Way', '2025-08-19', NULL, NULL, NULL, 50, 50, '12B', '17:00:00', '18:00:00', '2025-08-19', 150.00),
(51, 'Dubai', 'Kuwait City', 'Tourist', 'Two Way', '2025-08-20', 3, '2025-08-23', 5.00, 51, 51, '13C', '08:00:00', '10:00:00', '2025-08-20', 300.00),
(52, 'Salalah', 'Muscat', 'Family visit', 'One Way', '2025-08-21', NULL, NULL, NULL, 52, 52, '14A', '09:00:00', '11:00:00', '2025-08-21', 200.00),
(53, 'Riyadh', 'Manama', 'Business trip', 'Two Way', '2025-08-22', 2, '2025-08-24', 7.00, 53, 53, '15B', '10:00:00', '11:30:00', '2025-08-22', 250.00),
(54, 'Aqaba', 'Amman', 'Vacation', 'One Way', '2025-08-23', NULL, NULL, NULL, 54, 54, '16C', '11:00:00', '12:00:00', '2025-08-23', 150.00),
(55, 'Larnaca', 'Beirut', 'Tourist', 'Two Way', '2025-08-24', 3, '2025-08-27', 8.00, 55, 55, '17A', '12:00:00', '13:30:00', '2025-08-24', 200.00),
(56, 'Marrakech', 'Casablanca', 'Conference', 'One Way', '2025-08-25', NULL, NULL, NULL, 56, 56, '18B', '13:00:00', '14:00:00', '2025-08-25', 150.00),
(57, 'Oran', 'Algiers', 'Family visit', 'Two Way', '2025-08-26', 4, '2025-08-30', 5.00, 57, 57, '19C', '14:00:00', '15:30:00', '2025-08-26', 200.00),
(58, 'Sfax', 'Tunis', 'Business trip', 'One Way', '2025-08-27', NULL, NULL, NULL, 58, 58, '20A', '15:00:00', '16:00:00', '2025-08-27', 150.00),
(59, 'Mombasa', 'Nairobi', 'Vacation', 'Two Way', '2025-08-28', 5, '2025-09-02', 7.00, 59, 59, '11B', '16:00:00', '17:30:00', '2025-08-28', 250.00),
(60, 'Kumasi', 'Accra', 'Tourist', 'One Way', '2025-08-29', NULL, NULL, NULL, 60, 60, '12C', '17:00:00', '18:00:00', '2025-08-29', 150.00),
(61, 'Bahir Dar', 'Addis Ababa', 'Business trip', 'Two Way', '2025-08-30', 3, '2025-09-02', 5.00, 61, 61, '13A', '08:00:00', '09:30:00', '2025-08-30', 200.00),
(62, 'Juba', 'Khartoum', 'Conference', 'One Way', '2025-08-31', NULL, NULL, NULL, 62, 62, '14B', '09:00:00', '11:00:00', '2025-08-31', 300.00),
(63, 'Gulu', 'Kampala', 'Family visit', 'Two Way', '2025-09-01', 2, '2025-09-03', 8.00, 63, 63, '15C', '10:00:00', '11:00:00', '2025-09-01', 150.00),
(64, 'Bulawayo', 'Harare', 'Vacation', 'One Way', '2025-09-02', NULL, NULL, NULL, 64, 64, '16A', '11:00:00', '12:00:00', '2025-09-02', 150.00);
