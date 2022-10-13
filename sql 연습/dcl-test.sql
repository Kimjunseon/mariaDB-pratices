-- 데이터베이스 생성 
create database animal;

-- 데이터베이스 생성 확인
show databases;

-- db 사용자 삭제
drop user 'animal'@'localhost';


-- db 사용자 생성
create user 'animal'@'localhost' identified by 'animal';

-- 권한부여
grant all privileges on webdb.* to 'animal'@'localhost';

-- 권한 정보 재로딩, 컨트롤 엔터 2~3번
flush privileges;