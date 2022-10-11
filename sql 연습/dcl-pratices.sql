-- 데이터베이스 생성 
create database webdb;

-- 데이터베이스 생성 확인
show databases;


-- db 사용자 삭제
-- drop user 'webdb'@'localhost';

-- db 사용자 생성
create user 'webdb'@'localhost' identified by 'webdb';

-- 권한부여
grant all privileges on webdb.* to 'webdb'@'localhost';

-- 권한 정보 재로딩, 컨트롤 엔터 2~3번
flush privileges;