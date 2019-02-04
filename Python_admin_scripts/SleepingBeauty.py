#!/usr/bin/python

import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEBase import MIMEBase
from email import encoders
import os

# Operations:
os.system("echo -e 'Report Status of the PROD Server' > /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Sleeping Proc\n-----------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps -e -o s | grep -o 'S' -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Disk status\n-----------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("df -h >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Running Proc\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps -e -o s | grep -o 'R' -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'CPU average\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("w >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Selenium-Sleep\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps aux | grep -i chromedriver -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Chrom-Sleep\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps aux | grep -i chrom -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Controllers-Sleep\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps aux | grep -i controller -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Apache childs\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("pgrep httpd | wc -l >> /root/.scripts/mail/pyproc/report_proc.txt")



# Mail send
fromaddr = "from_sender@mail"
toaddr = "to_receiver@mail"
 
msg = MIMEMultipart()
 
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = "Report"
 
body = "Sleeping processes in YourServername"
 
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
