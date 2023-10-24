CREATE DATABASE trains;

\c trains;


CREATE TABLE `city` (
  `Name` varchar(255) PRIMARY KEY,
  `Region` varchar(255)
);

CREATE TABLE `station` (
  `Name` varchar(255) PRIMARY KEY,
  `Tracks` varchar(255),
  `CityName` varchar(255),
  `Region` varchar(255)
);

CREATE TABLE `connection` (
  `TrainNr` integer PRIMARY KEY,
  `FromStation` varchar(255),
  `ToStation` varchar(255),
  `Departure` data,
  `Arrival` data
);

CREATE TABLE `train` (
  `TrainNr` integer PRIMARY KEY,
  `Length` integer,
  `StartStationName` varchar(255),
  `EndStationName` varchar(255)
);

ALTER TABLE `station` ADD FOREIGN KEY (`Name`) REFERENCES `city` (`Name`);

ALTER TABLE `station` ADD FOREIGN KEY (`CityName`) REFERENCES `city` (`Name`);

ALTER TABLE `connection` ADD FOREIGN KEY (`FromStation`) REFERENCES `station` (`Name`);

ALTER TABLE `connection` ADD FOREIGN KEY (`ToStation`) REFERENCES `station` (`Name`);

ALTER TABLE `connection` ADD FOREIGN KEY (`TrainNr`) REFERENCES `station` (`Name`);

ALTER TABLE `connection` ADD FOREIGN KEY (`FromStation`) REFERENCES `train` (`StartStationName`);

ALTER TABLE `connection` ADD FOREIGN KEY (`ToStation`) REFERENCES `train` (`EndStationName`);

ALTER TABLE `connection` ADD FOREIGN KEY (`TrainNr`) REFERENCES `train` (`TrainNr`);
