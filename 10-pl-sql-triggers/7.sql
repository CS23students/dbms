-- 7	Deactivate a trigger and then activate it again
-- Deactivate
ALTER TRIGGER trg_salary_limit DISABLE;

-- Reactivate
ALTER TRIGGER trg_salary_limit ENABLE;
