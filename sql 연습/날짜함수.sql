-- 함수: 날짜 함수
-- curdate(), current_date
select curdate(), current_date;

-- curtime(), current_time
select curtime(), current_time;

-- now() vs sysdate()
select now(), sysdate();
select now(), sleep(2), now(); -- 쿼리가 시작 될 때 시작
select sysdate(), sleep(2), sysdate(); -- 쿼리가 실행 될 때 시작

-- date_format()
-- 2022년 10월 13일 10:12:49 %Y는 연도 %m은 월의 숫자 %M은 월의 영어 %h 시 % 분 %s 초
select date_format(now(), '%Y년 %m월 %d일 %h:%i:%s');
select date_format(now(), '%d %b, \'%y %h:%i:%s');

-- period_diff() 기간구하기
-- 포맷팅: YYMM YYYYMM
-- 예) 근무 개월 수
select emp_no,
	period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m')) as month
	from employees
	order by month desc;
    
-- date_add(= adddate), date_sub(=subdate)
-- 날짜를 date 더해서 특정 일수를 출력... 날짜를 date에 type(year, month, day)의 표현식을 더하거나 뺸다.
-- 예제) 각 사원들의 근속년 수가 5년이 되는 날은 언제인가요?
select first_name,
	   hire_date,
       date_add(hire_date, interval 5 year)
  from employees;
  
  
  
  
  


    
    


