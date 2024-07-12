alter session set"_ORACLE_SCRIPT"=true;

create user musthave IDENTIFIED BY 1234;

GRANT connect, resource,unlimited tablespace to musthave;

select tablespace_name, status, contents from dba_tablespaces;

select tablespace_name, sum(bytes),max(bytes) from dba_free_space
    group by tablespace_name;
    
select username, default_tablespace from dba_users
    where username in upper('musthave');

alter user musthave QUOTA 5m on users;

select * from tab;

DROP table member;
DROP table board;
DROP table seq_board_num;
--멤버
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);
--게시판 
create table board(
    num number primary key,
    title varchar2(200) not null,
    content varchar(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

--외래키 생성
alter table board
    add constraint board_men_fk foreign key (id)
    references member(id);
    
--시퀀스 생성
create sequence seq_board_num
    increment by 1  ----1씩 증가
    start with 1 --- 시작값 1
    minvalue 1 ---최소값 1
    nomaxvalue ---최대값 무한대
    nocycle --- 순환하지 않음.
    nocache; --캐시안함.
    
--더미 데이터 입력
insert into member (id, pass, name) values ('musthave','1234','머스트헤브');

insert into board (num, title, content,id,postdate, visitcount)
    values (seq_board_num.nextval,'제목1입니다.','내용1입니다.','musthave',sysdate, 0);

insert into  board values (seq_board_num.nextval, '지금은 봄입니다.','봄의왈츠','musthave',sysdate,0);
insert into  board values (seq_board_num.nextval, '지금은 여름입니다.','여름의향기','musthave',sysdate,0);
insert into  board values (seq_board_num.nextval, '지금은 가을입니다.','가을동화','musthave',sysdate,0);
insert into  board values (seq_board_num.nextval, '지금은 겨울입니다.','겨울연가','musthave',sysdate,0);

commit;
desc member;
select * from member;
select id, pass, rownum from member;

