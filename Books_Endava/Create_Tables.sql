CREATE TABLE Authors(

authorID int IDENTITY(100,1) NOT NULL PRIMARY KEY,
authorName varchar(50) NOT NULL,
nationality varchar(50),
dateOfBirth date,
createdDate datetime NOT NULL DEFAULT GETDATE(),
modifiedDate datetime NOT NULL,
createdBy varchar(50) NOT NULL DEFAULT SYSTEM_USER

)

CREATE TABLE Faculties(

facultyID int IDENTITY(200,1) NOT NULL PRIMARY KEY,
facultyName varchar(50) NOT NULL,
numberOfSubjects int,
yearEstablished int,
createdDate datetime NOT NULL DEFAULT GETDATE(),
modifiedDate datetime NOT NULL,
createdBy varchar(50) NOT NULL DEFAULT SYSTEM_USER

)

CREATE TABLE Books(

bookID int IDENTITY(300,1) NOT NULL PRIMARY KEY,
authorID int NOT NULL,
bookName varchar(50) NOT NULL,
genre varchar(50),
numberOfPages int,
createdDate datetime DEFAULT GETDATE(),
modifiedDate datetime,
createdBy varchar(50) DEFAULT SYSTEM_USER
FOREIGN KEY (authorID) REFERENCES Authors(authorID)

)

CREATE TABLE Students(

studentID int IDENTITY(400,1) NOT NULL PRIMARY KEY,
facultyID int NOT NULL,
studentName varchar(50) NOT NULL,
age int,
createdDate datetime NOT NULL DEFAULT GETDATE(),
modifiedDate datetime NOT NULL,
createdBy varchar(50) NOT NULL DEFAULT SYSTEM_USER
FOREIGN KEY (facultyID) REFERENCES Faculties(facultyID)

)

CREATE TABLE Borrows(

borrowID int IDENTITY(500,1) NOT NULL PRIMARY KEY,
bookID int NOT NULL,
studentID int NOT NULL,
dateTaken date NOT NULL,
dateReturned date,
createdDate datetime NOT NULL DEFAULT GETDATE(),
modifiedDate datetime NOT NULL,
createdBy varchar(50) NOT NULL DEFAULT SYSTEM_USER
FOREIGN KEY (bookID) REFERENCES Books(bookID),
FOREIGN KEY (studentID) REFERENCES Students(studentID)
)
