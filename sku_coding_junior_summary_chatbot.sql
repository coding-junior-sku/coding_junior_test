#drop database summary_deeplearning;

create database summary_deeplearning character set=utf8mb4;

use summary_deeplearning;

create table news (
	id bigint not null auto_increment primary key,
    news_title varchar(255) not null,
	news_write_date datetime not null,
    news_description text not null,
	news_link varchar(255) unique key
)character set= utf8mb4;

desc news;
select * from news;



#truncate news;


create table members(
	id int not null auto_increment primary key,
    name varchar(255) not null,
    login_id varchar(50) not null unique key,
    password varchar(50) not null
)character set=utf8mb4;

create table chats(
	id bigint not null auto_increment primary key,
    chat_room_id int not null ,
    writer_is_human int not null,
    write_content text not null,
    write_time datetime default now()
)character set=utf8mb4;

ALTER TABLE chats ADD CONSTRAINT chat_room_id_foreign FOREIGN KEY(chat_room_id) REFERENCES members (id) ON DELETE CASCADE;

desc members;
desc chats;

/*실험 구간임->따라할 필요 없음*/
select * from members;
insert into members (name,login_id,password) values('남기정','kjn','1234');

select * from chats;
insert into chats(chat_room_id,writer_is_human,write_content) values(7,0,'챗봇 test1');
insert into chats(chat_room_id,writer_is_human,write_content) values(7,0,'챗봇 test2');