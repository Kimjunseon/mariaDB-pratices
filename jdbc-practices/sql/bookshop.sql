show tables;
desc book;
desc author;

-- author insert
insert into author values(null, '원수연');

-- author select
select * from author;

-- author delate all;
delete from author;

-- book insert
insert into book values(null, 'test', '재고있음', 3);

-- book select
select * from book;

-- book delete all
delete from book where no = 25;

-- findAll