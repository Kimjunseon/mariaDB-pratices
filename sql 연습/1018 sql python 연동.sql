desc pet;
insert into pet values('멍멍', '김준선', 'dog', 'm', '2018-08-18', null);
delete from pet where name = '멍멍';
select *
from pet;


select name, owner, species, gender, date_format(birth, '%y-%m-d') from pet;