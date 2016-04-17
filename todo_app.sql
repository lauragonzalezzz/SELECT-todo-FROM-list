-- 1. drop michael if exists
DROP USER IF EXISTS michael;

-- 2. create user michael with pass stonebreaker
CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- 3. drop database todo_app
DROP DATABASE IF EXISTS todo_app;

-- 4. create database todo_app
CREATE DATABASE todo_app;

-- 5. Connect to todo_app
\c todo_app;

-- 6. Create table named tasks w/ columns
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at timestamp without time zone NOT NULL default NOW(),
  updated_at timestamp without time zone,
  completed_at BOOL NOT NULL default FALSE
  );

-- 7. Column id is tables primary key
--Done above

-- 8. Queries
-- i. remove column completed
ALTER TABLE tasks *
DROP completed_at;

-- ii. add column complete
ALTER TABLE tasks
ADD completed_at timestamp default NULL;

-- iii. change update to not allow null values, default now()
ALTER TABLE tasks
ALTER updated_at SET NOT NULL;
ALTER TABLE tasks
ALTER updated_at SET DEFAULT NOW();

-- iv. create new task
INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', NOW(), NOW(), NULL);

--v. create a new task
INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

-- vi. select all the titles of the tasks that are not complete
SELECT tasks.title FROM tasks WHERE tasks.completed_at IS NULL;

--vii. update study sql task to be complete
UPDATE tasks set completed_at= NOW() WHERE title = 'Study SQL';

-- viii.
SELECT tasks.title, tasks.description FROM tasks WHERE tasks.completed_at IS NULL;

-- ix.
SELECT * FROM tasks ORDER BY completed_at DESC;

-- x. create new task
INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

-- xi. create new task
INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

-- xii. create new task
INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

-- xiii. select title fields of all tasks with title that includes 'mistake'
SELECT title FROM tasks WHERE title LIKE '%mistake%';

--xiv. delete tasks with title of mistake 1
DELETE FROM tasks where title = 'mistake 1';

--xv. selected title/desc where title includes mistake
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

--xvi. delete all tasks with mistake in title
DELETE FROM tasks WHERE title LIKE '%mistake%';

--xvii. select all sorted by title ascending
SELECT * FROM tasks ORDER BY title ASC;


SELECT * FROM tasks;