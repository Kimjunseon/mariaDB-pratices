select * from user;
select * from board;
insert into board values (null, 'hi', 'world', 1, now(), 1, 1, 1 ,1);
insert into board values (null, 'hi', 'world', 1, now(), 1, 1, 1 ,2);

select a.no, b.title, a.name, b.hit, date_format(b.reg_date, '%Y/%m/%d %H:%i:%s')
from user a, board b
where a.no = b.user_no;
