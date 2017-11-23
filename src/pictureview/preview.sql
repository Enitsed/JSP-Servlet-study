create table preview(
 num number,
 filepath varchar2(100)
);

create sequence preview_num_seq 
start with 1
increment by 1
nocache
nocycle;


select * from preview order by num

delete from preview


drop table preview
drop sequence preview_num_seq