spool on
spool template.log
set timing on 

prompt table contents;
desc SCHEMANAME.TABLENAME;

prompt number of records;
select count(*) as total from SCHEMANAME.TABLENAME;

prompt sample records;
select * from SCHEMANAME.TABLENAME where rownum <= 10;

prompt create aggregation including distribution of key field;
create table NEWTABLE as 
select COLNAME, count(*) from SCHEMANAME.TABLENAME
group by COLNAME;

prompt grant privilege;
grant select on NEWTABLE to USERNAME;


quit;
set timing off
spool off
/
