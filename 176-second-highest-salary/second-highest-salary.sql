# Write your MySQL query statement below
WITH Ranking AS (
    SELECT salary,
        RANK() OVER (
            ORDER BY salary DESC
        ) AS new_rank
    FROM Employee
)
SELECT COALESCE(
    (SELECT salary
    FROM Ranking
    WHERE new_rank>1
    LIMIT 1), NULL
) AS SecondHighestSalary;