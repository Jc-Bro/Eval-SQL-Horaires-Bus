/*Deletes data inserted in tables when script is launched*/
DELETE FROM Stops;
DELETE FROM Schedules;
DELETE FROM Ligne;
DELETE FROM Direction;
DELETE FROM Stops_Schedules;
DELETE FROM Ligne_direction;
DELETE FROM Ligne_Stop;
DELETE FROM Stops_Direction;

/* Bus stops */
INSERT INTO Stops (ID_Stop, Stop_name) VALUES (1, 'P+R Ouest'), (2, 'Fourchène1'), (3, 'Madeleine'), (4, 'République'), (5, 'Pibs2'), (6, 'Petit Tohannic'), (7, 'Delestraint'), (8, 'Kersec');

/* Bus schedules */
INSERT INTO Schedules (ID_Schedule, hour_Schedules) VALUES 
(1, '6:32:00'), (2, '6:42:00'), (3, '6:52:00'), (4, '7:00:00'), (5, '7:10:00'), (6, '6:34:00'), (7, '6:44:00'), (8, '6:54:00'), (9, '7:02:00'), (10, '7:12:00'), 
(11, '6:37:00'), (12, '6:47:00'), (13, '6:57:00'), (14, '7:06:00'), (15, '7:16:00'), (16, '7:22:00'), (17, '7:07:00'), (18, '7:17:00'), (19, '6:46:00'), (20, '6:56:00'), 
(21, '7:27:00'), (22, '6:50:00'), (23, '7:11:00'), (24, '7:21:00'), (25, '7:31:00'), (26, '6:51:00'), (27, '7:01:00'), (28, '7:32:00'), (29, '6:55:00'), (30, '7:05:00'),
(31, '7:26:00'), (32, '7:36:00');

/* Bus line 2 */
INSERT INTO Ligne (ID_Ligne, ligne_name) VALUES (1, 'Ligne 2');

/* Line 2 direction */
INSERT INTO Direction (ID_direction, direction_name) VALUES (1, 'Direction Kersec'), (2, 'Direction P+R Ouest');


INSERT INTO Stops_Schedules (ID_Stop, ID_Schedule) VALUES (3,11), (3,12), (3,13), (3,14), (3,15), (4,2), (4,3), (4,9), (4,10), (4,16);


INSERT INTO Stops_Direction (ID_Stop, ID_direction, order_in_direction) VALUES (1,1,1), (2,1,2), (3,1,3), (4,1,4), (5,1,5), (6,1,6), (7,1,7), (8,1,8), (8,2,1), (7,2,2), (6,2,3), (5,2,4), (4,2,5), (3,2,6), (2,2,7), (1,2,8);


INSERT INTO Temporary_redirections (ID_Stop_Non_Desservi, ID_Stop_Redirection) VALUES (6, 7);