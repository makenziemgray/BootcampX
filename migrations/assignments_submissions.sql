-- Create assignments table
CREATE TABLE assignments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  day INTEGER NOT NULL,
  chapter INTEGER NOT NULL,
  duration INTEGER NOT NULL
);

-- Create assignment_submissions table
CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY,
  assignment_id INTEGER REFERENCES assignments(id),
  student_id INTEGER REFERENCES students(id),
  duration INTEGER,
  submission_date DATE
);