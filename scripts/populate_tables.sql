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

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Appraisal', 'Initiated');

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Appraisal', 'Active (Pending Team Member Submission)');

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Appraisal', 'Submitted (Pending Supervisor Review)');

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Appraisal', 'Reviewed (Pending Team Member Approval)');

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Appraisal', 'Completed (Request for Executive Discussion)');

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Appraisal', 'Completed');

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Timesheet', 'Submitted');

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Timesheet', 'Not Submitted');

    INSERT INTO ivh.status (status_type, status)
    VALUES ('Timesheet', 'Late');

    COMMIT;

END;