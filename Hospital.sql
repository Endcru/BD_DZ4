CREATE TABLE `Room` (
  `RoomNr` integer,
  `StatNr` integer,
  `Beds` integer,
  PRIMARY KEY (`RoomNr`, `StatNr`)
);

CREATE TABLE `Patient` (
  `PatientNr` integer PRIMARY KEY,
  `Name` varchar(255),
  `Disease` varchar(255),
  `RoomNr` integer,
  `from` varchar(255),
  `to` varchar(255)
);

CREATE TABLE `Doctor` (
  `PersNr` integer PRIMARY KEY,
  `Name` char,
  `StatNr` integer,
  `Area` varchar(255),
  `Rang` varchar(255)
);

CREATE TABLE `Caregivers` (
  `PersNr` integer PRIMARY KEY,
  `Name` varchar(255),
  `StatNr` integer,
  `Qualification` varchar(255)
);

CREATE TABLE `Station` (
  `StatNr` integer PRIMARY KEY,
  `Name` varchar(255)
);

ALTER TABLE `Caregivers` ADD FOREIGN KEY (`PersNr`) REFERENCES `Station` (`StatNr`);

ALTER TABLE `Doctor` ADD FOREIGN KEY (`PersNr`) REFERENCES `Station` (`StatNr`);

ALTER TABLE `Patient` ADD FOREIGN KEY (`PatientNr`) REFERENCES `Doctor` (`PersNr`);

ALTER TABLE `Patient` ADD FOREIGN KEY (`PatientNr`) REFERENCES `Room` (`RoomNr`);

ALTER TABLE `Room` ADD FOREIGN KEY (`RoomNr`) REFERENCES `Patient` (`RoomNr`);

ALTER TABLE `Room` ADD FOREIGN KEY (`RoomNr`) REFERENCES `Station` (`StatNr`);
