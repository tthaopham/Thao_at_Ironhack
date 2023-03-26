-- 1. Upload script
USE employees_mod;

-- 2. Procedure for average salary of all employees:

DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
SELECT avg(salary) FROM t_salaries WHERE salary IS NOT NULL;
END
$$ DELIMITER ;

CALL avg_salary();

-- 3.  emp_info to get employee numbers (p = parameters)
DELIMITER $$
CREATE PROCEDURE emp_info(
	IN p_first_name VARCHAR(255), 
    IN p_last_name VARCHAR(255), 
    OUT p_emp_no INTEGER)
    
BEGIN
SELECT e.emp_no INTO p_emp_no 
FROM
	t_employees e
WHERE 
	e.first_name = p_first_name AND e.last_name = p_last_name;
END$$
DELIMITER ;

-- 4. Call Procedure:
SET @v_emp_no = 0;
CALL emp_info('Larisa', 'Bage', @v_emp_no );
SELECT @v_emp_no;

-- 6. Check salary from the newest contract (code runs but results not correct)
DELIMITER $$
CREATE FUNCTION emp_info_sal(
	p_first_name VARCHAR(255), 
    p_last_name VARCHAR(255))
    RETURNS decimal(10,2)
    
BEGIN
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10,2);

SELECT s.salary INTO p_newest_sal
FROM
	t_salaries s
JOIN t_employees e
ON s.emp_no = e.empt_no
WHERE 
	e.first_name = p_first_name AND e.last_name = p_last_name AND s.to_date = '9999-01-01';
END$$
DELIMITER ;

SET @v_salary = 0;
CALL emp_info_sal('Mary', 'Sluis', @v_salary );
SELECT @v_salary;
