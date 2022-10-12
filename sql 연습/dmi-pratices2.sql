show tables;
show databases;

select count(*) from employees;
select count(*) from departments;
select * from departments;

-- 논리데이터베스 설계(ERD) <- -> 물리 데이터 베이스(tables)

-- distinct 중복제거
select distinct(title) from titles;

select from_date, to_date from titles limit 0, 10;

-- select 연습
select * from departments;
select dept_no, dept_name from departments;

-- alias(as 생략 가능)
-- 예제 1: employees 테이블에서 직원의 이름, 성별, 입사일을 출력
select first_name as '이름',
	   gender as '성별',
       hire_date as '입사일'
  from employees limit 0, 1000; -- (0부터 1000줄까지 생성) 설정에서 해제 가능

-- 예제 2: employees 테이블에서 직원의 이름, 성별, 입사일을 출력, concat을 사용하기
select concat(first_name,'' , last_name) as '이름',
		gender as '성별', hire_date as '입사일'
        from employees;
        
-- distinct
-- 예제 : 타이틀 테이블에서 모든 직급의 이름 출력
select distinct(title)
	from titles limit 0, 10;

-- where
-- where절 #1 대입 연산자
-- 예제 : employees 테이블에서 1991년 이저에 입사한 직원의 이름, 성별, 입사입을 출력
select first_name, gender, hire_date
	from employees
    where hire_date < '1991-01-01';

-- where절 #2 비교 연산자
-- 예제 : employees 테이블에서 1989년 이전 입사한 여직원 이름, 성별, 입사일 출력
select first_name, gender, hire_date
	from employees
    where hire_date < '1989-01-01'
    and gender = 'f';
    
-- where절 #3 IN 연산자
-- 예제 : dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력
 SELECT emp_no, dept_no    
   FROM dept_emp
  WHERE dept_no in( 'd005', 'd009');
  
  SELECT emp_no, dept_no    
   FROM dept_emp
  WHERE dept_no = 'd005'
	or dept_no = 'd009';
    
-- where절 #4 Like 검색
-- 예제 : employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력
select first_name, hire_date
	from employees
    where hire_date <= '1989-01-01'
    and hire_date <= '1989-12-31';
    
select first_name, hire_date
	from employees
    where hire_date like '1989%';
    
select first_name, hire_date
	from employees
    where hire_date between  '1989-01-01' and '1989-12-31';
    
-- order by 절
-- 예제 1: salaries 테이블에서 2001년 월급을 가장 높은순으로 사원의 사번, 월급순으로 출력
select emp_no, salary, from_date, to_date
	from salaries
    where from_date like '2001%'
		and to_date like '2001%'
    order by salary desc;
    
-- 예제 2: 남자 직원의 이름, 성별, 입사일(선임순) 정렬
select first_name as '이름' , gender as '성' , hire_date as '입사일'
		from employees
        where gender = 'M'
        order by '입사일' asc;
        
-- 예제 3: 직원들의 사번, 월급을 사번(asc), 월급(desc) 순으로 출력하세요
select emp_no, salary
from salaries
order by emp_no asc, salary desc;





