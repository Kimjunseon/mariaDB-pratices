-- 멤버 카트,, 카테고리 상품 주문 주문도서

select *
 from member;
  
 insert
	into member(no, member_name, phone_number, member_mail, member_password)
  values(null, '김준선', '010-0000-0000', 'junseon0722@gmail.com', password(1234));
  
 insert
	into cart(no, member_no, book_count, book_name_no, price)
  values(null, 1, 8, 001, 5000);
    
  select *
 from cart;
 
 insert
	into book(no, cart_no, book_name, price)
  values(null, 1, '자바', 5000);
 
 select *
 from book;
 
 
 -- 멤버 카트 카테고리 상품, 주문 주문도서
 
 select *
 from catagory;
 
 insert
	into catagory(no, book_no, catagory_name)
  values(null, 1, '개발');
  
select *
from orders;

insert
	into orders(no, order_book_no, order_number, price_amount, address)
  values(null, 1, 001, 7, '서초');
  
select *
from order_book;
  
insert
	into order_book(no, member_no, book_number, book_name, book_count)
  values(null, 1, 001, '자바', 7);
  
select *
from order_book;  
  
select *
from member;   


select *
 from cart;
 
  delete
	 from member
     where phone_number = '010-0000-0000';