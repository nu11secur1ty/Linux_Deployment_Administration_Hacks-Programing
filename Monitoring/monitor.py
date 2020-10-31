#!/usr/bin/python
# V.Varbanovski @nu11secur1ty

import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEBase import MIMEBase
from email import encoders
import os

# You can create your own directory for report similar to mine "/root/.scripts/mail/pyproc/report_proc.txt" 
# If you want of course or you can just create the same as mine, this is your choice =)

# Operations:
os.system("echo -e 'Report Status of Your-PROD Server' > /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Sleeping Proc\n-----------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps -e -o s | grep -o 'S' -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Mysql-Usage\n-----------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps -eo %mem,%cpu -S -p $(pgrep mysqld) >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Zombi\n-----------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps aux | awk {'print $8'}|grep -c Z  >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Spec-log-new\n-----------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps aux | grep -i your_proc -c  >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Spec-log\n-----------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("du -h /home/your/dir/tempobet.log >> /root/.scripts/mail/pyproc/report_proc.txt")

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

os.system("echo -e 'someservices-Sleep\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps aux | grep -i someservices -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Apache childs\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("pgrep httpd | wc -l >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Chromium-sleep\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps aux | grep -i chromium -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'SomeSpec-sleep\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("ps aux | grep somespec -c >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'CPU-Temp\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("sensors >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Swap-check\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("free -m | grep Swap >> /root/.scripts/mail/pyproc/report_proc.txt")

os.system("echo -e 'Time of the server\n------------------------' >> /root/.scripts/mail/pyproc/report_proc.txt")
os.system("timedatectl status >> /root/.scripts/mail/pyproc/report_proc.txt")


# Mail send
fromaddr = "yoursender@gmail.com"
toaddr = "yourreceiver@gmail.com"
 
msg = MIMEMultipart()
 
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = "Report"
 
body = "Sleeping processes in Your-PROD-ENV"
 
msg.attach(MIMEText(body, 'plain'))
 
filename = "report_proc.txt"
attachment = open("/root/.scripts/mail/pyproc/report_proc.txt", "r")
 
part = MIMEBase('application', 'octet-stream')
part.set_payload((attachment).read())
encoders.encode_base64(part)
part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
 
msg.attach(part)
 
server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login(fromaddr, "yourpassword_sender")
text = msg.as_string()
server.sendmail(fromaddr, toaddr, text)
server.quit()
