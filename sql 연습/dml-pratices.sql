-- 대소문자 구분 없음
select version(), current_DATE;
select version(), current_date;

-- 함수 및 수식
select sin(pi()/4), (2+3)*2;

-- 동시 실행이 아닌 커서가 있는 곳에서 실행됨
select version(); select now();

select
	version(),
	now();
    
-- cli에서는 \c 캔슬함

-- 테이블 보기
show tables;

-- 테이블 삭제
-- drop table pet;

-- 테이블 만들기 (DDL)
create table pet(
	name varchar(20), -- 20자짜리 str
    owner varchar(20),
    species varchar(20),
    gender char(1), -- varchar는 20이라 지정해두고 5의 입력 시, 5로 줄어듬
    birth date, -- 날짜
    death date
);

-- 스키마: 구조를 확인 테이블 및 디비를 확인
-- desc = describe
describe pet;

-- 데이터 조회
select name, owner, species, gender, birth, death from pet;

-- 데이터 넣기(생성, Create)
insert
	into pet -- 특정 열만 넣을려면 pet(name, owner...)
    value ('성탄이', '안대혁', 'dog', 'm', '2018-12-25', null);
    
-- 데이터 삭제(삭제, Delete)
delete
	from pet 
    where name = '성탄이';

-- load data local file 파일불러오기 (하위 폴더로 내려갈때 마다 \\ 으로 가야함)
load data local infile 'C:\\AIstudy\\pet.txt' into table pet;

-- update(변경, Update)
update 	pet
	set death = null
    where name != 'Bowser';

-- '0000-00-00' 데이터를 null로 업데이트
-- update pet set death = null where death = '0000-00-00';

-- 조회 1: where (row 선택 조건)
-- Q1. 1990년 이후에 태어난 아이들은? (출력: 이름, 종, 생일)
select name, species, birth from pet
	where birth > '1990-12-31';

-- select name, species, birth
-- 	from pet
-- 	where birth > '1990-12-31';

-- Gwen과 함께 사는 아이들은? (출력: 이름, 종, 집사)
select name, species, owner
	from pet
	where owner = 'Gwen';

-- null 다루기 1: 현재 살아있는 아이들은?(이름, 생일, 사망일)
select name, birth, death
	from pet
    where death is null; -- null 구문은 is를 사용 해야함
    
-- null 다루기 2: 현재 죽어있는 아이들은?(이름, 생일, 사망일)
select name, birth, death
	from pet
    where death is not null;

-- like 검색 1(패턴매칭): 이름이 b로 시작하는 아이들은?
select name
	from pet
    where name like 'b%'; -- b로 시작하는 문자

-- like 검색 2(패턴매칭): 이름이 b로 시작하며 6자인 아이들은?
select name
	from pet
    where name like 'b_____'; -- 언더바(_)는 개수로 몇개 더 뽑을지 결정 ex) (b_) b로 시작하며 2글자

-- order by 정렬기능
-- 아이들을 어린 순으로 출력하세요(이름, 생일)
select name, birth
	 from pet
     order by birth desc; -- 내림차순 asc 오름차순 desc

-- 아이들을 많은 순으로 출력하세요(이름, 생일)
select name, birth
	 from pet
     order by birth asc; -- 내림차순 asc 오름차순 desc

-- 집계(통계) 함수
select count(*) -- 칼럼의 수 확인, *은 풀스캔
	from pet;




 
