/*Header OPTIONS and LIBNAME definitions*/

ods html body = "output_file.xls";
**********************************************************************;

/*MACRO Variable setup*/

title "Check the contents of a dataset";
proc contents data = TABLENAME; run;

title "Check uniqueness";
proc sql;
  select count(*) as total, count(IDFIELD) as id_field from TABLENAME;
quit;
 
title "Check variable distribution";
proc means data = TABLENAME n nmiss min mean max std; var _numeric_; run;
proc freq data = TABLENAME; tables VAR_LIST; run;

title;

ods html close;




 
