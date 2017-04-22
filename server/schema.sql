/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/
DROP DATABASE IF EXISTS `chat`;

CREATE DATABASE chat;

USE chat;

DROP TABLE IF EXISTS ` users`;

CREATE TABLE `users` (
  `ID` int AUTO_INCREMENT NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `ID` int AUTO_INCREMENT NOT NULL,
  `message` varchar(255) NOT NULL,
  `userID` int,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`userID`) REFERENCES users(ID)
);


DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `ID` int AUTO_INCREMENT NOT NULL,
  `roomname` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
);


DROP TABLE IF EXISTS `usersRooms`;

CREATE TABLE `usersRooms` (
  `ID` int AUTO_INCREMENT NOT NULL,
  `userID` int,
  `roomID` int,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (userID) REFERENCES users(ID),
  FOREIGN KEY (roomID) REFERENCES rooms(ID)
);


DROP TABLE IF EXISTS `messagesRooms`;

CREATE TABLE `messagesRooms` (
  `ID` int AUTO_INCREMENT NOT NULL,
  `messageID` int,
  `roomID` int,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (messageID) REFERENCES messages(ID),
  FOREIGN KEY (roomID) REFERENCES rooms(ID)
);
