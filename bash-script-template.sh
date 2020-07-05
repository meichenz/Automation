#Use the pound sign to start a comment
#Below is the cron job schedule for the bash script
#crontab -e
#30 8 * * * /FILEPATH/bash-script-template.sh

echo "Analytical process START"
arc_dt=$(date +'%m_%d_%Y')
path=/MAINPATH
errFile=$path/logging-errors.txt

cd $path
nohup /SAS-EXE-FILE -noterminal -memsize 4g sas-test.sas -log /LOGPATH/sas-logging.log -print /OUTPUTPATH/sas-output.lst
nohup /PYTHON-EXE-FILE python-test.py >> /LOGPATH/python-logging.log 
sqlplus -s USERNAME/PASSWORD@DB @sql-template.sql


echo "Analytical Process END"

echo "Rename Daily Logging and Output Files"
if [ -f $errFile ] 
then mv $errFile $path/logging-errors_${arc_dt}.txt
fi

mv $path/logging.log $path/logging_${arc_dt}.log
mv $path/outputs.lst $path/outputs_${arc_dt}.lst
mv $path/outputs.xls $path/outputs_${arc_dt}.xls
