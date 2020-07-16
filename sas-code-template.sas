/*Header OPTIONS and LIBNAME definitions*/

ods html body = "output_file.xls";
**********************************************************************;

/*MACRO Variable setup*/

title "Check the contents of a dataset";
proc contents data = TABLENAME; run;

title "Create a subset of the table";
data TABLE_SUB;
  set TABLENAME(keep = IDFIELD var1 var2);
  where var1 >= 10;
  var3 = var1 + var2;
 run;
 
title "Merge two tables together by the match key";
proc sort data = TABLE_SUB nodupkey out = TABLE1; by IDFIELD; run;
proc sort data = TABLENAME2 nodupkey out = TABLE2; by IDFIELD; run;
 
data TABLE_FINAL;
  merge TABLE1(in = a) TABLE2(in = b);
  by IDFIELD;
  match_table1 = a;
  match_table2 = b;
  if a; /*use table1 as base*/
run;
 
title "Check the match rate between table1 and table2";
proc freq data = TABLE_FINAL; table match_table1*match_table2/list missing; run;

title "Check uniqueness";
proc sql;
  select count(*) as total, count(IDFIELD) as id_field from TABLENAME;
quit;
 
title "Variable distribution for the final table";
proc means data = TABLE_FINAL n nmiss min mean max std; var _numeric_; run;
proc freq data = TABLE_FINAL; tables VAR_LIST; run;

title;

ods html close;




 
