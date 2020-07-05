
import os, email, smtplib, ssl, logging
from os import path 
from datetime import date 
from email.mime.multipart import MIMEMultipart 
from email.MIMEBase import MIMEBase
from email.mime.text import MIMEText
from email import encoders

# logging.basicConfig(filename='logScan_sendEmail.log', level=logging.INFO)
date = date.today()
logpth = LOGPATH
outpth = OUTPUTPATH
logR = LOGNAME.log
errW = ERRFILE.txt
outsend = OUTPUTFILE.xls
scanfile = logpth + '/' + logR  
errfile = logpth + '/' + errW
sendfile = outpth + '/' + outsend

errmsg = 'ERROR:'

fromaddr = "EMAIL@CORP"
toaddr1 = "EMAIL1@CORP"
toaddr2 = "EMAIL2@CORP"

msg = MIMEMultipart('alternative')
msg['From'] = fromaddr 

def scanlog():
	print("Read log file and write ERROR messages")
	f = open(scanfile, "r") # List of log lines
	log_lines = f.read().split('\n')
	f.close()
	counter = 0
	for i, log in enumerate(log_lines):
		if errmsg in log:
			try:
				print(str(counter) + 'th ' + str(i) + ' ' + str(log) + '\n')
				with open(errfile, "a+") as out_file: # a+ is appending 
					out_file.write(errmsg + ' is present in line ' + str(i) + ' : ' + str(log) + '\n')	
			except IOError:
				print(str(counter) + 'th ' + str(i) + ' ' + str(log) + '\n')
				with open(errfile, "w+") as out_file: # a+ is appending 
					out_file.write(errmsg + ' is present in line ' + str(i) + ' : ' + str(log) + '\n')					
			counter += 1
	if counter > 0:	
		with open(errfile, "a+") as out_file:
			out_file.write('\n' + str(date) + ' There are new Error messages. The file is updated\n\n\n')

scanlog()
			
def main():
	print("Send Email")

	if os.path.isfile(errfile):
		print "Error message detected"
		line = "Hi team, \n\n   XXX log scanning encountered ERRORS..Please see the attached error list to troubleshoot.\n\nThanks\n" 
		body = MIMEText(line, 'plain')
		with open(errfile, "rb") as attachment:
			part = MIMEBase("application", "octet-stream")
			part.set_payload(attachment.read())
		encoders.encode_base64(part)
		part.add_header("Content-Disposition", 'attachment; filename="ERRFILE.txt"' )
		msg['Subject'] = "Unexpected Results from XXX"
		msg['To'] = toaddr1
		msg.attach(body)	
		msg.attach(part)
	else:
		print "XXX Ran Successfully"
		line = "Hi team, \n\n    XXX ran successfully! Please see the attached output.\n\nThanks\n" 
		body = MIMEText(line, 'plain')
		
		with open(sendfile, "rb") as attachment:
			part = MIMEBase("application", "octet-stream")
			part.set_payload(attachment.read())
		encoders.encode_base64(part)
		part.add_header("Content-Disposition", 'attachment; filename="OUTPUTFILE.xls"' )
		msg['Subject'] = "OK Result for XXX"
		msg['To'] = toaddr2
		msg.attach(body)
		msg.attach(part)
		
	server = smtplib.SMTP('XXXXXX')
	server.set_debuglevel(1)
	server.sendmail(msg['From'], msg['To'], msg.as_string())
	server.quit()

if __name__ == "__main__":
	main()

print("Email Sent")

exit()








