CREATE DATABASE INNOVET;

\connect "innovet"

CREATE SCHEMA ivh;

CREATE TABLE ivh.supervisor (
    supervisor_id serial PRIMARY KEY,
    last_name text NOT NULL,
    first_name text NOT NULL
);

CREATE TABLE ivh.employee (
    employee_id serial PRIMARY KEY,
    last_name text NOT NULL,
    first_name text NOT NULL,
    start_date date NOT NULL,
    supervisor_id integer,
    is_team_member boolean NOT NULL,
    is_supervisor boolean NOT NULL,
    is_administrator boolean NOT NULL,
    is_executive boolean NOT NULL,
    has_timesheet boolean NOT NULL,
    CONSTRAINT fk_employee_supervisor FOREIGN KEY (supervisor_id) REFERENCES ivh.supervisor(supervisor_id)
);

CREATE TABLE ivh.status (
    status_id serial PRIMARY KEY,
    status_code text NOT NULL,
    status_type text NOT NULL,
    status text NOT NULL
);

CREATE TABLE ivh.appraisal (
    appraisal_id serial PRIMARY KEY,
    employee_id integer NOT NULL,
    status_id integer NOT NULL,
    year integer NOT NULL,
    CONSTRAINT fk_appraisal_employee FOREIGN KEY (employee_id) REFERENCES ivh.employee(employee_id),
    CONSTRAINT fk_appraisal_status FOREIGN KEY (status_id) REFERENCES ivh.status(status_id)
);

CREATE TABLE ivh.goal_type (
    goal_type_id serial PRIMARY KEY,
    goal_type text NOT NULL
);

CREATE TABLE ivh.rating (
    rating_id serial PRIMARY KEY,
    rating_code integer NOT NULL,
    rating_type text NOT NULL,
    rating text NOT NULL
);

CREATE TABLE ivh.goal (
    goal_id serial PRIMARY KEY,
    employee_id integer NOT NULL,
    appraisal_id integer NOT NULL,
    goal_type_id integer NOT NULL,
    goal text NOT NULL,
    rating_id integer NOT NULL,
    CONSTRAINT fk_goal_employee FOREIGN KEY (employee_id) REFERENCES ivh.employee(employee_id),
    CONSTRAINT fk_goal_appraisal FOREIGN KEY (appraisal_id) REFERENCES ivh.appraisal(appraisal_id),
    CONSTRAINT fk_goal_goal_type FOREIGN KEY (goal_type_id) REFERENCES ivh.goal_type(goal_type_id),
    CONSTRAINT fk_goal_rating FOREIGN KEY (rating_id) REFERENCES ivh.rating(rating_id)
);

CREATE TABLE ivh.pto (
    pto_id serial PRIMARY KEY,
    employee_id integer NOT NULL,
    allocated_time decimal NOT NULL,
    scheduled_time decimal NOT NULL,
    remaining_time decimal NOT NULL,
    non_rolloverable_time decimal NOT NULL,
    CONSTRAINT fk_pto_employee FOREIGN KEY (employee_id) REFERENCES ivh.employee(employee_id)
);

CREATE TABLE ivh.timesheet (
    timesheet_id serial PRIMARY KEY,
    employee_id integer NOT NULL,
    month text NOT NULL,
    day integer NOT NULL,
    status_id integer NOT NULL,
    CONSTRAINT fk_timesheet_employee FOREIGN KEY (employee_id) REFERENCES ivh.employee(employee_id),
    CONSTRAINT fk_timesheet_status FOREIGN KEY (status_id) REFERENCES ivh.status(status_id)
);