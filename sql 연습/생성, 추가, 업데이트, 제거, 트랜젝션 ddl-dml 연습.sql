drop table member;

create table member(
	no int(11) not null auto_increment,
    email varchar(100) not null,
    password varchar(64) not null,
    name varchar(100) not null,
    department varchar(100),
    primary key(no)
);

desc member;

-- 데이터 추가
alter table member add column jumin char(13) not null;

-- 데이터 제거
alter table member drop jumin;

-- 위치 지정
alter table member add column jumin char(13) not null after email;

-- 기존 변경
alter table member change department department varchar(200) not null;

-- 주민번호 제거
alter table member drop jumin;
desc member;

-- insert
insert
	into member(no, email, password, name, department)
  values(null, 'kickscar1@gmail.com', password('1234'), '안대혁', '개발팀');
  
select * from member;


-- updete
update member
	set email = 'kickscar3@gmail.com', password = password('4321')
    where no = 2;
select * from member;

-- delete
delete
	 from member
     where no = 2;
     select * from member;

-- transaction
select @@autocommit;
set @@autocommit =0;

insert
	into member(no, email, password, name, department)
  values(null, 'kickscar5@gmail.com', password('1234'), '안대혁5', '개발팀');
commit;

select * from member;

