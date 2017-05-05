# create DATABASE athletic;
# USE athletic;
DROP TABLE IF EXISTS EventPlanLine;
DROP TABLE IF EXISTS EventPlan;
DROP TABLE IF EXISTS EventRequest;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Facility;
DROP TABLE IF EXISTS Resource;
CREATE TABLE Customer (
  custno VARCHAR(255) NOT NULL,
  custname VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  internal CHAR(1) NOT NULL,
  contact VARCHAR(255) NOT NULL,
  phone VARCHAR(100) NOT NULL,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(2) NOT NULL,
  zip VARCHAR(5) NOT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY (custno)
);
CREATE TABLE Employee (
  empno VARCHAR(255) NOT NULL,
  empname VARCHAR(255) NOT NULL,
  department VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  CONSTRAINT PK_Employee PRIMARY KEY (empno)
);
CREATE TABLE Facility (
  facno VARCHAR(255) NOT NULL,
  facname VARCHAR(255) NOT NULL,
  CONSTRAINT PK_Facility PRIMARY KEY (facno),
  CONSTRAINT Unique_Facname UNIQUE (facname)
);
CREATE TABLE Location (
  locno VARCHAR(255) NOT NULL,
  facno VARCHAR(255) NOT NULL,
  locname VARCHAR(255) NOT NULL,
  CONSTRAINT PK_Location PRIMARY KEY (locno),
  CONSTRAINT FK_Facility FOREIGN KEY (facno) REFERENCES Facility (facno)
);
CREATE TABLE Resource (
  resno VARCHAR(255) NOT NULL,
  resval VARCHAR(255) NOT NULL,
  rate FLOAT NOT NULL,
  CONSTRAINT PK_Resource PRIMARY KEY (resno)
);
CREATE TABLE EventRequest (
  eventno VARCHAR(255) NOT NULL ,
  dateheld DATE NOT NULL,
  datereq DATE NOT NULL,
  facno VARCHAR(255) NOT NULL,
  custno VARCHAR(255) NOT NULL,
  dateauth DATE,
  status VARCHAR(10) NOT NULL,
  estcost FLOAT NOT NULL,
  estaudience INTEGER NOT NULL,
  budno VARCHAR(20),
  CONSTRAINT PK_EventRequest PRIMARY KEY (eventno),
  CONSTRAINT FK_Faculty FOREIGN KEY (facno) REFERENCES Facility (facno),
  CONSTRAINT FK_Customer FOREIGN KEY (custno) REFERENCES Customer (custno)
);
CREATE TABLE EventPlan (
  planno VARCHAR(255) NOT NULL,
  eventno VARCHAR(255) NOT NULL,
  workdate DATE NOT NULL,
  notes VARCHAR(255),
  activity VARCHAR(30) NOT NULL,
  empno VARCHAR(255),
  CONSTRAINT PK_EventPlan PRIMARY KEY (planno),
  CONSTRAINT FK_EventRequest FOREIGN KEY (eventno) REFERENCES EventRequest (eventno),
  CONSTRAINT FK_Employee FOREIGN KEY (empno) REFERENCES Employee (empno)
);
CREATE TABLE EventPlanLine (
  planno VARCHAR(255) NOT NULL,
  lineno INTEGER NOT NULL,
  timestart DATETIME NOT NULL,
  numberfld INTEGER NOT NULL ,
  locno VARCHAR(255) NOT NULL,
  resno VARCHAR(255) NOT NULL,
  CONSTRAINT FK_EventPlan FOREIGN KEY (planno) REFERENCES EventPlan (planno),
  CONSTRAINT FK_Location FOREIGN KEY (locno) REFERENCES Location (locno),
  CONSTRAINT FK_fResource FOREIGN KEY (resno) REFERENCES Resource(resno)
);
