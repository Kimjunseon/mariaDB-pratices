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
