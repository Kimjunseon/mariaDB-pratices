select b.content, b.no, b.title, a.name, b.hit, b.group_no, b.order_no, date_format(b.reg_date, '%Y/%m/%d %H:%i:%s')
from user a, board b
where a.no = b.user_no
order by b.no desc, b.group_no desc, b.order_no asc, b.depth desc;

select * from board;

insert into board values (null, '', '', 0, now(), 1, (select max(order_no+1) from board b), 1, 1);

select * from board;

update board
set order_no = order_no + 1
where group_no = 1 and order_no > 2;

select * from board;