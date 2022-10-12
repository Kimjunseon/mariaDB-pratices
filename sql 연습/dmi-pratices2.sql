show tables;
show databases;

select count(*) from employees;
select count(*) from departments;
select * from departments;

-- 논리데이터베스 설계(ERD) <- -> 물리 데이터 베이스(tables)

-- distinct 중복제거
select distinct(title) from titles;

select from_date, to_date from titles limit 0, 10;


