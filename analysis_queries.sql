-- 1. Total number of employees
SELECT COUNT(*) AS total_employees FROM hr_analytics;

-- 2. Employees who left
SELECT COUNT(*) AS employees_left FROM hr_analytics WHERE left_ = 1;

-- 3. Department-wise employee attrition
SELECT department, COUNT(*) AS left_count
FROM hr_analytics
WHERE left_ = 1
GROUP BY department
ORDER BY left_count DESC;

-- 4. Salary-level-wise attrition
SELECT salary, COUNT(*) AS left_count
FROM hr_analytics
WHERE left_ = 1
GROUP BY salary
ORDER BY left_count DESC;

-- 5. Impact of promotions on attrition
SELECT promotion_last_5years, COUNT(*) AS left_count
FROM hr_analytics
WHERE left_ = 1
GROUP BY promotion_last_5years;

-- 6. Work accidents vs attrition
SELECT work_accident, COUNT(*) AS left_count
FROM hr_analytics
WHERE left_ = 1
GROUP BY work_accident;

-- 7. Overall average monthly working hours
SELECT ROUND(AVG(average_montly_hours), 2) AS avg_monthly_hours
FROM hr_analytics;

-- 8. Overworked employees (hours > 250) who left
SELECT COUNT(*) AS overworked_left
FROM hr_analytics
WHERE average_montly_hours > 250 AND left_ = 1;

-- 9. Number of projects vs average hours
SELECT number_project,
       ROUND(AVG(average_montly_hours), 2) AS avg_hours
FROM hr_analytics
GROUP BY number_project
ORDER BY number_project;

-- 10. High-performing employees who left (evaluation > 0.80)
SELECT COUNT(*) AS high_eval_left
FROM hr_analytics
WHERE last_evaluation > 0.8 AND left_ = 1;

-- 11. Low evaluation + low satisfaction
SELECT COUNT(*) AS low_performance_count
FROM hr_analytics
WHERE last_evaluation < 0.5
  AND satisfaction_level < 0.5;

-- 12. Salary distribution
SELECT salary, COUNT(*) AS salary_count
FROM hr_analytics
GROUP BY salary
ORDER BY salary DESC;

-- 13. Employees with longest tenure (Top 10)
SELECT *
FROM hr_analytics
ORDER BY time_spend_company DESC
LIMIT 10;
