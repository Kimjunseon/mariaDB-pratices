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
  
  
  