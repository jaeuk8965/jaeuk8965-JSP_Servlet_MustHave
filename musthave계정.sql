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
--���
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);
--�Խ��� 
create table board(
    num number primary key,
    title varchar2(200) not null,
    content varchar(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

--�ܷ�Ű ����
alter table board
    add constraint board_men_fk foreign key (id)
    references member(id);
    
--������ ����
create sequence seq_board_num
    increment by 1  ----1�� ����
    start with 1 --- ���۰� 1
    minvalue 1 ---�ּҰ� 1
    nomaxvalue ---�ִ밪 ���Ѵ�
    nocycle --- ��ȯ���� ����.
    nocache; --ĳ�þ���.
    
--���� ������ �Է�
insert into member (id, pass, name) values ('musthave','1234','�ӽ�Ʈ���');

insert into board (num, title, content,id,postdate, visitcount)
    values (seq_board_num.nextval,'����1�Դϴ�.','����1�Դϴ�.','musthave',sysdate, 0);

insert into  board values (seq_board_num.nextval, '������ ���Դϴ�.','���ǿ���','musthave',sysdate,0);
insert into  board values (seq_board_num.nextval, '������ �����Դϴ�.','���������','musthave',sysdate,0);
insert into  board values (seq_board_num.nextval, '������ �����Դϴ�.','������ȭ','musthave',sysdate,0);
insert into  board values (seq_board_num.nextval, '������ �ܿ��Դϴ�.','�ܿ￬��','musthave',sysdate,0);

commit;
desc member;
select * from member;
select id, pass, rownum from member;

