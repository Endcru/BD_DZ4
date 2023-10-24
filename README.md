# BD_DZ4

zd 1

Library

Table category {
  CategoryName varchar [primary key]
}

Table bookCat { 
  ISBN integer [primary key]
  CategoryName varchar [primary key]
}

Table book {
  ISBN integer [primary key]
  Title varchar
  Author varchar
  PagesNum integer
  PubYear integer
}

Table publisher {
  PubName varchar [primary key]
  PubKind varchar
} 

Table reader {
  reader_id integer [primary key]
  LastName varchar
  FirstName varchar
  Address varchar
  BirthDate data
}


Table borrowing {
  borrowing_id integer [primary key]
  ReaderNr integer
  ISBN integer
  CopyNumber integer
  ReturnDate data
}


Table copy {
  ISBN varchar [primary key]
  CopyNumber integer [primary key]
  Shelf integer
  Position integer
}




Ref: reader.reader_id - borrowing.ReaderNr
Ref: reader.reader_id < borrowing.borrowing_id
Ref: copy.CopyNumber - borrowing.CopyNumber
Ref: copy.ISBN - borrowing.ISBN
Ref: copy.ISBN - book.ISBN
Ref: bookCat.CategoryName > book.ISBN
Ref: bookCat.ISBN < category.CategoryName
Ref: bookCat.ISBN - book.ISBN
Ref: copy.CopyNumber > book.ISBN
Ref: publisher.PubName < book.ISBN



Trains


Table city {
  Name varchar [primary key]
  Region varchar
}

Table station { 
  Name varchar  [primary key]
  Tracks varchar
  CityName varchar
  Region varchar
}

Table connection { 
TrainNr integer  [primary key]
FromStation varchar
ToStation varchar
Departure data
Arrival data
}

Table train { 
  TrainNr integer  [primary key]
  Length integer
  StartStationName varchar
  EndStationName varchar
}



Ref: city.Name < station.Name
Ref: city.Name - station.CityName
Ref: station.Name - connection.FromStation
Ref: station.Name - connection.ToStation
Ref: station.Name < connection.TrainNr
Ref: train.StartStationName - connection.FromStation
Ref: train.EndStationName - connection.ToStation
Ref: train.TrainNr - connection.TrainNr


Hospital

Table Room {
  RoomNr integer [primary key]
  StatNr integer [primary key]
  Beds integer
}

Table Patient {
  PatientNr integer [primary key]
  Name varchar
  Disease varchar
  RoomNr integer
  from varchar
  to varchar
}


Table Doctor {
  PersNr integer [primary key]
  Name char
  StatNr integer
  Area varchar
  Rang varchar
}


Table Caregivers {
  PersNr integer [primary key]
  Name varchar
  StatNr integer
  Qualification varchar
}

Table Station { 
  StatNr integer [primary key]
  Name varchar
}




Ref: Caregivers.PersNr > Station.StatNr
Ref: Doctor.PersNr > Station.StatNr
Ref: Doctor.PersNr < Patient.PatientNr
Ref: Patient.PatientNr > Room.RoomNr
Ref: Patient.RoomNr - Room.RoomNr
Ref: Station.StatNr < Room.RoomNr

