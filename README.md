# Automation of Cronjobs in Unix System

Hi there,

This is a repository that provides useful bash and python scrips to automate analytical ETL processes written in SAS, SQL and schedule using cron tasks in Unix system.

Table of Contents 
* Schedule setup
  - cron job set up guild, see file 'cronjob-setup.sh'
  - wrapper to run bash scripts, see file 'bash-script-template.sh'
  
* Log scanner
```
We want to scan the log files to check if there exists any errors after the ETL process is completed. The errors will be written into an error file to enable easy check of what went wrong.
The scanner is written in Python. Please refer to file 'logscan_email.py'. 

```

* Email notifications
```
Eventually, we want to send out an email notification once the scan finishes. 
  - If there is no error in the log file, send out an email saying that the job has completed successfully.
  - If there are any error messages from the log file, send out an email saying that the job has encountered errors. An attachment with the list of errors will be sent along for quick check.


```
