/*
    Question url: https://leetcode.com/problems/percentage-of-users-attended-a-contest/editorial/?envType=study-plan-v2&envId=top-sql-50
    Question: 
    +-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+
user_id is the primary key (column with unique values) for this table.
Each row of this table contains the name and the id of a user.
 
Table: Register
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+
(contest_id, user_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id of a user and the contest they registered into.
 
Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

The result format is in the following example.
*/
SELECT contest_id, -- The ID of the contest
ROUND( COUNT(DISTINCT user_id) * 100 / ( -- Calculate the percentage of users
SELECT  COUNT(user_id) -- Total number of unique users
FROM  Users   ), 2 ) AS percentage -- The percentage of users registered for each contest, rounded to 2 decimal places
FROM  Register -- The table containing registration information
GROUP BY  contest_id -- Group the data by contest ID
ORDER BY  percentage DESC, -- Order the results by percentage in descending order contest_id; -- Then order by contest ID for ties
