--CREATE DATABASE CompetitionsDataBase;
USE CompetitionsDataBase;

-- Create Universities table
CREATE TABLE Universities (
    universityID INT IDENTITY PRIMARY KEY ,
    name VARCHAR(100) UNIQUE NOT NULL CHECK(LEN(name) >= 3),
    university_type VARCHAR(20) NOT NULL CHECK (university_type IN ('medical',
	'college', 'life sciences', 'technical', 'physical education', 'private', 'higher vocational'))
);

-- Create Stadiums table
CREATE TABLE Stadiums (
    stadiumID INT IDENTITY PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL CHECK(LEN(name) >= 3),
    address VARCHAR(100) NOT NULL,
    capacity INT NOT NULL CHECK (capacity BETWEEN 100 AND 70000),
	universityID INT REFERENCES Universities NOT NULL
);


-- Create Competitions table
CREATE TABLE Competitions (
    competitionID INT IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL CHECK(LEN(name) >= 3),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
	-- Ensure that start date is before or equal to the end date
    CHECK (start_date <= end_date AND start_date >= '2018-01-01' AND end_date <= '2050-01-01'),
	stadiumID INT REFERENCES Stadiums(stadiumID) NOT NULL
);

-- Create Disciplines table
CREATE TABLE Disciplines (
    discipline_name VARCHAR(15) CHECK(LEN(discipline_name) >= 4),
    category VARCHAR(11) CHECK(category IN ('men', 'women', 'relay_men', 'relay_women', 'relay_mix')),
    score_type VARCHAR(12) CHECK(score_type IN ('float_number', 'time')),
    max_participants_per_event INT NOT NULL CHECK(max_participants_per_event BETWEEN 3 AND 30),
    PRIMARY KEY (discipline_name, category)
);

-- Create Events table
CREATE TABLE Events (
    eventID INT IDENTITY PRIMARY KEY,
    level VARCHAR(20) NOT NULL CHECK(level IN ('qualifications', 'final')),
    date DATE NOT NULL,
    time TIME NOT NULL,
    group_number INT DEFAULT 1 CHECK(group_number >= 1),
    competitionID INT FOREIGN KEY REFERENCES Competitions(competitionID) NOT NULL,
    discipline_name_ref VARCHAR(15) NOT NULL,
    category_ref VARCHAR(11) NOT NULL,
    FOREIGN KEY(discipline_name_ref, category_ref) REFERENCES Disciplines(discipline_name, category) ON UPDATE CASCADE
);

-- Create Scored_Places table
CREATE TABLE Scored_Places (
    scored_placeID INT IDENTITY PRIMARY KEY,
    general_place INT CHECK(general_place BETWEEN 1 AND 500) NOT NULL,
    discipline_name_ref VARCHAR(15) NOT NULL,
    category_ref VARCHAR(11) NOT NULL,
    FOREIGN KEY(discipline_name_ref, category_ref) REFERENCES Disciplines(discipline_name, category) ON UPDATE CASCADE ON DELETE NO ACTION
);

-- Create Results table, many to many
CREATE TABLE Results (
    resultID INT IDENTITY PRIMARY KEY,
    score VARCHAR(8) CHECK(LEN(score) >= 3),
    points INT NOT NULL CHECK(points >= 0),
    eventID INT FOREIGN KEY REFERENCES Events(eventID) ON DELETE NO ACTION NOT NULL,
    scored_placeID INT FOREIGN KEY REFERENCES Scored_Places(scored_placeID) ON DELETE CASCADE
);

-- Create Trainers table
CREATE TABLE Trainers (
    trainerID INT IDENTITY PRIMARY KEY,
    name VARCHAR(20) NOT NULL CHECK(LEN(name) >= 2),
    surname VARCHAR(50) NOT NULL CHECK(LEN(surname) >= 2),
    telephone_number VARCHAR(15) UNIQUE CHECK(LEN(telephone_number) = 11 AND telephone_number LIKE '___-___-___'),
    email VARCHAR(40) UNIQUE CHECK(LEN(email) >= 5 AND email LIKE '%@%')
);

-- Create Athletes table
CREATE TABLE Athletes (
    athlete_start_number INT PRIMARY KEY CHECK(athlete_start_number BETWEEN 1 AND 9999),
    name VARCHAR(20) NOT NULL CHECK(LEN(name) >= 2),
    surname VARCHAR(50) NOT NULL CHECK(LEN(surname) >= 2),
    date_of_birth DATE,
    gender VARCHAR(6) NOT NULL CHECK(gender IN ('male', 'female')),
    trainerID INT FOREIGN KEY REFERENCES Trainers(trainerID) NOT NULL
);

-- Create Registrations table
CREATE TABLE Registrations (
    registrationID INT IDENTITY PRIMARY KEY,
    registry_date DATE NOT NULL DEFAULT GETDATE(),
    universityID INT FOREIGN KEY REFERENCES Universities(universityID) NOT NULL,
    competitionID INT FOREIGN KEY REFERENCES Competitions(competitionID) NOT NULL,
    athlete_start_number INT FOREIGN KEY REFERENCES Athletes(athlete_start_number) NOT NULL,
);


-- Create Licenses table
CREATE TABLE Licenses (
	license_number VARCHAR(10) PRIMARY KEY CHECK (
        license_number LIKE '[A-Z]/[0-9][0-9][0-9][0-9]/[0-9][0-9]'
        AND ASCII(SUBSTRING(license_number, 1, 1)) >= ASCII('A')
        AND ASCII(SUBSTRING(license_number, 1, 1)) <= ASCII('Z')
        AND CAST(SUBSTRING(license_number, 3, 4) AS INT) BETWEEN 0 AND 9999
        AND CAST(SUBSTRING(license_number, 8, 2) AS INT) BETWEEN 0 AND 50
    ),
    expiry_date DATE NOT NULL,
    athlete_start_number INT REFERENCES Athletes(athlete_start_number) NOT NULL
);

-- Create enrolled_to table
CREATE TABLE enrolled_to (
    registrationID INT REFERENCES Registrations(registrationID),
    discipline_name_ref VARCHAR(15) NOT NULL,
    category_ref VARCHAR(11) NOT NULL,
    FOREIGN KEY(discipline_name_ref, category_ref) REFERENCES Disciplines(discipline_name, category) ON UPDATE CASCADE,
    PRIMARY KEY (registrationID, discipline_name_ref, category_ref)
);

-- Create participate_in table
CREATE TABLE participate_in (
    athlete_start_number INT REFERENCES Athletes(athlete_start_number) NOT NULL,
    eventID INT REFERENCES Events(eventID) NOT NULL,
    PRIMARY KEY (athlete_start_number, eventID)
);

-- Create scored_by table
CREATE TABLE scored_by (
    athlete_start_number INT REFERENCES Athletes(athlete_start_number) ON DELETE NO ACTION NOT NULL,
    resultID INT REFERENCES Results(resultID) ON DELETE CASCADE,
    PRIMARY KEY (athlete_start_number, resultID)
);

-- Create has_scored table
CREATE TABLE has_scored (
    athlete_start_number INT REFERENCES Athletes(athlete_start_number) ON DELETE NO ACTION NOT NULL,
    scored_placeID INT REFERENCES Scored_Places(scored_placeID) ON DELETE CASCADE,
    PRIMARY KEY (athlete_start_number, scored_placeID)
);

-- Create allows_for table
CREATE TABLE allows_for (
    competitionID INT REFERENCES Competitions(competitionID),
    discipline_name_ref VARCHAR(15) NOT NULL,
    category_ref VARCHAR(11) NOT NULL,
    FOREIGN KEY(discipline_name_ref, category_ref) REFERENCES Disciplines(discipline_name, category) ON UPDATE CASCADE,
    PRIMARY KEY (competitionID, discipline_name_ref, category_ref)
);