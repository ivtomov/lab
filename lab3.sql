INSERT INTO students (name, egn, address, phone, class)
VALUES ('Ivan Ivanov Ivanov', '9207186371', 'Sofia-Serdika', '0888892950', '10');

SELECT * FROM students ORDER BY name;

DELETE FROM students WHERE egn='9207186371';

SELECT students.name, sports.name AS sport
FROM student_sport
JOIN students ON student_sport.student_id = students.id
JOIN sportGroups ON student_sport.sportGroup_id = sportGroups.id
JOIN sports ON sportGroups.sport_id = sports.id;

SELECT students.name, students.class, student_sport.sportGroup_id 
FROM student_sport 
INNER JOIN sportGroups ON student_sport.sportGroup_id = sportGroups.id 
INNER JOIN students ON student_sport.student_id = students.id 
WHERE sportGroups.dayOfWeek = 'Monday';

SELECT DISTINCT coaches.name
FROM coaches 
INNER JOIN sportGroups ON sportGroups.coach_id = coaches.id 
INNER JOIN sports ON sportGroups.sport_id = sports.id 
WHERE sports.name = 'Football';

SELECT location, dayOfWeek, hourOfTraining 
FROM sportGroups 
INNER JOIN sports ON sports.id = sportGroups.sport_id 
WHERE sports.name = 'Volleyball';

SELECT sports.name
FROM sports 
INNER JOIN sportGroups ON sports.id = sportGroups.sport_id 
INNER JOIN student_sport ON sportGroups.id = student_sport.sportGroup_id 
INNER JOIN students ON student_sport.student_id = students.id 
WHERE students.name = 'Iliyan Ivanov';

SELECT s.name
FROM students s
JOIN student_sport ss ON s.id = ss.student_id
JOIN sportGroups sg ON ss.sportGroup_id = sg.id
JOIN coaches c ON sg.coach_id = c.id
JOIN sports sp ON sg.sport_id = sp.id
WHERE sp.name = 'Football' AND c.name = 'Ivan Todorov Petkov';