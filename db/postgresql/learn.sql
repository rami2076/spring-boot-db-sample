DROP TABLE public.my;

CREATE TABLE IF NOT EXISTS public.my
(
    id     serial primary key,
    name   varchar(10),
    target integer default 0
    );
-- DROP RULE employee_rule ON public.employee;


-- CREATE OR REPLACE RULE employee_rule AS ON UPDATE TO public.employee
--     DO ALSO UPDATE public.employee as e
--             SET target = target + 1
--             where id = OLD.id;

create or replace function log_update_some_table() returns trigger as
$$
begin
    NEW.target := OLD.target + 1;
return NEW;
end;
$$ language plpgsql;

create or replace trigger log_update_some_table_trigger
    before update
                         on public.my
                         for each row
                         execute procedure log_update_some_table();

insert into public.my (name)
values ('name');

SELECT t.*
FROM public.my t;

update public.my
set name = 'first1'
where id = 1;
