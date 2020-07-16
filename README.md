# Automation of Cronjobs in Unix System

Hi there,

This is a repository that provides useful bash and python scrips to streamline analytical ETL processes written in SAS, SQL and schedule automated cron tasks in Unix system.

Table of Contents 
* Schedule setup - **cronjob-setup.sh**
* Bash wrapper - **bash-script-template.sh**
  - Sample SAS code - **sas-code-template.sas**
  - Sample SQL code - **sql-code-template.sql**
  
* Log scanner - **logscan-email.py**
  - We want to scan the log files to check if there exists any errors after the ETL process is completed. The errors will be written into an error file to enable easy check of what went wrong.

* Email notifications - **logscan-email.py**
  - Eventually, we want to send out an email notification once the scan finishes. 
    - If there is no error in the log file, send out an email saying that the job has completed successfully.
    - If there are any error messages from the log file, send out an email saying that the job has encountered errors. An attachment will be sent along with the list of errors for quick check.


