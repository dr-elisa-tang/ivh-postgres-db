\connect "innovet"

BEGIN;

    INSERT INTO ivh.supervisor (last_name, first_name)
    VALUES ('Gould', 'Mike');

    INSERT INTO ivh.supervisor (last_name, first_name)
    VALUES ('Bouhaddou', 'Omar');

    INSERT INTO ivh.supervisor (last_name, first_name)
    VALUES ('Hovey', 'David');

    INSERT INTO ivh.employee (last_name, first_name, start_date, supervisor_id, is_team_member, is_supervisor, is_administrator, is_executive, has_timesheet)
    VALUES ('Tang', 'Elisa', '2020-11-02', (select supervisor_id from ivh.supervisor where first_name = 'David'), true, false, false, false, true);

    INSERT INTO ivh.employee (last_name, first_name, start_date, supervisor_id, is_team_member, is_supervisor, is_administrator, is_executive, has_timesheet)
    VALUES ('Hathaway', 'Laura', '2020-11-23', (select supervisor_id from ivh.supervisor where first_name = 'Mike'), true, false, false, false, false);

    INSERT INTO ivh.employee (last_name, first_name, start_date, supervisor_id, is_team_member, is_supervisor, is_administrator, is_executive, has_timesheet)
    VALUES ('Hovey', 'David', '2020-03-30', (select supervisor_id from ivh.supervisor where first_name = 'Mike'), true, true, false, false, true);

    INSERT INTO ivh.employee (last_name, first_name, start_date, supervisor_id, is_team_member, is_supervisor, is_administrator, is_executive, has_timesheet)
    VALUES ('Weiss', 'Michael', '2021-09-29', (select supervisor_id from ivh.supervisor where first_name = 'David'), true, false, false, false, true);

    INSERT INTO ivh.employee (last_name, first_name, start_date, supervisor_id, is_team_member, is_supervisor, is_administrator, is_executive, has_timesheet)
    VALUES ('Yang', 'Yiqi', '2020-04-04', (select supervisor_id from ivh.supervisor where first_name = 'Omar'), true, false, true, false, false);

    INSERT INTO ivh.employee (last_name, first_name, start_date, is_team_member, is_supervisor, is_administrator, is_executive, has_timesheet)
    VALUES ('Gould', 'Mike', '2017-10-01', false, false, false, true, false);

    INSERT INTO ivh.employee (last_name, first_name, start_date, is_team_member, is_supervisor, is_administrator, is_executive, has_timesheet)
    VALUES ('Bouhaddou', 'Omar', '2017-10-01', false, false, false, true, false);

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Appraisal', 'I', 'Initiated');

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Appraisal', 'A', 'Active (Pending Team Member Submission)');

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Appraisal', 'S', 'Submitted (Pending Supervisor Review)');

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Appraisal', 'R', 'Reviewed (Pending Team Member Approval)');

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Appraisal', 'CR', 'Completed (Request for Executive Discussion)');

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Appraisal', 'C', 'Completed');

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Timesheet', 'S', 'Submitted');

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Timesheet', 'NS', 'Not Submitted');

    INSERT INTO ivh.status (status_type, status_code, status)
    VALUES ('Timesheet', 'L', 'Late');

    INSERT INTO ivh.appraisal (employee_id, status_id, year)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            , (select status_id from ivh.status where status_type = 'Appraisal' and status_code = 'C')
            , 2020);

    INSERT INTO ivh.appraisal (employee_id, status_id, year)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            , (select status_id from ivh.status where status_type = 'Appraisal' and status_code = 'C')
            , 2021);

    INSERT INTO ivh.appraisal (employee_id, status_id, year)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            , (select status_id from ivh.status where status_type = 'Appraisal' and status_code = 'C')
            , 2022);

    INSERT INTO ivh.goal_type (goal_type)
    VALUES ('Client Quality Assurance');

    INSERT INTO ivh.goal_type (goal_type)
    VALUES ('Professional Development');

    INSERT INTO ivh.goal_type (goal_type)
    VALUES ('Internal Operations Support');

    INSERT INTO ivh.rating (rating_code, rating_type, rating)
    VALUES (1, 'Appraisal', 'Unacceptable');

    INSERT INTO ivh.rating (rating_code, rating_type, rating)
    VALUES (2, 'Appraisal', 'Needs Improvement');

    INSERT INTO ivh.rating (rating_code, rating_type, rating)
    VALUES (3, 'Appraisal', 'Meets Expectations');

    INSERT INTO ivh.rating (rating_code, rating_type, rating)
    VALUES (4, 'Appraisal', 'Exceeds Expectations');

    INSERT INTO ivh.rating (rating_code, rating_type, rating)
    VALUES (5, 'Appraisal', 'Outstanding');

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2020)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Client Quality Assurance')
            , 'Support research and development efforts.'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '3'));

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2020)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Professional Development')
            , 'PHP Direct System and React RDC Challenge'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '4'));

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2020)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Internal Operations Support')
            , 'Participated in the RDC challenge to pusue a potential contract'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '3'));

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2021)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Client Quality Assurance')
            , 'Support and provide assurance, reliability, availability, and contribute to overall success'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '3'));

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2021)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Professional Development')
            , 'Pega COVID Workflow'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '2'));

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2021)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Internal Operations Support')
            , 'Particiapated in Pega platform challenge to pusue potential contract'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '5'));

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2022)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Client Quality Assurance')
            , 'Support multiple projects across the CCDSO contract as a shared resource between product teams'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '4'));

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2022)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Professional Development')
            , 'DevOps - GitHub Actions, Fortify, Docker and Development - Spring Boot and Maven'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '3'));

    INSERT INTO ivh.goal (employee_id, appraisal_id, goal_type_id, goal, rating_id)
    VALUES ((select employee_id from ivh.employee where last_name = 'Tang')
            ,(select appraisal_id from ivh.appraisal
                where employee_id = (select employee_id from ivh.employee where last_name = 'Tang')
                and year = 2022)
            , (select goal_type_id from ivh.goal_type where goal_type = 'Internal Operations Support')
            , 'Initiate internal InnoVet Web App to supoprt administrative and HR processes'
            , (select rating_id from ivh.rating where rating_type = 'Appraisal' and rating_code = '5'));

    COMMIT;

END;