-- library management system project 2

-- Creating branch table

drop table if exists branch;
create table branch
	(
		branch_id varchar(10) primary key,
		manager_id varchar(10),
		branch_address varchar(50),
		contact_no varchar(10)
	);

alter table branch
	alter table contact_no type varchar(15);

drop table if exists employees;
create table employees 
	(
		emp_id varchar(10) primary key,
		emp_name varchar(25),
		position varchar(15),	
		salary int,
		branch_id varchar(25) -- FK
	);

drop table if exists books;
create table books
	(
		isbn varchar(20) primary key,
		book_title varchar(75),
		category varchar(20),
		rental_price float,
		status varchar(15),
		author varchar(35),
		publisher varchar(55)
	);

drop table if exists members;
create table members
	(
		member_id varchar(10) primary key,	
		member_name varchar(25),
		member_address varchar(75),
		reg_date date
	);
	
drop table if exists issued_status;
create table issued_status
	(
		issued_id varchar(10) primary key,
		issued_member_id varchar(10), -- FK
		issued_book_name varchar(75),
		issued_date date,
		issued_book_isbn varchar(25), -- FK
		issued_emp_id varchar(10) -- FK
	);

drop table if exists return_status;
create table return_status
	(
		return_id varchar(10) primary key,
		issued_id varchar(10), -- FK
		return_book_name varchar(75),
		return_date date,
		return_book_isbn varchar(20)
	);

-- Foreign key
Alter table  issued_status
ADD CONSTRAINT fk_members FOREIGN KEY (issued_member_id) REFERENCES members(member_id);

Alter table  issued_status
ADD CONSTRAINT fk_books FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn);

Alter table  issued_status
ADD CONSTRAINT fk_employees FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id);

Alter table  employees
ADD CONSTRAINT fk_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id);

Alter table  return_status
ADD CONSTRAINT fk_issued_status FOREIGN KEY (issued_id) REFERENCES issued_status(issued_id);

