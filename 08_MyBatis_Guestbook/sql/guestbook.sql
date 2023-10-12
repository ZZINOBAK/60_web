create table guestbook (
    idx number(4) primary key,
    name varchar2(30),
    subject varchar2(150),
    content varchar2(4000),
    email varchar2(100),
    pwd varchar2(30),
    regdate date default sysdate
);

create sequence guestbook_seq nocache;

insert into guestbook
        (idx, name, subject, content, email, pwd, regdate)
values (guestbook_seq.nextval, '김하은천재1', '제목1', '내용1',
        'kimha1@naver.com', 'gkdms1', sysdate-3);
        
insert into guestbook
        (idx, name, subject, content, email, pwd, regdate)
values (guestbook_seq.nextval, '김하은천재2', '제목2', '내용2',
        'kimha2@naver.com', 'gkdms2', sysdate-2);
        
insert into guestbook
        (idx, name, subject, content, email, pwd, regdate)
values (guestbook_seq.nextval, '김하은천재3', '제목3', '내용3',
        'kimha3@naver.com', 'gkdms3', sysdate-1);
        
commit;

select * from guestbook;

select idx, name, subject, content, email, pwd, regdate
from guestbook
order by idx desc
;