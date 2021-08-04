create table reply_test
(
    replynum number primary key,
    boardnum number default 0,
    userid varchar2(50) not null,
    replytext varchar2(1000) not null,
    regdate date default sysdate
    );
    
create sequence replytest_seq;