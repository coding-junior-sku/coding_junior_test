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
select * from news where news_title='';
show table status where name = 'news';

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


#drop table boards;
#drop table comments;

create table boards(
	id int not null auto_increment primary key,
    writer int  not null ,
    title varchar(255) not null,
    content text not null,
    alert_number int ,
    alert_handle tinyint ,
    write_time datetime default now()
)character set=utf8mb4;

create table comments(
	id int not null auto_increment primary key,
    writer int not null,
    content text not null,
    alert_number int ,
    alert_handle tinyint,
    write_time datetime default now(),
    board_id int not null
)character set=utf8mb4;

alter table comments add constraint board_id_foreign foreign key(board_id) references boards(id) on delete cascade;

desc members;
desc chats;

desc boards;
desc comments;

/*실험 구간임->따라할 필요 없음*/
select * from members;
insert into members (name,login_id,password) values('남기정','kjn','1234');

select * from chats;
insert into chats(chat_room_id,writer_is_human,write_content) values(7,0,'챗봇 test1');
insert into chats(chat_room_id,writer_is_human,write_content) values(7,0,'챗봇 test2');

select * from boards;