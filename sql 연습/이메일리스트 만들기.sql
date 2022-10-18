drop table email_list;

create table email_list(
	no int(11) not null auto_increment,
    first_name varchar(45) not null,
    last_name varchar(45) not null,
    email varchar(200) not null,
    primary key(no));
    
select *
from email_list;

