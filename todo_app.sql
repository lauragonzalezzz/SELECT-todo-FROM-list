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

