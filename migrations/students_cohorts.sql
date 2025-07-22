-- Create cohorts table
CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

-- Create students table
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(20),
  github VARCHAR(100),
  start_date DATE NOT NULL,
  end_date DATE,
  cohort_id INTEGER REFERENCES cohorts(id)
);