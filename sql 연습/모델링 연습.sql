show tables;
select *
from member;

insert
	into member(no, member_name, phone_number, member_mail, member_password)
  values(null, '김준선', '010-1234-5678', 'junseon0722@gmail.com', password(5578));

insert
	into member(no, member_name, phone_number, member_mail, member_password)
  values(null, '김네모', '010-8888-8888', 'seon0722@gmail.com', password(578));

 select *
   from member;
  
insert
	into member(no, member_name, phone_number, member_mail, member_password)
  values(null, '김준선', '010-1234-5678', 'junseon0722@gmail.com', password(5578));
  
  
  show tables;
  
  select *
   from catagory;
  
insert
	into catagory(no, catagory_name)
  values(null, '국어');
  
insert
	into catagory(no, catagory_name)
  values(null, '수학');
  
insert
	into catagory(no, catagory_name)
  values(null, '영어');
  
  
select *
  from member;
  
select *
  from catagory;
  
select *
  from book;
 
 insert
   into book(no, book_name)
 values(null, '동백꽃');
  
 insert
   into book(no, book_name)
 values(null, '2차 방정식');
 
 insert
   into book(no, book_name)
 values(null, 'toeic');
 
 select *
   from cart;
   
 insert
   into cart(no, book_count, book_name_no)
 values(null, 8, 1);
 
 insert
   into cart(no, book_count, book_name_no)
 values(null, 5, 2);
 
select *
  from orders;
  
 insert
   into orders(no, order_number, order_buyer, price_amount, address)
 values(null, 1, 'JS', 3, 'seocho');
 
 select *
  from order_book;
 