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

