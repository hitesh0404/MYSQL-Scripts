desc employees;
desc salaries;
select *,count(first_name) from employees group by hire_date;
show full tables;
select * from departments d ;

desc current_dept_emp;

select 
	dept_no,
	(select dept_name from departments d where cd.dept_no = d.dept_no) as dept_name ,
	count(emp_no)as emp_no ,count(cd.emp_no) as current_emp 
from 
	dept_emp as cd 
	
group by 
	dept_no;
	

delimiter $

create or replace function get_dept_count(id int)
returns int
begin  
	declare dept_count int default 0;
	select count(dept_no) into dept_count from dept_emp de  where emp_no = id;
	return dept_count;
end$

create  or replace procedure  insert_emp (in emp_number int,
										  in birth_date date,
										  in first_name varchar(14),
										  in last_name varchar(16),
										  in gender char(1),
										  in hire_date date)
										  
begin
	declare emp int;
	select emp_no into emp from employees e where emp_no=emp_number; 
	
	if emp is null  then
		insert into employees values(emp_number,
									   birth_date,
									   first_name,
									   last_name,
									   gender,
									  hire_date);					 
	else 
		signal sqlstate '65000'
		set message_text='record already exists'  ;
	end if;
	
end
 call insert_emp(101,'1999-01-01','john','cater','M','2024-08-31')$

	





show create view current_dept_emp ;