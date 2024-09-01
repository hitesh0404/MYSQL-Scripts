delimiter $


create  or replace procedure  pro1()
select 'hello world';




create  or replace procedure  pro2()
begin 
	select 'hello world';
	select 'hello universe';
end $





create  or replace procedure  Full_emp_details(in id int)
begin 
	select 
		e.employeeNumber,
		concat(firstName,lastName) as `Full Name`,
		city,
		phone 
	from 
		employees e 
	join 
		offices o 
	using(officeCode) where employeeNumber = id; 
end $
create or replace procedure get_total_spend(in cust_id int,out total decimal(20,2))
begin 
	select sum(od.quantityOrdered*od.priceEach) into total
	from 
		orderdetails od 
	join 
		orders  using(orderNumber) 
	join 
		customers c using(customerNumber) 
	where c.customerNumber = cust_id ;
end$






































