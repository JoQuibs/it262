/*
  SurveySez-02072023.sql - updated 02/07/2023
  
  Here are a few notes on things below that may not be self evident:
  
  INDEXES: You'll see indexes below for example:
  
  INDEX SurveyID_index(SurveyID)
  
  Any field that has highly unique data that is either searched on or used as a join should be indexed, which speeds up a  
  search on a tall table, but potentially slows down an add or delete
  
  TIMESTAMP: MySQL currently only supports one date field per table to be automatically updated with the current time.  We'll use a 
  field in a few of the tables named LastUpdated:
  
  LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP
  
  The other date oriented field we are interested in, DateAdded we'll do by hand on insert with the MySQL function NOW().
  
  CASCADES: In order to avoid orphaned records in deletion of a Survey, we'll want to get rid of the associated Q & A, etc. 
  We therefore want a 'cascading delete' in which the deletion of a Survey activates a 'cascade' of deletions in an 
  associated table.  Here's what the syntax looks like:  
  
  FOREIGN KEY (SurveyID) REFERENCES winter2023_surveys(SurveyID) ON DELETE CASCADE
  
  The above is from the Questions table, which stores a foreign key, SurveyID in it.  This line of code tags the foreign key to 
  identify which associated records to delete.
  
  Be sure to check your cascades by deleting a survey and watch all the related table data disappear!
  
  
*/


SET foreign_key_checks = 0; #turn off constraints temporarily

#since constraints cause problems, drop tables first, working backward
DROP TABLE IF EXISTS winter2023_answers;
DROP TABLE IF EXISTS winter2023_questions;
DROP TABLE IF EXISTS winter2023_surveys;
  
#all tables must be of type InnoDB to do transactions, foreign key constraints
CREATE TABLE winter2023_surveys(
SurveyID INT UNSIGNED NOT NULL AUTO_INCREMENT,
AdminID INT UNSIGNED DEFAULT 0,
Title VARCHAR(255) DEFAULT '',
Description TEXT DEFAULT '',
DateAdded DATETIME,
LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (SurveyID)
)ENGINE=INNODB; 

#assigning first survey to AdminID == 1
INSERT INTO winter2023_surveys VALUES (NULL,1,'Our First Survey','Description of Survey',NOW(),NOW()); 

#foreign key field must match size and type, hence SurveyID is INT UNSIGNED
CREATE TABLE winter2023_questions(
QuestionID INT UNSIGNED NOT NULL AUTO_INCREMENT,
SurveyID INT UNSIGNED DEFAULT 0,
Question TEXT DEFAULT '',
Description TEXT DEFAULT '',
DateAdded DATETIME,
LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (QuestionID),
INDEX SurveyID_index(SurveyID),
FOREIGN KEY (SurveyID) REFERENCES winter2023_surveys(SurveyID) ON DELETE CASCADE
)ENGINE=INNODB;

INSERT INTO winter2023_questions VALUES (NULL,1,'Do You Like Our Website?','We really want to know!',NOW(),NOW());
INSERT INTO winter2023_questions VALUES (NULL,1,'Do You Like Cookies?','We like cookies!',NOW(),NOW());
INSERT INTO winter2023_questions VALUES (NULL,1,'Favorite Toppings?','We like chocolate!',NOW(),NOW());


#foreign key field must match size and type, hence QuestionID is INT UNSIGNED
CREATE TABLE winter2023_answers(
AnswerID INT UNSIGNED NOT NULL AUTO_INCREMENT,
QuestionID INT UNSIGNED DEFAULT 0,
Answer TEXT DEFAULT '',
Description TEXT DEFAULT '',
DateAdded DATETIME,
LastUpdated TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AnswerID),
INDEX QuestionID_index(QuestionID),
FOREIGN KEY (QuestionID) REFERENCES winter2023_questions(QuestionID) ON DELETE CASCADE
)ENGINE=INNODB;

#answers for question 1
INSERT INTO winter2023_answers VALUES (NULL,1,'Yes','',NOW(),NOW());
INSERT INTO winter2023_answers VALUES (NULL,1,'No','',NOW(),NOW());

#answers for question 2
INSERT INTO winter2023_answers VALUES  (NULL,2,'Yes','',NOW(),NOW());
INSERT INTO winter2023_answers VALUES (NULL,2,'No','',NOW(),NOW());
INSERT INTO winter2023_answers VALUES (NULL,2,'Maybe','',NOW(),NOW());

#answers for question 3
INSERT INTO winter2023_answers VALUES (NULL,3,'Chocolate','',NOW(),NOW());
INSERT INTO winter2023_answers VALUES (NULL,3,'Whipped Cream','',NOW(),NOW());
INSERT INTO winter2023_answers VALUES (NULL,3,'Sprinkles','',NOW(),NOW());

/*
Add additional tables here


*/
SET foreign_key_checks = 1; #turn foreign key check back on