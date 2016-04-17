-- 1. drop michael if exists
DROP USER IF EXISTS michael;

-- 2. create user michael with pass stonebreaker
CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- 3. drop database todo_app
DROP DATABASE IF EXISTS todo_app;

-- 4. create database todo_app
CREATE DATABASE todo_app;

