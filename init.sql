CREATE DATABASE IF NOT EXISTS project;

CREATE USER 'abdelrhman'@'localhost' IDENTIFIED BY '123';

GRANT ALL PRIVILEGES ON project.* TO 'abdelrhman'@'localhost';

USE project;

CREATE TABLE IF NOT EXISTS customer_info_tbl (
  customer_id VARCHAR(11),
  customer_name VARCHAR(256),
  customer_email VARCHAR(256),
  PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS phone_info_tbl (
  phone_id VARCHAR(11),
  customer_id VARCHAR(11),
  phone_number VARCHAR(11),
  PRIMARY KEY (phone_id),
  FOREIGN KEY (customer_id) REFERENCES customer_info_tbl(customer_id)
);

