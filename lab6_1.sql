USE school_sport_clubs;
-- 1 Изведете имената, класовете и телефоните на всички ученици, които тренират футбол.
SELECT students.`name`, students.`class`, students.`phone`
FROM students
JOIN student_sport ON students.`id` = student_sport.`student_id`
JOIN sportgroups ON sportgroups.`id` = student_sport.`sportGroup_id`
JOIN sports ON sportgroups.`sport_id` = sports.`id`
WHERE sports.`name` = "Football";

-- 2 Изведете имената на всички треньори по волейбол.
SELECT coaches.`name`
FROM coaches
JOIN sportgroups ON sportgroups.`coach_id` = coaches.`id`
JOIN sports ON sportgroups.`sport_id` = sports.`id`
WHERE sports.`name` = "Volleyball";

-- 3 Изведете името на треньора,спорта,денят и мястото на тренировки заMaria Hristova Dimova.
SELECT coaches.`name`, sports.`name` as sport,`sportgroups`.`location`, sportgroups.`dayOfWeek`
FROM students
JOIN student_sport ON students.`id` = student_sport.`student_id`
JOIN sportgroups ON sportgroups.`id` = student_sport.`sportGroup_id`
JOIN coaches ON sportgroups.`coach_id` = coaches.`id`
JOIN sports ON sportgroups.`sport_id` = sports.`id`
WHERE students.`name` = "Maria Hristova Dimova";

-- 4 Изведете сумите от платените през годините такси на учениците по месеци, но само за ученици с такси по месеци над 700 лева и с треньор с ЕГН 7509041245.
SELECT students.`name`, taxespayments.`month`, SUM(taxespayments.`paymentAmount`)
FROM students
JOIN taxespayments ON students.`id` = taxespayments.`student_id`
JOIN sportgroups ON sportgroups.`id` = taxespayments.`group_id`
JOIN coaches ON coaches.`id` = sportgroups.`coach_id`
WHERE coaches.`egn` = "7509041245"
GROUP BY students.`name`, taxespayments.`month`
HAVING SUM(taxespayments.`paymentAmount`) > 700;

-- 5 Изведете броя настудентите, трениращи футбол.
SELECT sports.`name`, COUNT(students.`id`)
FROM sports
JOIN sportgroups ON sportgroups.`sport_id` = sports.`id`
JOIN student_sport ON student_sport.`sportGroup_id` = sportgroups.`id`
JOIN students ON students.`id` = student_sport.`student_id`
WHERE sports.`name` = "Football"
GROUP BY (sports.`name`);

-- 6 Изведете имената на треньорите и водените от тях спортове. Нека в резултатите да присъстват и треньорите, които не водят групи.
SELECT DISTINCT coaches.`name`, sports.`name` as sport
FROM sports
JOIN sportgroups ON sportgroups.`sport_id` = sports.`id`
RIGHT JOIN coaches ON coaches.`id` = sportgroups.`coach_id`;

-- 7 Напишете заявка, с която извеждатеимето на спорта, мястото, където се провеждат  тренировките  и  броя  на  студентите,  които  тренират  в съответната група. Нека в резултатите да присъстват само групис численост над 3 души.
SELECT sports.`name`, sportgroups.`location`, COUNT(students.`id`)
FROM sports
JOIN sportgroups ON sportgroups.`sport_id` = sports.`id`
JOIN student_sport ON student_sport.`sportGroup_id` = sportgroups.`id`
JOIN students ON students.`id` = student_sport.`student_id`
GROUP BY sports.`name`, sportgroups.`location`
HAVING COUNT(students.`id`) > 3;

