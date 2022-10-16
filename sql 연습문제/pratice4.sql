-- 혼합 SQL 문제입니다.
-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(a.emp_no) '직원 수'
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and b.salary > (select avg(salary)
				      from salaries
				     where to_date = '9999-01-01');
        
-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다.
-- 출력 사번 이름 부서연봉
  select a.emp_no '사번', concat(a.first_name, ' ', a.last_name) '이름', max(b.dept_name) '부서명' , max(c.salary) '급여'
    from employees a, departments b, salaries c, dept_emp d
   where a.emp_no = c.emp_no
	 and a.emp_no = d.emp_no
	 and b.dept_no = d.dept_no
group by b.dept_name
order by max(c.salary) desc;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요
select a.emp_no, a.first_name, b.salary, c.dept_no
  from employees a, salaries b, dept_emp c
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and b.salary > (select avg(d.salary)
					 from salaries d, dept_emp f
                    where d.emp_no = f.emp_no
					  and d.to_date = '9999-01-01'
					  and f.to_date = '9999-01-01' 
					  and f.dept_no = c.dept_no);
               
-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select b.emp_no, b.first_name, a.dept_no, c.dept_name
  from dept_manager a, employees b, departments c
 where a.emp_no = b.emp_no
   and c.dept_no = a.dept_no
   and a.to_date = '9999-01-01';

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select a.emp_no, a.first_name, b.title, c.salary, d.dept_no
  from employees a, titles b, salaries c, dept_emp d
 where a.emp_no = b.emp_no 
   and b.emp_no = c.emp_no
   and d.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and d.dept_no =  (select *
						from(select max(a.avg_dept) kk
						from (select dept_no, avg(e.salary) avg_dept
								from salaries e, dept_emp f
								where e.emp_no = f.emp_no
								  and e.to_date = '9999-01-01'
								  and f.to_date = '9999-01-01'
							 group by f.dept_no) a) ff);

(select *
						from(select max(a.avg_dept)
						from (select dept_no, avg(e.salary) avg_dept
								from salaries e, dept_emp f
								where e.emp_no = f.emp_no
								  and e.to_date = '9999-01-01'
								  and f.to_date = '9999-01-01'
							 group by f.dept_no) a) ff);

            
  
-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 





-- 문제7.
-- 평균 연봉이 가장 높은 직책?

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.








