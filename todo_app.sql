-- 1. drop michael if exists
DROP USER IF EXISTS michael;

-- 2. create user michael with pass stonebreaker
CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

