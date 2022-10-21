show tables;
desc member;
insert
  into member(no, member_name, phone_number, member_mail, member_password)
values(1, '김준선', '010-8888-8888', 'junseon@gmail.com', 'helloworld123!');

insert
  into member(no, member_name, phone_number, member_mail, member_password)
values(2, '김비트', '010-5555-5555', 'bit@gmail.com', 'bit555!');

insert
  into member(no, member_name, phone_number, member_mail, member_password)
values(3, '피카츄', '010-9999-9999', 'pika@gmail.com', 'chu555!');

select * from member;

insert
  into order_book(no, member_no, book_number, book_name, book_count)
values(null, 1, 001, 'javascript', 10);
delete
from order_book
where no = 4;

select * from order_book;

select member_name, book_name
from member a, order_book b
where a.no = b.member_no;

delete
	 from member
     where no = 6;
     select * from member;
     
select *
from catagory;


insert
  into catagory(no, catagory_name)
values(null, "IT");

insert
  into catagory(no, catagory_name)
values(null, "수필");

insert
  into catagory(no, catagory_name)
values(null, "소설");

select * from book;
select * from cart;

insert
  into book(no, catagory_no, cart_no, book_name, price)
values(1, 1, 1, "java", 23000);

insert
  into book(no, catagory_no, cart_no, book_name, price)
values(2, 2, 2, "사람사전", 12000);

insert
  into book(no, catagory_no, cart_no, book_name, price)
values(3, 3, 3, "지금이순간", 9000);

insert
  into cart(no, member_no, order_no, book_count, price)
values(null, 1, 1, "java", 23000);

select * from cart;

select * from orders;

insert
  into orders(no, order_number, price_amount, address)
values(1, 22090101, 23000, "강원도 원주시");

insert
  into orders(no, order_number, price_amount, address)
values(2, 22090102, 12000, "서울시 서초구");

insert
  into orders(no, order_number, price_amount, address)
values(3, 22090103, 9000, "경기도 마산");

insert
  into cart(no, member_no, orders_no, book_count, book_name_no, price)
values(1, 1, 1, 1, 001, 23000);

insert
  into cart(no, member_no, orders_no, book_count, book_name_no, price)
values(2, 2, 2, 1, 002, 12000);

insert
  into cart(no, member_no, orders_no, book_count, book_name_no, price)
values(3, 3, 3, 1, 003, 9000);

select * from cart;

delete
	 from book
     where no = 2;
     
select * from book;

insert
  into book(no, catagory_no, cart_no, book_name, price)
values(3, 3, 3, '지금이순간', 9000);

select * from book;

select a.order_number, b.member_name, a.price_amount, a.address
from orders a, member b
where a.no = b.no;


select *
from order_book;

insert
  into order_book(no, member_no, book_number, book_name, book_count)
values(1, 1, 001, 'java', 1);
insert
  into order_book(no, member_no, book_number, book_name, book_count)
values(2, 2, 002, '사람사전', 1);
insert
  into order_book(no, member_no, book_number, book_name, book_count)
values(3, 3, 003, '지금이순간', 1);

-- 도서번호 도서제목 수량

select book_number, book_name, book_count
from order_book;

desc cart;

select a.book_name, a.book_count, b.price
from order_book a, cart b
where a.no = b.no;
