CREATE DATABASE library;

\c library;

CREATE TABLE `category` (
  `CategoryName` varchar(255) PRIMARY KEY
);

CREATE TABLE `bookCat` (
  `ISBN` integer,
  `CategoryName` varchar(255),
  PRIMARY KEY (`ISBN`, `CategoryName`)
);

CREATE TABLE `book` (
  `ISBN` integer PRIMARY KEY,
  `Title` varchar(255),
  `Author` varchar(255),
  `PagesNum` integer,
  `PubYear` integer
);

CREATE TABLE `publisher` (
  `PubName` varchar(255) PRIMARY KEY,
  `PubKind` varchar(255)
);

CREATE TABLE `reader` (
  `reader_id` integer PRIMARY KEY,
  `LastName` varchar(255),
  `FirstName` varchar(255),
  `Address` varchar(255),
  `BirthDate` data
);

CREATE TABLE `borrowing` (
  `borrowing_id` integer PRIMARY KEY,
  `ReaderNr` integer,
  `ISBN` integer,
  `CopyNumber` integer,
  `ReturnDate` data
);

CREATE TABLE `copy` (
  `ISBN` varchar(255),
  `CopyNumber` integer,
  `Shelf` integer,
  `Position` integer,
  PRIMARY KEY (`ISBN`, `CopyNumber`)
);

ALTER TABLE `borrowing` ADD FOREIGN KEY (`ReaderNr`) REFERENCES `reader` (`reader_id`);

ALTER TABLE `borrowing` ADD FOREIGN KEY (`borrowing_id`) REFERENCES `reader` (`reader_id`);

ALTER TABLE `borrowing` ADD FOREIGN KEY (`CopyNumber`) REFERENCES `copy` (`CopyNumber`);

ALTER TABLE `borrowing` ADD FOREIGN KEY (`ISBN`) REFERENCES `copy` (`ISBN`);

ALTER TABLE `book` ADD FOREIGN KEY (`ISBN`) REFERENCES `copy` (`ISBN`);

ALTER TABLE `bookCat` ADD FOREIGN KEY (`CategoryName`) REFERENCES `book` (`ISBN`);

ALTER TABLE `category` ADD FOREIGN KEY (`CategoryName`) REFERENCES `bookCat` (`ISBN`);

ALTER TABLE `book` ADD FOREIGN KEY (`ISBN`) REFERENCES `bookCat` (`ISBN`);

ALTER TABLE `copy` ADD FOREIGN KEY (`CopyNumber`) REFERENCES `book` (`ISBN`);

ALTER TABLE `book` ADD FOREIGN KEY (`ISBN`) REFERENCES `publisher` (`PubName`);
