/*
    Question url: https://leetcode.com/problems/biggest-single-number/submissions/1578451011/?envType=study-plan-v2&envId=top-sql-50
    Question: 
    +-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains an integer.
 

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.

The result format is in the following example.
*/
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (
    SELECT num 
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
);
