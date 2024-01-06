USE CompetitionsDataBase;

DELETE FROM allows_for;
DELETE FROM has_scored;
DELETE FROM scored_by;
DELETE FROM participate_in;
DELETE FROM enrolled_to;
DELETE FROM Licenses;
DELETE FROM Registrations;
DELETE FROM Athletes;
DELETE FROM Trainers;
DELETE FROM Results;
DELETE FROM Scored_Places;
DELETE FROM Events;
DELETE FROM Disciplines;
DELETE FROM Competitions;
DELETE FROM Stadiums;
DELETE FROM Universities;

-- Inserting 10 US Universities with corresponding stadiums
-- Identifying University FOREIGN KEY ID's with IDENT_CURRENT()
-- 1
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Metro Health Sciences University', 'medical');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Metro Health Stadium', '123 Health St, New York City, NY', 60000, IDENT_CURRENT('Universities'));

-- 2
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Silicon Valley Technology Institute', 'technical');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Tech Valley Arena', '456 Tech Blvd, San Francisco, CA', 55000, IDENT_CURRENT('Universities'));

-- 3, without stadium
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Southern Coastal Life Sciences College', 'life sciences');

-- 4
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Rocky Mountain Technical University', 'technical');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Rocky Summit Stadium', '101 Mountain Rd, Denver, CO', 50000, IDENT_CURRENT('Universities'));

-- 5
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Midwest Physical Education Academy', 'physical education');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Midwest Sports Complex', '202 Sports St, Chicago, IL', 45000, IDENT_CURRENT('Universities'));

-- 6, without stadium
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Golden State Private University', 'private');

-- 7
INSERT INTO Universities
  (name, university_type)
VALUES
  ('New England Higher Vocational Institute', 'higher vocational');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('New England Stadium', '404 Higher Way, Boston, MA', 60000, IDENT_CURRENT('Universities'));

-- 8
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Lone Star College of Innovation', 'college');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Lone Star Innovation Center', '505 Lone Star Dr, Dallas, TX', 30000, IDENT_CURRENT('Universities'));

-- 9
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Capital City College of Arts', 'college');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Capital Arts Field', '606 Arts Ave, Washington, D.C.', 50000, IDENT_CURRENT('Universities'));

-- 10
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Great Lakes College', 'college');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Great Lakes Sports Arena', '707 Lakeside Rd, Detroit, MI', 55000, IDENT_CURRENT('Universities'));

-- 11
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Sunbelt Private University', 'private');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Sunbelt Private Stadium', '808 Sunbelt St, Phoenix, AZ', 60000, IDENT_CURRENT('Universities'));

-- 12
INSERT INTO Universities
  (name, university_type)
VALUES
  ('Harvard University', 'college');

INSERT INTO Stadiums
  (name, address, capacity, universityID)
VALUES
  ('Harvard Stadium', '95 N Harvard St, Boston, MA', 30323, IDENT_CURRENT('Universities'));



-- Inserting 10 Competitions
INSERT INTO Competitions
  (name, start_date, end_date, stadiumID)
VALUES
  ('Health Sciences Sport Festival', '2018-05-01', '2018-05-02', 1),
  ('Winter Tech Innovators', '2018-11-01', '2018-11-01', 2),
  ('Relay Lone Star Challenge', '2019-05-15', '2019-05-15', 6),
  ('Rocky Mountain Pole Vault Clash', '2019-08-07', '2019-08-08', 3),
  ('1st Midwest Athletics Run Festival', '2021-09-01', '2021-09-03', 4),
  ('Golden State Games Jump women Finals', '2021-11-04', '2021-11-05', 2),
  ('New England Collegiate Jump Men Finals', '2022-04-02', '2022-04-02', 5),
  ('National Hurdles Championships', '2022-09-03', '2022-09-03', 10),
  ('Capital Arts Sports Competition Javelin', '2023-05-21', '2023-05-21', 7),
  ('2nd Midwest Athletics Discus Festival', '2024-02-02', '2024-02-03', 4);

-- Inserting track-and-field Disciplines
INSERT INTO Disciplines
  (discipline_name, category, score_type, max_participants_per_event)
VALUES
  ('100m Sprint', 'men', 'time', 8),
  ('100m Sprint', 'women', 'time', 8),
  ('100m Sprint', 'relay_mix', 'time', 4),
  ('Hammer Throw', 'men', 'float_number', 20),
  ('Shot Put', 'women', 'float_number', 30),
  ('400m Run', 'relay_women', 'time', 4),
  ('Pole Vault', 'men', 'float_number', 15),
  ('Pole Vault', 'women', 'float_number', 15),
  ('800m Run', 'men', 'time', 8),
  ('1500m Run', 'men', 'time', 12),
  ('1500m Run', 'women', 'time', 12),
  ('High Jump', 'women', 'float_number', 20),
  ('Long Jump', 'women', 'float_number', 20),
  ('Triple Jump', 'men', 'float_number', 20),
  ('100m Hurdles', 'women', 'time', 8),
  ('Javelin Throw', 'men', 'float_number', 30),
  ('Discus Throw', 'women', 'float_number', 30),
  ('Discus Throw', 'men', 'float_number', 30);

-- Inserting 20 Events
INSERT INTO Events
  (level, date, time, group_number, competitionID, discipline_name_ref, category_ref)
VALUES
  -- 'Health Sciences Sport Festival'
  ('qualifications', '2018-05-01', '10:00:00', 1, 1, '100m Sprint', 'men'),
  ('qualifications', '2018-05-01', '10:05:00', 2, 1, '100m Sprint', 'men'),
  ('final', '2018-05-02', '10:00:00', 1, 1, '100m Sprint', 'men'),
  ('final', '2018-05-02', '10:05:00', 1, 1, '100m Sprint', 'women'),
  ('final', '2018-05-02', '10:10:00', 1, 1, '100m Sprint', 'relay_mix'),
  ('final', '2018-05-02', '15:30:00', 1, 1, 'Hammer Throw', 'men'),

  -- 'Winter Tech Innovators', '2018-11-01', '2018-11-01'
  ('final', '2018-11-01', '16:30:00', 1, 2, 'Shot Put', 'women'),

  -- 'Relay Lone Star Challenge'
  ('final', '2019-05-15', '10:30:00', 1, 3, '400m Run', 'relay_women'),

  -- 'Rocky Mountain Pole Vault Clash', '2019-08-07', '2019-08-08'
  ('final', '2019-08-07', '10:00:00', 1, 4, 'Pole Vault', 'men'),
  ('final', '2019-08-08', '10:00:00', 1, 4, 'Pole Vault', 'women'),

  -- '1st Midwest Athletics Run Festival', '2021-09-01', '2021-09-03'
  ('final', '2021-09-01', '10:00:00', 1, 5, '800m Run', 'men'),
  ('final', '2021-09-02', '10:00:00', 1, 5, '1500m Run', 'men'),
  ('final', '2021-09-03', '10:20:00', 1, 5, '1500m Run', 'women'),

  -- 'Golden State Games Jump women Finals', '2021-11-04', '2021-11-05'
  ('final', '2021-11-04', '09:00:00', 1, 6, 'High Jump', 'women'),
  ('final', '2021-11-05', '09:00:00', 2, 6, 'Long Jump', 'women'),

  -- 'New England Collegiate Jump Men Finals'
  ('final', '2022-04-02', '12:30:00', 3, 7, 'Triple Jump', 'men'),

  -- 'National Hurdles Championships'
  ('final', '2022-09-03', '10:15:00', 1, 8, '100m Hurdles', 'women'),

  -- 'Capital Arts Sports Competition Javelin',
  ('final', '2023-05-21', '08:00:00', 1, 9, 'Javelin Throw', 'men'),

  -- '2nd Midwest Athletics Discus Festival'
  ('final', '2024-02-02', '08:00:00', 1, 10, 'Discus Throw', 'women'),
  ('final', '2024-02-03', '09:00:00', 1, 10, 'Discus Throw', 'men');


-- Inserting Scored Places
INSERT INTO Scored_Places
  (general_place, discipline_name_ref, category_ref)
VALUES
  -- Competition 1 - Sprint 100m Men
  -- group 1
  (1, '100m Sprint', 'men'),
  (2, '100m Sprint', 'men'),
  (3, '100m Sprint', 'men'),
  (4, '100m Sprint', 'men'),

  -- group 2
  (1, '100m Sprint', 'men'),
  (2, '100m Sprint', 'men'),
  (3, '100m Sprint', 'men'),
  (4, '100m Sprint', 'men'),

  -- Final men
  (1, '100m Sprint', 'men'),
  (2, '100m Sprint', 'men'),
  (3, '100m Sprint', 'men'),
  (4, '100m Sprint', 'men'),
  (5, '100m Sprint', 'men'),
  (6, '100m Sprint', 'men'),
  (7, '100m Sprint', 'men'),
  (8, '100m Sprint', 'men'),

  -- Sprint 100m Women
  -- Final women
  (1, '100m Sprint', 'women'),
  (2, '100m Sprint', 'women'),
  (3, '100m Sprint', 'women'),
  (4, '100m Sprint', 'women'),
  (5, '100m Sprint', 'women'),

  -- Final Relay Mix
  (1, '100m Sprint', 'relay_mix'),
  (2, '100m Sprint', 'relay_mix'),

  -- Final Hammer Throw
  (1, 'Hammer Throw', 'men'),
  (2, 'Hammer Throw', 'men'),
  (3, 'Hammer Throw', 'men'),
  (4, 'Hammer Throw', 'men'),

  -- Competition 2
  -- Final Shot Put Women
  (1, 'Shot Put', 'women'),
  (2, 'Shot Put', 'women'),
  (3, 'Shot Put', 'women'),

  -- Competition 3
  -- Final Relay Women 400m Run
  (1, '400m Run', 'relay_women'),
  (2, '400m Run', 'relay_women'),

  -- Competition 4
  -- Final Pole Vault Men
  (1, 'Pole Vault', 'men'),
  (2, 'Pole Vault', 'men'),
  (3, 'Pole Vault', 'men'),

  -- Final Pole Vault Women
  (1, 'Pole Vault', 'women'),
  (2, 'Pole Vault', 'women'),
  (3, 'Pole Vault', 'women'),
  (4, 'Pole Vault', 'women'),

  -- Competition 5
  -- Final Men 800m
  (1, '800m Run', 'men'),
  (2, '800m Run', 'men'),
  (3, '800m Run', 'men'),
  (4, '800m Run', 'men'),

  -- Final Men 1500m
  (1, '1500m Run', 'men'),
  (2, '1500m Run', 'men'),
  (3, '1500m Run', 'men'),
  (4, '1500m Run', 'men'),
  (5, '1500m Run', 'men'),
  (6, '1500m Run', 'men'),
  (7, '1500m Run', 'men'),

  -- Final Women 1500m
  (1, '1500m Run', 'women'),
  (2, '1500m Run', 'women'),
  (3, '1500m Run', 'women'),
  (4, '1500m Run', 'women'),
  (5, '1500m Run', 'women'),
  (6, '1500m Run', 'women'),

  -- Competition 6
  -- Final Women High Jump
  (1, 'High Jump', 'women'),
  (2, 'High Jump', 'women'),
  (3, 'High Jump', 'women'),

  -- Final Women Long Jump
  (1, 'Long Jump', 'women'),
  (2, 'Long Jump', 'women'),
  (3, 'Long Jump', 'women'),
  (4, 'Long Jump', 'women'),

  -- Competition 7
  -- Final Men Triple Jump
  (1, 'Triple Jump', 'men'),
  (2, 'Triple Jump', 'men'),
  (3, 'Triple Jump', 'men'),
  (4, 'Triple Jump', 'men'),
  (5, 'Triple Jump', 'men'),

  -- Competition 8
  -- Final Women Hurdles 100m
  (1, '100m Hurdles', 'women'),
  (2, '100m Hurdles', 'women'),
  (3, '100m Hurdles', 'women'),
  (4, '100m Hurdles', 'women'),
  (5, '100m Hurdles', 'women'),

  -- Competition 9
  -- Final Javelin Throw Men
  (1, 'Javelin Throw', 'men'),
  (2, 'Javelin Throw', 'men'),
  (3, 'Javelin Throw', 'men'),
  (4, 'Javelin Throw', 'men');


INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
-- Sprint 100m Men - Qualifications Group 1
  ('10.55', 8, 1, 1),
  ('10.60', 6, 1, 2),
  ('10.70', 4, 1, 3),
  ('10.80', 2, 1, 4);

INSERT INTO Results 
  (score, points, eventID, scored_placeID)
  SELECT NULL, 0, 1, NULL

-- Sprint 100m Men - Qualifications Group 2
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('10.52', 6, 2, 5),
  ('10.58', 4, 2, 6),
  ('10.68', 2, 2, 7),
  ('10.78', 0, 2, 8);

-- Sprint 100m Men - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('10.50', 16, 3, 9),
  ('10.55', 14, 3, 10),
  ('10.60', 12, 3, 11),
  ('10.65', 10, 3, 12),
  ('10.70', 8, 3, 13),
  ('10.75', 6, 3, 14),
  ('10.76', 4, 3, 15),
  ('11.02', 2, 3, 16);

-- Sprint 100m Women - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('11.20', 10, 4, 17),
  ('11.25', 8, 4, 18),
  ('11.30', 6, 4, 19),
  ('11.45', 4, 4, 20),
  ('11.50', 2, 4, 21);

-- Sprint 100m Mix - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('09.52', 6, 5, 22),
  ('10.18', 4, 5, 23);

INSERT INTO Results 
  (score, points, eventID, scored_placeID)
  SELECT NULL, 0, 5, NULL

-- Hammer Throw Men - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('75.80', 8, 6, 24),
  ('73.50', 6, 6, 25),
  ('71.20', 4, 6, 26),
  ('69.00', 2, 6, 27);

-- Shot Put Women - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('19.80', 6, 7, 28),
  ('19.50', 4, 7, 29),
  ('19.20', 2, 7, 30);

-- 400m Run Women Relay - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('3:45.20', 6, 8, 31),
  ('3:46.00', 4, 8, 32);

INSERT INTO Results 
  (score, points, eventID, scored_placeID)
  SELECT NULL, 0, 8, NULL

-- Pole Vault Men - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('4.90', 10, 9, 33),
  ('4.85', 8, 9, 34),
  ('4.80', 6, 9, 35);

INSERT INTO Results 
  (score, points, eventID, scored_placeID)
  SELECT NULL, 0, 9, NULL

INSERT INTO Results 
  (score, points, eventID, scored_placeID)
  SELECT NULL, 0, 9, NULL

-- Pole Vault Women - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('3.90', 8, 10, 36),
  ('3.85', 6, 10, 37),
  ('3.80', 4, 10, 38),
  ('3.75', 2, 10, 39);

-- 800m Run Men - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('1:48.50', 8, 11, 40),
  ('1:48.90', 6, 11, 41),
  ('1:49.30', 4, 11, 42),
  ('1:49.70', 2, 11, 43);

-- 1500m Run Men - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('3:40.50', 14, 12, 44),
  ('3:41.00', 12, 12, 45),
  ('3:41.50', 10, 12, 46),
  ('3:42.00', 8, 12, 47),
  ('3:42.50', 6, 12, 48),
  ('3:43.00', 4, 12, 49),
  ('3:43.50', 2, 12, 50);

-- 1500m Run Women - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('4:00.00', 12, 13, 51),
  ('4:01.00', 10, 13, 52),
  ('4:02.00', 8, 13, 53),
  ('4:03.00', 6, 13, 54),
  ('4:04.00', 4, 13, 55),
  ('4:05.00', 2, 13, 56);

-- High Jump Women - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('1.80', 6, 14, 57),
  ('1.75', 4, 14, 58),
  ('1.70', 2, 14, 59);

-- Long Jump Women - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('6.50', 8, 15, 60),
  ('6.40', 6, 15, 61),
  ('6.30', 4, 15, 62),
  ('6.20', 2, 15, 63);

-- Triple Jump Men - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('17.30', 10, 16, 64),
  ('17.10', 8, 16, 65),
  ('16.90', 6, 16, 66),
  ('16.70', 4, 16, 67),
  ('16.50', 2, 16, 68);

-- 100m Hurdles Women - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('12.80', 10, 17, 69),
  ('12.85', 8, 17, 70),
  ('12.90', 6, 17, 71),
  ('12.95', 4, 17, 72),
  ('13.00', 2, 17, 73);

-- Javelin Throw Men - Final
INSERT INTO Results
  (score, points, eventID, scored_placeID)
VALUES
  ('75.80', 8, 18, 74),
  ('73.50', 6, 18, 75),
  ('71.20', 4, 18, 76),
  ('69.00', 2, 18, 77);

-- Inserting Trainers
INSERT INTO Trainers
  (name, surname, telephone_number, email)
VALUES
  ('John', 'Doe', '123-456-789', 'john.doe@gmail.com'),
  ('Jane', 'Smith', '987-654-321', 'jane.smith@gmail.com'),
  ('Mike', 'Johnson', '111-222-333', 'mike.johnson@gmail.com'),
  ('Emily', 'Brown', '444-555-666', 'emily.brown@gmail.com'),
  ('David', 'Williams', '777-888-999', 'david.williams@gmail.com'),
  ('Olivia', 'Taylor', '555-111-222', 'olivia.taylor@gmail.com'),
  ('Ryan', 'Anderson', '333-444-555', 'ryan.anderson@gmail.com'),
  ('Sophia', 'Miller', '666-777-888', 'sophia.miller@gmail.com'),
  ('Ethan', 'Wilson', '888-999-111', 'ethan.wilson@gmail.com'),
  ('Ava', 'Thomas', '222-333-444', 'ava.thomas@gmail.com');

-- Inserting Athletes
INSERT INTO Athletes
  (athlete_start_number, name, surname, date_of_birth, gender, trainerID)
VALUES

  (1, 'Alice', 'Johnson', '1990-05-15', 'female', 1),
  (2, 'Bob', 'Miller', '1992-08-22', 'male', 1),
  (3, 'Catherine', 'Lee', '1995-02-10', 'female', 1),
  (4, 'Daniel', 'Brown', '1993-11-30', 'male', 1),
  (5, 'Eva', 'Davis', '1994-04-18', 'female', 2),
  (6, 'Mason', 'Martinez', '1991-07-05', 'male', 2),
  (7, 'Grace', 'Garcia', '1993-09-20', 'female', 2),
  (8, 'Logan', 'Lewis', '1994-03-12', 'male', 2),
  (9, 'Sofia', 'Scott', '1996-01-25', 'female', 3),
  (10, 'Jackson', 'Jones', '1992-12-08', 'male', 3),
  (11, 'Aria', 'Allen', '1990-06-14', 'female', 3),
  (12, 'Elijah', 'Evans', '1993-04-02', 'male', 3),
  (13, 'Zoe', 'Zimmerman', '1995-08-17', 'female', 2),
  (14, 'Carter', 'Collins', '1991-11-28', 'male', 4),
  (15, 'Lily', 'Lopez', '1994-09-10', 'female', 1),
  (16, 'Lucas', 'Lloyd', '1996-02-03', 'male', 5),
  (17, 'Avery', 'Adams', '1990-12-22', 'female', 1),
  (18, 'Liam', 'Lambert', '1992-03-30', 'male', 6),
  (19, 'Emma', 'Elliott', '1993-05-05', 'female', 7),
  (20, 'Wyatt', 'Ward', '1995-07-18', 'male', 8),
  (21, 'Michael', 'Jordan', '1995-03-15', 'male', 9),
  (22, 'Christopher', 'Smith', '1990-07-22', 'male', 10),
  (23, 'Olivia', 'Owens', '1994-06-08', 'female', 3),
  (24, 'Sophia', 'Sanders', '1996-09-15', 'female', 3);

-- Insert Licenses for Athletes
INSERT INTO Licenses (license_number, expiry_date, athlete_start_number)
VALUES
  ('A/0001/01', '2019-12-31', 1),
  ('A/0002/01', '2023-12-31', 2),
  ('A/0003/01', '2022-12-31', 3),
  ('A/0004/01', '2018-12-31', 4),
  ('A/0005/01', '2019-12-31', 5),
  ('A/0006/01', '2018-12-31', 6),
  ('A/0007/01', '2019-12-31', 7),
  ('A/0008/01', '2023-12-31', 8),
  ('A/0009/01', '2022-12-31', 9),
  ('A/0010/01', '2021-12-31', 10),
  ('A/0011/01', '2021-12-31', 11),
  ('A/0012/01', '2022-12-31', 12),
  ('A/0013/01', '2021-12-31', 13),
  ('A/0014/01', '2023-12-31', 14),
  ('A/0015/01', '2021-12-31', 15),
  ('A/0016/01', '2023-12-31', 16),
  ('A/0017/01', '2022-12-31', 17),
  ('A/0018/01', '2021-12-31', 18),
  ('A/0019/01', '2022-12-31', 19),
  ('A/0020/01', '2023-12-31', 20),
  ('A/0021/01', '2022-12-31', 21),
  ('A/0022/01', '2023-12-31', 22),
  ('A/0023/01', '2022-12-31', 23),
  ('A/0024/01', '2023-12-31', 24);


INSERT INTO Registrations
  (registry_date, universityID, competitionID, athlete_start_number)
VALUES
  -- competitions:
  -- 1
  ('2018-04-20', 1, 1, 1),
  ('2018-04-15', 1, 1, 2),
  ('2018-04-10', 1, 1, 3),
  ('2018-04-05', 1, 1, 4),
  ('2018-03-31', 2, 1, 5),
  ('2018-03-26', 2, 1, 6),
  ('2018-03-21', 2, 1, 7),
  ('2018-03-16', 2, 1, 8),
  ('2018-03-11', 3, 1, 9),
  ('2018-03-06', 3, 1, 10),
  ('2018-02-23', 3, 1, 12),
  ('2018-02-13', 4, 1, 14),
  ('2018-02-08', 5, 1, 15),
  ('2018-02-03', 5, 1, 16),
  ('2018-01-29', 6, 1, 18),
  ('2018-01-24', 8, 1, 20),
  ('2018-01-19', 9, 1, 21),
  ('2018-01-14', 10, 1, 22),

  -- 2
  ('2018-09-20', 1, 2, 3),
  ('2018-09-10', 6, 2, 17),
  ('2018-09-01', 7, 2, 19),

  --3
  ('2019-05-10', 1, 3, 1),
  ('2019-04-25', 1, 3, 3),
  ('2019-05-05', 1, 3, 5),
  ('2019-04-15', 1, 3, 7),
  ('2019-05-01', 2, 3, 9),
  ('2019-04-20', 2, 3, 11),
  ('2019-05-01', 2, 3, 13),
  ('2019-04-20', 2, 3, 15),
  ('2019-05-01', 3, 3, 17),
  ('2019-04-20', 3, 3, 19),
  ('2019-05-10', 3, 3, 23),
  ('2019-04-25', 3, 3, 24),

  -- 4
  ('2019-07-15', 1, 4, 1),
  ('2019-07-20', 1, 4, 2),
  ('2019-07-25', 2, 4, 7),
  ('2019-07-30', 2, 4, 8),
  ('2019-08-01', 3, 4, 9),
  ('2019-08-02', 3, 4, 10),
  ('2019-08-03', 6, 4, 18),
  ('2019-08-04', 7, 4, 19),
  ('2019-08-05', 9, 4, 21),

  -- 5
  ('2021-08-15', 2, 5, 8),
  ('2021-08-20', 2, 5, 13),
  ('2021-08-25', 3, 5, 9),
  ('2021-08-30', 3, 5, 10),
  ('2021-08-31', 3, 5, 11),
  ('2021-07-07', 3, 5, 23),
  ('2021-07-08', 3, 5, 24),
  ('2021-07-01', 4, 5, 14),
  ('2021-07-02', 5, 5, 16),
  ('2021-07-03', 6, 5, 18),
  ('2021-07-04', 7, 5, 19),
  ('2021-07-05', 8, 5, 20),
  ('2021-07-06', 10, 5, 22),

  -- 6
  ('2021-10-15', 1, 6, 3),
  ('2021-10-20', 1, 6, 11),
  ('2021-10-25', 2, 6, 13),
  ('2021-10-30', 3, 6, 15),

  -- 7
  ('2022-03-15', 4, 7, 12),
  ('2022-03-15', 5, 7, 16),
  ('2022-03-16', 7, 7, 19),
  ('2022-03-12', 9, 7, 21),
  ('2022-02-11', 10, 7, 22),

  -- 8
  ('2022-08-01', 1, 8, 3),
  ('2022-07-10', 3, 8, 9),
  ('2022-08-15', 3, 8, 23),
  ('2022-08-15', 4, 8, 24),
  ('2022-08-17', 5, 8, 17),

  -- 9
  ('2023-04-01', 1, 9, 2),
  ('2023-05-03', 2, 9, 8),
  ('2023-05-19', 5, 9, 16),
  ('2023-05-15', 8, 9, 20),

  -- 10
  ('2023-12-15', 4, 10, 14),
  ('2023-12-15', 4, 10, 24),
  ('2023-12-17', 10, 10, 22);

INSERT INTO enrolled_to
  (registrationID, discipline_name_ref, category_ref)
VALUES
  -- 1
  (1, '100m Sprint', 'women'),
  (1, '100m Sprint', 'relay_mix'),
  (2, '100m Sprint', 'men'),
  (2, '100m Sprint', 'relay_mix'),
  (3, '100m Sprint', 'women'),
  (3, '100m Sprint', 'relay_mix'),
  (4, '100m Sprint', 'men'),
  (4, '100m Sprint', 'relay_mix'),
  (5, '100m Sprint', 'women'),
  (5, '100m Sprint', 'relay_mix'),
  (6, '100m Sprint', 'men'),
  (6, '100m Sprint', 'relay_mix'),
  (7, '100m Sprint', 'women'),
  (7, '100m Sprint', 'relay_mix'),
  (8, '100m Sprint', 'men'),
  (8, '100m Sprint', 'relay_mix'),
  (9, '100m Sprint', 'women'),
  (9, '100m Sprint', 'relay_mix'),
  (10, '100m Sprint', 'men'),
  (10, '100m Sprint', 'relay_mix'),
  (11, '100m Sprint', 'relay_mix'),
  (12, '100m Sprint', 'men'),
  (12, '100m Sprint', 'relay_mix'),
  (13, '100m Sprint', 'men'),
  (14, '100m Sprint', 'men'),
  (15, '100m Sprint', 'men'),
  (15, 'Hammer Throw', 'men'),
  (16, 'Hammer Throw', 'men'),
  (17, 'Hammer Throw', 'men'),
  (18, 'Hammer Throw', 'men'),

  -- 2
  (19, 'Shot Put', 'women'),
  (20, 'Shot Put', 'women'),
  (21, 'Shot Put', 'women'),

  -- 3
  (22, '400m Run', 'relay_women'),
  (23, '400m Run', 'relay_women'),
  (24, '400m Run', 'relay_women'),
  (25, '400m Run', 'relay_women'),
  (26, '400m Run', 'relay_women'),
  (27, '400m Run', 'relay_women'),
  (28, '400m Run', 'relay_women'),
  (29, '400m Run', 'relay_women'),
  (30, '400m Run', 'relay_women'),
  (31, '400m Run', 'relay_women'),
  (32, '400m Run', 'relay_women'),
  (33, '400m Run', 'relay_women'),

  -- 4
  (34, 'Pole Vault', 'women'),
  (35, 'Pole Vault', 'men'),
  (36, 'Pole Vault', 'women'),
  (37, 'Pole Vault', 'men'),
  (38, 'Pole Vault', 'women'),
  (39, 'Pole Vault', 'men'),
  (40, 'Pole Vault', 'men'),
  (41, 'Pole Vault', 'women'),
  (42, 'Pole Vault', 'men'),

  -- 5
  (43, '800m Run', 'men'),
  (43, '1500m Run', 'men'),
  (44, '1500m Run', 'women'),
  (45, '1500m Run', 'women'),
  (46, '800m Run', 'men'),
  (46, '1500m Run', 'men'),
  (47, '1500m Run', 'women'),
  (48, '1500m Run', 'women'),
  (49, '1500m Run', 'women'),
  (50, '800m Run', 'men'),
  (50, '1500m Run', 'men'),
  (51, '1500m Run', 'men'),
  (52, '800m Run', 'men'),
  (52, '1500m Run', 'men'),
  (53, '1500m Run', 'women'),
  (54, '1500m Run', 'men'),
  (55, '1500m Run', 'men'),

  -- 6
  (56, 'High Jump', 'women'),
  (56, 'Long Jump', 'women'),
  (57, 'Long Jump', 'women'),
  (58, 'High Jump', 'women'),
  (58, 'Long Jump', 'women'),
  (59, 'High Jump', 'women'),
  (59, 'Long Jump', 'women'),

  --7
  (60, 'Triple Jump', 'men'),
  (61, 'Triple Jump', 'men'),
  (62, 'Triple Jump', 'men'),
  (63, 'Triple Jump', 'men'),
  (64, 'Triple Jump', 'men'),

  -- 8 
  (65, '100m Hurdles', 'women'),
  (66, '100m Hurdles', 'women'),
  (67, '100m Hurdles', 'women'),
  (68, '100m Hurdles', 'women'),
  (69, '100m Hurdles', 'women'),

  -- 9
  (70, 'Javelin Throw', 'men'),
  (71, 'Javelin Throw', 'men'),
  (72, 'Javelin Throw', 'men'),
  (73, 'Javelin Throw', 'men'),

  -- 10
  (74, 'Discus Throw', 'men'),
  (75, 'Discus Throw', 'women'),
  (76, 'Discus Throw', 'men');


INSERT INTO participate_in
  (athlete_start_number, eventID)
VALUES
  -- 1
  (2, 1),
  (4, 1),
  (6, 1),
  (8, 1),
  (10, 1),

  (12, 2),
  (14, 2),
  (16, 2),
  (17, 2),

  (2, 3),
  (4, 3),
  (6, 3),
  (8, 3),
  (12, 3),
  (14, 3),
  (16, 3),
  (17, 3),

  (1, 4),
  (3, 4),
  (5, 4),
  (7, 4),
  (9, 4),

  (1, 5),
  (2, 5),
  (3, 5),
  (4, 5),
  (5, 5),
  (6, 5),
  (7, 5),
  (8, 5),
  (9, 5),
  (10, 5),
  (11, 5),
  (12, 5),

  (17, 6),
  (20, 6),
  (21, 6),
  (22, 6),

  -- 2
  (3, 7),
  (17, 7),
  (19, 7),

  -- 3
  (1, 8),
  (3, 8),
  (5, 8),
  (7, 8),
  (9, 8),
  (11, 8),
  (13, 8),
  (15, 8),
  (17, 8),
  (19, 8),
  (23, 8),
  (24, 8),

  -- 4
  (2, 9),
  (8, 9),
  (10, 9),
  (18, 9),
  (21, 9),

  (1, 10),
  (7, 10),
  (9, 10),
  (19, 10),

  -- 5
  (8, 11),
  (10, 11),
  (14, 11),
  (18, 11),

  (8, 12),
  (10, 12),
  (14, 12),
  (16, 12),
  (18, 12),
  (20, 12),
  (22, 12),

  (13, 13),
  (9, 13),
  (11, 13),
  (23, 13),
  (24, 13),
  (19, 13),

  -- 6
  (3, 14),
  (13, 14),
  (15, 14),

  (3, 15),
  (11, 15),
  (13, 15),
  (15, 15),

  -- 7
  (12, 16),
  (16, 16),
  (19, 16),
  (21, 16),
  (22, 16),

  --8
  (3, 17),
  (9, 17),
  (17, 17),
  (23, 17),
  (24, 17),

  -- 9
  (2, 18),
  (8, 18),
  (16, 18),
  (20, 18);


INSERT INTO scored_by
  (athlete_start_number, resultID)
VALUES
  -- 1
  (2, 1),
  (4, 2),
  (6, 3),
  (8, 4),
  (10, 5),

  (12, 6),
  (14, 7),
  (16, 8),
  (17, 9),

  (2, 10),
  (4, 12),
  (6, 14),
  (8, 15),
  (12, 11),
  (14, 13),
  (16, 16),
  (17, 17),

  (1, 18),
  (3, 19),
  (5, 20),
  (7, 21),
  (9, 22),

  (1, 23),
  (2, 23),
  (3, 23),
  (4, 23),
  (5, 25),
  (6, 25),
  (7, 25),
  (8, 25),
  (9, 24),
  (10, 24),
  (11, 24),
  (12, 24),

  (17, 26),
  (20, 27),
  (21, 28),
  (22, 29),

  -- 2
  (17, 30),
  (3, 31),
  (19, 32),

  -- 3
  (1, 35),
  (3, 35),
  (5, 35),
  (7, 35),
  (9, 33),
  (11, 33),
  (13, 33),
  (15, 33),
  (17, 34),
  (19, 34),
  (23, 34),
  (24, 34),

  -- 4
  (2, 36),
  (8, 39),
  (10, 37),
  (18, 38),
  (21, 40),

  (1, 44),
  (7, 43),
  (9, 42),
  (19, 41),

  -- 5
  (8, 48),
  (10, 45),
  (14, 46),
  (18, 47),

  (8, 55),
  (10, 50),
  (14, 49),
  (16, 51),
  (18, 53),
  (20, 52),
  (22, 54),

  (13, 56),
  (9, 57),
  (11, 58),
  (23, 59),
  (24, 60),
  (19, 61),

  -- 6
  (3, 64),
  (13, 62),
  (15, 63),

  (3, 65),
  (11, 66),
  (13, 67),
  (15, 68),

  -- 7 
  (12, 69),
  (16, 70),
  (19, 71),
  (21, 72),
  (22, 73),
  -- 8
  (3, 75),
  (9, 74),
  (17, 77),
  (23, 76),
  (24, 78),

  -- 9 
  (2, 82),
  (8, 79),
  (16, 80),
  (20, 81);


INSERT INTO has_scored
  (athlete_start_number, scored_placeID)
VALUES
  -- 1
  (2, 1),
  (4, 2),
  (6, 3),
  (8, 4),

  (12, 5),
  (14, 6),
  (16, 7),
  (17, 8),

  (2, 9),
  (4, 11),
  (6, 13),
  (8, 14),
  (12, 10),
  (14, 12),
  (16, 15),
  (17, 16),

  (1, 17),
  (3, 18),
  (5, 19),
  (7, 20),
  (9, 21),

  (1, 22),
  (2, 22),
  (3, 22),
  (4, 22),
  (9, 23),
  (10, 23),
  (11, 23),
  (12, 23),

  (17, 24),
  (20, 25),
  (21, 26),
  (22, 27),

  -- 2
  (17, 28),
  (3, 29),
  (19, 30),

  -- 3
  (9, 31),
  (11, 31),
  (13, 31),
  (15, 31),
  (17, 32),
  (19, 32),
  (23, 32),
  (24, 32),

  -- 4 
  (2, 33),
  (10, 34),
  (18, 35),

  (1, 39),
  (7, 38),
  (9, 37),
  (19, 36),

  -- 5
  (8, 43),
  (10, 40),
  (14, 41),
  (18, 42),

  (8, 50),
  (10, 45),
  (14, 44),
  (16, 46),
  (18, 48),
  (20, 47),
  (22, 49),

  (13, 51),
  (9, 52),
  (11, 53),
  (23, 54),
  (24, 55),
  (19, 56),

  -- 6 
  (3, 59),
  (13, 57),
  (15, 58),

  (3, 60),
  (11, 61),
  (13, 62),
  (15, 63),
  -- 7
  (12, 64),
  (16, 65),
  (19, 66),
  (21, 67),
  (22, 68),

  -- 8
  (3, 70),
  (9, 69),
  (17, 72),
  (23, 71),
  (24, 73),

  -- 9 
  (2, 77),
  (8, 74),
  (16, 75),
  (20, 76);

INSERT INTO allows_for
  (competitionID, discipline_name_ref, category_ref)
VALUES
  (1, '100m Sprint', 'men'),
  (1, '100m Sprint', 'women'),
  (1, '100m Sprint', 'relay_mix'),
  (1, 'Hammer Throw', 'men'),
  (2, 'Shot Put', 'women'),
  (3, '400m Run', 'relay_women'),
  (4, 'Pole Vault', 'men'),
  (4, 'Pole Vault', 'women'),
  (5, '800m Run', 'men'),
  (5, '1500m Run', 'men'),
  (5, '1500m Run', 'women'),
  (6, 'High Jump', 'women'),
  (6, 'Long Jump', 'women'),
  (7, 'Triple Jump', 'men'),
  (8, '100m Hurdles', 'women'),
  (9, 'Javelin Throw', 'men'),
  (10, 'Discus Throw', 'men'),
  (10, 'Discus Throw', 'women');

      

