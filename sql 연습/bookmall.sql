select *
from catagory;


insert into catagory(no, catagory_name) values(1, 'IT');

insert
into catagory(no, catagory_name)
values(2, 'NOVEL');

insert
into catagory(no, catagory_name)
values(3, 'SF');

select *
from book;

insert
into book(no, catagory_no, book_name, price, book_number)
values(1, 1, 'mysql 모델링 하는 법', 25000, 'IT001');

insert
into book(no, catagory_no, book_name, price, book_number)
values(2, 2, '개미', 13000, 'NV001');

insert
into book(no, catagory_no, book_name, price, book_number)
values(3, 3, '공상과학', 9000, 'SF001');


select *
from member;

insert
into member(no, member_name, phone_number, member_mail, member_password, address)
values(1, "김준선", "010-8888-8888", "js@naver.com", "jsjs88", "강원도 원주");

insert
into member(no, member_name, phone_number, member_mail, member_password, address)
values(2, "김세모", "010-5555-5555", "semo@gmail.com", "semo55", "서울시 서초");

select *
from cart;

insert into cart(no, member_no, book_no, book_count) values(1, 1, 1, 2);

insert
into cart(no, member_no, book_no, book_count)
values(2, 1, 2, 1);

select *
from orders;

insert
into orders(no, member_no, order_number, price_amount) values(1, 1, 221001001, 0);

select b.member_name, d.book_name, sum(d.price * c.book_count), d.book_number, sum(c.book_count), a.order_number, b.address from  orders a, member b, cart c, book d where a.no = b.no and c.member_no = b.no and d.no = c.no group by b.member_name;
 