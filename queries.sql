/* For exercise 1 : This sql code displays the timetable in chronological order at Madelaine and République stops. */

SELECT Schedules.hour_Schedules AS "Horaires à l'arrêt Madeleine (Lundi)"
FROM Stops
JOIN Stops_Schedules ON Stops.ID_Arret = Stops_Schedules.ID_Arret
JOIN Schedules ON Stops_Schedules.ID_Horaire = Schedules.ID_Horaire
WHERE Stops.arret_name = 'Madeleine';

SELECT Schedules.hour_Schedules AS "Horaires à l'arrêt République (Lundi)"
FROM Stops
JOIN Stops_Schedules ON Stops.ID_Arret = Stops_Schedules.ID_Arret
JOIN Schedules ON Stops_Schedules.ID_Horaire = Schedules.ID_Horaire
WHERE Stops.arret_name = 'République';





/* For exercice 2 : This sql code displays the complete route of line 2 Direction Kersec */
SELECT Stops.arret_name AS "Parcours de la ligne 2 Direction Kersec"
FROM Stops
JOIN Stops_Direction ON Stops.ID_Arret = Stops_Direction.ID_Arret
JOIN Direction ON Stops_Direction.ID_direction = Direction.ID_direction
WHERE Direction.direction_name = 'Direction Kersec'
ORDER BY Stops_Direction.order_in_direction;





/* For exercice 4 & 5 : This sql code displays the Petit Tohannic bus stop timetable */
SELECT
    CASE
        WHEN Stops.arret_name = 'Petit Tohannic' THEN CONCAT('L\'arrêt n\'est pas desservi. Veuillez vous reporter à "', Arret_Redirection.arret_name, '".')
        ELSE Schedules.hour_Schedules
    END AS "Schedules à l'arrêt Petit Tohannic (Lundi)"
FROM
    Stops
LEFT JOIN Redirections_Temporaires ON Stops.ID_Arret = Redirections_Temporaires.ID_Arret_Non_Desservi
LEFT JOIN Stops AS Arret_Redirection ON Redirections_Temporaires.ID_Arret_Redirection = Arret_Redirection.ID_Arret
LEFT JOIN Stops_Schedules ON Stops.ID_Arret = Stops_Schedules.ID_Arret
LEFT JOIN Schedules ON Stops_Schedules.ID_Horaire = Schedules.ID_Horaire
WHERE
    Stops.arret_name = 'Petit Tohannic';





/* For exercice 6 & 7 : This sql code displays the complete route for each direction of the line */
SELECT 
    CONCAT('Ligne 2', ' ', Direction.direction_name) AS Ligne,
    GROUP_CONCAT(Stops.arret_name ORDER BY Stops_Direction.order_in_direction SEPARATOR ',') AS "Arrêts desservis"
FROM 
    Direction
LEFT JOIN 
    Stops_Direction ON Direction.ID_direction = Stops_Direction.ID_direction
LEFT JOIN 
    Stops ON Stops_Direction.ID_Arret = Stops.ID_Arret
GROUP BY 
    Direction.ID_direction, Direction.direction_name;




/* Call of the stored procedure */
CALL insert_schedule('06:32', '06:41', '00:01');
SELECT Schedules FROM schedule;