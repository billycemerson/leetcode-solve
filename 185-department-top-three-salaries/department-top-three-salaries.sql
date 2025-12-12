# Write your MySQL query statement below
WITH RankedSalaries AS (  
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS new_rank
    FROM Employee
)

SELECT d.name AS Department,
    r.name AS Employee,
    r.salary AS Salary
FROM Department AS d
LEFT JOIN RankedSalaries AS r
    ON d.id=r.departmentId
WHERE r.new_rank <=3
GROUP BY Department, Employee;