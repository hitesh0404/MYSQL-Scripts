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


call Full_emp_details(1088);






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


call get_total_spend(124,@total)$
select @total$






create  or replace procedure get_max_quantity_product 
							(inout id int,out  p_code varchar(10))
begin 
	declare q_o int;

	select 
		productcode,
		max(quantityOrdered) into p_code,q_o 
		from 
			orderdetails 
		where 
			orderNumber=id;
		set id =q_o;
end$
 set @od=10100$
 
 call get_max_quantity_product(@od,@product)$
 select @od as quantity_ordered,@product$





























