show tables;
desc member;
insert
  into member(no, member_name, phone_number, member_mail, member_password)
values(null, '김준선', '010-8888-8888', 'junseon@gmail.com', password(123)); 
select * from member;

insert
  into order_book(no, member_no, book_number, book_name, book_count)
values(null, 1, 001, 'javascript', 10);

select * from order_book;

select member_name, book_name
from member a, order_book b
where a.no = b.member_no;

delete
	 from member
     where no = 1;
     select * from member;
