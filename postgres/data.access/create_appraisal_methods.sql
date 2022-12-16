\connect "innovet"

create or replace function ivh.get_appraisal_by_employee_id(pEmployeeId int)
    returns table
    ( employee_id int
    , employee_name text
    , supervisor_name text
    , appraisal_id int
    , year int
    , status_id int
    , status text) 
	language plpgsql as $$
    begin
        return query
            select e.employee_id
                , e.last_name || ', ' || e.first_name as employee_name
                , s.last_name || ', ' || s.first_name as supervisor_name
                , a.appraisal_id
                , a.year
                , a.status_id
                , st.status
            from ivh.employee e
                join ivh.supervisor s on e.supervisor_id = s.supervisor_id
                left join ivh.appraisal a on e.employee_id = a.employee_id
                join ivh.status st on a.status_id = st.status_id
            where e.employee_id = pEmployeeId;
    end $$;

create or replace function ivh.get_goals_by_appraisal_id(appraisalId int)
    returns table
    ( appraisal_id int
    , employee_id int
    , employee_name text
    , year int
    , status_id int
    , status text
    , goals_id int
    , goal_type text
    , goal text
    , rating_code int
    , rating text) 
    language plpgsql as $$
    begin
        return query
            select a.appraisal_id
                , e.employee_id
                , e.last_name || ', ' || e.first_name as employee_name
                , a.year
                , a.status_id
                , st.status
                , g.goal_id
                , gt.goal_type
                , g.goal
                , r.rating_code
                , r.rating
            from ivh.employee e
                left outer join ivh.appraisal a on e.employee_id = a.employee_id
                left outer join ivh.status st on a.status_id = st.status_id
                left outer join ivh.goal g on g.appraisal_id = a.appraisal_id
                left outer join ivh.goal_type gt on g.goal_type_id = gt.goal_type_id
                left outer join ivh.rating r on g.rating_id = r.rating_id
            where a.appraisal_id = appraisalId;
    end $$;