CREATE TABLE course (
	course_id           text PRIMARY KEY,
	name                text UNIQUE,
	description         text NOT NULL,
	price               double precision NOT NULL CHECK(price >= 0)
);

CREATE TABLE person (
	dni                 integer PRIMARY KEY NOT NULL,
	name                text NOT NULL,
	surname             text NOT NULL,
	birthday            timestamp with time zone NOT NULL
);

CREATE TABLE contact_information (
	dni                 integer NOT NULL REFERENCES person(dni),
	postal_address      text NOT NULL,
	phone_number        text,
	email               text
);

CREATE TABLE student (
	dni                 integer UNIQUE REFERENCES person(dni),
	student_id          text PRIMARY KEY,
	inscription_date    timestamp with time zone NOT NULL
);

CREATE TABLE is_student_of (
	student_id          text NOT NULL REFERENCES student(student_id),
	course_id           text NOT NULL REFERENCES course(course_id),
	PRIMARY KEY (student_id, course_id)
);

CREATE TABLE professor (
	dni                 integer UNIQUE REFERENCES person(dni),
	cuil                text PRIMARY KEY,
	salary              double precision NOT NULL CHECK (salary > 0),
	signing_in_date     timestamp with time zone NOT NULL
);

CREATE TABLE is_proffesor_of (
	cuil                text NOT NULL REFERENCES professor(cuil),
	course_id           text NOT NULL REFERENCES course(course_id),
	PRIMARY KEY (cuil, course_id)
);
