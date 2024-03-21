/* Table Stops */
DROP TABLE IF EXISTS Stops;
CREATE TABLE Stops (
    ID_Stop INT NOT NULL, 
    stop_name VARCHAR(200), 
    PRIMARY KEY (ID_Stop)
);

/* Table Ligne */
DROP TABLE IF EXISTS Ligne;
CREATE TABLE Ligne (
    ID_Ligne INT NOT NULL, 
    ligne_name VARCHAR(64), 
    PRIMARY KEY (ID_Ligne)
);

/* Table Direction */
DROP TABLE IF EXISTS Direction;
CREATE TABLE Direction (
    ID_direction INT NOT NULL, 
    direction_name VARCHAR(64), 
    PRIMARY KEY (ID_direction)
);

/* Table Schedules */
DROP TABLE IF EXISTS Schedules;
CREATE TABLE Schedules (
    ID_Schedule INT NOT NULL, 
    hour_Schedules TIME, 
    PRIMARY KEY (ID_Schedule)
);

/* Join Table Stops_Direction */
DROP TABLE IF EXISTS Stops_Direction;
CREATE TABLE Stops_Direction (
    ID_Stop INT NOT NULL,
    ID_direction INT NOT NULL,
    order_in_direction INT NOT NULL,
    PRIMARY KEY (ID_Stop, ID_direction)
);

/* Join Table Ligne_Stop */
DROP TABLE IF EXISTS Ligne_Stop; 
CREATE TABLE Ligne_Stop (
    ID_Ligne INT NOT NULL, 
    ID_Stop INT NOT NULL, 
    PRIMARY KEY (ID_Ligne, ID_Stop)
);

/* Join Table Ligne_direction */
DROP TABLE IF EXISTS Ligne_direction; 
CREATE TABLE Ligne_direction (
    ID_direction INT NOT NULL, 
    ID_Ligne INT NOT NULL, 
    PRIMARY KEY (ID_direction,  ID_Ligne)
);

/* Join Table Stops_Schedules*/
DROP TABLE IF EXISTS Stops_Schedules; 
CREATE TABLE Stops_Schedules (
    ID_Stop INT NOT NULL, 
    ID_Schedule INT NOT NULL, 
    PRIMARY KEY (ID_Stop,  ID_Schedule)
);

/* For exercice 3 : Table for temporary bus stop redirections*/
DROP TABLE IF EXISTS Temporary_redirections;
CREATE TABLE Temporary_redirections (
    ID_Redirection INT NOT NULL AUTO_INCREMENT, 
    ID_Stop_Non_Desservi INT NOT NULL, 
    ID_Stop_Redirection INT NOT NULL, 
    PRIMARY KEY (ID_Redirection)
);

/* Add all foreign key to all concerned tables */
ALTER TABLE Ligne_Stop ADD CONSTRAINT FK_Ligne_Stop_ID_Ligne FOREIGN KEY (ID_Ligne) REFERENCES Ligne (ID_Ligne);
ALTER TABLE Ligne_Stop ADD CONSTRAINT FK_Ligne_Stop_ID_Stop FOREIGN KEY (ID_Stop) REFERENCES Stops (ID_Stop);
ALTER TABLE Ligne_direction ADD CONSTRAINT FK_Ligne_direction_ID_direction FOREIGN KEY (ID_direction) REFERENCES Direction (ID_direction);
ALTER TABLE Ligne_direction ADD CONSTRAINT FK_Ligne_direction_ID_Ligne FOREIGN KEY (ID_Ligne) REFERENCES Ligne (ID_Ligne);
ALTER TABLE Stops_Direction ADD CONSTRAINT FK_Stops_Direction_ID_Stop FOREIGN KEY (ID_Stop) REFERENCES Stops (ID_Stop);
ALTER TABLE Stops_Direction ADD CONSTRAINT FK_Stops_Direction_ID_direction FOREIGN KEY (ID_direction) REFERENCES Direction (ID_direction);
ALTER TABLE Stops_Schedules ADD CONSTRAINT FK_Stops_Schedules_ID_Stop FOREIGN KEY (ID_Stop) REFERENCES Stops (ID_Stop);
ALTER TABLE Stops_Schedules ADD CONSTRAINT FK_Stops_Schedules_ID_Schedule FOREIGN KEY (ID_Schedule) REFERENCES Schedules (ID_Schedule);
ALTER TABLE Temporary_redirections ADD CONSTRAINT FK_Temporary_redirections_ID_Stop_Non_Desservi FOREIGN KEY (ID_Stop_Non_Desservi) REFERENCES Stops (ID_Stop);
ALTER TABLE Temporary_redirections ADD CONSTRAINT FK_Temporary_redirections_ID_Stop_Redirection FOREIGN KEY (ID_Stop_Redirection) REFERENCES Stops (ID_Stop);


/* For exercice 10 : Stored procedure for insert schedules, minute by minute, in a schedule table */
DELIMITER //

CREATE PROCEDURE insert_schedule(
    IN time_start TIME,
    IN time_end TIME,
    IN step_time TIME
)
BEGIN
    DECLARE current_time_value TIME;
    
    SET current_time_value = time_start;
    
    WHILE current_time_value <= time_end DO
        INSERT INTO schedule (Schedules) VALUES (current_time_value);
        SET current_time_value = ADDTIME(current_time_value, step_time);
    END WHILE;
    
END//

DELIMITER ;
