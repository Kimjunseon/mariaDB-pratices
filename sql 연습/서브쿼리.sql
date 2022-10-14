-- 서브쿼리
-- 1) select 절에 올 수 있다.
-- 2) from 절에 올 수 있다.
select now() as a, sysdate() b, 3+1 c;

select s.a, s.b, s.c
	from(select now() as a, sysdate() b, 3+1 c) s;

-- 3) where 절의 서브쿼리
-- 예제) 현제, Fai Bale이 근무하는 부서의 직원들의 사번, 이름을 출력
select dept_no
	from dept_emp a, employees b
   where a.emp_no = b.emp_no
     and concat(first_name,' ', last_name) = 'Fai Bale'
     and a.to_date = '9999-01-01';

select a.emp_no, b.first_name
	from dept_emp a, employees b
   where a.emp_no = b.emp_no
	 and a.to_date = '9999-01-01'
     and a.dept_no = 'd004';

-- SOL) 서브쿼리는 동시에 실행이 됨. 위에 경우에는 2개로 나뉘기 때문에 순간변화에 에러가 발생 할 수 있는 요지가 있다.
select a.emp_no, b.first_name
	from dept_emp a, employees b
   where a.emp_no = b.emp_no
	 and a.to_date = '9999-01-01'
     and a.dept_no = (select dept_no
						from dept_emp a, employees b
					   where a.emp_no = b.emp_no
						 and concat(first_name,' ', last_name) = 'Fai Bale'
						 and a.to_date = '9999-01-01');

-- 3-1) 단일 행 연산자: =, !=, >, <, >=, <=
-- 실습문제1: 현재, 전체 사원의 평균연봉 보다 적은 급여를 받고 있는 사원의 이름, 급여를 출력
select avg(salary) from salaries where to_date = '9999-01-01';
-- 72012
select a.first_name, b.salary
	from employees a, salaries b
   where a.emp_no = b.emp_no
     and b.to_date = '9999-01-01'
     and b.salary < (select avg(salary)
					   from salaries
					  where to_date = '9999-01-01')
order by b.salary desc;

-- 실습문제 2: 현재, 가장 적은 직책별 평균급여의 직책과 그 급여를 출력하세요.
-- 1) 현재 가장 적은 직책별 평균급여 구하기
-- 1-1) 현재 직책별 평균급여
  select a.title, avg(b.salary) avg_salary
	from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a. title;

-- 1-2) 가장 직책별 평균급여
select min(a.avg_salary)
	from (select a.title, avg(b.salary) avg_salary
			from titles a, salaries b
		   where a.emp_no = b.emp_no
			 and a.to_date = '9999-01-01'
			 and b.to_date = '9999-01-01'
		group by a. title) a;
        
-- 2-1) sol: subquery 
  select a.title, avg(b.salary) avg_salary
	from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title
  having avg_salary = (select min(a.avg_salary)
						  from(select a.title, avg(b.salary) avg_salary
								 from titles a, salaries b
								where a.emp_no = b.emp_no
								  and a.to_date = '9999-01-01'
								  and b.to_date = '9999-01-01'
							 group by a. title) a);
        
-- 2-2) sol2: top-k 조건에 의해 정렬 후 top(맨 위)부터 K번째까지 가져옴
  select a.title, avg(b.salary) avg_salary
	from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title
order by avg_salary asc
   limit 0, 1;

-- 3-2) 복수 행 연산자: in, not in, any, all
-- any 사용법
-- 1. =any: in과 동일
-- 2. >any, >=any: 최소값
-- 3. <any, <=any: 최대값
-- 4. <> any: not in과 동일

-- all 사용법
-- 1. =all: x
-- 2. >all, >=all: 최대값
-- 3. <all, <=all: 최소값
-- 4. <>all

-- 실습문제 3: 현재 급여가 50,000 이상인 직원의 이름, 급여를 출력
-- sol 1) join으로 해보기
select a.first_name, b.salary
	from employees a, salaries b
   where a.emp_no = b.emp_no
	 and b.to_date = '9999-01-01'
     and b.salary >= 50000
order by b.salary asc; 
   
-- sol 2) subquery로 해보기 (복수연산자)
select a.first_name, b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and (a.emp_no, b.salary) in (select emp_no, salary
								 from salaries
								where to_date = '9999-01-01'
								  and salary >= 50000);

select a.first_name, b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and (a.emp_no, b.salary) =any (select emp_no, salary
								 from salaries
								where to_date = '9999-01-01'
								  and salary >= 50000);
                                  
-- 실습문제 4: 현재, 각 부서별로 최고 월급을 받는 직원의 이름, 부서이름, 월급을 출력
-- 출력 예)
-- 총무 둘리 200
-- 개발 뭉치 500

  select a.dept_no, max(c.salary) as max_salary
    from dept_emp a, salaries c
   where a.emp_no = c.emp_no
     and a.to_date = '9999-01-01'
     and c.to_date = '9999-01-01'
group by a.dept_no;

-- SOL 1) where절 subquery
select *
  from departments a, dept_emp b, employees c, salaries d
 where a.dept_no = b.dept_no
   and b.emp_no = c.emp_no
   and c.emp_no = d.emp_no
   and b.to_date = '9999-01-01'
   and d.to_date = '9999-01-01'
   and (a.dept_no, d.salary) in (select a.dept_no, max(c.salary) as max_salary
								   from dept_emp a, salaries c
								  where a.emp_no = c.emp_no
									and a.to_date = '9999-01-01'
									and c.to_date = '9999-01-01'
							   group by a.dept_no);

select a.dept_name, c.first_name, d.salary
  from departments a, dept_emp b, employees c, salaries d
 where a.dept_no = b.dept_no
   and b.emp_no = c.emp_no
   and c.emp_no = d.emp_no
   and b.to_date = '9999-01-01'
   and d.to_date = '9999-01-01'
   and (a.dept_no, d.salary) in (select a.dept_no, max(c.salary) as max_salary
								   from dept_emp a, salaries c
								  where a.emp_no = c.emp_no
									and a.to_date = '9999-01-01'
									and c.to_date = '9999-01-01'
							   group by a.dept_no);

-- SOL 2) from절 subquery
select a.dept_name, c.first_name, d.salary
  from departments a,
	   dept_emp b,
       employees c,
       salaries d,
       (select a.dept_no, max(c.salary) as max_salary
	      from dept_emp a, salaries c
		 where a.emp_no = c.emp_no
		   and a.to_date = '9999-01-01'
		   and c.to_date = '9999-01-01'
      group by a.dept_no) e -- from 추가
 where a.dept_no = b.dept_no
   and b.emp_no = c.emp_no
   and c.emp_no = d.emp_no
   and e.dept_no = a.dept_no -- from 추가
   and b.to_date = '9999-01-01'
   and d.to_date = '9999-01-01'
   and e.max_salary = d.salary; -- from 추가

                  