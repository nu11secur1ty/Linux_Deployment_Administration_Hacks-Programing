#!/usr/bin/python
# by Ventsislav Varbanovski @nu11secur1ty

import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEBase import MIMEBase
from email import encoders
import os

##WARNING!
# This part is very IMPORTANT for what services you use and what command you must use to check of your services 
# if they working properly!
# ---------------------------------------------------------------------------------------- #

# Operations:
os.system("echo -e 'Report Status of the name of your PROD Server' > /path/to/your/attac.txt")

os.system("echo -e 'Sleeping Proc\n-----------------------' >> /path/to/your/attac.txt")
os.system("ps -e -o s | grep -o 'S' -c >> /path/to/your/attac.txt")

os.system("echo -e 'Disk status\n-----------------------' >> /path/to/your/attac.txt")
os.system("df -h >> /path/to/your/attac.txt")

os.system("echo -e 'Running Proc\n------------------------' >> /path/to/your/attac.txt")
os.system("ps -e -o s | grep -o 'R' -c >> /path/to/your/attac.txt")

os.system("echo -e 'CPU average\n------------------------' >> /path/to/your/attac.txt")
os.system("w >> /path/to/your/attac.txt")

os.system("echo -e 'Selenium-Sleep\n------------------------' >> /path/to/your/attac.txt")
os.system("ps aux | grep -i chromedriver -c >> /path/to/your/attac.txt")

os.system("echo -e 'Chrom-Sleep\n------------------------' >> /path/to/your/attac.txt")
os.system("ps aux | grep -i chrom -c >> /path/to/your/attac.txt")

os.system("echo -e 'Controllers-Sleep\n------------------------' >> /path/to/your/attac.txt")
os.system("ps aux | grep -i controller -c >> /path/to/your/attac.txt")

os.system("echo -e 'Apache childs\n------------------------' >> /path/to/your/attac.txt")
os.system("pgrep httpd | wc -l >> /path/to/your/attac.txt")



# Mail send
fromaddr = "from_sender@mail"
toaddr = "to_receiver@mail"
 
msg = MIMEMultipart()
 
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = "Report"
 
body = "Sleeping processes in Your PROD Servername"
 
msg.attach(MIMEText(body, 'plain'))
 
filename = "your_attach.txt"
attachment = open("/path/to/your/attac", "r")
 
part = MIMEBase('application', 'octet-stream')
part.set_payload((attachment).read())
encoders.encode_base64(part)
part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
 
msg.attach(part)
 
server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login(fromaddr, "your_password_mail")
text = msg.as_string()
server.sendmail(fromaddr, toaddr, text)
server.quit()
