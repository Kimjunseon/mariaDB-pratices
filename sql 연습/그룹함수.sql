-- 집계쿼리: select 절에 그룹함수(avg, max, min, count, sum, ...)가 적용된 경우
select avg(salary), sum(salary)
	from salaries;
    
-- select 절에 그룹함수가 있는 경우, 어떤 컬럼도 select 절에 올 수 없다. 타 DB에서는 오류발생
select avg(salary), emp_no
	from salaries;
    
-- query 순서
-- 1) from: 접근테이블 확인
-- 2) where: 조건에 맞는 row를 선택
-- 3) avg: 집계사용
-- 4) 출력 projection
select avg(salary) -- 3번
	from salaries -- 1번
    where emp_no = '10060'; -- 2번

-- group by에 참여하고 있는 컬럼은 projection이 가능하다(select 절에는 올 수 있다.)
select emp_no, avg(salary)
	from salaries 
    group by emp_no;

-- having
-- 집계결과(결과 임시 테이블)에서 row를 선택해야 하는 경우
-- 이미 where 절은 실행이 되었기 때문에 having 절에 이 조건을 주어야 한다.
 select emp_no, avg(salary)
	from salaries 
    where emp_no < '10010'
    group by emp_no
    having avg(salary) < '60000';


select emp_no, avg(salary), to_date
	from salaries 
    where emp_no < '10010'
    group by emp_no
    having avg(salary) < '60000'
    order by to_date like '9999%';

    
    
    
    
    
    