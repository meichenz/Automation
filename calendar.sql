
/*
select TRUNC(SYSDATE,'y') from all_objects
WHERE ROWNUM <= ADD_MONTHS(TRUNC(SYSDATE,'y'),12) - TRUNC(SYSDATE,'y');

SELECT LPAD( MONTH, 20-(20-LENGTH(MONTH))/2 ) MONTH,"Sun", "Mon", "Tue",
"Wed", "Thu", "Fri", "Sat"
FROM (SELECT TO_CHAR(dt,'fmMonthfm YYYY') MONTH,TO_CHAR(dt+1,'iw') week,
MAX(DECODE(TO_CHAR(dt,'d'),'1',LPAD(TO_CHAR(dt,'fmdd'),2))) "Sun",
MAX(DECODE(TO_CHAR(dt,'d'),'2',LPAD(TO_CHAR(dt,'fmdd'),2))) "Mon",
MAX(DECODE(TO_CHAR(dt,'d'),'3',LPAD(TO_CHAR(dt,'fmdd'),2))) "Tue",
MAX(DECODE(TO_CHAR(dt,'d'),'4',LPAD(TO_CHAR(dt,'fmdd'),2))) "Wed",
MAX(DECODE(TO_CHAR(dt,'d'),'5',LPAD(TO_CHAR(dt,'fmdd'),2))) "Thu",
MAX(DECODE(TO_CHAR(dt,'d'),'6',LPAD(TO_CHAR(dt,'fmdd'),2))) "Fri",
MAX(DECODE(TO_CHAR(dt,'d'),'7',LPAD(TO_CHAR(dt,'fmdd'),2))) "Sat"
FROM ( SELECT TRUNC(SYSDATE,'y')-1+ROWNUM dt
FROM all_objects
WHERE ROWNUM <= ADD_MONTHS(TRUNC(SYSDATE,'y'),12) - TRUNC(SYSDATE,'y'))
GROUP BY TO_CHAR(dt,'fmMonthfm YYYY'), TO_CHAR( dt+1, 'iw' ))
ORDER BY TO_DATE( MONTH, 'Month YYYY' ), TO_NUMBER(week);

*/

create table mzhou.calendar2020 as 
select dt, 
TO_CHAR(dt,'DD') Day,
TO_CHAR(dt,'Mon') Month,
TO_CHAR(dt,'YYYY') Year,
TO_CHAR(dt+1,'iw') week,
(case when "Sun" is not null then 'Sun' 
when "Mon" is not null then 'Mon'
when "Tue" is not null then 'Tue'
when "Wed" is not null then 'Wed'
when "Thu" is not null then 'Thu'
when "Fri" is not null then 'Fri'
when "Sat" is not null then 'Sat'
else null end) DayWeek
from (SELECT dt, 
MAX(DECODE(TO_CHAR(dt,'d'),'1',LPAD(TO_CHAR(dt,'fmdd'),2))) "Sun",
MAX(DECODE(TO_CHAR(dt,'d'),'2',LPAD(TO_CHAR(dt,'fmdd'),2))) "Mon",
MAX(DECODE(TO_CHAR(dt,'d'),'3',LPAD(TO_CHAR(dt,'fmdd'),2))) "Tue",
MAX(DECODE(TO_CHAR(dt,'d'),'4',LPAD(TO_CHAR(dt,'fmdd'),2))) "Wed",
MAX(DECODE(TO_CHAR(dt,'d'),'5',LPAD(TO_CHAR(dt,'fmdd'),2))) "Thu",
MAX(DECODE(TO_CHAR(dt,'d'),'6',LPAD(TO_CHAR(dt,'fmdd'),2))) "Fri",
MAX(DECODE(TO_CHAR(dt,'d'),'7',LPAD(TO_CHAR(dt,'fmdd'),2))) "Sat"
FROM ( SELECT TRUNC(SYSDATE,'y')-1+ROWNUM dt
FROM all_objects
WHERE ROWNUM <= ADD_MONTHS(TRUNC(SYSDATE,'y'),12) - TRUNC(SYSDATE,'y'))
GROUP BY dt ORDER BY dt);


/*CREATE CALENDAR TABLE STARTING FROM JAN1, 2015 FOR TEN YEARS*/
create table mzhou.calendar as 
select dt, 
TO_NUMBER(TO_CHAR(dt,'DD')) Day,
TO_NUMBER(TO_CHAR(dt,'MM')) Month,
TO_NUMBER(TO_CHAR(dt,'YYYY')) Year,
TO_NUMBER(TO_CHAR(dt+1,'iw')) week,
(case when "Sun" is not null then 'Sun' 
when "Mon" is not null then 'Mon'
when "Tue" is not null then 'Tue'
when "Wed" is not null then 'Wed'
when "Thu" is not null then 'Thu'
when "Fri" is not null then 'Fri'
when "Sat" is not null then 'Sat'
else null end) DayWeek
from (SELECT dt, 
MAX(DECODE(TO_CHAR(dt,'d'),'1',LPAD(TO_CHAR(dt,'fmdd'),2))) "Sun",
MAX(DECODE(TO_CHAR(dt,'d'),'2',LPAD(TO_CHAR(dt,'fmdd'),2))) "Mon",
MAX(DECODE(TO_CHAR(dt,'d'),'3',LPAD(TO_CHAR(dt,'fmdd'),2))) "Tue",
MAX(DECODE(TO_CHAR(dt,'d'),'4',LPAD(TO_CHAR(dt,'fmdd'),2))) "Wed",
MAX(DECODE(TO_CHAR(dt,'d'),'5',LPAD(TO_CHAR(dt,'fmdd'),2))) "Thu",
MAX(DECODE(TO_CHAR(dt,'d'),'6',LPAD(TO_CHAR(dt,'fmdd'),2))) "Fri",
MAX(DECODE(TO_CHAR(dt,'d'),'7',LPAD(TO_CHAR(dt,'fmdd'),2))) "Sat"
FROM (SELECT to_date('01-JAN-15', 'DD-MON-YY')-1 + ROWNUM dt
FROM all_objects
WHERE ROWNUM <= ADD_MONTHS(TRUNC(SYSDATE,'y'),12*10) - TRUNC(SYSDATE,'y'))
GROUP BY dt ORDER BY dt);

