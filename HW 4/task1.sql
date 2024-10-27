-- IN1013 - HW 4: Task 1 (DEFINTION PART)

-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

-- DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender VARCHAR(1),
  birth DATE,
  death DATE,
  CHECK (Gender IN ('M', 'F'))
);

CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  FOREIGN KEY (petName) REFERENCES petPet(petName),
  PRIMARY KEY (petname, eventdate, eventtype)
);